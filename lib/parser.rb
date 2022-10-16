class Parser
  def read(tokens)
    raise SyntaxError, 'unexpected EOF while reading' if tokens.length == 0

    case token = tokens.shift
    when '('
      l = []
      until tokens[0] == ')'
        l << read(tokens)
      end
      tokens.shift
      l
    when ')'
      raise SyntaxError, 'unexpected )'
    else
      token
    end
  end
end
