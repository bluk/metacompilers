// PROGRAM compiler
public class Compiler {

  public func compile(_ input: String) -> Bool {
    // initialize compiler variables
    self.inbuf = input
    self.initialize()
    // call the first rule
    self.contextPush("PROGRAM")
    self.rulePROGRAM()
    self.contextPop()
    // special case handling of first rule failure
    if !self.isError && !self.isParsed {
      self.isError = true
      self.erule = "PROGRAM"
      self.einput = self.inp }
    return !self.isError
  }

  // body of compiler definition 
  func rulePROGRAM() {
    self.test(".SYNTAX")
    if self.isParsed {
      self.contextPush("ID")
      self.ruleID()
      self.contextPop()
      if self.isError { return }
      if !self.isParsed { self.err() }
      self.out("// ")
      self.out(self.token)
      self.out(" compiler")
      self.eol()
      self.out("public class Compiler {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.eol()
      self.contextPush("PREAMBLE")
      self.rulePREAMBLE()
      self.contextPop()
      if self.isError { return }
      if !self.isParsed { self.err() }
      self.isParsed = true
      while self.isParsed {
        self.contextPush("PR")
        self.rulePR()
        self.contextPop()
        if self.isError { return }
        if self.isParsed {
        }
        if !self.isParsed {
          self.contextPush("COMMENT")
          self.ruleCOMMENT()
          self.contextPop()
          if self.isError { return }
          if self.isParsed {
          }
        }
      }
      self.isParsed = true
      if !self.isParsed { self.err() }
      self.test(".TOKENS")
      if !self.isParsed { self.err() }
      self.isParsed = true
      while self.isParsed {
        self.contextPush("TR")
        self.ruleTR()
        self.contextPop()
        if self.isError { return }
        if self.isParsed {
        }
        if !self.isParsed {
          self.contextPush("COMMENT")
          self.ruleCOMMENT()
          self.contextPop()
          if self.isError { return }
          if self.isParsed {
          }
        }
      }
      self.isParsed = true
      if !self.isParsed { self.err() }
      self.test(".END")
      if !self.isParsed { self.err() }
      self.contextPush("POSTAMBLE")
      self.rulePOSTAMBLE()
      self.contextPop()
      if self.isError { return }
      if !self.isParsed { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
    }
  }

  // object definition preamble 
  func rulePREAMBLE() {
    self.out("public func compile(_ input: String) -> Bool {")
    self.stack[self.stack.count - 1].leftMargin += 2
    self.eol()
    if true {
      self.out("// initialize compiler variables")
      self.eol()
      self.out("self.inbuf = input")
      self.eol()
      self.out("self.initialize()")
      self.eol()
      self.out("// call the first rule")
      self.eol()
      self.out("self.contextPush(")
      self.out(String(UnicodeScalar(34)))
      self.out(self.token)
      self.out(String(UnicodeScalar(34)))
      self.out(")")
      self.eol()
      self.out("self.rule")
      self.out(self.token)
      self.out("()")
      self.eol()
      self.out("self.contextPop()")
      self.eol()
      self.out("// special case handling of first rule failure")
      self.eol()
      self.out("if !self.isError && !self.isParsed {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("self.isError = true")
      self.eol()
      self.out("self.erule = ")
      self.out(String(UnicodeScalar(34)))
      self.out(self.token)
      self.out(String(UnicodeScalar(34)))
      self.out("")
      self.eol()
      self.out("self.einput = self.inp }")
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.eol()
      self.out("return !self.isError")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
    }
  }

  // runtime and object definition postamble 
  func rulePOSTAMBLE() {
    self.out("struct StackFrame {")
    self.stack[self.stack.count - 1].leftMargin += 2
    self.eol()
    if true {
      self.out("var generatedLabel: Int")
      self.eol()
      self.out("var erule: String")
      self.eol()
      self.out("var leftMargin: Int")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.out("// runtime variables")
      self.eol()
      self.out("var isParsed = false")
      self.eol()
      self.out("var isToken = false")
      self.eol()
      self.out("var isError = false")
      self.eol()
      self.out("var inp = 0")
      self.eol()
      self.out("var inbuf = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.out("public var outputBuffer = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.out("public var erule = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.out("public var einput = 0")
      self.eol()
      self.out("public var token = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.out("var labelCount = 0")
      self.eol()
      self.out("var stack: [StackFrame] = []")
      self.eol()
      self.eol()
      self.out("public init() {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("self.initialize()")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func initialize () {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// initialize for another compile")
      self.eol()
      self.out("self.isParsed = false")
      self.eol()
      self.out("self.isToken = false")
      self.eol()
      self.out("self.isError = false")
      self.eol()
      self.out("self.inp = 0")
      self.eol()
      self.out("self.outputBuffer = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.out("self.erule = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.out("self.einput = 0")
      self.eol()
      self.out("self.token = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.out("self.labelCount = 1")
      self.eol()
      self.out("self.stack = []")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func contextPush (_ rulename: String) {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// push and initialize a new stackframe")
      self.eol()
      self.out("// new context inherits current context left margin")
      self.eol()
      self.out("var leftMargin = 0")
      self.eol()
      self.out("if self.stack.count >= 1 { leftMargin = self.stack[self.stack.count - 1].leftMargin }")
      self.eol()
      self.out("// stackframe definition")
      self.eol()
      self.out("self.stack.append(StackFrame(generatedLabel: 0, erule: rulename, leftMargin: leftMargin))")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func contextPop () {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// pop and possibly deallocate old stackframe")
      self.eol()
      self.out("_ = self.stack.popLast() // pop stackframe")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func out (_ output: String) {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// output string")
      self.eol()
      self.out("var indent = 0")
      self.eol()
      self.out("// if newline last output, add left margin before string")
      self.eol()
      self.out("if self.outputBuffer.count > 0 && String(UnicodeScalar(Array(self.outputBuffer.utf8)[self.outputBuffer.count - 1])) == ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(92)))
      self.out("n")
      self.out(String(UnicodeScalar(34)))
      self.out(" {")
      self.eol()
      self.out("  indent = self.stack[self.stack.count - 1].leftMargin")
      self.eol()
      self.out("  while indent > 0 { self.outputBuffer += ")
      self.out(String(UnicodeScalar(34)))
      self.out(" ")
      self.out(String(UnicodeScalar(34)))
      self.out("; indent -= 1 } }")
      self.eol()
      self.out("self.outputBuffer += output")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func eol () {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// output end of line")
      self.eol()
      self.out("self.outputBuffer += ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(92)))
      self.out("n")
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func test (_ stringToCompare: String) {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// test for a string in the input")
      self.eol()
      self.out("var inputOffset = 0")
      self.eol()
      self.out("// delete whitespace")
      self.eol()
      self.out("while Array(self.inbuf.utf8)[self.inp] == 32 ||")
      self.eol()
      self.out("       Array(self.inbuf.utf8)[self.inp] == 9 ||")
      self.eol()
      self.out("       Array(self.inbuf.utf8)[self.inp] == 13 ||")
      self.eol()
      self.out("       Array(self.inbuf.utf8)[self.inp] == 10 { self.inp += 1}")
      self.eol()
      self.out("// test string case insensitive")
      self.eol()
      self.out("self.isParsed = true")
      self.eol()
      self.out("while self.isParsed && (inputOffset < stringToCompare.count) && ((self.inp + inputOffset) < self.inbuf.count) {")
      self.eol()
      self.out("self.isParsed = String(UnicodeScalar(Array(stringToCompare.utf8)[inputOffset])).uppercased() ==")
      self.eol()
      self.out("                String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp + inputOffset])).uppercased()")
      self.eol()
      self.out("  inputOffset += 1 }")
      self.eol()
      self.out("self.isParsed = self.isParsed && (inputOffset == stringToCompare.count)")
      self.eol()
      self.out("// advance input if found")
      self.eol()
      self.out("if self.isParsed { self.inp = self.inp + stringToCompare.count }")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func err() {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// compilation error, provide error indication and context")
      self.eol()
      self.out("self.isError = true")
      self.eol()
      self.out("self.erule = self.stack[self.stack.count - 1].erule")
      self.eol()
      self.out("self.einput = self.inp")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
    }
  }

  // parsing rule definition 
  func rulePR() {
    self.contextPush("ID")
    self.ruleID()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.out("func rule")
      self.out(self.token)
      self.out("() {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.test("=")
      if !self.isParsed { self.err() }
      self.contextPush("EX1")
      self.ruleEX1()
      self.contextPop()
      if self.isError { return }
      if !self.isParsed { self.err() }
      self.test(";")
      if !self.isParsed { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
    }
  }

  // token rule definition 
  func ruleTR() {
    self.contextPush("ID")
    self.ruleID()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.out("func rule")
      self.out(self.token)
      self.out("() {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.test(":")
      if !self.isParsed { self.err() }
      self.contextPush("TX1")
      self.ruleTX1()
      self.contextPop()
      if self.isError { return }
      if !self.isParsed { self.err() }
      self.test(";")
      if !self.isParsed { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
    }
  }

  // comment definition 
  func ruleCOMMENT() {
    self.test("[")
    if self.isParsed {
      self.contextPush("CMLINE")
      self.ruleCMLINE()
      self.contextPop()
      if self.isError { return }
      if !self.isParsed { self.err() }
      self.test("]")
      if !self.isParsed { self.err() }
      self.out("//")
      self.out(self.token)
      self.eol()
    }
  }

  // parsing expressions 
  func ruleEX1() {
    self.contextPush("EX2")
    self.ruleEX2()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.isParsed = true
      while self.isParsed {
        self.test("/")
        if self.isParsed {
          self.out("if !self.isParsed {")
          self.stack[self.stack.count - 1].leftMargin += 2
          self.eol()
          self.contextPush("EX2")
          self.ruleEX2()
          self.contextPop()
          if self.isError { return }
          if !self.isParsed { self.err() }
          self.stack[self.stack.count - 1].leftMargin -= 2
          self.out("}")
          self.eol()
        }
      }
      self.isParsed = true
      if !self.isParsed { self.err() }
    }
  }

  func ruleEX2() {
    self.contextPush("EX3")
    self.ruleEX3()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.out("if self.isParsed {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
    }
    if !self.isParsed {
      self.contextPush("OUTPUT")
      self.ruleOUTPUT()
      self.contextPop()
      if self.isError { return }
      if self.isParsed {
        self.out("if true {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
      }
    }
    if self.isParsed {
      self.isParsed = true
      while self.isParsed {
        self.contextPush("EX3")
        self.ruleEX3()
        self.contextPop()
        if self.isError { return }
        if self.isParsed {
          self.out("if !self.isParsed { self.err() }")
          self.eol()
        }
        if !self.isParsed {
          self.contextPush("OUTPUT")
          self.ruleOUTPUT()
          self.contextPop()
          if self.isError { return }
          if self.isParsed {
          }
        }
      }
      self.isParsed = true
      if !self.isParsed { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
    }
  }

  func ruleEX3() {
    self.contextPush("ID")
    self.ruleID()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.out("self.contextPush(")
      self.out(String(UnicodeScalar(34)))
      self.out(self.token)
      self.out(String(UnicodeScalar(34)))
      self.out(")")
      self.eol()
      self.out("self.rule")
      self.out(self.token)
      self.out("()")
      self.eol()
      self.out("self.contextPop()")
      self.eol()
      self.out("if self.isError { return }")
      self.eol()
    }
    if !self.isParsed {
      self.contextPush("STRING")
      self.ruleSTRING()
      self.contextPop()
      if self.isError { return }
      if self.isParsed {
        self.out("self.test(")
        self.out(String(UnicodeScalar(34)))
        self.out(self.token)
        self.out(String(UnicodeScalar(34)))
        self.out(")")
        self.eol()
      }
    }
    if !self.isParsed {
      self.test("(")
      if self.isParsed {
        self.contextPush("EX1")
        self.ruleEX1()
        self.contextPop()
        if self.isError { return }
        if !self.isParsed { self.err() }
        self.test(")")
        if !self.isParsed { self.err() }
      }
    }
    if !self.isParsed {
      self.test(".EMPTY")
      if self.isParsed {
        self.out("self.isParsed = true")
        self.eol()
      }
    }
    if !self.isParsed {
      self.test(".LITCHR")
      if self.isParsed {
        self.out("self.token = String(Array(self.inbuf.utf8)[self.inp])")
        self.eol()
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
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.contextPush("EX3")
        self.ruleEX3()
        self.contextPop()
        if self.isError { return }
        if !self.isParsed { self.err() }
        self.stack[self.stack.count - 1].leftMargin -= 2
        self.out("}")
        self.eol()
        self.out("self.isParsed = true")
        self.eol()
      }
    }
  }

  // output expressions 
  func ruleOUTPUT() {
    self.test(".OUT")
    if self.isParsed {
      self.test("(")
      if !self.isParsed { self.err() }
      self.isParsed = true
      while self.isParsed {
        self.contextPush("OUT1")
        self.ruleOUT1()
        self.contextPop()
        if self.isError { return }
      }
      self.isParsed = true
      if !self.isParsed { self.err() }
      self.test(")")
      if !self.isParsed { self.err() }
    }
  }

  func ruleOUT1() {
    self.test("*")
    if self.isParsed {
      self.out("self.out(self.token)")
      self.eol()
    }
    if !self.isParsed {
      self.contextPush("STRING")
      self.ruleSTRING()
      self.contextPop()
      if self.isError { return }
      if self.isParsed {
        self.out("self.out(")
        self.out(String(UnicodeScalar(34)))
        self.out(self.token)
        self.out(String(UnicodeScalar(34)))
        self.out(")")
        self.eol()
      }
    }
    if !self.isParsed {
      self.contextPush("NUMBER")
      self.ruleNUMBER()
      self.contextPop()
      if self.isError { return }
      if self.isParsed {
        self.out("self.out(String(UnicodeScalar(")
        self.out(self.token)
        self.out(")))")
        self.eol()
      }
    }
    if !self.isParsed {
      self.test("#")
      if self.isParsed {
        self.out("if self.stack[self.stack.count - 1].generatedLabel == 0 {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.out("self.stack[self.stack.count - 1] = self.labelCount")
        self.eol()
        self.out("self.labelCount += 1 }")
        self.stack[self.stack.count - 1].leftMargin -= 2
        self.eol()
        self.out("self.out(self.stack[self.stack.count - 1].generatedLabel)")
        self.eol()
      }
    }
    if !self.isParsed {
      self.test(".NL")
      if self.isParsed {
        self.out("self.eol()")
        self.eol()
      }
    }
    if !self.isParsed {
      self.test(".LB")
      if self.isParsed {
      }
    }
    if !self.isParsed {
      self.test(".TB")
      if self.isParsed {
        self.out("self.out(")
        self.out(String(UnicodeScalar(34)))
        self.out(String(UnicodeScalar(92)))
        self.out("t")
        self.out(String(UnicodeScalar(34)))
        self.out(")")
        self.eol()
      }
    }
    if !self.isParsed {
      self.test(".LM+")
      if self.isParsed {
        self.out("self.stack[self.stack.count - 1].leftMargin += 2")
        self.eol()
      }
    }
    if !self.isParsed {
      self.test(".LM-")
      if self.isParsed {
        self.out("self.stack[self.stack.count - 1].leftMargin -= 2")
        self.eol()
      }
    }
  }

  // token expressions 
  func ruleTX1() {
    self.contextPush("TX2")
    self.ruleTX2()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.isParsed = true
      while self.isParsed {
        self.test("/")
        if self.isParsed {
          self.out("if !self.isParsed {")
          self.stack[self.stack.count - 1].leftMargin += 2
          self.eol()
          self.contextPush("TX2")
          self.ruleTX2()
          self.contextPop()
          if self.isError { return }
          if !self.isParsed { self.err() }
          self.stack[self.stack.count - 1].leftMargin -= 2
          self.out("}")
          self.eol()
        }
      }
      self.isParsed = true
      if !self.isParsed { self.err() }
    }
  }

  func ruleTX2() {
    self.contextPush("TX3")
    self.ruleTX3()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.out("if self.isParsed {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.isParsed = true
      while self.isParsed {
        self.contextPush("TX3")
        self.ruleTX3()
        self.contextPop()
        if self.isError { return }
        if self.isParsed {
          self.out("if !self.isParsed { return }")
          self.eol()
        }
      }
      self.isParsed = true
      if !self.isParsed { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
    }
  }

  func ruleTX3() {
    self.test(".TOKEN")
    if self.isParsed {
      self.out("self.isToken = true")
      self.eol()
      self.out("self.token = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
    }
    if !self.isParsed {
      self.test(".DELTOK")
      if self.isParsed {
        self.out("self.isToken = false")
        self.eol()
      }
    }
    if !self.isParsed {
      self.test("$")
      if self.isParsed {
        self.out("self.isParsed = true")
        self.eol()
        self.out("while self.isParsed {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.contextPush("TX3")
        self.ruleTX3()
        self.contextPop()
        if self.isError { return }
        if !self.isParsed { self.err() }
        self.stack[self.stack.count - 1].leftMargin -= 2
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
        self.contextPush("CX1")
        self.ruleCX1()
        self.contextPop()
        if self.isError { return }
        if !self.isParsed { self.err() }
        self.test(")")
        if !self.isParsed { self.err() }
        self.out("self.isParsed = !self.isParsed")
        self.eol()
        self.out("if self.isParsed {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.out("if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }")
        self.eol()
        self.out("self.inp += 1 }")
        self.stack[self.stack.count - 1].leftMargin -= 2
        self.eol()
      }
    }
    if !self.isParsed {
      self.test(".ANY(")
      if self.isParsed {
        self.contextPush("CX1")
        self.ruleCX1()
        self.contextPop()
        if self.isError { return }
        if !self.isParsed { self.err() }
        self.test(")")
        if !self.isParsed { self.err() }
        self.out("if self.isParsed {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.out("if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }")
        self.eol()
        self.out("self.inp += 1 }")
        self.stack[self.stack.count - 1].leftMargin -= 2
        self.eol()
      }
    }
    if !self.isParsed {
      self.contextPush("ID")
      self.ruleID()
      self.contextPop()
      if self.isError { return }
      if self.isParsed {
        self.out("self.contextPush(")
        self.out(String(UnicodeScalar(34)))
        self.out(self.token)
        self.out(String(UnicodeScalar(34)))
        self.out(")")
        self.eol()
        self.out("self.rule")
        self.out(self.token)
        self.out("()")
        self.eol()
        self.out("self.contextPop()")
        self.eol()
        self.out("if self.isError { return }")
        self.eol()
      }
    }
    if !self.isParsed {
      self.test("(")
      if self.isParsed {
        self.contextPush("TX1")
        self.ruleTX1()
        self.contextPop()
        if self.isError { return }
        if !self.isParsed { self.err() }
        self.test(")")
        if !self.isParsed { self.err() }
      }
    }
  }

  // character expressions 
  func ruleCX1() {
    self.out("self.isParsed =")
    self.stack[self.stack.count - 1].leftMargin += 2
    self.eol()
    if true {
      self.contextPush("CX2")
      self.ruleCX2()
      self.contextPop()
      if self.isError { return }
      if !self.isParsed { self.err() }
      self.isParsed = true
      while self.isParsed {
        self.test("!")
        if self.isParsed {
          self.out(" ||")
          self.eol()
          self.contextPush("CX2")
          self.ruleCX2()
          self.contextPop()
          if self.isError { return }
          if !self.isParsed { self.err() }
        }
      }
      self.isParsed = true
      if !self.isParsed { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.eol()
    }
  }

  func ruleCX2() {
    self.contextPush("CX3")
    self.ruleCX3()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.test(":")
      if self.isParsed {
        self.out("(Array(self.inbuf.utf8)[self.inp] >= ")
        self.out(self.token)
        self.out(" ) &&")
        self.eol()
        self.contextPush("CX3")
        self.ruleCX3()
        self.contextPop()
        if self.isError { return }
        if !self.isParsed { self.err() }
        self.out(" (Array(self.inbuf.utf8)[self.inp] <= ")
        self.out(self.token)
        self.out("  )")
      }
      if !self.isParsed {
        self.isParsed = true
        if self.isParsed {
          self.out("Array(self.inbuf.utf8)[self.inp] == ")
          self.out(self.token)
          self.out(" ")
        }
      }
      if !self.isParsed { self.err() }
    }
  }

  func ruleCX3() {
    self.contextPush("NUMBER")
    self.ruleNUMBER()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
    }
    if !self.isParsed {
      self.contextPush("SQUOTE")
      self.ruleSQUOTE()
      self.contextPop()
      if self.isError { return }
      if self.isParsed {
        self.token = String(Array(self.inbuf.utf8)[self.inp])
        self.inp += 1
        if !self.isParsed { self.err() }
      }
    }
  }

  // token definitions 
  func rulePREFIX() {
    self.isParsed = true
    while self.isParsed {
      self.isParsed =
        Array(self.inbuf.utf8)[self.inp] == 32  ||
        Array(self.inbuf.utf8)[self.inp] == 9  ||
        Array(self.inbuf.utf8)[self.inp] == 13  ||
        Array(self.inbuf.utf8)[self.inp] == 10 
      if self.isParsed {
        if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
        self.inp += 1 }
    }
    self.isParsed = true
    if self.isParsed {
    }
  }

  func ruleID() {
    self.contextPush("PREFIX")
    self.rulePREFIX()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.isToken = true
      self.token = ""
      self.isParsed = true
      if !self.isParsed { return }
      self.contextPush("ALPHA")
      self.ruleALPHA()
      self.contextPop()
      if self.isError { return }
      if !self.isParsed { return }
      self.isParsed = true
      while self.isParsed {
        self.contextPush("ALPHA")
        self.ruleALPHA()
        self.contextPop()
        if self.isError { return }
        if self.isParsed {
        }
        if !self.isParsed {
          self.contextPush("DIGIT")
          self.ruleDIGIT()
          self.contextPop()
          if self.isError { return }
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

  func ruleNUMBER() {
    self.contextPush("PREFIX")
    self.rulePREFIX()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.isToken = true
      self.token = ""
      self.isParsed = true
      if !self.isParsed { return }
      self.contextPush("DIGIT")
      self.ruleDIGIT()
      self.contextPop()
      if self.isError { return }
      if !self.isParsed { return }
      self.isParsed = true
      while self.isParsed {
        self.contextPush("DIGIT")
        self.ruleDIGIT()
        self.contextPop()
        if self.isError { return }
      }
      self.isParsed = true
      if !self.isParsed { return }
      self.isToken = false
      self.isParsed = true
      if !self.isParsed { return }
    }
  }

  func ruleSTRING() {
    self.contextPush("PREFIX")
    self.rulePREFIX()
    self.contextPop()
    if self.isError { return }
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
          Array(self.inbuf.utf8)[self.inp] == 13  ||
          Array(self.inbuf.utf8)[self.inp] == 10  ||
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

  func ruleALPHA() {
    self.isParsed =
      (Array(self.inbuf.utf8)[self.inp] >= 65 ) &&
       (Array(self.inbuf.utf8)[self.inp] <= 90  ) ||
      (Array(self.inbuf.utf8)[self.inp] >= 97 ) &&
       (Array(self.inbuf.utf8)[self.inp] <= 122  )
    if self.isParsed {
      if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
      self.inp += 1 }
    if self.isParsed {
    }
  }

  func ruleDIGIT() {
    self.isParsed =
      (Array(self.inbuf.utf8)[self.inp] >= 48 ) &&
       (Array(self.inbuf.utf8)[self.inp] <= 57  )
    if self.isParsed {
      if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
      self.inp += 1 }
    if self.isParsed {
    }
  }

  func ruleSQUOTE() {
    self.contextPush("PREFIX")
    self.rulePREFIX()
    self.contextPop()
    if self.isError { return }
    if self.isParsed {
      self.isParsed =
        Array(self.inbuf.utf8)[self.inp] == 39 
      if self.isParsed {
        if self.isToken { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
        self.inp += 1 }
      if !self.isParsed { return }
    }
  }

  func ruleCMLINE() {
    self.isToken = true
    self.token = ""
    self.isParsed = true
    if self.isParsed {
      self.isParsed = true
      while self.isParsed {
        self.isParsed =
          Array(self.inbuf.utf8)[self.inp] == 10  ||
          Array(self.inbuf.utf8)[self.inp] == 13  ||
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
    var generatedLabel: Int
    var erule: String
    var leftMargin: Int
  }
  // runtime variables
  var isParsed = false
  var isToken = false
  var isError = false
  var inp = 0
  var inbuf = ""
  public var outputBuffer = ""
  public var erule = ""
  public var einput = 0
  public var token = ""
  var labelCount = 0
  var stack: [StackFrame] = []

  public init() {
    self.initialize()
  }

  func initialize () {
    // initialize for another compile
    self.isParsed = false
    self.isToken = false
    self.isError = false
    self.inp = 0
    self.outputBuffer = ""
    self.erule = ""
    self.einput = 0
    self.token = ""
    self.labelCount = 1
    self.stack = []
  }

  func contextPush (_ rulename: String) {
    // push and initialize a new stackframe
    // new context inherits current context left margin
    var leftMargin = 0
    if self.stack.count >= 1 { leftMargin = self.stack[self.stack.count - 1].leftMargin }
    // stackframe definition
    self.stack.append(StackFrame(generatedLabel: 0, erule: rulename, leftMargin: leftMargin))
  }

  func contextPop () {
    // pop and possibly deallocate old stackframe
    _ = self.stack.popLast() // pop stackframe
  }

  func out (_ output: String) {
    // output string
    var indent = 0
    // if newline last output, add left margin before string
    if self.outputBuffer.count > 0 && String(UnicodeScalar(Array(self.outputBuffer.utf8)[self.outputBuffer.count - 1])) == "\n" {
      indent = self.stack[self.stack.count - 1].leftMargin
      while indent > 0 { self.outputBuffer += " "; indent -= 1 } }
    self.outputBuffer += output
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

  func err() {
    // compilation error, provide error indication and context
    self.isError = true
    self.erule = self.stack[self.stack.count - 1].erule
    self.einput = self.inp
  }

}

