import XCTest
@testable import Metacompilers

final class MetacompilersTests: XCTestCase {
    func readFileContents(_ filePath: String) -> String {
        guard let fileHandle = FileHandle(forReadingAtPath: filePath) else {
            XCTFail("Could not load file: \(filePath)")
            fatalError()
        }

        defer {
            fileHandle.closeFile()
        }

        let data = fileHandle.readDataToEndOfFile()

        guard let dataAsStr = String(data: data, encoding: .utf8) else {
            XCTFail("Could not read file as text: \(filePath)")
            fatalError()
        }

        return dataAsStr
    }

    func testCompile() {
        let metalangContents = readFileContents("Resources/i01-initial-swift-compiler.metalang")
        let compilerSourceContents = readFileContents("Sources/Metacompilers/Metacompiler.swift")

        let compiler = Compiler()
        XCTAssertTrue(compiler.compile(metalangContents))
        XCTAssertEqual(compiler.outbuf.trimmingCharacters(in: .newlines), compilerSourceContents.trimmingCharacters(in: .newlines))
    }

    static var allTests = [
        ("testCompile", testCompile),
    ]
}
