# frozen_string_literal: true

require_relative '../lib/game_logic.rb'

describe GameLogic do
  let(:sample_won) { [X, X, X, 4, 5, 6, 7, 8, 9] }

    describe "#won" do 
      context 'if there is a win move in the board' do
        it 'returns true' do
          its_won = sample_won.won
          expect(its_won).to be true
        end
      end
    end
end
