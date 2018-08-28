// PROGRAM compiler
public class Compiler {

  public func compile(_ input: String) -> Bool {
    // initialize compiler variables
    self.inbuf = input
    self.initialize()
    // call the first rule
    self.ctxpush("PROGRAM")
    self.rulePROGRAM()
    self.ctxpop()
    // special case handling of first rule failure
    if ((!self.eflag) && (!self.pflag)) {
      self.eflag = true
      self.erule = "PROGRAM"
      self.einput = self.inp }
    return !self.eflag
  }

  // body of compiler definition 
  func rulePROGRAM() {
    self.test(".SYNTAX")
    if (self.pflag) {
      self.ctxpush("ID")
      self.ruleID()
      self.ctxpop()
      if (self.eflag) { return }
      if (!self.pflag) { self.err() }
      self.out("// ")
      self.out(self.token)
      self.out(" compiler")
      self.eol()
      self.out("public class Compiler {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.eol()
      self.ctxpush("PREAMBLE")
      self.rulePREAMBLE()
      self.ctxpop()
      if (self.eflag) { return }
      if (!self.pflag) { self.err() }
      self.pflag = true
      while (self.pflag) {
        self.ctxpush("PR")
        self.rulePR()
        self.ctxpop()
        if (self.eflag) { return }
        if (self.pflag) {
        }
        if (!self.pflag) {
          self.ctxpush("COMMENT")
          self.ruleCOMMENT()
          self.ctxpop()
          if (self.eflag) { return }
          if (self.pflag) {
          }
        }
      }
      self.pflag = true
      if (!self.pflag) { self.err() }
      self.test(".TOKENS")
      if (!self.pflag) { self.err() }
      self.pflag = true
      while (self.pflag) {
        self.ctxpush("TR")
        self.ruleTR()
        self.ctxpop()
        if (self.eflag) { return }
        if (self.pflag) {
        }
        if (!self.pflag) {
          self.ctxpush("COMMENT")
          self.ruleCOMMENT()
          self.ctxpop()
          if (self.eflag) { return }
          if (self.pflag) {
          }
        }
      }
      self.pflag = true
      if (!self.pflag) { self.err() }
      self.test(".END")
      if (!self.pflag) { self.err() }
      self.ctxpush("POSTAMBLE")
      self.rulePOSTAMBLE()
      self.ctxpop()
      if (self.eflag) { return }
      if (!self.pflag) { self.err() }
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
    if (true) {
      self.out("// initialize compiler variables")
      self.eol()
      self.out("self.inbuf = input")
      self.eol()
      self.out("self.initialize()")
      self.eol()
      self.out("// call the first rule")
      self.eol()
      self.out("self.ctxpush(")
      self.out(String(UnicodeScalar(34)))
      self.out(self.token)
      self.out(String(UnicodeScalar(34)))
      self.out(")")
      self.eol()
      self.out("self.rule")
      self.out(self.token)
      self.out("()")
      self.eol()
      self.out("self.ctxpop()")
      self.eol()
      self.out("// special case handling of first rule failure")
      self.eol()
      self.out("if ((!self.eflag) && (!self.pflag)) {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("self.eflag = true")
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
      self.out("return !self.eflag")
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
    if (true) {
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
      self.out("var pflag = false")
      self.eol()
      self.out("var tflag = false")
      self.eol()
      self.out("var eflag = false")
      self.eol()
      self.out("var inp = 0")
      self.eol()
      self.out("var inbuf = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.out("public var outbuf = ")
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
      self.out("var labelcount = 0")
      self.eol()
      self.out("var stack:[StackFrame] = []")
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
      self.out("self.pflag = false")
      self.eol()
      self.out("self.tflag = false")
      self.eol()
      self.out("self.eflag = false")
      self.eol()
      self.out("self.inp = 0")
      self.eol()
      self.out("self.outbuf = ")
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
      self.out("self.labelcount = 1")
      self.eol()
      self.out("self.stack = []")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func ctxpush (_ rulename: String) {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// push and initialize a new stackframe")
      self.eol()
      self.out("// new context inherits current context left margin")
      self.eol()
      self.out("var LM = 0; if (self.stack.count >= 1) { LM = self.stack[self.stack.count - 1].leftMargin }")
      self.eol()
      self.out("// stackframe definition")
      self.eol()
      self.out("self.stack.append(StackFrame(generatedLabel: 0, erule: rulename, leftMargin: LM))")
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func ctxpop () {")
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
      self.out("func out (_ s: String) {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// output string")
      self.eol()
      self.out("var i = 0")
      self.eol()
      self.out("// if newline last output, add left margin before string")
      self.eol()
      self.out("if (self.outbuf.count > 0 && String(UnicodeScalar(Array(self.outbuf.utf8)[self.outbuf.count - 1])) == ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(92)))
      self.out("n")
      self.out(String(UnicodeScalar(34)))
      self.out(") {")
      self.eol()
      self.out("  i = self.stack[self.stack.count - 1].leftMargin")
      self.eol()
      self.out("  while (i>0) { self.outbuf += ")
      self.out(String(UnicodeScalar(34)))
      self.out(" ")
      self.out(String(UnicodeScalar(34)))
      self.out("; i -= 1 } }")
      self.eol()
      self.out("self.outbuf += s")
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
      self.out("self.outbuf += ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(92)))
      self.out("n")
      self.out(String(UnicodeScalar(34)))
      self.eol()
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
      self.out("func test (_ s: String) {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.out("// test for a string in the input")
      self.eol()
      self.out("var i = 0")
      self.eol()
      self.out("// delete whitespace")
      self.eol()
      self.out("while (Array(self.inbuf.utf8)[self.inp] == 32 ||")
      self.eol()
      self.out("       Array(self.inbuf.utf8)[self.inp] == 9 ||")
      self.eol()
      self.out("       Array(self.inbuf.utf8)[self.inp] == 13 ||")
      self.eol()
      self.out("       Array(self.inbuf.utf8)[self.inp] == 10) { self.inp += 1}")
      self.eol()
      self.out("// test string case insensitive")
      self.eol()
      self.out("self.pflag = true ; i = 0")
      self.eol()
      self.out("while (self.pflag && (i < s.count) && ((self.inp+i) < self.inbuf.count) )")
      self.eol()
      self.out("{ self.pflag = String(UnicodeScalar(Array(s.utf8)[i])).uppercased() ==")
      self.eol()
      self.out("                String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp+i])).uppercased()")
      self.eol()
      self.out("  i += 1 }")
      self.eol()
      self.out("self.pflag = self.pflag && (i == s.count)")
      self.eol()
      self.out("// advance input if found")
      self.eol()
      self.out("if (self.pflag) { self.inp = self.inp + s.count }")
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
      self.out("self.eflag = true")
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
    self.ctxpush("ID")
    self.ruleID()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.out("func rule")
      self.out(self.token)
      self.out("() {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.test("=")
      if (!self.pflag) { self.err() }
      self.ctxpush("EX1")
      self.ruleEX1()
      self.ctxpop()
      if (self.eflag) { return }
      if (!self.pflag) { self.err() }
      self.test(";")
      if (!self.pflag) { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
    }
  }

  // token rule definition 
  func ruleTR() {
    self.ctxpush("ID")
    self.ruleID()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.out("func rule")
      self.out(self.token)
      self.out("() {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.test(":")
      if (!self.pflag) { self.err() }
      self.ctxpush("TX1")
      self.ruleTX1()
      self.ctxpop()
      if (self.eflag) { return }
      if (!self.pflag) { self.err() }
      self.test(";")
      if (!self.pflag) { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
      self.eol()
    }
  }

  // comment definition 
  func ruleCOMMENT() {
    self.test("[")
    if (self.pflag) {
      self.ctxpush("CMLINE")
      self.ruleCMLINE()
      self.ctxpop()
      if (self.eflag) { return }
      if (!self.pflag) { self.err() }
      self.test("]")
      if (!self.pflag) { self.err() }
      self.out("//")
      self.out(self.token)
      self.eol()
    }
  }

  // parsing expressions 
  func ruleEX1() {
    self.ctxpush("EX2")
    self.ruleEX2()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.pflag = true
      while (self.pflag) {
        self.test("/")
        if (self.pflag) {
          self.out("if (!self.pflag) {")
          self.stack[self.stack.count - 1].leftMargin += 2
          self.eol()
          self.ctxpush("EX2")
          self.ruleEX2()
          self.ctxpop()
          if (self.eflag) { return }
          if (!self.pflag) { self.err() }
          self.stack[self.stack.count - 1].leftMargin -= 2
          self.out("}")
          self.eol()
        }
      }
      self.pflag = true
      if (!self.pflag) { self.err() }
    }
  }

  func ruleEX2() {
    self.ctxpush("EX3")
    self.ruleEX3()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.out("if (self.pflag) {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
    }
    if (!self.pflag) {
      self.ctxpush("OUTPUT")
      self.ruleOUTPUT()
      self.ctxpop()
      if (self.eflag) { return }
      if (self.pflag) {
        self.out("if (true) {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
      }
    }
    if (self.pflag) {
      self.pflag = true
      while (self.pflag) {
        self.ctxpush("EX3")
        self.ruleEX3()
        self.ctxpop()
        if (self.eflag) { return }
        if (self.pflag) {
          self.out("if (!self.pflag) { self.err() }")
          self.eol()
        }
        if (!self.pflag) {
          self.ctxpush("OUTPUT")
          self.ruleOUTPUT()
          self.ctxpop()
          if (self.eflag) { return }
          if (self.pflag) {
          }
        }
      }
      self.pflag = true
      if (!self.pflag) { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
    }
  }

  func ruleEX3() {
    self.ctxpush("ID")
    self.ruleID()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.out("self.ctxpush(")
      self.out(String(UnicodeScalar(34)))
      self.out(self.token)
      self.out(String(UnicodeScalar(34)))
      self.out(")")
      self.eol()
      self.out("self.rule")
      self.out(self.token)
      self.out("()")
      self.eol()
      self.out("self.ctxpop()")
      self.eol()
      self.out("if (self.eflag) { return }")
      self.eol()
    }
    if (!self.pflag) {
      self.ctxpush("STRING")
      self.ruleSTRING()
      self.ctxpop()
      if (self.eflag) { return }
      if (self.pflag) {
        self.out("self.test(")
        self.out(String(UnicodeScalar(34)))
        self.out(self.token)
        self.out(String(UnicodeScalar(34)))
        self.out(")")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test("(")
      if (self.pflag) {
        self.ctxpush("EX1")
        self.ruleEX1()
        self.ctxpop()
        if (self.eflag) { return }
        if (!self.pflag) { self.err() }
        self.test(")")
        if (!self.pflag) { self.err() }
      }
    }
    if (!self.pflag) {
      self.test(".EMPTY")
      if (self.pflag) {
        self.out("self.pflag = true")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test(".LITCHR")
      if (self.pflag) {
        self.out("self.token = String(Array(self.inbuf.utf8)[self.inp])")
        self.eol()
        self.out("self.inp += 1")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test("$")
      if (self.pflag) {
        self.out("self.pflag = true")
        self.eol()
        self.out("while (self.pflag) {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.ctxpush("EX3")
        self.ruleEX3()
        self.ctxpop()
        if (self.eflag) { return }
        if (!self.pflag) { self.err() }
        self.stack[self.stack.count - 1].leftMargin -= 2
        self.out("}")
        self.eol()
        self.out("self.pflag = true")
        self.eol()
      }
    }
  }

  // output expressions 
  func ruleOUTPUT() {
    self.test(".OUT")
    if (self.pflag) {
      self.test("(")
      if (!self.pflag) { self.err() }
      self.pflag = true
      while (self.pflag) {
        self.ctxpush("OUT1")
        self.ruleOUT1()
        self.ctxpop()
        if (self.eflag) { return }
      }
      self.pflag = true
      if (!self.pflag) { self.err() }
      self.test(")")
      if (!self.pflag) { self.err() }
    }
  }

  func ruleOUT1() {
    self.test("*")
    if (self.pflag) {
      self.out("self.out(self.token)")
      self.eol()
    }
    if (!self.pflag) {
      self.ctxpush("STRING")
      self.ruleSTRING()
      self.ctxpop()
      if (self.eflag) { return }
      if (self.pflag) {
        self.out("self.out(")
        self.out(String(UnicodeScalar(34)))
        self.out(self.token)
        self.out(String(UnicodeScalar(34)))
        self.out(")")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.ctxpush("NUMBER")
      self.ruleNUMBER()
      self.ctxpop()
      if (self.eflag) { return }
      if (self.pflag) {
        self.out("self.out(String(UnicodeScalar(")
        self.out(self.token)
        self.out(")))")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test("#")
      if (self.pflag) {
        self.out("if (self.stack[self.stack.count - 1].generatedLabel == 0) {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.out("self.stack[self.stack.count - 1] = self.labelcount")
        self.eol()
        self.out("self.labelcount += 1 }")
        self.stack[self.stack.count - 1].leftMargin -= 2
        self.eol()
        self.out("self.out(self.stack[self.stack.count - 1].generatedLabel)")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test(".NL")
      if (self.pflag) {
        self.out("self.eol()")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test(".LB")
      if (self.pflag) {
      }
    }
    if (!self.pflag) {
      self.test(".TB")
      if (self.pflag) {
        self.out("self.out(")
        self.out(String(UnicodeScalar(34)))
        self.out(String(UnicodeScalar(92)))
        self.out("t")
        self.out(String(UnicodeScalar(34)))
        self.out(")")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test(".LM+")
      if (self.pflag) {
        self.out("self.stack[self.stack.count - 1].leftMargin += 2")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test(".LM-")
      if (self.pflag) {
        self.out("self.stack[self.stack.count - 1].leftMargin -= 2")
        self.eol()
      }
    }
  }

  // token expressions 
  func ruleTX1() {
    self.ctxpush("TX2")
    self.ruleTX2()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.pflag = true
      while (self.pflag) {
        self.test("/")
        if (self.pflag) {
          self.out("if (!self.pflag) {")
          self.stack[self.stack.count - 1].leftMargin += 2
          self.eol()
          self.ctxpush("TX2")
          self.ruleTX2()
          self.ctxpop()
          if (self.eflag) { return }
          if (!self.pflag) { self.err() }
          self.stack[self.stack.count - 1].leftMargin -= 2
          self.out("}")
          self.eol()
        }
      }
      self.pflag = true
      if (!self.pflag) { self.err() }
    }
  }

  func ruleTX2() {
    self.ctxpush("TX3")
    self.ruleTX3()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.out("if (self.pflag) {")
      self.stack[self.stack.count - 1].leftMargin += 2
      self.eol()
      self.pflag = true
      while (self.pflag) {
        self.ctxpush("TX3")
        self.ruleTX3()
        self.ctxpop()
        if (self.eflag) { return }
        if (self.pflag) {
          self.out("if (!self.pflag) { return }")
          self.eol()
        }
      }
      self.pflag = true
      if (!self.pflag) { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.out("}")
      self.eol()
    }
  }

  func ruleTX3() {
    self.test(".TOKEN")
    if (self.pflag) {
      self.out("self.tflag = true")
      self.eol()
      self.out("self.token = ")
      self.out(String(UnicodeScalar(34)))
      self.out(String(UnicodeScalar(34)))
      self.eol()
    }
    if (!self.pflag) {
      self.test(".DELTOK")
      if (self.pflag) {
        self.out("self.tflag = false")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test("$")
      if (self.pflag) {
        self.out("self.pflag = true")
        self.eol()
        self.out("while (self.pflag) {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.ctxpush("TX3")
        self.ruleTX3()
        self.ctxpop()
        if (self.eflag) { return }
        if (!self.pflag) { self.err() }
        self.stack[self.stack.count - 1].leftMargin -= 2
        self.out("}")
        self.eol()
      }
    }
    if (self.pflag) {
      self.out("self.pflag = true")
      self.eol()
    }
    if (!self.pflag) {
      self.test(".ANYBUT(")
      if (self.pflag) {
        self.ctxpush("CX1")
        self.ruleCX1()
        self.ctxpop()
        if (self.eflag) { return }
        if (!self.pflag) { self.err() }
        self.test(")")
        if (!self.pflag) { self.err() }
        self.out("self.pflag = !self.pflag")
        self.eol()
        self.out("if (self.pflag) {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.out("if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }")
        self.eol()
        self.out("self.inp += 1 }")
        self.stack[self.stack.count - 1].leftMargin -= 2
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test(".ANY(")
      if (self.pflag) {
        self.ctxpush("CX1")
        self.ruleCX1()
        self.ctxpop()
        if (self.eflag) { return }
        if (!self.pflag) { self.err() }
        self.test(")")
        if (!self.pflag) { self.err() }
        self.out("if (self.pflag) {")
        self.stack[self.stack.count - 1].leftMargin += 2
        self.eol()
        self.out("if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }")
        self.eol()
        self.out("self.inp += 1 }")
        self.stack[self.stack.count - 1].leftMargin -= 2
        self.eol()
      }
    }
    if (!self.pflag) {
      self.ctxpush("ID")
      self.ruleID()
      self.ctxpop()
      if (self.eflag) { return }
      if (self.pflag) {
        self.out("self.ctxpush(")
        self.out(String(UnicodeScalar(34)))
        self.out(self.token)
        self.out(String(UnicodeScalar(34)))
        self.out(")")
        self.eol()
        self.out("self.rule")
        self.out(self.token)
        self.out("()")
        self.eol()
        self.out("self.ctxpop()")
        self.eol()
        self.out("if (self.eflag) { return }")
        self.eol()
      }
    }
    if (!self.pflag) {
      self.test("(")
      if (self.pflag) {
        self.ctxpush("TX1")
        self.ruleTX1()
        self.ctxpop()
        if (self.eflag) { return }
        if (!self.pflag) { self.err() }
        self.test(")")
        if (!self.pflag) { self.err() }
      }
    }
  }

  // character expressions 
  func ruleCX1() {
    self.out("self.pflag =")
    self.stack[self.stack.count - 1].leftMargin += 2
    self.eol()
    if (true) {
      self.ctxpush("CX2")
      self.ruleCX2()
      self.ctxpop()
      if (self.eflag) { return }
      if (!self.pflag) { self.err() }
      self.pflag = true
      while (self.pflag) {
        self.test("!")
        if (self.pflag) {
          self.out(" ||")
          self.eol()
          self.ctxpush("CX2")
          self.ruleCX2()
          self.ctxpop()
          if (self.eflag) { return }
          if (!self.pflag) { self.err() }
        }
      }
      self.pflag = true
      if (!self.pflag) { self.err() }
      self.stack[self.stack.count - 1].leftMargin -= 2
      self.eol()
    }
  }

  func ruleCX2() {
    self.ctxpush("CX3")
    self.ruleCX3()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.test(":")
      if (self.pflag) {
        self.out("(Array(self.inbuf.utf8)[self.inp] >= ")
        self.out(self.token)
        self.out(" ) &&")
        self.eol()
        self.ctxpush("CX3")
        self.ruleCX3()
        self.ctxpop()
        if (self.eflag) { return }
        if (!self.pflag) { self.err() }
        self.out(" (Array(self.inbuf.utf8)[self.inp] <= ")
        self.out(self.token)
        self.out("  )")
      }
      if (!self.pflag) {
        self.pflag = true
        if (self.pflag) {
          self.out("Array(self.inbuf.utf8)[self.inp] == ")
          self.out(self.token)
          self.out(" ")
        }
      }
      if (!self.pflag) { self.err() }
    }
  }

  func ruleCX3() {
    self.ctxpush("NUMBER")
    self.ruleNUMBER()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
    }
    if (!self.pflag) {
      self.ctxpush("SQUOTE")
      self.ruleSQUOTE()
      self.ctxpop()
      if (self.eflag) { return }
      if (self.pflag) {
        self.token = String(Array(self.inbuf.utf8)[self.inp])
        self.inp += 1
        if (!self.pflag) { self.err() }
      }
    }
  }

  // token definitions 
  func rulePREFIX() {
    self.pflag = true
    while (self.pflag) {
      self.pflag =
        Array(self.inbuf.utf8)[self.inp] == 32  ||
        Array(self.inbuf.utf8)[self.inp] == 9  ||
        Array(self.inbuf.utf8)[self.inp] == 13  ||
        Array(self.inbuf.utf8)[self.inp] == 10 
      if (self.pflag) {
        if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
        self.inp += 1 }
    }
    self.pflag = true
    if (self.pflag) {
    }
  }

  func ruleID() {
    self.ctxpush("PREFIX")
    self.rulePREFIX()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.tflag = true
      self.token = ""
      self.pflag = true
      if (!self.pflag) { return }
      self.ctxpush("ALPHA")
      self.ruleALPHA()
      self.ctxpop()
      if (self.eflag) { return }
      if (!self.pflag) { return }
      self.pflag = true
      while (self.pflag) {
        self.ctxpush("ALPHA")
        self.ruleALPHA()
        self.ctxpop()
        if (self.eflag) { return }
        if (self.pflag) {
        }
        if (!self.pflag) {
          self.ctxpush("DIGIT")
          self.ruleDIGIT()
          self.ctxpop()
          if (self.eflag) { return }
          if (self.pflag) {
          }
        }
      }
      self.pflag = true
      if (!self.pflag) { return }
      self.tflag = false
      self.pflag = true
      if (!self.pflag) { return }
    }
  }

  func ruleNUMBER() {
    self.ctxpush("PREFIX")
    self.rulePREFIX()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.tflag = true
      self.token = ""
      self.pflag = true
      if (!self.pflag) { return }
      self.ctxpush("DIGIT")
      self.ruleDIGIT()
      self.ctxpop()
      if (self.eflag) { return }
      if (!self.pflag) { return }
      self.pflag = true
      while (self.pflag) {
        self.ctxpush("DIGIT")
        self.ruleDIGIT()
        self.ctxpop()
        if (self.eflag) { return }
      }
      self.pflag = true
      if (!self.pflag) { return }
      self.tflag = false
      self.pflag = true
      if (!self.pflag) { return }
    }
  }

  func ruleSTRING() {
    self.ctxpush("PREFIX")
    self.rulePREFIX()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.pflag =
        Array(self.inbuf.utf8)[self.inp] == 39 
      if (self.pflag) {
        if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
        self.inp += 1 }
      if (!self.pflag) { return }
      self.tflag = true
      self.token = ""
      self.pflag = true
      if (!self.pflag) { return }
      self.pflag = true
      while (self.pflag) {
        self.pflag =
          Array(self.inbuf.utf8)[self.inp] == 13  ||
          Array(self.inbuf.utf8)[self.inp] == 10  ||
          Array(self.inbuf.utf8)[self.inp] == 39 
        self.pflag = !self.pflag
        if (self.pflag) {
          if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
          self.inp += 1 }
      }
      self.pflag = true
      if (!self.pflag) { return }
      self.tflag = false
      self.pflag = true
      if (!self.pflag) { return }
      self.pflag =
        Array(self.inbuf.utf8)[self.inp] == 39 
      if (self.pflag) {
        if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
        self.inp += 1 }
      if (!self.pflag) { return }
    }
  }

  func ruleALPHA() {
    self.pflag =
      (Array(self.inbuf.utf8)[self.inp] >= 65 ) &&
       (Array(self.inbuf.utf8)[self.inp] <= 90  ) ||
      (Array(self.inbuf.utf8)[self.inp] >= 97 ) &&
       (Array(self.inbuf.utf8)[self.inp] <= 122  )
    if (self.pflag) {
      if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
      self.inp += 1 }
    if (self.pflag) {
    }
  }

  func ruleDIGIT() {
    self.pflag =
      (Array(self.inbuf.utf8)[self.inp] >= 48 ) &&
       (Array(self.inbuf.utf8)[self.inp] <= 57  )
    if (self.pflag) {
      if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
      self.inp += 1 }
    if (self.pflag) {
    }
  }

  func ruleSQUOTE() {
    self.ctxpush("PREFIX")
    self.rulePREFIX()
    self.ctxpop()
    if (self.eflag) { return }
    if (self.pflag) {
      self.pflag =
        Array(self.inbuf.utf8)[self.inp] == 39 
      if (self.pflag) {
        if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
        self.inp += 1 }
      if (!self.pflag) { return }
    }
  }

  func ruleCMLINE() {
    self.tflag = true
    self.token = ""
    self.pflag = true
    if (self.pflag) {
      self.pflag = true
      while (self.pflag) {
        self.pflag =
          Array(self.inbuf.utf8)[self.inp] == 10  ||
          Array(self.inbuf.utf8)[self.inp] == 13  ||
          Array(self.inbuf.utf8)[self.inp] == 93 
        self.pflag = !self.pflag
        if (self.pflag) {
          if (self.tflag) { self.token += String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp])) }
          self.inp += 1 }
      }
      self.pflag = true
      if (!self.pflag) { return }
      self.tflag = false
      self.pflag = true
      if (!self.pflag) { return }
    }
  }

  struct StackFrame {
    var generatedLabel: Int
    var erule: String
    var leftMargin: Int
  }
  // runtime variables
  var pflag = false
  var tflag = false
  var eflag = false
  var inp = 0
  var inbuf = ""
  public var outbuf = ""
  public var erule = ""
  public var einput = 0
  public var token = ""
  var labelcount = 0
  var stack:[StackFrame] = []

  public init() {
    self.initialize()
  }

  func initialize () {
    // initialize for another compile
    self.pflag = false
    self.tflag = false
    self.eflag = false
    self.inp = 0
    self.outbuf = ""
    self.erule = ""
    self.einput = 0
    self.token = ""
    self.labelcount = 1
    self.stack = []
  }

  func ctxpush (_ rulename: String) {
    // push and initialize a new stackframe
    // new context inherits current context left margin
    var LM = 0; if (self.stack.count >= 1) { LM = self.stack[self.stack.count - 1].leftMargin }
    // stackframe definition
    self.stack.append(StackFrame(generatedLabel: 0, erule: rulename, leftMargin: LM))
  }

  func ctxpop () {
    // pop and possibly deallocate old stackframe
    _ = self.stack.popLast() // pop stackframe
  }

  func out (_ s: String) {
    // output string
    var i = 0
    // if newline last output, add left margin before string
    if (self.outbuf.count > 0 && String(UnicodeScalar(Array(self.outbuf.utf8)[self.outbuf.count - 1])) == "\n") {
      i = self.stack[self.stack.count - 1].leftMargin
      while (i>0) { self.outbuf += " "; i -= 1 } }
    self.outbuf += s
  }

  func eol () {
    // output end of line
    self.outbuf += "\n"
  }

  func test (_ s: String) {
    // test for a string in the input
    var i = 0
    // delete whitespace
    while (Array(self.inbuf.utf8)[self.inp] == 32 ||
           Array(self.inbuf.utf8)[self.inp] == 9 ||
           Array(self.inbuf.utf8)[self.inp] == 13 ||
           Array(self.inbuf.utf8)[self.inp] == 10) { self.inp += 1}
    // test string case insensitive
    self.pflag = true ; i = 0
    while (self.pflag && (i < s.count) && ((self.inp+i) < self.inbuf.count) )
    { self.pflag = String(UnicodeScalar(Array(s.utf8)[i])).uppercased() ==
                    String(UnicodeScalar(Array(self.inbuf.utf8)[self.inp+i])).uppercased()
      i += 1 }
    self.pflag = self.pflag && (i == s.count)
    // advance input if found
    if (self.pflag) { self.inp = self.inp + s.count }
  }

  func err() {
    // compilation error, provide error indication and context
    self.eflag = true
    self.erule = self.stack[self.stack.count - 1].erule
    self.einput = self.inp
  }

}

