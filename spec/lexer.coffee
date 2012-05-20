{Lexer, Token, TAG} = Compiler
fs = require 'fs'
{inspect} = require 'util'

describe 'Lexer', ->
  it 'initialize with source code string', ->
    init = ->
      lexer = new Lexer '.'
    init.should.not.throw()

  describe '#read()', ->
    it 'read a character from source code', ->
      lexer = new Lexer '>1a('
      lexer.read().peek.should.equal '>'
      lexer.read().peek.should.equal '1'
      lexer.read().peek.should.equal 'a'
      lexer.read().peek.should.equal '('

    it 'throw Error when trying to read EOF', ->
      lexer = new Lexer '.'
      read = ->
        lexer.read().read()
      read.should.throw('Program incomplete.')

  describe '#scan() scan source code and return a Token', ->
    it 'skip spaces and tabs', ->
      lexer = new Lexer ' +\t-'
      lexer.scan().should.eql(new Token '+')
      lexer.scan().should.eql(new Token '-')

    it 'skip EOF but add line number', ->
      lexer = new Lexer '+    \n  \t-\n'
      lexer.line.should.eql(1)
      lexer.scan()
      lexer.line.should.eql(1)
      lexer.scan()
      lexer.line.should.eql(2)

    describe 'scan operators, relations, punctuation marks', ->
      fn = (token) -> # function for closure
        it "scan '#{token}' and return Token #{token}", ->
          lexer = new Lexer token
          lexer.scan().should.eql(new Token token)

      for token in ['+', '-', '*', '/', '=', '<>', '<', '<=', '>', '>=', '(', ')', ',', ';', '.', ':=']
        fn(token)

