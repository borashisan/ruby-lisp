require 'spec_helper'

RSpec.describe Parser do
  let(:program) { "(define plus1 (lambda (n) (+ n 1)))" }

  describe '#read' do
    let(:tokens) { Lexer.new.tokenize(program) }
    it '期待した通り配列が返ること' do
      expect(Parser.new.read(tokens)).to eq ['define', 'plus1', ['lambda', ['n'], ['+', 'n', '1']]]
    end
  end
end
