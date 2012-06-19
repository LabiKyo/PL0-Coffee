{TAG} = Compiler
class Compiler.Token

  constructor: (tag) ->
    if TAG.indexOf(tag) is -1
      throw new Error 'Invalid tag value.'
    @tag = tag

class Compiler.Number extends Compiler.Token

  constructor: (value) ->
    super 'number'
    if /^[0-9]+$/.test value.toString()
      @value = ~~value
    else
      throw new Error "Invalid number: #{value}"

class Compiler.Identifier extends Compiler.Token

  constructor: (identifier) ->
    unless KEYWORDS.indexOf(identifier) is -1
      super identifier
