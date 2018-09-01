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

    func out(content: String) {
        // output string
        var indent = 0
        // if newline last output, add left margin before string
        if self.outputBuffer.count > 0 && String(UnicodeScalar(Array(self.outputBuffer.utf8)[self.outputBuffer.count - 1])) == "\n" {
            indent = leftMargin
            while indent > 0 { outputBuffer += " "; indent -= 1 }
        }
        outputBuffer += content
    }

    func traverseNodes(node: Node) {
        switch (node.type) {
        case .root:
            for child in node.children {
                traverseNodes(node: child)
            }
        case .comment:
            out(content: "// \(node.content!.trimmingCharacters(in: .whitespaces))\n")
        case .rule:
            out(content: "func rule\(node.content!)() throws {\n")
            leftMargin += 4
            out(content: "self.contextPush(\"\(node.content!)\")\n")
            out(content: "defer { self.contextPop() }\n")
            for child in node.children {
                traverseNodes(node: child)
            }
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
        default:
            break
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
