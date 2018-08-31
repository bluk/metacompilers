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

func traverseNodes(node: Node) {
    switch (node.type) {
    case .root:
        for child in node.children {
            traverseNodes(node: child)
        }
    case .output:
        var outputBuffer = ""
        for child in node.children {
            switch (child.type) {
            case .text:
                if let content = child.content {
                    outputBuffer += content
                }
            default:
                fatalError("Unexpected child")
            }
        }
        print(outputBuffer, terminator: "")
    default:
        break
    }
}

let compiler = Compiler()
do {
    try compiler.compile(dataAsStr)
    if (isCompilerOutput) {
        print(compiler.outputBuffer)
    } else {
        traverseNodes(node: compiler.rootAST)
    }
} catch Compiler.CompilerError.parseFailure(let rule, let inputOffset) {
    print("Compiler Error:")
    print(compiler.outputBuffer)
    print(rule)
    print(inputOffset)
    print(compiler.token)
    exit(1)
}
