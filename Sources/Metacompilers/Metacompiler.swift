// PROGRAM compiler
public class Compiler {

    public func compile(_ input: String) throws {
        // initialize compiler variables
        self.inbuf = input
        self.initialize()
        // call the first rule
        try self.rulePROGRAM()
        // special case handling of first rule failure
        if !self.isParsed {
            throw CompilerError.parseFailure(rule: "PROGRAM", inputOffset: self.inp)
        }
    }

    // body of compiler definition 
    func rulePROGRAM() throws {
        self.contextPush("PROGRAM")
        defer { self.contextPop() }
        self.test(".SYNTAX")
        if self.isParsed {
            try self.ruleID()
            if !self.isParsed { try self.err() }
            self.out("// ")
            self.out(self.token)
            self.out(" compiler")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: self.token))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: " compiler"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("public class Compiler {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "public class Compiler {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            try self.rulePREAMBLE()
            if !self.isParsed { try self.err() }
            self.isParsed = true
            while self.isParsed {
                try self.rulePR()
                if self.isParsed {
                }
                if !self.isParsed {
                    try self.ruleCOMMENT()
                    if self.isParsed {
                    }
                }
            }
            self.isParsed = true
            if !self.isParsed { try self.err() }
            self.test(".TOKENS")
            if !self.isParsed { try self.err() }
            self.isParsed = true
            while self.isParsed {
                try self.ruleTR()
                if self.isParsed {
                }
                if !self.isParsed {
                    try self.ruleCOMMENT()
                    if self.isParsed {
                    }
                }
            }
            self.isParsed = true
            if !self.isParsed { try self.err() }
            self.test(".END")
            if !self.isParsed { try self.err() }
            try self.rulePOSTAMBLE()
            if !self.isParsed { try self.err() }
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
        }
    }

