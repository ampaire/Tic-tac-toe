# frozen_string_literal: true

require_relative '../lib/game_logic.rb'
require_relative '../lib/players.rb'

describe GameLogic do
  let(:board) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }

    describe "#won" do 
      context 'if there is a win move in the board' do
        it 'returns true' do
          @game = GameLogic.new(@players)
          result = @game.won
          expect(result).to be true
        end
      end
    end
end
