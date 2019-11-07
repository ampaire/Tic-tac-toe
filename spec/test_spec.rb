# frozen_string_literal: true

require_relative '../lib/game_logic.rb'
@players = ['Effie', 'David']
@mock_game = GameLogic.new(@players)


describe GameLogic do
    describe "#won" do 
      context 'if there is a win move in the board' do
        it 'returns true' do
        end
      end
    end
end
