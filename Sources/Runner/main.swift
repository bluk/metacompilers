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

guard let dataAsStr = String(data: data, encoding: .utf8) else {
    print("Could not read file as text: \(metalangFile)")
    exit(1)
}

let compiler = Compiler()
do {
    try compiler.compile(dataAsStr)
    print(compiler.outputBuffer)
} catch Compiler.CompilerError.parseFailure(let rule, let inputOffset) {
    print("Compiler Error:")
    print(compiler.outputBuffer)
    print(rule)
    print(inputOffset)
    print(compiler.token)
    exit(1)
}
