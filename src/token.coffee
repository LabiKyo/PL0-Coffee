{TAG} = Compiler
class Compiler.Token

  constructor: (tag) ->
    if TAG.indexOf(tag) is -1
      throw new Error 'Invalid tag value.'
    @tag = tag
