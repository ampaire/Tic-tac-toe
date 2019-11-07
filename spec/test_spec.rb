# frozen_string_literal: true

require_relative '../lib/game_logic.rb'
players = ['Effie', 'David']
mock_game = GameLogic.new(players)
empty_game = GameLogic.new(players)

describe GameLogic do
    describe "#won" do 
      context 'If theres a win pattern in the board' do
        subject { result = mock_game.won }
        it 'returns an array whit the winning pattern' do 
          mock_game.player_index(1)
          mock_game.player_index(4)
          mock_game.player_index(7)
          expect(subject).to eql([1, 4, 7])
        end
      end

      context 'If theres no a win pattern in the board' do
        subject { result = empty_game.won }
        it 'returns nil' do
          expect(subject).to be nil
        end
      end
    end

    describe '#player_index' do
      context 'If is given an index and a symbol :X or :O' do
        subject { result = mock_game.player_index(2) }
        it 'Returns the symbol to be filled in the slot (index)' do
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

      context 'If the slot in the board is not filled' do
        subject { result = mock_game.board_full?(5) } 
        it 'returns false' do
          expect(subject).to be false
        end
      end
    end

    describe '#take_place' do
      context 'Recieve the position as string input' do
        subject { result = mock_game.take_place(3) }
        it 'returns the input as integer' do
          expect(subject).to be_a(Integer)
        end
      end

      context 'Recieve a letter as input for position' do
        subject {  result = mock_game.take_place('w') }
        it 'returns -1' do 
          expect(subject).to eql(-1)
        end
      end
    end

    describe '#count_turns' do
      context 'If there are filled  slots in the board' do
        subject { result = mock_game.count_turns }
        it 'returns the nuber of filled slots' do
          expect(subject).to eql(4)
        end
      end

      context 'If there is no filled slots in the board' do
        it 'returns 0 slots filled' do 
          result = empty_game.count_turns
          expect(result).to eql(0)
        end
      end
    end
end
