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

    describe '#player_index' do
      context 'Puts into the slot player selection :X or :O' do
        subject { result = mock_game.player_index(2) }
        it 'Returns the symbol to be fille in the slot' do
          expect(subject).to eql(:X)
        end
      end
    end

    describe '#board_full?' do
      context 'If the slot in the board its filled whit X or O' do
        subject { mock_game.board_full?(1) }
        it 'returns true' do
          expect(subject).to be true
        end
      end
    end

    describe '#take_place' do
      context 'Check if the input is a integer' do
        it 'returns the input as integer' do
        end
      end
    end
end
