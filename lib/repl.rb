require "readline"
require "./lib/lexer"
require "./lib/parser"
require "./lib/evaluator"

class Repl
  def repl
    while line = Readline.readline("[Ruby-Lisp]> ", true)
      tokens = Lexer.new.tokenize(line)
      parsed_tokens = Parser.new.read(tokens)
      val = Evaluator.new.eval(parsed_tokens)
      to_string(val) unless val.nil?
    end
  end

  private

  def to_string(exp)
    puts (exp.instance_of?(Array)) ? '(' + exp.map(&:to_s).join(" ") + ')' : "#{exp}"
  end
end
