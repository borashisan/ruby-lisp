require 'spec_helper'

RSpec.describe Parser do
  let(:program) { "(define plus1 (lambda (n) (+ n 1)))" }
  let(:target) { Parser.new.read(tokens) }

  describe '#read' do
    let(:tokens) { Lexer.new.tokenize(program) }
    it '期待した通り配列が返ること' do
      expect(target).to eq [:define, :plus1, [:lambda, [:n], [:+, :n, 1]]]
    end

    context '文字列の観点' do
      let(:program) { '(setq hoge "1")' }

      it 'ダブルクォートは文字列として解析されること' do
        expect(target).to eq [:setq, :hoge, '1']
      end
    end
  end
end
