// PROGRAM compiler
public class Compiler {

    public final func compile(_ input: String) throws {
        // initialize compiler variables
        inbuf = input
        initialize()
        // call the first rule
        try rulePROGRAM()
        // special case handling of first rule failure
        if !isParsed {
            throw CompilerError.parseFailure(rule: "PROGRAM", inputOffset: inp)
        }
    }

    // body of compiler definition 
    final func rulePROGRAM() throws {
        contextPush("PROGRAM")
        defer { contextPop() }
        test(".SYNTAX")
        if isParsed {
            try ruleID()
            if !isParsed { try err() }
            out("// ")
            out(token)
            out(" compiler")
            eol()
            latestNode = Node(type: .output)
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            latestNode = Node(type: .text(value: "// "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: token))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: " compiler"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("public class Compiler {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            eol()
            latestNode = Node(type: .text(value: "public class Compiler {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            try rulePREAMBLE()
            if !isParsed { try err() }
            isParsed = true
            while isParsed {
                try rulePR()
                if isParsed {
                }
                if !isParsed {
                    try ruleCOMMENT()
                    if isParsed {
                    }
                }
            }
            isParsed = true
            if !isParsed { try err() }
            test(".TOKENS")
            if !isParsed { try err() }
            isParsed = true
            while isParsed {
                try ruleTR()
                if isParsed {
                }
                if !isParsed {
                    try ruleCOMMENT()
                    if isParsed {
                    }
                }
            }
            isParsed = true
            if !isParsed { try err() }
            test(".END")
            if !isParsed { try err() }
            try rulePOSTAMBLE()
            if !isParsed { try err() }
            latestNode = Node(type: .output)
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
        }
    }

    // object definition preamble 
    final func rulePREAMBLE() throws {
        contextPush("PREAMBLE")
        defer { contextPop() }
        latestNode = Node(type: .output)
        if true {
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            out("public final func compile(_ input: String) throws {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "public final func compile(_ input: String) throws {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// initialize compiler variables")
            eol()
            latestNode = Node(type: .text(value: "// initialize compiler variables"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("inbuf = input")
            eol()
            latestNode = Node(type: .text(value: "inbuf = input"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("initialize()")
            eol()
            latestNode = Node(type: .text(value: "initialize()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// call the first rule")
            eol()
            latestNode = Node(type: .text(value: "// call the first rule"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("try rule")
            out(token)
            out("()")
            eol()
            latestNode = Node(type: .text(value: "try rule"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: token))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// special case handling of first rule failure")
            eol()
            latestNode = Node(type: .text(value: "// special case handling of first rule failure"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("if !isParsed {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "if !isParsed {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("throw CompilerError.parseFailure(rule: ")
            out(String(UnicodeScalar(34)))
            out(token)
            out(String(UnicodeScalar(34)))
            out(", inputOffset: inp)")
            eol()
            latestNode = Node(type: .text(value: "throw CompilerError.parseFailure(rule: "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: token))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: ", inputOffset: inp)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
        }
    }

    // runtime and object definition postamble 
    final func rulePOSTAMBLE() throws {
        contextPush("POSTAMBLE")
        defer { contextPop() }
        latestNode = Node(type: .output)
        if true {
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            out("struct StackFrame {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "struct StackFrame {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var erule: String")
            eol()
            latestNode = Node(type: .text(value: "var erule: String"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var leftMargin: Int")
            eol()
            latestNode = Node(type: .text(value: "var leftMargin: Int"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// runtime variables")
            eol()
            latestNode = Node(type: .text(value: "// runtime variables"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var isParsed = false")
            eol()
            latestNode = Node(type: .text(value: "var isParsed = false"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var isToken = false")
            eol()
            latestNode = Node(type: .text(value: "var isToken = false"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var inp = 0")
            eol()
            latestNode = Node(type: .text(value: "var inp = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var inbuf = ")
            out(String(UnicodeScalar(34)))
            out(String(UnicodeScalar(34)))
            eol()
            latestNode = Node(type: .text(value: "var inbuf = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("public var outputBuffer = ")
            out(String(UnicodeScalar(34)))
            out(String(UnicodeScalar(34)))
            eol()
            latestNode = Node(type: .text(value: "public var outputBuffer = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("public var token = ")
            out(String(UnicodeScalar(34)))
            out(String(UnicodeScalar(34)))
            eol()
            latestNode = Node(type: .text(value: "public var token = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("public var rootAST = Node(type: .root)")
            eol()
            latestNode = Node(type: .text(value: "public var rootAST = Node(type: .root)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var currentNode: Node?")
            eol()
            latestNode = Node(type: .text(value: "var currentNode: Node?"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var latestNode: Node?")
            eol()
            latestNode = Node(type: .text(value: "var latestNode: Node?"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var nodeContextStack: [Node] = []")
            eol()
            latestNode = Node(type: .text(value: "var nodeContextStack: [Node] = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var stashedNodes: [Node] = []")
            eol()
            latestNode = Node(type: .text(value: "var stashedNodes: [Node] = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var stack: [StackFrame] = []")
            eol()
            eol()
            latestNode = Node(type: .text(value: "var stack: [StackFrame] = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("public init() {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "public init() {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("initialize()")
            eol()
            latestNode = Node(type: .text(value: "initialize()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func initialize () {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func initialize () {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// initialize for another compile")
            eol()
            latestNode = Node(type: .text(value: "// initialize for another compile"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("isParsed = false")
            eol()
            latestNode = Node(type: .text(value: "isParsed = false"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("isToken = false")
            eol()
            latestNode = Node(type: .text(value: "isToken = false"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("inp = 0")
            eol()
            latestNode = Node(type: .text(value: "inp = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("outputBuffer = ")
            out(String(UnicodeScalar(34)))
            out(String(UnicodeScalar(34)))
            eol()
            latestNode = Node(type: .text(value: "outputBuffer = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("token = ")
            out(String(UnicodeScalar(34)))
            out(String(UnicodeScalar(34)))
            eol()
            latestNode = Node(type: .text(value: "token = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("stack = []")
            eol()
            latestNode = Node(type: .text(value: "stack = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("rootAST = Node(type: .root)")
            eol()
            latestNode = Node(type: .text(value: "rootAST = Node(type: .root)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("currentNode = rootAST")
            eol()
            latestNode = Node(type: .text(value: "currentNode = rootAST"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("nodeContextStack = []")
            eol()
            latestNode = Node(type: .text(value: "nodeContextStack = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("stashedNodes = []")
            eol()
            latestNode = Node(type: .text(value: "stashedNodes = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func contextPush(_ rulename: String) {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func contextPush(_ rulename: String) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// push and initialize a new stackframe")
            eol()
            latestNode = Node(type: .text(value: "// push and initialize a new stackframe"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// new context inherits current context left margin")
            eol()
            latestNode = Node(type: .text(value: "// new context inherits current context left margin"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var leftMargin = 0")
            eol()
            out("if stack.count >= 1 { leftMargin = stack[stack.count - 1].leftMargin }")
            eol()
            latestNode = Node(type: .text(value: "var leftMargin = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "if stack.count >= 1 { leftMargin = stack[stack.count - 1].leftMargin }"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// stackframe definition")
            eol()
            latestNode = Node(type: .text(value: "// stackframe definition"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("stack.append(StackFrame(erule: rulename, leftMargin: leftMargin))")
            eol()
            latestNode = Node(type: .text(value: "stack.append(StackFrame(erule: rulename, leftMargin: leftMargin))"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func contextPop() {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func contextPop() {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// pop and possibly deallocate old stackframe")
            eol()
            latestNode = Node(type: .text(value: "// pop and possibly deallocate old stackframe"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("_ = stack.popLast() // pop stackframe")
            eol()
            latestNode = Node(type: .text(value: "_ = stack.popLast() // pop stackframe"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func out(_ output: String) {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func out(_ output: String) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// output string")
            eol()
            latestNode = Node(type: .text(value: "// output string"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var indent = 0")
            eol()
            latestNode = Node(type: .text(value: "var indent = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// if newline last output, add left margin before string")
            eol()
            latestNode = Node(type: .text(value: "// if newline last output, add left margin before string"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("if outputBuffer.count > 0 && String(UnicodeScalar(Array(outputBuffer.utf8)[outputBuffer.count - 1])) == ")
            out(String(UnicodeScalar(34)))
            out(String(UnicodeScalar(92)))
            out("n")
            out(String(UnicodeScalar(34)))
            out(" {")
            eol()
            latestNode = Node(type: .text(value: "if outputBuffer.count > 0 && String(UnicodeScalar(Array(outputBuffer.utf8)[outputBuffer.count - 1])) == "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(92))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: " {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("  indent = stack[stack.count - 1].leftMargin")
            eol()
            latestNode = Node(type: .text(value: "  indent = stack[stack.count - 1].leftMargin"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("  while indent > 0 { outputBuffer += ")
            out(String(UnicodeScalar(34)))
            out(" ")
            out(String(UnicodeScalar(34)))
            out("; indent -= 1 } }")
            eol()
            latestNode = Node(type: .text(value: "  while indent > 0 { outputBuffer += "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: " "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "; indent -= 1 } }"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("outputBuffer += output")
            eol()
            latestNode = Node(type: .text(value: "outputBuffer += output"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func add(childNode: Node) {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func add(childNode: Node) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("currentNode?.children.append(childNode)")
            eol()
            latestNode = Node(type: .text(value: "currentNode?.children.append(childNode)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func pushNodeContext(node: Node) {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func pushNodeContext(node: Node) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("nodeContextStack.append(currentNode!)")
            eol()
            latestNode = Node(type: .text(value: "nodeContextStack.append(currentNode!)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("currentNode = node")
            eol()
            latestNode = Node(type: .text(value: "currentNode = node"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func popNodeContext() {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func popNodeContext() {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("currentNode = nodeContextStack.popLast()!")
            eol()
            latestNode = Node(type: .text(value: "currentNode = nodeContextStack.popLast()!"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func stash(node: Node) {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func stash(node: Node) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("stashedNodes.append(node)")
            eol()
            latestNode = Node(type: .text(value: "stashedNodes.append(node)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func popNodeStash() {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func popNodeStash() {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("currentNode?.children.append(contentsOf: stashedNodes)")
            eol()
            out("stashedNodes = []")
            eol()
            latestNode = Node(type: .text(value: "currentNode?.children.append(contentsOf: stashedNodes)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "stashedNodes = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func eol () {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func eol () {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// output end of line")
            eol()
            latestNode = Node(type: .text(value: "// output end of line"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("outputBuffer += ")
            out(String(UnicodeScalar(34)))
            out(String(UnicodeScalar(92)))
            out("n")
            out(String(UnicodeScalar(34)))
            eol()
            latestNode = Node(type: .text(value: "outputBuffer += "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(92))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func test (_ stringToCompare: String) {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func test (_ stringToCompare: String) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// test for a string in the input")
            eol()
            latestNode = Node(type: .text(value: "// test for a string in the input"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("var inputOffset = 0")
            eol()
            latestNode = Node(type: .text(value: "var inputOffset = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// delete whitespace")
            eol()
            latestNode = Node(type: .text(value: "// delete whitespace"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("while Array(inbuf.utf8)[inp] == 32 ||")
            eol()
            latestNode = Node(type: .text(value: "while Array(inbuf.utf8)[inp] == 32 ||"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("       Array(inbuf.utf8)[inp] == 9 ||")
            eol()
            latestNode = Node(type: .text(value: "       Array(inbuf.utf8)[inp] == 9 ||"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("       Array(inbuf.utf8)[inp] == 13 ||")
            eol()
            latestNode = Node(type: .text(value: "       Array(inbuf.utf8)[inp] == 13 ||"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("       Array(inbuf.utf8)[inp] == 10 { inp += 1}")
            eol()
            latestNode = Node(type: .text(value: "       Array(inbuf.utf8)[inp] == 10 { inp += 1}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// test string case insensitive")
            eol()
            latestNode = Node(type: .text(value: "// test string case insensitive"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("isParsed = true")
            eol()
            latestNode = Node(type: .text(value: "isParsed = true"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("while isParsed && (inputOffset < stringToCompare.count) && ((inp + inputOffset) < inbuf.count) {")
            eol()
            latestNode = Node(type: .text(value: "while isParsed && (inputOffset < stringToCompare.count) && ((inp + inputOffset) < inbuf.count) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("isParsed = String(UnicodeScalar(Array(stringToCompare.utf8)[inputOffset])).uppercased() ==")
            eol()
            latestNode = Node(type: .text(value: "isParsed = String(UnicodeScalar(Array(stringToCompare.utf8)[inputOffset])).uppercased() =="))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("                String(UnicodeScalar(Array(inbuf.utf8)[inp + inputOffset])).uppercased()")
            eol()
            latestNode = Node(type: .text(value: "                String(UnicodeScalar(Array(inbuf.utf8)[inp + inputOffset])).uppercased()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("  inputOffset += 1 }")
            eol()
            latestNode = Node(type: .text(value: "  inputOffset += 1 }"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("isParsed = isParsed && (inputOffset == stringToCompare.count)")
            eol()
            latestNode = Node(type: .text(value: "isParsed = isParsed && (inputOffset == stringToCompare.count)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// advance input if found")
            eol()
            latestNode = Node(type: .text(value: "// advance input if found"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("if isParsed { inp = inp + stringToCompare.count }")
            eol()
            latestNode = Node(type: .text(value: "if isParsed { inp = inp + stringToCompare.count }"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("public enum CompilerError: Error {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "public enum CompilerError: Error {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("case parseFailure(rule: String, inputOffset: Int)")
            eol()
            latestNode = Node(type: .text(value: "case parseFailure(rule: String, inputOffset: Int)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("final func err() throws {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .text(value: "final func err() throws {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("// compilation error, provide error indication and context")
            eol()
            latestNode = Node(type: .text(value: "// compilation error, provide error indication and context"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            out("throw CompilerError.parseFailure(rule: stack[stack.count - 1].erule, inputOffset: inp)")
            eol()
            latestNode = Node(type: .text(value: "throw CompilerError.parseFailure(rule: stack[stack.count - 1].erule, inputOffset: inp)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
        }
    }

    // parsing rule definition 
    final func rulePR() throws {
        contextPush("PR")
        defer { contextPop() }
        try ruleID()
        if isParsed {
            out("final func rule")
            out(token)
            out("() throws {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .rule(value: token))
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            out("contextPush(")
            out(String(UnicodeScalar(34)))
            out(token)
            out(String(UnicodeScalar(34)))
            out(")")
            eol()
            out("defer { contextPop() }")
            eol()
            test("=")
            if !isParsed { try err() }
            try ruleEX1()
            if !isParsed { try err() }
            test(";")
            if !isParsed { try err() }
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            popNodeContext()
        }
    }

    // token rule definition 
    final func ruleTR() throws {
        contextPush("TR")
        defer { contextPop() }
        try ruleID()
        if isParsed {
            out("final func rule")
            out(token)
            out("() throws {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            latestNode = Node(type: .rule(value: token))
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            out("contextPush(")
            out(String(UnicodeScalar(34)))
            out(token)
            out(String(UnicodeScalar(34)))
            out(")")
            eol()
            out("defer { contextPop() }")
            eol()
            test(":")
            if !isParsed { try err() }
            try ruleTX1()
            if !isParsed { try err() }
            test(";")
            if !isParsed { try err() }
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            eol()
            popNodeContext()
        }
    }

    // comment definition 
    final func ruleCOMMENT() throws {
        contextPush("COMMENT")
        defer { contextPop() }
        test("[")
        if isParsed {
            try ruleCMLINE()
            if !isParsed { try err() }
            test("]")
            if !isParsed { try err() }
            out("//")
            out(token)
            eol()
            latestNode = Node(type: .comment(value: token))
            add(childNode: latestNode!)
        }
    }

    // parsing expressions 
    final func ruleEX1() throws {
        contextPush("EX1")
        defer { contextPop() }
        latestNode = Node(type: .or)
        if true {
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            try ruleEX2()
            if !isParsed { try err() }
            isParsed = true
            while isParsed {
                test("/")
                if isParsed {
                    out("if !isParsed {")
                    stack[stack.count - 1].leftMargin += 4
                    eol()
                    try ruleEX2()
                    if !isParsed { try err() }
                    stack[stack.count - 1].leftMargin -= 4
                    out("}")
                    eol()
                }
            }
            isParsed = true
            if !isParsed { try err() }
            popNodeContext()
        }
    }

    final func ruleEX2() throws {
        contextPush("EX2")
        defer { contextPop() }
        latestNode = Node(type: .and)
        if true {
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            try ruleEX3()
            if isParsed {
                out("if isParsed {")
                stack[stack.count - 1].leftMargin += 4
                eol()
            }
            if !isParsed {
                try ruleOUTPUT()
                if isParsed {
                    out("if true {")
                    stack[stack.count - 1].leftMargin += 4
                    eol()
                }
            }
            if !isParsed {
                try ruleNODE()
                if isParsed {
                    out("if true {")
                    stack[stack.count - 1].leftMargin += 4
                    eol()
                }
            }
            if !isParsed { try err() }
            isParsed = true
            while isParsed {
                try ruleEX3()
                if isParsed {
                    out("if !isParsed { try err() }")
                    eol()
                }
                if !isParsed {
                    try ruleOUTPUT()
                    if isParsed {
                    }
                }
                if !isParsed {
                    try ruleNODE()
                    if isParsed {
                    }
                }
            }
            isParsed = true
            if !isParsed { try err() }
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            popNodeContext()
        }
    }

    final func ruleEX3() throws {
        contextPush("EX3")
        defer { contextPop() }
        try ruleID()
        if isParsed {
            out("try rule")
            out(token)
            out("()")
            eol()
            latestNode = Node(type: .id(value: token))
            add(childNode: latestNode!)
        }
        if !isParsed {
            try ruleSTRING()
            if isParsed {
                out("test(")
                out(String(UnicodeScalar(34)))
                out(token)
                out(String(UnicodeScalar(34)))
                out(")")
                eol()
                latestNode = Node(type: .string(value: token))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test("(")
            if isParsed {
                try ruleEX1()
                if !isParsed { try err() }
                test(")")
                if !isParsed { try err() }
            }
        }
        if !isParsed {
            test(".EMPTY")
            if isParsed {
                out("isParsed = true")
                eol()
                latestNode = Node(type: .empty)
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".LITCHR")
            if isParsed {
                out("token = String(Array(inbuf.utf8)[inp])")
                eol()
                latestNode = Node(type: .readCharacter)
                add(childNode: latestNode!)
                out("inp += 1")
                eol()
            }
        }
        if !isParsed {
            test("$")
            if isParsed {
                out("isParsed = true")
                eol()
                out("while isParsed {")
                stack[stack.count - 1].leftMargin += 4
                eol()
                latestNode = Node(type: .zeroOrMore)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                try ruleEX3()
                if !isParsed { try err() }
                popNodeContext()
                stack[stack.count - 1].leftMargin -= 4
                out("}")
                eol()
                out("isParsed = true")
                eol()
            }
        }
    }

    // output expressions 
    final func ruleOUTPUT() throws {
        contextPush("OUTPUT")
        defer { contextPop() }
        test(".OUT")
        if isParsed {
            test("(")
            if !isParsed { try err() }
            latestNode = Node(type: .output)
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            isParsed = true
            while isParsed {
                try ruleOUT1()
            }
            isParsed = true
            if !isParsed { try err() }
            popNodeContext()
            test(")")
            if !isParsed { try err() }
        }
    }

    final func ruleOUT1() throws {
        contextPush("OUT1")
        defer { contextPop() }
        test("*")
        if isParsed {
            out("out(token)")
            eol()
            latestNode = Node(type: .text(value: "out(token)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
        }
        if !isParsed {
            try ruleSTRING()
            if isParsed {
                out("out(")
                out(String(UnicodeScalar(34)))
                out(token)
                out(String(UnicodeScalar(34)))
                out(")")
                eol()
                latestNode = Node(type: .text(value: "out("))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: token))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: ")"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            try ruleNUMBER()
            if isParsed {
                out("out(String(UnicodeScalar(")
                out(token)
                out(")))")
                eol()
                latestNode = Node(type: .text(value: "out(String(UnicodeScalar("))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: token))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: ")))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NL")
            if isParsed {
                out("eol()")
                eol()
                latestNode = Node(type: .text(value: "eol()"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".LM+")
            if isParsed {
                out("stack[stack.count - 1].leftMargin += 4")
                eol()
                latestNode = Node(type: .text(value: "stack[stack.count - 1].leftMargin += 4"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".LM-")
            if isParsed {
                out("stack[stack.count - 1].leftMargin -= 4")
                eol()
                latestNode = Node(type: .text(value: "stack[stack.count - 1].leftMargin -= 4"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
    }

    // .NODE( .NODE_COMMENT '//' * ' compiler' ) 
    //node expressions 
    final func ruleNODE() throws {
        contextPush("NODE")
        defer { contextPop() }
        test(".NODECONTEXTPUSH")
        if isParsed {
            test("(")
            if !isParsed { try err() }
            test(")")
            if !isParsed { try err() }
            out("pushNodeContext(node: latestNode!)")
            eol()
            latestNode = Node(type: .output)
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            latestNode = Node(type: .text(value: "pushNodeContext(node: latestNode!)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
        }
        if !isParsed {
            test(".NODECONTEXTPOP")
            if isParsed {
                test("(")
                if !isParsed { try err() }
                test(")")
                if !isParsed { try err() }
                out("popNodeContext()")
                eol()
                latestNode = Node(type: .output)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                latestNode = Node(type: .text(value: "popNodeContext()"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !isParsed {
            test(".NODESTASHPOP")
            if isParsed {
                test("(")
                if !isParsed { try err() }
                test(")")
                if !isParsed { try err() }
                out("popNodeStash()")
                eol()
                latestNode = Node(type: .output)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                latestNode = Node(type: .text(value: "popNodeStash()"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !isParsed {
            test(".NODESTASHPUSH")
            if isParsed {
                test("(")
                if !isParsed { try err() }
                test(")")
                if !isParsed { try err() }
                out("stash(node: latestNode!)")
                eol()
                latestNode = Node(type: .output)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                latestNode = Node(type: .text(value: "stash(node: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !isParsed {
            test(".NODEADDCHILD")
            if isParsed {
                test("(")
                if !isParsed { try err() }
                test(")")
                if !isParsed { try err() }
                out("add(childNode: latestNode!)")
                eol()
                latestNode = Node(type: .output)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !isParsed {
            test(".NODE")
            if isParsed {
                latestNode = Node(type: .output)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                test("(")
                if !isParsed { try err() }
                try ruleNODETYPE()
                if !isParsed { try err() }
                test(")")
                if !isParsed { try err() }
                popNodeContext()
            }
        }
    }

    final func ruleNODETYPE() throws {
        contextPush("NODETYPE")
        defer { contextPop() }
        test(".NODEOUTPUT")
        if isParsed {
            out("latestNode = Node(type: .output)")
            eol()
            latestNode = Node(type: .text(value: "latestNode = Node(type: .output)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
        }
        if !isParsed {
            test(".NODERULE")
            if isParsed {
                out("latestNode = Node(type: .rule(value: token))")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .rule(value: token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODECOMMENT")
            if isParsed {
                out("latestNode = Node(type: .comment(value: token))")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .comment(value: token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODEID")
            if isParsed {
                out("latestNode = Node(type: .id(value: token))")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .id(value: token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODETOKENEXPRESSION")
            if isParsed {
                out("latestNode = Node(type: .tokenExpression)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenExpression)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODETOKENSTART")
            if isParsed {
                out("latestNode = Node(type: .tokenStart)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenStart)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODETOKENEND")
            if isParsed {
                out("latestNode = Node(type: .tokenEnd)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenEnd)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODETOKENANYBUT")
            if isParsed {
                out("latestNode = Node(type: .tokenAnyBut)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenAnyBut)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODETOKENANY")
            if isParsed {
                out("latestNode = Node(type: .tokenAny)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenAny)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODECHAREXPRESSION")
            if isParsed {
                out("latestNode = Node(type: .charExpression)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .charExpression)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODECHAREQUAL")
            if isParsed {
                out("latestNode = Node(type: .charEqual)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .charEqual)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODECHARLESSTHANEQUAL")
            if isParsed {
                out("latestNode = Node(type: .charLessThanOrEqual)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .charLessThanOrEqual)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODECHARGREATERTHANEQUAL")
            if isParsed {
                out("latestNode = Node(type: .charGreaterThanOrEqual)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .charGreaterThanOrEqual)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODESTRING")
            if isParsed {
                out("latestNode = Node(type: .string(value: token))")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .string(value: token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODENUMBER")
            if isParsed {
                out("latestNode = Node(type: .number(value: token))")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .number(value: token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODECHAR")
            if isParsed {
                out("latestNode = Node(type: .character(value: token))")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .character(value: token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODETEXT")
            if isParsed {
                isParsed = true
                while isParsed {
                    try ruleNODETEXTCONTENT()
                }
                isParsed = true
                if !isParsed { try err() }
            }
        }
        if !isParsed {
            test(".NODEREADCHAR")
            if isParsed {
                out("latestNode = Node(type: .readCharacter)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .readCharacter)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODEEMPTY")
            if isParsed {
                out("latestNode = Node(type: .empty)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .empty)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODEOR")
            if isParsed {
                out("latestNode = Node(type: .or)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .or)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODEAND")
            if isParsed {
                out("latestNode = Node(type: .and)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .and)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NODEZEROORMORE")
            if isParsed {
                out("latestNode = Node(type: .zeroOrMore)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .zeroOrMore)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
    }

    final func ruleNODETEXTCONTENT() throws {
        contextPush("NODETEXTCONTENT")
        defer { contextPop() }
        test("*")
        if isParsed {
            out("latestNode = Node(type: .text(value: token))")
            eol()
            out("add(childNode: latestNode!)")
            eol()
            latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: token))"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
        }
        if !isParsed {
            try ruleSTRING()
            if isParsed {
                out("latestNode = Node(type: .text(value: ")
                out(String(UnicodeScalar(34)))
                out(token)
                out(String(UnicodeScalar(34)))
                out("))")
                eol()
                out("add(childNode: latestNode!)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: "))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: token))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            try ruleNUMBER()
            if isParsed {
                out("latestNode = Node(type: .text(value: String(UnicodeScalar(")
                out(token)
                out("))))")
                eol()
                out("add(childNode: latestNode!)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: String(UnicodeScalar("))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: token))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "))))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".NL")
            if isParsed {
                out("latestNode = Node(type: .text(value: ")
                out(String(UnicodeScalar(34)))
                out(String(UnicodeScalar(92)))
                out("n")
                out(String(UnicodeScalar(34)))
                out("))")
                eol()
                out("add(childNode: latestNode!)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: "))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(92))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "n"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".LM+")
            if isParsed {
                out("latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))")
                eol()
                out("add(childNode: latestNode!)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test(".LM-")
            if isParsed {
                out("latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))")
                eol()
                out("add(childNode: latestNode!)")
                eol()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .leftMargin(margin: stack[stack.count - 1].leftMargin))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
    }

    // token expressions 
    final func ruleTX1() throws {
        contextPush("TX1")
        defer { contextPop() }
        latestNode = Node(type: .tokenExpression)
        if true {
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            latestNode = Node(type: .or)
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            try ruleTX2()
            if !isParsed { try err() }
            isParsed = true
            while isParsed {
                test("/")
                if isParsed {
                    out("if !isParsed {")
                    stack[stack.count - 1].leftMargin += 4
                    eol()
                    try ruleTX2()
                    if !isParsed { try err() }
                    stack[stack.count - 1].leftMargin -= 4
                    out("}")
                    eol()
                }
            }
            isParsed = true
            if !isParsed { try err() }
            popNodeContext()
            popNodeContext()
        }
    }

    final func ruleTX2() throws {
        contextPush("TX2")
        defer { contextPop() }
        latestNode = Node(type: .and)
        if true {
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            try ruleTX3()
            if !isParsed { try err() }
            out("if isParsed {")
            stack[stack.count - 1].leftMargin += 4
            eol()
            isParsed = true
            while isParsed {
                try ruleTX3()
                if isParsed {
                    out("if !isParsed { return }")
                    eol()
                }
            }
            isParsed = true
            if !isParsed { try err() }
            stack[stack.count - 1].leftMargin -= 4
            out("}")
            eol()
            popNodeContext()
        }
    }

    final func ruleTX3() throws {
        contextPush("TX3")
        defer { contextPop() }
        test(".TOKEN")
        if isParsed {
            out("isToken = true")
            eol()
            out("token = ")
            out(String(UnicodeScalar(34)))
            out(String(UnicodeScalar(34)))
            eol()
            latestNode = Node(type: .tokenStart)
            add(childNode: latestNode!)
        }
        if !isParsed {
            test(".DELTOK")
            if isParsed {
                out("isToken = false")
                eol()
                latestNode = Node(type: .tokenEnd)
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test("$")
            if isParsed {
                out("isParsed = true")
                eol()
                out("while isParsed {")
                stack[stack.count - 1].leftMargin += 4
                eol()
                latestNode = Node(type: .zeroOrMore)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                try ruleTX3()
                if !isParsed { try err() }
                popNodeContext()
                stack[stack.count - 1].leftMargin -= 4
                out("}")
                eol()
            }
        }
        if isParsed {
            out("isParsed = true")
            eol()
        }
        if !isParsed {
            test(".ANYBUT(")
            if isParsed {
                latestNode = Node(type: .tokenAnyBut)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                try ruleCX1()
                if !isParsed { try err() }
                popNodeContext()
                test(")")
                if !isParsed { try err() }
                out("isParsed = !isParsed")
                eol()
                out("if isParsed {")
                stack[stack.count - 1].leftMargin += 4
                eol()
                out("if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }")
                eol()
                out("inp += 1 }")
                stack[stack.count - 1].leftMargin -= 4
                eol()
            }
        }
        if !isParsed {
            test(".ANY(")
            if isParsed {
                latestNode = Node(type: .tokenAny)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                try ruleCX1()
                if !isParsed { try err() }
                popNodeContext()
                test(")")
                if !isParsed { try err() }
                out("if isParsed {")
                stack[stack.count - 1].leftMargin += 4
                eol()
                out("if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }")
                eol()
                out("inp += 1 }")
                stack[stack.count - 1].leftMargin -= 4
                eol()
            }
        }
        if !isParsed {
            try ruleID()
            if isParsed {
                out("try rule")
                out(token)
                out("()")
                eol()
                latestNode = Node(type: .id(value: token))
                add(childNode: latestNode!)
            }
        }
        if !isParsed {
            test("(")
            if isParsed {
                try ruleTX1()
                if !isParsed { try err() }
                test(")")
                if !isParsed { try err() }
            }
        }
    }

    // character expressions 
    final func ruleCX1() throws {
        contextPush("CX1")
        defer { contextPop() }
        out("isParsed =")
        stack[stack.count - 1].leftMargin += 4
        eol()
        if true {
            latestNode = Node(type: .charExpression)
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            latestNode = Node(type: .or)
            add(childNode: latestNode!)
            pushNodeContext(node: latestNode!)
            try ruleCX2()
            if !isParsed { try err() }
            isParsed = true
            while isParsed {
                test("!")
                if isParsed {
                    out(" ||")
                    eol()
                    try ruleCX2()
                    if !isParsed { try err() }
                }
            }
            isParsed = true
            if !isParsed { try err() }
            popNodeContext()
            stack[stack.count - 1].leftMargin -= 4
            eol()
            popNodeContext()
        }
    }

    final func ruleCX2() throws {
        contextPush("CX2")
        defer { contextPop() }
        try ruleCX3()
        if isParsed {
            stash(node: latestNode!)
            test(":")
            if isParsed {
                latestNode = Node(type: .and)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                out("( Array(inbuf.utf8)[inp] >= ")
                out(token)
                out(" &&")
                eol()
                latestNode = Node(type: .charGreaterThanOrEqual)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                popNodeStash()
                popNodeContext()
                try ruleCX3()
                if !isParsed { try err() }
                stash(node: latestNode!)
                out(" Array(inbuf.utf8)[inp] <= ")
                out(token)
                out(" )")
                latestNode = Node(type: .charLessThanOrEqual)
                add(childNode: latestNode!)
                pushNodeContext(node: latestNode!)
                popNodeStash()
                popNodeContext()
                popNodeContext()
            }
            if !isParsed {
                isParsed = true
                if isParsed {
                    out("Array(inbuf.utf8)[inp] == ")
                    out(token)
                    latestNode = Node(type: .charEqual)
                    add(childNode: latestNode!)
                    pushNodeContext(node: latestNode!)
                    popNodeStash()
                    popNodeContext()
                }
            }
            if !isParsed { try err() }
        }
    }

    final func ruleCX3() throws {
        contextPush("CX3")
        defer { contextPop() }
        try ruleNUMBER()
        if isParsed {
            latestNode = Node(type: .number(value: token))
        }
        if !isParsed {
            try ruleSQUOTE()
            if isParsed {
                token = String(Array(inbuf.utf8)[inp])
                inp += 1
                if !isParsed { try err() }
                latestNode = Node(type: .character(value: token))
            }
        }
    }

    // token definitions 
    final func rulePREFIX() throws {
        contextPush("PREFIX")
        defer { contextPop() }
        isParsed = true
        while isParsed {
            isParsed =
                Array(inbuf.utf8)[inp] == 32 ||
                Array(inbuf.utf8)[inp] == 9 ||
                Array(inbuf.utf8)[inp] == 13 ||
                Array(inbuf.utf8)[inp] == 10
            if isParsed {
                if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }
                inp += 1 }
        }
        isParsed = true
        if isParsed {
        }
    }

    final func ruleID() throws {
        contextPush("ID")
        defer { contextPop() }
        try rulePREFIX()
        if isParsed {
            isToken = true
            token = ""
            isParsed = true
            if !isParsed { return }
            try ruleALPHA()
            if !isParsed { return }
            isParsed = true
            while isParsed {
                try ruleALPHA()
                if isParsed {
                }
                if !isParsed {
                    try ruleDIGIT()
                    if isParsed {
                    }
                }
            }
            isParsed = true
            if !isParsed { return }
            isToken = false
            isParsed = true
            if !isParsed { return }
        }
    }

    final func ruleNUMBER() throws {
        contextPush("NUMBER")
        defer { contextPop() }
        try rulePREFIX()
        if isParsed {
            isToken = true
            token = ""
            isParsed = true
            if !isParsed { return }
            try ruleDIGIT()
            if !isParsed { return }
            isParsed = true
            while isParsed {
                try ruleDIGIT()
            }
            isParsed = true
            if !isParsed { return }
            isToken = false
            isParsed = true
            if !isParsed { return }
        }
    }

    final func ruleSTRING() throws {
        contextPush("STRING")
        defer { contextPop() }
        try rulePREFIX()
        if isParsed {
            isParsed =
                Array(inbuf.utf8)[inp] == 39
            if isParsed {
                if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }
                inp += 1 }
            if !isParsed { return }
            isToken = true
            token = ""
            isParsed = true
            if !isParsed { return }
            isParsed = true
            while isParsed {
                isParsed =
                    Array(inbuf.utf8)[inp] == 13 ||
                    Array(inbuf.utf8)[inp] == 10 ||
                    Array(inbuf.utf8)[inp] == 39
                isParsed = !isParsed
                if isParsed {
                    if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }
                    inp += 1 }
            }
            isParsed = true
            if !isParsed { return }
            isToken = false
            isParsed = true
            if !isParsed { return }
            isParsed =
                Array(inbuf.utf8)[inp] == 39
            if isParsed {
                if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }
                inp += 1 }
            if !isParsed { return }
        }
    }

    final func ruleALPHA() throws {
        contextPush("ALPHA")
        defer { contextPop() }
        isParsed =
            ( Array(inbuf.utf8)[inp] >= 65 &&
             Array(inbuf.utf8)[inp] <= 90 ) ||
            ( Array(inbuf.utf8)[inp] >= 97 &&
             Array(inbuf.utf8)[inp] <= 122 )
        if isParsed {
            if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }
            inp += 1 }
        if isParsed {
        }
    }

    final func ruleDIGIT() throws {
        contextPush("DIGIT")
        defer { contextPop() }
        isParsed =
            ( Array(inbuf.utf8)[inp] >= 48 &&
             Array(inbuf.utf8)[inp] <= 57 )
        if isParsed {
            if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }
            inp += 1 }
        if isParsed {
        }
    }

    final func ruleSQUOTE() throws {
        contextPush("SQUOTE")
        defer { contextPop() }
        try rulePREFIX()
        if isParsed {
            isParsed =
                Array(inbuf.utf8)[inp] == 39
            if isParsed {
                if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }
                inp += 1 }
            if !isParsed { return }
        }
    }

    final func ruleCMLINE() throws {
        contextPush("CMLINE")
        defer { contextPop() }
        isToken = true
        token = ""
        isParsed = true
        if isParsed {
            isParsed = true
            while isParsed {
                isParsed =
                    Array(inbuf.utf8)[inp] == 10 ||
                    Array(inbuf.utf8)[inp] == 13 ||
                    Array(inbuf.utf8)[inp] == 93
                isParsed = !isParsed
                if isParsed {
                    if isToken { token += String(UnicodeScalar(Array(inbuf.utf8)[inp])) }
                    inp += 1 }
            }
            isParsed = true
            if !isParsed { return }
            isToken = false
            isParsed = true
            if !isParsed { return }
        }
    }

    struct StackFrame {
        var erule: String
        var leftMargin: Int
    }
    // runtime variables
    var isParsed = false
    var isToken = false
    var inp = 0
    var inbuf = ""
    public var outputBuffer = ""
    public var token = ""
    public var rootAST = Node(type: .root)
    var currentNode: Node?
    var latestNode: Node?
    var nodeContextStack: [Node] = []
    var stashedNodes: [Node] = []
    var stack: [StackFrame] = []

    public init() {
        initialize()
    }

    final func initialize () {
        // initialize for another compile
        isParsed = false
        isToken = false
        inp = 0
        outputBuffer = ""
        token = ""
        stack = []
        rootAST = Node(type: .root)
        currentNode = rootAST
        nodeContextStack = []
        stashedNodes = []
    }

    final func contextPush(_ rulename: String) {
        // push and initialize a new stackframe
        // new context inherits current context left margin
        var leftMargin = 0
        if stack.count >= 1 { leftMargin = stack[stack.count - 1].leftMargin }
        // stackframe definition
        stack.append(StackFrame(erule: rulename, leftMargin: leftMargin))
    }

    final func contextPop() {
        // pop and possibly deallocate old stackframe
        _ = stack.popLast() // pop stackframe
    }

    final func out(_ output: String) {
        // output string
        var indent = 0
        // if newline last output, add left margin before string
        if outputBuffer.count > 0 && String(UnicodeScalar(Array(outputBuffer.utf8)[outputBuffer.count - 1])) == "\n" {
          indent = stack[stack.count - 1].leftMargin
          while indent > 0 { outputBuffer += " "; indent -= 1 } }
        outputBuffer += output
    }

    final func add(childNode: Node) {
        currentNode?.children.append(childNode)
    }

    final func pushNodeContext(node: Node) {
        nodeContextStack.append(currentNode!)
        currentNode = node
    }

    final func popNodeContext() {
        currentNode = nodeContextStack.popLast()!
    }

    final func stash(node: Node) {
        stashedNodes.append(node)
    }

    final func popNodeStash() {
        currentNode?.children.append(contentsOf: stashedNodes)
        stashedNodes = []
    }

    final func eol () {
        // output end of line
        outputBuffer += "\n"
    }

    final func test (_ stringToCompare: String) {
        // test for a string in the input
        var inputOffset = 0
        // delete whitespace
        while Array(inbuf.utf8)[inp] == 32 ||
               Array(inbuf.utf8)[inp] == 9 ||
               Array(inbuf.utf8)[inp] == 13 ||
               Array(inbuf.utf8)[inp] == 10 { inp += 1}
        // test string case insensitive
        isParsed = true
        while isParsed && (inputOffset < stringToCompare.count) && ((inp + inputOffset) < inbuf.count) {
        isParsed = String(UnicodeScalar(Array(stringToCompare.utf8)[inputOffset])).uppercased() ==
                        String(UnicodeScalar(Array(inbuf.utf8)[inp + inputOffset])).uppercased()
          inputOffset += 1 }
        isParsed = isParsed && (inputOffset == stringToCompare.count)
        // advance input if found
        if isParsed { inp = inp + stringToCompare.count }
    }

    public enum CompilerError: Error {
        case parseFailure(rule: String, inputOffset: Int)
    }

    final func err() throws {
        // compilation error, provide error indication and context
        throw CompilerError.parseFailure(rule: stack[stack.count - 1].erule, inputOffset: inp)
    }

}

