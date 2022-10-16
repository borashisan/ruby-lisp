require 'debug'

class Evaluator
  def eval(parsed_tokens)
    case token = parsed_tokens.shift
    when :+
      sum = 0
      until parsed_tokens[0].nil?
        sum += parsed_tokens.shift
      end
      sum
    else
      raise NameError, 'undefined local variable or method'
    end
  end
end
