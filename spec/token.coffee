{Token, Number, TAG} = Compiler

describe 'Token', ->
  it 'initialize with tag string', ->
    init = ->
      token = new Token 'if'
      token = new Token '+'
      token = new Token ':='
    init.should.not.throw()

  it 'throw an error when tag string is invalid', ->
    init = ->
      token = new Token 'abcd'
    init.should.throw('Invalid tag value.')

  it 'equal to same tag tokens', ->
    token = new Token 'if'
    token.should.eql new Token 'if'

  it 'not equal to different tag tokens', ->
    token = new Token 'if'
    token.should.not.eql new Token '+'

describe 'Number', ->
  it 'initialize with number', ->
    init = ->
      number = new Number 123
      number = new Number 100111123321
    init.should.not.throw()

  it 'initialize with number string', ->
    init = ->
      number = new Number '123'
      number = new Number '010012301'
    init.should.not.throw()

  it 'throw an error when number is invalid', ->
    init = ->
      number = new Number 'alk'
    init.should.throw('Invalid number: alk')

describe 'Identifier', ->
  it 'initialize with string', ->
    init = ->
      identifier = new Identifier 'asdf'
    init.should.not.throw()

