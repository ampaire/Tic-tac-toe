# frozen_string_literal: true

require_relative '../lib/game_logic.rb'
players = ['Effie', 'David']
mock_game = GameLogic.new(players)

describe GameLogic do
    describe "#won" do 
      context 'Check if theres a win move and check the pattern' do
        it 'returns the first element where is not false' do 
          mock_game.player_index(1)
          mock_game.player_index(4)
          mock_game.player_index(7)
          result = mock_game.won
          expect(result).to eql([1, 4, 7])
        end
      end
    end
end
