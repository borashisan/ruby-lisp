require 'spec_helper'

RSpec.describe Lexer do
  let(:program) { "(define plus1 (lambda (n) (+ n 1)))" }

  describe '#tokenize' do
    it 'tokenに変換できること' do
      expect(Lexer.new.tokenize(program)).to eq ["(", "define", "plus1", "(", "lambda", "(", "n", ")", "(", "+", "n", "1", ")", ")", ")"]
    end
  end
end
