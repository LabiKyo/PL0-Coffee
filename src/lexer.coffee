{Token, TAG} = Compiler
class Compiler.Lexer

  constructor: (@source) ->
    @length = @source.length
    @line = 1 # source code start from line 1
    @read_pointer = -1 # point to the position of source code that already read

  # attributes

  # methods
  read: =>
    @peek = @source[++@read_pointer]
    if @read_pointer is @length
      throw new Error 'Program incomplete.'
    @

  get_forward: =>
    @source[@read_pointer+1]

  scan: =>
    while true
      @read()
      if @peek is '\r' or @peek is '\n'
        ++@line
      if /^\s$/.test @peek
        continue
      break

    forward = @get_forward()
    switch @peek
      when '+', '-', '*', '/', '=', '(', ')', ',', ';', '.'
        new Token @peek
      when '<'
        if forward is '>' or forward is '='
          ++@read_pointer
          new Token @peek + forward
        else
          new Token @peek
      when '>'
        if forward is '='
          ++@read_pointer
          new Token @peek + forward
        else
          new Token @peek
      when ':'
        if forward is '='
          ++@read_pointer
          new Token @peek + forward
        else
          new Token @peek
