require 'debug'

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
      atom(token)
    end
  end

  private

  def atom(token)
    # ダブルクォートで囲われていれば文字列
    if token[0] == "\""
      raise SyntaxError, 'unexpected "' if token[-1] != "\""
      token.gsub("\"", "")
    # 0でないのにto_iが0であればシンボル
    elsif token != '0' && token.to_i == 0
      token.to_sym
    # 数値
    else
      token.to_i
    end
  end
end
