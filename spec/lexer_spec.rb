require 'spec_helper'

RSpec.describe Lexer do
  let(:program) { "(define plus1 (lambda (n) (+ n 1)))" }
  let(:target) { Lexer.new.tokenize(program) }

  describe '#tokenize' do
    it 'tokenに変換できること' do
      expect(target).to eq ["(", "define", "plus1", "(", "lambda", "(", "n", ")", "(", "+", "n", "1", ")", ")", ")"]
    end

    context 'ダブルクォート' do
      let(:program) { '(setq hoge "1")' }

      it 'ダブルクォートが文字列として認識されること' do
        expect(target).to eq ["(", "setq", "hoge", "\"1\"", ")"]
      end
    end
  end
end
