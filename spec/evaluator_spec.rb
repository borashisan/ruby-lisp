require 'spec_helper'

RSpec.describe Evaluator do
  let(:tokens) { Lexer.new.tokenize(program) }
  let(:parsed_tokens) { Parser.new.read(tokens)}

  describe '#eval' do
    context '+' do
      context '引数が2つ' do
        let(:program) { '(+ 1 2)' }

        it '評価できること' do
          expect(Evaluator.new.eval(parsed_tokens)).to eq 3
        end
      end

      context '引数が2つ以上' do
        let(:program) { '(+ 1 2 3)' }

        it '評価できること' do
          expect(Evaluator.new.eval(parsed_tokens)).to eq 6
        end
      end
    end
  end
end
