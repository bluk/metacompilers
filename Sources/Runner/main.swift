import Foundation
import Metacompilers

if CommandLine.arguments.count < 2 {
    print("Usage: Runner <metalang file>")
    exit(1)
}

let metalangFile = CommandLine.arguments[1]
guard let fileHandle = FileHandle(forReadingAtPath: metalangFile) else {
    print("Could not load file: \(metalangFile)")
    exit(1)
}

defer {
    fileHandle.closeFile()
}

let data = fileHandle.readDataToEndOfFile()

var isCompilerOutput = true

if CommandLine.arguments.count >= 3 && CommandLine.arguments[2] == "ast"  {
    isCompilerOutput = false
}

guard let dataAsStr = String(data: data, encoding: .utf8) else {
    print("Could not read file as text: \(metalangFile)")
    exit(1)
}

class CodeGenerator {
    var outputBuffer = ""
    var leftMargin = 0
    var isCharExpression = false

    func out(content: String) {
        // output string
        var indent = 0
        // if newline last output, add left margin before string
        if content != "\n" {
            if self.outputBuffer.count > 0 && String(UnicodeScalar(Array(self.outputBuffer.utf8)[self.outputBuffer.count - 1])) == "\n" {

                indent = leftMargin
                while indent > 0 { outputBuffer += " "; indent -= 1 }
            }
        }
        outputBuffer += content
    }

    func traverseNodes(node: Node) {
        switch (node.type) {
        case .root:
            node.children.forEach(traverseNodes)
        case .or:
            guard node.children.count > 0 else {
                return
            }

//            if isCharExpression {
//                out(content: "( ")
//            }
            traverseNodes(node: node.children.first!)

            guard node.children.count > 1 else {
//                if isCharExpression {
//                    out(content: " )")
//                }
                return
            }

            for child in node.children[1...] {
                if isCharExpression {
                    out(content: " ||\n")
                } else {
                    out(content: "if !self.isParsed {\n")
                    leftMargin += 4
                }
                traverseNodes(node: child)
                if !isCharExpression {
                    leftMargin -= 4
                    out(content: "}\n")
                }
            }
        case .and:
            guard node.children.count > 0 else {
                return
            }

            if isCharExpression {
                out(content: "( ")
            }
            traverseNodes(node: node.children.first!)

            if !isCharExpression {
                switch(node.children.first!.type) {
                case .output:
                    out(content: "if true {\n")
                default:
                    out(content: "if self.isParsed {\n")
                }
                leftMargin += 4
            }

            guard node.children.count > 1 else {
                if isCharExpression {
                    out(content: " )")
                } else {
                    leftMargin -= 4
                    out(content: "}\n")
                }
                return
            }

            for child in node.children[1...] {
                if isCharExpression {
                    out(content: " &&\n")
                    out(content: " ")
                }
                traverseNodes(node: child)

                if !isCharExpression {
                    switch(child.type) {
                    case .output:
                        break
                    default:
                        out(content: "if !self.isParsed { try self.err() }\n")
                    }
                }
            }

            if isCharExpression {
                out(content: " )")
            } else {
                leftMargin -= 4
                out(content: "}\n")
            }
        case .zeroOrMore:
            guard node.children.count > 0 else {
                return
            }

            out(content: "self.isParsed = true\n")
            out(content: "while self.isParsed {\n")
            leftMargin += 4
            node.children.forEach(traverseNodes)
            leftMargin -= 4
            out(content: "}\n")
            out(content: "self.isParsed = true\n")
        case .readCharacter:
            out(content: "self.token = String(Array(self.inbuf.utf8)[self.inp])\n")
            out(content: "self.inp += 1\n")
        case .string:
            out(content: "self.test(\"\(node.content!)\")\n")
        case .id:
            out(content: "try self.rule\(node.content!)()\n")
        case .empty:
            out(content: "self.isParsed = true\n")
        case .comment:
            out(content: "//\(node.content!)\n")
        case .rule:
            out(content: "func rule\(node.content!)() throws {\n")
            leftMargin += 4
            out(content: "self.contextPush(\"\(node.content!)\")\n")
            out(content: "defer { self.contextPop() }\n")
            node.children.forEach(traverseNodes)
            leftMargin -= 4
            out(content: "}\n\n")
        case .leftMargin(let margin):
            leftMargin = margin
        case .output:
            for child in node.children {
                switch (child.type) {
                case .text:
                    if let content = child.content {
                        out(content: content)
                    }
                case .leftMargin(let margin):
                    leftMargin = margin
                default:
                    fatalError("Unexpected child")
                }
            }
        case .text:
            fatalError("Unexpected node")
        case .statement:
            fatalError("Unexpected node")
        case .expression:
            fatalError("Unexpected node")
        case .helper(_):
            fatalError("Unexpected node")
        case .charExpression:
            out(content: "self.isParsed =\n")
            isCharExpression = true
            leftMargin += 4

            guard node.children.count > 0 else {
                fatalError("Expected at least one child")
            }

            node.children.forEach(traverseNodes)

            leftMargin -= 4
            out(content: "\n")
            isCharExpression = false
        case .charEqual:
            guard node.children.count == 1 else {
                fatalError("Unexpected only 1 child node")
            }

            guard let child = node.children.first else {
                fatalError("Unexpected that child is not available")
            }

            switch (child.type) {
            case .number(let value):
                out(content: "Array(self.inbuf.utf8)[self.inp] == \(value)")
            case .character(let value):
                out(content: "Array(self.inbuf.utf8)[self.inp] == \(value)")
            default:
                fatalError("Unexpected child type")
            }
        case .charLessThanOrEqual:
            guard node.children.count == 1 else {
                fatalError("Unexpected only 1 child node")
            }

            guard let child = node.children.first else {
                fatalError("Unexpected that child is not available")
            }

            switch (child.type) {
            case .number(let value):
                out(content: "Array(self.inbuf.utf8)[self.inp] <= \(value)")
            case .character(let value):
                out(content: "Array(self.inbuf.utf8)[self.inp] <= \(value)")
            default:
                fatalError("Unexpected child type")
            }
        case .charGreaterThanOrEqual:
            guard node.children.count == 1 else {
                fatalError("Unexpected only 1 child node")
            }

            guard let child = node.children.first else {
                fatalError("Unexpected that child is not available")
            }

            switch (child.type) {
            case .number(let value):
                out(content: "Array(self.inbuf.utf8)[self.inp] >= \(value)")
            case .character(let value):
                out(content: "Array(self.inbuf.utf8)[self.inp] >= \(value)")
            default:
                fatalError("Unexpected child type")
            }
        case .number(_):
            fatalError("Unexpected node")
        case .character(_):
            fatalError("Unexpected node")
        }
    }
}

let compiler = Compiler()
do {
    try compiler.compile(dataAsStr)
    if (isCompilerOutput) {
        print(compiler.outputBuffer)
    } else {
        let generator = CodeGenerator()
        generator.traverseNodes(node: compiler.rootAST)
        print(generator.outputBuffer)
    }
} catch Compiler.CompilerError.parseFailure(let rule, let inputOffset) {
    print("Compiler Error:")
    print(compiler.outputBuffer)
    print(rule)
    print(inputOffset)
    print(compiler.token)
    exit(1)
}