    // object definition preamble 
    func rulePREAMBLE() throws {
        self.contextPush("PREAMBLE")
        defer { self.contextPop() }
        self.out("public func compile(_ input: String) throws {")
        self.stack[self.stack.count - 1].leftMargin += 4
        self.eol()
        if true {
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "public func compile(_ input: String) throws {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// initialize compiler variables")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// initialize compiler variables"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.inbuf = input")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.inbuf = input"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.initialize()")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.initialize()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// call the first rule")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// call the first rule"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("try self.rule")
            self.out(self.token)
            self.out("()")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "try self.rule"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: self.token))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// special case handling of first rule failure")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// special case handling of first rule failure"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("if !self.isParsed {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "if !self.isParsed {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("throw CompilerError.parseFailure(rule: ")
            self.out(String(UnicodeScalar(34)))
            self.out(self.token)
            self.out(String(UnicodeScalar(34)))
            self.out(", inputOffset: self.inp)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "throw CompilerError.parseFailure(rule: "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: self.token))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: ", inputOffset: self.inp)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
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
    func rulePOSTAMBLE() throws {
        self.contextPush("POSTAMBLE")
        defer { self.contextPop() }
        self.out("struct StackFrame {")
        self.stack[self.stack.count - 1].leftMargin += 4
        self.eol()
        if true {
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "struct StackFrame {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var erule: String")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var erule: String"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var leftMargin: Int")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var leftMargin: Int"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// runtime variables")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// runtime variables"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var isParsed = false")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var isParsed = false"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var isToken = false")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var isToken = false"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var inp = 0")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var inp = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var inbuf = ")
            self.out(String(UnicodeScalar(34)))
            self.out(String(UnicodeScalar(34)))
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var inbuf = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("public var outputBuffer = ")
            self.out(String(UnicodeScalar(34)))
            self.out(String(UnicodeScalar(34)))
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "public var outputBuffer = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("public var token = ")
            self.out(String(UnicodeScalar(34)))
            self.out(String(UnicodeScalar(34)))
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "public var token = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("public var rootAST = Node(type: .root)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "public var rootAST = Node(type: .root)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var currentNode: Node?")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var currentNode: Node?"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var latestNode: Node?")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var latestNode: Node?"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var nodeContextStack: [Node] = []")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var nodeContextStack: [Node] = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var stashedNodes: [Node] = []")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var stashedNodes: [Node] = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var stack: [StackFrame] = []")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var stack: [StackFrame] = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("public init() {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "public init() {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.initialize()")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.initialize()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func initialize () {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func initialize () {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// initialize for another compile")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// initialize for another compile"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.isParsed = false")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.isParsed = false"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.isToken = false")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.isToken = false"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.inp = 0")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.inp = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.outputBuffer = ")
            self.out(String(UnicodeScalar(34)))
            self.out(String(UnicodeScalar(34)))
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.outputBuffer = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.token = ")
            self.out(String(UnicodeScalar(34)))
            self.out(String(UnicodeScalar(34)))
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.token = "))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.stack = []")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.stack = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.rootAST = Node(type: .root)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.rootAST = Node(type: .root)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.currentNode = rootAST")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.currentNode = rootAST"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.nodeContextStack = []")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.nodeContextStack = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.stashedNodes = []")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.stashedNodes = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func contextPush(_ rulename: String) {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func contextPush(_ rulename: String) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// push and initialize a new stackframe")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// push and initialize a new stackframe"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// new context inherits current context left margin")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// new context inherits current context left margin"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var leftMargin = 0")
            self.eol()
            self.out("if self.stack.count >= 1 { leftMargin = self.stack[self.stack.count - 1].leftMargin }")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var leftMargin = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "if self.stack.count >= 1 { leftMargin = self.stack[self.stack.count - 1].leftMargin }"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// stackframe definition")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// stackframe definition"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.stack.append(StackFrame(erule: rulename, leftMargin: leftMargin))")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.stack.append(StackFrame(erule: rulename, leftMargin: leftMargin))"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func contextPop() {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func contextPop() {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// pop and possibly deallocate old stackframe")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// pop and possibly deallocate old stackframe"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("_ = self.stack.popLast() // pop stackframe")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "_ = self.stack.popLast() // pop stackframe"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func out(_ output: String) {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func out(_ output: String) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// output string")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// output string"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var indent = 0")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var indent = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// if newline last output, add left margin before string")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// if newline last output, add left margin before string"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("if self.outputBuffer.count > 0 && String(UnicodeScalar(Array(self.outputBuffer.utf8)[self.outputBuffer.count - 1])) == ")
            self.out(String(UnicodeScalar(34)))
            self.out(String(UnicodeScalar(92)))
            self.out("n")
            self.out(String(UnicodeScalar(34)))
            self.out(" {")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "if self.outputBuffer.count > 0 && String(UnicodeScalar(Array(self.outputBuffer.utf8)[self.outputBuffer.count - 1])) == "))
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
            popNodeContext()
            self.out("  indent = self.stack[self.stack.count - 1].leftMargin")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "  indent = self.stack[self.stack.count - 1].leftMargin"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("  while indent > 0 { self.outputBuffer += ")
            self.out(String(UnicodeScalar(34)))
            self.out(" ")
            self.out(String(UnicodeScalar(34)))
            self.out("; indent -= 1 } }")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "  while indent > 0 { self.outputBuffer += "))
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
            popNodeContext()
            self.out("self.outputBuffer += output")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.outputBuffer += output"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func add(childNode: Node) {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func add(childNode: Node) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("currentNode?.children.append(childNode)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "currentNode?.children.append(childNode)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func pushLastChildAsNodeContext() {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func pushLastChildAsNodeContext() {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("nodeContextStack.append(currentNode!)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "nodeContextStack.append(currentNode!)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("currentNode = currentNode!.children.last!")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "currentNode = currentNode!.children.last!"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func popNodeContext() {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func popNodeContext() {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("currentNode = nodeContextStack.popLast()!")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "currentNode = nodeContextStack.popLast()!"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func stash(node: Node) {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func stash(node: Node) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("stashedNodes.append(node)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "stashedNodes.append(node)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func popNodeStash() {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func popNodeStash() {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("currentNode?.children.append(contentsOf: stashedNodes)")
            self.eol()
            self.out("stashedNodes = []")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "currentNode?.children.append(contentsOf: stashedNodes)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "stashedNodes = []"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func eol () {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func eol () {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// output end of line")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// output end of line"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.outputBuffer += ")
            self.out(String(UnicodeScalar(34)))
            self.out(String(UnicodeScalar(92)))
            self.out("n")
            self.out(String(UnicodeScalar(34)))
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.outputBuffer += "))
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
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func test (_ stringToCompare: String) {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func test (_ stringToCompare: String) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// test for a string in the input")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// test for a string in the input"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("var inputOffset = 0")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "var inputOffset = 0"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// delete whitespace")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// delete whitespace"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("while Array(self.inbuf.utf8)[self.inp] == 32 ||")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "while Array(self.inbuf.utf8)[self.inp] == 32 ||"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("       Array(self.inbuf.utf8)[self.inp] == 9 ||")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "       Array(self.inbuf.utf8)[self.inp] == 9 ||"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("       Array(self.inbuf.utf8)[self.inp] == 13 ||")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "       Array(self.inbuf.utf8)[self.inp] == 13 ||"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("       Array(self.inbuf.utf8)[self.inp] == 10 { self.inp += 1}")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "       Array(self.inbuf.utf8)[self.inp] == 10 { self.inp += 1}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// test string case insensitive")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// test string case insensitive"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.isParsed = true")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.isParsed = true"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("while self.isParsed && (inputOffset < stringToCompare.count) && ((self.inp + inputOffset) < self.inbuf.count) {")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "while self.isParsed && (inputOffset < stringToCompare.count) && ((self.inp + inputOffset) < self.inbuf.count) {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.isParsed = String(UnicodeScalar(Array(stringToCompare.utf8)[inputOffset])).uppercased() ==")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.isParsed = String(UnicodeScalar(Array(stringToCompare.utf8)[inputOffset])).uppercased() =="))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("                String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp + inputOffset])).uppercased()")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "                String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp + inputOffset])).uppercased()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("  inputOffset += 1 }")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "  inputOffset += 1 }"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("self.isParsed = self.isParsed && (inputOffset == stringToCompare.count)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.isParsed = self.isParsed && (inputOffset == stringToCompare.count)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// advance input if found")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// advance input if found"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("if self.isParsed { self.inp = self.inp + stringToCompare.count }")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "if self.isParsed { self.inp = self.inp + stringToCompare.count }"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("public enum CompilerError: Error {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "public enum CompilerError: Error {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("case parseFailure(rule: String, inputOffset: Int)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "case parseFailure(rule: String, inputOffset: Int)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "}"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("func err() throws {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "func err() throws {"))
            add(childNode: latestNode!)
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("// compilation error, provide error indication and context")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "// compilation error, provide error indication and context"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.out("throw CompilerError.parseFailure(rule: self.stack[self.stack.count - 1].erule, inputOffset: self.inp)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "throw CompilerError.parseFailure(rule: self.stack[self.stack.count - 1].erule, inputOffset: self.inp)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))
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
    func rulePR() throws {
        self.contextPush("PR")
        defer { self.contextPop() }
        try self.ruleID()
        if self.isParsed {
            self.out("func rule")
            self.out(self.token)
            self.out("() throws {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            latestNode = Node(type: .rule(value: self.token))
            self.add(childNode: latestNode!)
            self.pushLastChildAsNodeContext()
            self.out("self.contextPush(")
            self.out(String(UnicodeScalar(34)))
            self.out(self.token)
            self.out(String(UnicodeScalar(34)))
            self.out(")")
            self.eol()
            self.out("defer { self.contextPop() }")
            self.eol()
            self.test("=")
            if !self.isParsed { try self.err() }
            try self.ruleEX1()
            if !self.isParsed { try self.err() }
            self.test(";")
            if !self.isParsed { try self.err() }
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            self.popNodeContext()
        }
    }

    // token rule definition 
    func ruleTR() throws {
        self.contextPush("TR")
        defer { self.contextPop() }
        try self.ruleID()
        if self.isParsed {
            self.out("func rule")
            self.out(self.token)
            self.out("() throws {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            latestNode = Node(type: .rule(value: self.token))
            self.add(childNode: latestNode!)
            self.pushLastChildAsNodeContext()
            self.out("self.contextPush(")
            self.out(String(UnicodeScalar(34)))
            self.out(self.token)
            self.out(String(UnicodeScalar(34)))
            self.out(")")
            self.eol()
            self.out("defer { self.contextPop() }")
            self.eol()
            self.test(":")
            if !self.isParsed { try self.err() }
            try self.ruleTX1()
            if !self.isParsed { try self.err() }
            self.test(";")
            if !self.isParsed { try self.err() }
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.eol()
            self.popNodeContext()
        }
    }

    // comment definition 
    func ruleCOMMENT() throws {
        self.contextPush("COMMENT")
        defer { self.contextPop() }
        self.test("[")
        if self.isParsed {
            try self.ruleCMLINE()
            if !self.isParsed { try self.err() }
            self.test("]")
            if !self.isParsed { try self.err() }
            self.out("//")
            self.out(self.token)
            self.eol()
            latestNode = Node(type: .comment(value: self.token))
            self.add(childNode: latestNode!)
        }
    }

    // parsing expressions 
    func ruleEX1() throws {
        self.contextPush("EX1")
        defer { self.contextPop() }
        add(childNode: Node(type: .or))
        if true {
            self.pushLastChildAsNodeContext()
            try self.ruleEX2()
            if !self.isParsed { try self.err() }
            self.isParsed = true
            while self.isParsed {
                self.test("/")
                if self.isParsed {
                    self.out("if !self.isParsed {")
                    self.stack[self.stack.count - 1].leftMargin += 4
                    self.eol()
                    try self.ruleEX2()
                    if !self.isParsed { try self.err() }
                    self.stack[self.stack.count - 1].leftMargin -= 4
                    self.out("}")
                    self.eol()
                }
            }
            self.isParsed = true
            if !self.isParsed { try self.err() }
            self.popNodeContext()
        }
    }

    func ruleEX2() throws {
        self.contextPush("EX2")
        defer { self.contextPop() }
        add(childNode: Node(type: .and))
        if true {
            self.pushLastChildAsNodeContext()
            try self.ruleEX3()
            if self.isParsed {
                self.out("if self.isParsed {")
                self.stack[self.stack.count - 1].leftMargin += 4
                self.eol()
            }
            if !self.isParsed {
                try self.ruleOUTPUT()
                if self.isParsed {
                    self.out("if true {")
                    self.stack[self.stack.count - 1].leftMargin += 4
                    self.eol()
                }
            }
            if !self.isParsed {
                try self.ruleNODE()
                if self.isParsed {
                    self.out("if true {")
                    self.stack[self.stack.count - 1].leftMargin += 4
                    self.eol()
                }
            }
            if !self.isParsed { try self.err() }
            self.isParsed = true
            while self.isParsed {
                try self.ruleEX3()
                if self.isParsed {
                    self.out("if !self.isParsed { try self.err() }")
                    self.eol()
                }
                if !self.isParsed {
                    try self.ruleOUTPUT()
                    if self.isParsed {
                    }
                }
                if !self.isParsed {
                    try self.ruleNODE()
                    if self.isParsed {
                    }
                }
            }
            self.isParsed = true
            if !self.isParsed { try self.err() }
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.popNodeContext()
        }
    }

    func ruleEX3() throws {
        self.contextPush("EX3")
        defer { self.contextPop() }
        try self.ruleID()
        if self.isParsed {
            self.out("try self.rule")
            self.out(self.token)
            self.out("()")
            self.eol()
            latestNode = Node(type: .id(value: self.token))
            self.add(childNode: latestNode!)
        }
        if !self.isParsed {
            try self.ruleSTRING()
            if self.isParsed {
                self.out("self.test(")
                self.out(String(UnicodeScalar(34)))
                self.out(self.token)
                self.out(String(UnicodeScalar(34)))
                self.out(")")
                self.eol()
                latestNode = Node(type: .string(value: self.token))
                self.add(childNode: latestNode!)
            }
        }
        if !self.isParsed {
            self.test("(")
            if self.isParsed {
                try self.ruleEX1()
                if !self.isParsed { try self.err() }
                self.test(")")
                if !self.isParsed { try self.err() }
            }
        }
        if !self.isParsed {
            self.test(".EMPTY")
            if self.isParsed {
                self.out("self.isParsed = true")
                self.eol()
                add(childNode: Node(type: .empty))
            }
        }
        if !self.isParsed {
            self.test(".LITCHR")
            if self.isParsed {
                self.out("self.token = String(Array(self.inbuf.utf8)[self.inp])")
                self.eol()
                latestNode = Node(type: .readCharacter)
                self.add(childNode: latestNode!)
                self.out("self.inp += 1")
                self.eol()
            }
        }
        if !self.isParsed {
            self.test("$")
            if self.isParsed {
                self.out("self.isParsed = true")
                self.eol()
                self.out("while self.isParsed {")
                self.stack[self.stack.count - 1].leftMargin += 4
                self.eol()
                add(childNode: Node(type: .zeroOrMore))
                self.pushLastChildAsNodeContext()
                try self.ruleEX3()
                if !self.isParsed { try self.err() }
                self.popNodeContext()
                self.stack[self.stack.count - 1].leftMargin -= 4
                self.out("}")
                self.eol()
                self.out("self.isParsed = true")
                self.eol()
            }
        }
    }

    // output expressions 
    func ruleOUTPUT() throws {
        self.contextPush("OUTPUT")
        defer { self.contextPop() }
        self.test(".OUT")
        if self.isParsed {
            self.test("(")
            if !self.isParsed { try self.err() }
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: ""))
            add(childNode: latestNode!)
            popNodeContext()
            self.pushLastChildAsNodeContext()
            self.isParsed = true
            while self.isParsed {
                try self.ruleOUT1()
            }
            self.isParsed = true
            if !self.isParsed { try self.err() }
            self.popNodeContext()
            self.test(")")
            if !self.isParsed { try self.err() }
        }
    }

    func ruleOUT1() throws {
        self.contextPush("OUT1")
        defer { self.contextPop() }
        self.test("*")
        if self.isParsed {
            self.out("self.out(self.token)")
            self.eol()
            latestNode = Node(type: .text(value: "self.out(self.token)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
        }
        if !self.isParsed {
            try self.ruleSTRING()
            if self.isParsed {
                self.out("self.out(")
                self.out(String(UnicodeScalar(34)))
                self.out(self.token)
                self.out(String(UnicodeScalar(34)))
                self.out(")")
                self.eol()
                latestNode = Node(type: .text(value: "self.out("))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: self.token))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: ")"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !self.isParsed {
            try self.ruleNUMBER()
            if self.isParsed {
                self.out("self.out(String(UnicodeScalar(")
                self.out(self.token)
                self.out(")))")
                self.eol()
                latestNode = Node(type: .text(value: "self.out(String(UnicodeScalar("))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: self.token))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: ")))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !self.isParsed {
            self.test(".NL")
            if self.isParsed {
                self.out("self.eol()")
                self.eol()
                latestNode = Node(type: .text(value: "self.eol()"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !self.isParsed {
            self.test(".LM+")
            if self.isParsed {
                self.out("self.stack[self.stack.count - 1].leftMargin += 4")
                self.eol()
                latestNode = Node(type: .text(value: "self.stack[self.stack.count - 1].leftMargin += 4"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
        if !self.isParsed {
            self.test(".LM-")
            if self.isParsed {
                self.out("self.stack[self.stack.count - 1].leftMargin -= 4")
                self.eol()
                latestNode = Node(type: .text(value: "self.stack[self.stack.count - 1].leftMargin -= 4"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
            }
        }
    }

    // .NODE( .NODE_COMMENT '//' * ' compiler' ) 
    //node expressions 
    func ruleNODE() throws {
        self.contextPush("NODE")
        defer { self.contextPop() }
        self.test(".NODECONTEXTPUSH")
        if self.isParsed {
            self.test("(")
            if !self.isParsed { try self.err() }
            self.test(")")
            if !self.isParsed { try self.err() }
            self.out("self.pushLastChildAsNodeContext()")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "self.pushLastChildAsNodeContext()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
        }
        if !self.isParsed {
            self.test(".NODECONTEXTPOP")
            if self.isParsed {
                self.test("(")
                if !self.isParsed { try self.err() }
                self.test(")")
                if !self.isParsed { try self.err() }
                self.out("self.popNodeContext()")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "self.popNodeContext()"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODESTASHPOP")
            if self.isParsed {
                self.test("(")
                if !self.isParsed { try self.err() }
                self.test(")")
                if !self.isParsed { try self.err() }
                self.out("self.popNodeStash()")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "self.popNodeStash()"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODESTASHPUSH")
            if self.isParsed {
                self.test("(")
                if !self.isParsed { try self.err() }
                self.test(")")
                if !self.isParsed { try self.err() }
                self.out("self.stash(node: latestNode!)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "self.stash(node: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODEADDCHILD")
            if self.isParsed {
                self.test("(")
                if !self.isParsed { try self.err() }
                self.test(")")
                if !self.isParsed { try self.err() }
                self.out("self.add(childNode: latestNode!)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "self.add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODE")
            if self.isParsed {
                self.test("(")
                if !self.isParsed { try self.err() }
                try self.ruleNODETYPE()
                if !self.isParsed { try self.err() }
                self.test(")")
                if !self.isParsed { try self.err() }
            }
        }
    }

    func ruleNODETYPE() throws {
        self.contextPush("NODETYPE")
        defer { self.contextPop() }
        self.test(".NODEOUTPUT")
        if self.isParsed {
            self.out("add(childNode: Node(type: .output))")
            self.eol()
            self.out("pushLastChildAsNodeContext()")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "add(childNode: Node(type: .output))"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "pushLastChildAsNodeContext()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
            self.isParsed = true
            while self.isParsed {
                try self.ruleNODECONTENT()
            }
            self.isParsed = true
            if !self.isParsed { try self.err() }
            self.out("popNodeContext()")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "popNodeContext()"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
        }
        if !self.isParsed {
            self.test(".NODERULE")
            if self.isParsed {
                self.out("latestNode = Node(type: .rule(value: self.token))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .rule(value: self.token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODECOMMENT")
            if self.isParsed {
                self.out("latestNode = Node(type: .comment(value: self.token))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .comment(value: self.token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODEID")
            if self.isParsed {
                self.out("latestNode = Node(type: .id(value: self.token))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .id(value: self.token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODETOKENEXPRESSION")
            if self.isParsed {
                self.out("latestNode = Node(type: .tokenExpression)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenExpression)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODETOKENSTART")
            if self.isParsed {
                self.out("latestNode = Node(type: .tokenStart)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenStart)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODETOKENEND")
            if self.isParsed {
                self.out("latestNode = Node(type: .tokenEnd)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenEnd)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODETOKENANYBUT")
            if self.isParsed {
                self.out("latestNode = Node(type: .tokenAnyBut)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenAnyBut)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODETOKENANY")
            if self.isParsed {
                self.out("latestNode = Node(type: .tokenAny)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .tokenAny)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODECHAREXPRESSION")
            if self.isParsed {
                self.out("latestNode = Node(type: .charExpression)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .charExpression)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODECHAREQUAL")
            if self.isParsed {
                self.out("latestNode = Node(type: .charEqual)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .charEqual)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODECHARLESSTHANEQUAL")
            if self.isParsed {
                self.out("latestNode = Node(type: .charLessThanOrEqual)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .charLessThanOrEqual)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODECHARGREATERTHANEQUAL")
            if self.isParsed {
                self.out("latestNode = Node(type: .charGreaterThanOrEqual)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .charGreaterThanOrEqual)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODESTRING")
            if self.isParsed {
                self.out("latestNode = Node(type: .string(value: self.token))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .string(value: self.token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODENUMBER")
            if self.isParsed {
                self.out("latestNode = Node(type: .number(value: self.token))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .number(value: self.token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODECHAR")
            if self.isParsed {
                self.out("latestNode = Node(type: .character(value: self.token))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .character(value: self.token))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODETEXT")
            if self.isParsed {
                self.isParsed = true
                while self.isParsed {
                    try self.ruleNODECONTENT()
                }
                self.isParsed = true
                if !self.isParsed { try self.err() }
            }
        }
        if !self.isParsed {
            self.test(".NODEREADCHAR")
            if self.isParsed {
                self.out("latestNode = Node(type: .readCharacter)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .readCharacter)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODEEMPTY")
            if self.isParsed {
                self.out("add(childNode: Node(type: .empty))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "add(childNode: Node(type: .empty))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODEOR")
            if self.isParsed {
                self.out("add(childNode: Node(type: .or))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "add(childNode: Node(type: .or))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODEAND")
            if self.isParsed {
                self.out("add(childNode: Node(type: .and))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "add(childNode: Node(type: .and))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NODEZEROORMORE")
            if self.isParsed {
                self.out("add(childNode: Node(type: .zeroOrMore))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "add(childNode: Node(type: .zeroOrMore))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
    }

    func ruleNODECONTENTTEXT() throws {
        self.contextPush("NODECONTENTTEXT")
        defer { self.contextPop() }
        self.test("*")
        if self.isParsed {
            self.out("latestNode = Node(type: .text(value: self.token))")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: self.token))"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
        }
        if !self.isParsed {
            try self.ruleSTRING()
            if self.isParsed {
                self.out("latestNode = Node(type: .text(value: ")
                self.out(String(UnicodeScalar(34)))
                self.out(self.token)
                self.out(String(UnicodeScalar(34)))
                self.out("))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: "))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: self.token))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            try self.ruleNUMBER()
            if self.isParsed {
                self.out("latestNode = Node(type: .text(value: String(UnicodeScalar(")
                self.out(self.token)
                self.out("))))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: String(UnicodeScalar("))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: self.token))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "))))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NL")
            if self.isParsed {
                self.out("latestNode = Node(type: .text(value: ")
                self.out(String(UnicodeScalar(34)))
                self.out(String(UnicodeScalar(92)))
                self.out("n")
                self.out(String(UnicodeScalar(34)))
                self.out("))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
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
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".LM+")
            if self.isParsed {
                self.out("latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".LM-")
            if self.isParsed {
                self.out("latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
    }

    func ruleNODECONTENT() throws {
        self.contextPush("NODECONTENT")
        defer { self.contextPop() }
        self.test("*")
        if self.isParsed {
            self.out("latestNode = Node(type: .text(value: self.token))")
            self.eol()
            self.out("add(childNode: latestNode!)")
            self.eol()
            add(childNode: Node(type: .output))
            pushLastChildAsNodeContext()
            latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: self.token))"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
            add(childNode: latestNode!)
            latestNode = Node(type: .text(value: "\n"))
            add(childNode: latestNode!)
            popNodeContext()
        }
        if !self.isParsed {
            try self.ruleSTRING()
            if self.isParsed {
                self.out("latestNode = Node(type: .text(value: ")
                self.out(String(UnicodeScalar(34)))
                self.out(self.token)
                self.out(String(UnicodeScalar(34)))
                self.out("))")
                self.eol()
                self.out("add(childNode: latestNode!)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: "))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: String(UnicodeScalar(34))))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: self.token))
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
                popNodeContext()
            }
        }
        if !self.isParsed {
            try self.ruleNUMBER()
            if self.isParsed {
                self.out("latestNode = Node(type: .text(value: String(UnicodeScalar(")
                self.out(self.token)
                self.out("))))")
                self.eol()
                self.out("add(childNode: latestNode!)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .text(value: String(UnicodeScalar("))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: self.token))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "))))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".NL")
            if self.isParsed {
                self.out("latestNode = Node(type: .text(value: ")
                self.out(String(UnicodeScalar(34)))
                self.out(String(UnicodeScalar(92)))
                self.out("n")
                self.out(String(UnicodeScalar(34)))
                self.out("))")
                self.eol()
                self.out("add(childNode: latestNode!)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
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
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".LM+")
            if self.isParsed {
                self.out("latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))")
                self.eol()
                self.out("add(childNode: latestNode!)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
        if !self.isParsed {
            self.test(".LM-")
            if self.isParsed {
                self.out("latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))")
                self.eol()
                self.out("add(childNode: latestNode!)")
                self.eol()
                add(childNode: Node(type: .output))
                pushLastChildAsNodeContext()
                latestNode = Node(type: .text(value: "latestNode = Node(type: .leftMargin(margin: self.stack[self.stack.count - 1].leftMargin))"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "add(childNode: latestNode!)"))
                add(childNode: latestNode!)
                latestNode = Node(type: .text(value: "\n"))
                add(childNode: latestNode!)
                popNodeContext()
            }
        }
    }

    // token expressions 
    func ruleTX1() throws {
        self.contextPush("TX1")
        defer { self.contextPop() }
        latestNode = Node(type: .tokenExpression)
        if true {
            self.add(childNode: latestNode!)
            self.pushLastChildAsNodeContext()
            add(childNode: Node(type: .or))
            self.pushLastChildAsNodeContext()
            try self.ruleTX2()
            if !self.isParsed { try self.err() }
            self.isParsed = true
            while self.isParsed {
                self.test("/")
                if self.isParsed {
                    self.out("if !self.isParsed {")
                    self.stack[self.stack.count - 1].leftMargin += 4
                    self.eol()
                    try self.ruleTX2()
                    if !self.isParsed { try self.err() }
                    self.stack[self.stack.count - 1].leftMargin -= 4
                    self.out("}")
                    self.eol()
                }
            }
            self.isParsed = true
            if !self.isParsed { try self.err() }
            self.popNodeContext()
            self.popNodeContext()
        }
    }

    func ruleTX2() throws {
        self.contextPush("TX2")
        defer { self.contextPop() }
        add(childNode: Node(type: .and))
        if true {
            self.pushLastChildAsNodeContext()
            try self.ruleTX3()
            if !self.isParsed { try self.err() }
            self.out("if self.isParsed {")
            self.stack[self.stack.count - 1].leftMargin += 4
            self.eol()
            self.isParsed = true
            while self.isParsed {
                try self.ruleTX3()
                if self.isParsed {
                    self.out("if !self.isParsed { return }")
                    self.eol()
                }
            }
            self.isParsed = true
            if !self.isParsed { try self.err() }
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.out("}")
            self.eol()
            self.popNodeContext()
        }
    }

    func ruleTX3() throws {
        self.contextPush("TX3")
        defer { self.contextPop() }
        self.test(".TOKEN")
        if self.isParsed {
            self.out("self.isToken = true")
            self.eol()
            self.out("self.token = ")
            self.out(String(UnicodeScalar(34)))
            self.out(String(UnicodeScalar(34)))
            self.eol()
            latestNode = Node(type: .tokenStart)
            self.add(childNode: latestNode!)
        }
        if !self.isParsed {
            self.test(".DELTOK")
            if self.isParsed {
                self.out("self.isToken = false")
                self.eol()
                latestNode = Node(type: .tokenEnd)
                self.add(childNode: latestNode!)
            }
        }
        if !self.isParsed {
            self.test("$")
            if self.isParsed {
                self.out("self.isParsed = true")
                self.eol()
                self.out("while self.isParsed {")
                self.stack[self.stack.count - 1].leftMargin += 4
                self.eol()
                add(childNode: Node(type: .zeroOrMore))
                self.pushLastChildAsNodeContext()
                try self.ruleTX3()
                if !self.isParsed { try self.err() }
                self.popNodeContext()
                self.stack[self.stack.count - 1].leftMargin -= 4
                self.out("}")
                self.eol()
            }
        }
        if self.isParsed {
            self.out("self.isParsed = true")
            self.eol()
        }
        if !self.isParsed {
            self.test(".ANYBUT(")
            if self.isParsed {
                latestNode = Node(type: .tokenAnyBut)
                self.add(childNode: latestNode!)
                self.pushLastChildAsNodeContext()
                try self.ruleCX1()
                if !self.isParsed { try self.err() }
                self.popNodeContext()
                self.test(")")
                if !self.isParsed { try self.err() }
                self.out("self.isParsed = !self.isParsed")
                self.eol()
                self.out("if self.isParsed {")
                self.stack[self.stack.count - 1].leftMargin += 4
                self.eol()
                self.out("if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }")
                self.eol()
                self.out("self.inp += 1 }")
                self.stack[self.stack.count - 1].leftMargin -= 4
                self.eol()
            }
        }
        if !self.isParsed {
            self.test(".ANY(")
            if self.isParsed {
                latestNode = Node(type: .tokenAny)
                self.add(childNode: latestNode!)
                self.pushLastChildAsNodeContext()
                try self.ruleCX1()
                if !self.isParsed { try self.err() }
                self.popNodeContext()
                self.test(")")
                if !self.isParsed { try self.err() }
                self.out("if self.isParsed {")
                self.stack[self.stack.count - 1].leftMargin += 4
                self.eol()
                self.out("if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }")
                self.eol()
                self.out("self.inp += 1 }")
                self.stack[self.stack.count - 1].leftMargin -= 4
                self.eol()
            }
        }
        if !self.isParsed {
            try self.ruleID()
            if self.isParsed {
                self.out("try self.rule")
                self.out(self.token)
                self.out("()")
                self.eol()
                latestNode = Node(type: .id(value: self.token))
                self.add(childNode: latestNode!)
            }
        }
        if !self.isParsed {
            self.test("(")
            if self.isParsed {
                try self.ruleTX1()
                if !self.isParsed { try self.err() }
                self.test(")")
                if !self.isParsed { try self.err() }
            }
        }
    }

    // character expressions 
    func ruleCX1() throws {
        self.contextPush("CX1")
        defer { self.contextPop() }
        self.out("self.isParsed =")
        self.stack[self.stack.count - 1].leftMargin += 4
        self.eol()
        if true {
            latestNode = Node(type: .charExpression)
            self.add(childNode: latestNode!)
            self.pushLastChildAsNodeContext()
            add(childNode: Node(type: .or))
            self.pushLastChildAsNodeContext()
            try self.ruleCX2()
            if !self.isParsed { try self.err() }
            self.isParsed = true
            while self.isParsed {
                self.test("!")
                if self.isParsed {
                    self.out(" ||")
                    self.eol()
                    try self.ruleCX2()
                    if !self.isParsed { try self.err() }
                }
            }
            self.isParsed = true
            if !self.isParsed { try self.err() }
            self.popNodeContext()
            self.stack[self.stack.count - 1].leftMargin -= 4
            self.eol()
            self.popNodeContext()
        }
    }

    func ruleCX2() throws {
        self.contextPush("CX2")
        defer { self.contextPop() }
        try self.ruleCX3()
        if self.isParsed {
            self.stash(node: latestNode!)
            self.test(":")
            if self.isParsed {
                add(childNode: Node(type: .and))
                self.pushLastChildAsNodeContext()
                self.out("( Array(self.inbuf.utf8)[self.inp] >= ")
                self.out(self.token)
                self.out(" &&")
                self.eol()
                latestNode = Node(type: .charGreaterThanOrEqual)
                self.add(childNode: latestNode!)
                self.pushLastChildAsNodeContext()
                self.popNodeStash()
                self.popNodeContext()
                try self.ruleCX3()
                if !self.isParsed { try self.err() }
                self.stash(node: latestNode!)
                self.out(" Array(self.inbuf.utf8)[self.inp] <= ")
                self.out(self.token)
                self.out(" )")
                latestNode = Node(type: .charLessThanOrEqual)
                self.add(childNode: latestNode!)
                self.pushLastChildAsNodeContext()
                self.popNodeStash()
                self.popNodeContext()
                self.popNodeContext()
            }
            if !self.isParsed {
                self.isParsed = true
                if self.isParsed {
                    self.out("Array(self.inbuf.utf8)[self.inp] == ")
                    self.out(self.token)
                    latestNode = Node(type: .charEqual)
                    self.add(childNode: latestNode!)
                    self.pushLastChildAsNodeContext()
                    self.popNodeStash()
                    self.popNodeContext()
                }
            }
            if !self.isParsed { try self.err() }
        }
    }

    func ruleCX3() throws {
        self.contextPush("CX3")
        defer { self.contextPop() }
        try self.ruleNUMBER()
        if self.isParsed {
            latestNode = Node(type: .number(value: self.token))
        }
        if !self.isParsed {
            try self.ruleSQUOTE()
            if self.isParsed {
                self.token = String(Array(self.inbuf.utf8)[self.inp])
                self.inp += 1
                if !self.isParsed { try self.err() }
                latestNode = Node(type: .character(value: self.token))
            }
        }
    }

    // token definitions 
    func rulePREFIX() throws {
        self.contextPush("PREFIX")
        defer { self.contextPop() }
        self.isParsed = true
        while self.isParsed {
            self.isParsed =
                Array(self.inbuf.utf8)[self.inp] == 32 ||
                Array(self.inbuf.utf8)[self.inp] == 9 ||
                Array(self.inbuf.utf8)[self.inp] == 13 ||
                Array(self.inbuf.utf8)[self.inp] == 10
            if self.isParsed {
                if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
                self.inp += 1 }
        }
        self.isParsed = true
        if self.isParsed {
        }
    }

    func ruleID() throws {
        self.contextPush("ID")
        defer { self.contextPop() }
        try self.rulePREFIX()
        if self.isParsed {
            self.isToken = true
            self.token = ""
            self.isParsed = true
            if !self.isParsed { return }
            try self.ruleALPHA()
            if !self.isParsed { return }
            self.isParsed = true
            while self.isParsed {
                try self.ruleALPHA()
                if self.isParsed {
                }
                if !self.isParsed {
                    try self.ruleDIGIT()
                    if self.isParsed {
                    }
                }
            }
            self.isParsed = true
            if !self.isParsed { return }
            self.isToken = false
            self.isParsed = true
            if !self.isParsed { return }
        }
    }

    func ruleNUMBER() throws {
        self.contextPush("NUMBER")
        defer { self.contextPop() }
        try self.rulePREFIX()
        if self.isParsed {
            self.isToken = true
            self.token = ""
            self.isParsed = true
            if !self.isParsed { return }
            try self.ruleDIGIT()
            if !self.isParsed { return }
            self.isParsed = true
            while self.isParsed {
                try self.ruleDIGIT()
            }
            self.isParsed = true
            if !self.isParsed { return }
            self.isToken = false
            self.isParsed = true
            if !self.isParsed { return }
        }
    }

    func ruleSTRING() throws {
        self.contextPush("STRING")
        defer { self.contextPop() }
        try self.rulePREFIX()
        if self.isParsed {
            self.isParsed =
                Array(self.inbuf.utf8)[self.inp] == 39
            if self.isParsed {
                if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
                self.inp += 1 }
            if !self.isParsed { return }
            self.isToken = true
            self.token = ""
            self.isParsed = true
            if !self.isParsed { return }
            self.isParsed = true
            while self.isParsed {
                self.isParsed =
                    Array(self.inbuf.utf8)[self.inp] == 13 ||
                    Array(self.inbuf.utf8)[self.inp] == 10 ||
                    Array(self.inbuf.utf8)[self.inp] == 39
                self.isParsed = !self.isParsed
                if self.isParsed {
                    if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
                    self.inp += 1 }
            }
            self.isParsed = true
            if !self.isParsed { return }
            self.isToken = false
            self.isParsed = true
            if !self.isParsed { return }
            self.isParsed =
                Array(self.inbuf.utf8)[self.inp] == 39
            if self.isParsed {
                if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
                self.inp += 1 }
            if !self.isParsed { return }
        }
    }

    func ruleALPHA() throws {
        self.contextPush("ALPHA")
        defer { self.contextPop() }
        self.isParsed =
            ( Array(self.inbuf.utf8)[self.inp] >= 65 &&
             Array(self.inbuf.utf8)[self.inp] <= 90 ) ||
            ( Array(self.inbuf.utf8)[self.inp] >= 97 &&
             Array(self.inbuf.utf8)[self.inp] <= 122 )
        if self.isParsed {
            if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
            self.inp += 1 }
        if self.isParsed {
        }
    }

    func ruleDIGIT() throws {
        self.contextPush("DIGIT")
        defer { self.contextPop() }
        self.isParsed =
            ( Array(self.inbuf.utf8)[self.inp] >= 48 &&
             Array(self.inbuf.utf8)[self.inp] <= 57 )
        if self.isParsed {
            if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
            self.inp += 1 }
        if self.isParsed {
        }
    }

    func ruleSQUOTE() throws {
        self.contextPush("SQUOTE")
        defer { self.contextPop() }
        try self.rulePREFIX()
        if self.isParsed {
            self.isParsed =
                Array(self.inbuf.utf8)[self.inp] == 39
            if self.isParsed {
                if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
                self.inp += 1 }
            if !self.isParsed { return }
        }
    }

    func ruleCMLINE() throws {
        self.contextPush("CMLINE")
        defer { self.contextPop() }
        self.isToken = true
        self.token = ""
        self.isParsed = true
        if self.isParsed {
            self.isParsed = true
            while self.isParsed {
                self.isParsed =
                    Array(self.inbuf.utf8)[self.inp] == 10 ||
                    Array(self.inbuf.utf8)[self.inp] == 13 ||
                    Array(self.inbuf.utf8)[self.inp] == 93
                self.isParsed = !self.isParsed
                if self.isParsed {
                    if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
                    self.inp += 1 }
            }
            self.isParsed = true
            if !self.isParsed { return }
            self.isToken = false
            self.isParsed = true
            if !self.isParsed { return }
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
        self.initialize()
    }

    func initialize () {
        // initialize for another compile
        self.isParsed = false
        self.isToken = false
        self.inp = 0
        self.outputBuffer = ""
        self.token = ""
        self.stack = []
        self.rootAST = Node(type: .root)
        self.currentNode = rootAST
        self.nodeContextStack = []
        self.stashedNodes = []
    }

    func contextPush(_ rulename: String) {
        // push and initialize a new stackframe
        // new context inherits current context left margin
        var leftMargin = 0
        if self.stack.count >= 1 { leftMargin = self.stack[self.stack.count - 1].leftMargin }
        // stackframe definition
        self.stack.append(StackFrame(erule: rulename, leftMargin: leftMargin))
    }

    func contextPop() {
        // pop and possibly deallocate old stackframe
        _ = self.stack.popLast() // pop stackframe
    }

    func out(_ output: String) {
        // output string
        var indent = 0
        // if newline last output, add left margin before string
        if self.outputBuffer.count > 0 && String(UnicodeScalar(Array(self.outputBuffer.utf8)[self.outputBuffer.count - 1])) == "\n" {
          indent = self.stack[self.stack.count - 1].leftMargin
          while indent > 0 { self.outputBuffer += " "; indent -= 1 } }
        self.outputBuffer += output
    }

    func add(childNode: Node) {
        currentNode?.children.append(childNode)
    }

    func pushLastChildAsNodeContext() {
        nodeContextStack.append(currentNode!)
        currentNode = currentNode!.children.last!
    }

    func popNodeContext() {
        currentNode = nodeContextStack.popLast()!
    }

    func stash(node: Node) {
        stashedNodes.append(node)
    }

    func popNodeStash() {
        currentNode?.children.append(contentsOf: stashedNodes)
        stashedNodes = []
    }

    func eol () {
        // output end of line
        self.outputBuffer += "\n"
    }

    func test (_ stringToCompare: String) {
        // test for a string in the input
        var inputOffset = 0
        // delete whitespace
        while Array(self.inbuf.utf8)[self.inp] == 32 ||
               Array(self.inbuf.utf8)[self.inp] == 9 ||
               Array(self.inbuf.utf8)[self.inp] == 13 ||
               Array(self.inbuf.utf8)[self.inp] == 10 { self.inp += 1}
        // test string case insensitive
        self.isParsed = true
        while self.isParsed && (inputOffset < stringToCompare.count) && ((self.inp + inputOffset) < self.inbuf.count) {
        self.isParsed = String(UnicodeScalar(Array(stringToCompare.utf8)[inputOffset])).uppercased() ==
                        String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp + inputOffset])).uppercased()
          inputOffset += 1 }
        self.isParsed = self.isParsed && (inputOffset == stringToCompare.count)
        // advance input if found
        if self.isParsed { self.inp = self.inp + stringToCompare.count }
    }

    public enum CompilerError: Error {
        case parseFailure(rule: String, inputOffset: Int)
    }

    func err() throws {
        // compilation error, provide error indication and context
        throw CompilerError.parseFailure(rule: self.stack[self.stack.count - 1].erule, inputOffset: self.inp)
    }

}

