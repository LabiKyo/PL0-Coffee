{Token, TAG} = Compiler

describe 'Token', ->
  it 'initialize with tag string', ->
    init = ->
      token = new Token 'if'
      token = new Token '+'
      token = new Token ':='
    init.should.not.throw()

  it 'throw Error when tag string is invalid', ->
    init = ->
      token = new Token 'abcd'
    init.should.throw('Invalid tag value.')

  it 'equal to same tag tokens', ->
    token = new Token 'if'
    token.should.eql new Token 'if'

  it 'not equal to different tag tokens', ->
    token = new Token 'if'
    token.should.not.eql new Token '+'
