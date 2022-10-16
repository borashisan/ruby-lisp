class Lexer
  def tokenize(program)
    program.gsub(/[()]/, ' \0 ').split
  end
end
