# frozen_string_literal: true

require_relative '../lib/game_logic.rb'
players = ['Effie', 'David']
mock_game = GameLogic.new(players)
empty_game = GameLogic.new(players)
full_game = GameLogic.new(players)

for x in (0..8) do
  full_game.player_index(x)
end

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
        it 'returns the number of filled slots' do
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

    describe '#available_moves' do
      context 'If there is available moves in the board' do
        it 'return an array with the available moves' do
          result = mock_game.available_moves
          expect(result).to eql([1, 4, 6, 7, 9])
        end
      end

      context 'If there is no available moves in the board' do
        it 'return an empty array' do
          result = full_game.available_moves
          expect(result).to eql([])
        end
      end
    end

    describe '#valid_move?' do
      context 'If the given input is a valid move' do
        subject { result = mock_game.valid_move?(5) }
        it 'returns true' do
          expect(subject).to be true
        end
      end
      
      context 'If the given input is not a valid move' do
        subject { result = mock_game.valid_move?(2) }
        it 'return false' do
          expect(subject).to be false
        end
      end
    end

    describe '#valid_char?' do
      context 'If the given input is a valid selection (y/n)' do
        subject { result = mock_game.valid_char?('Y') }
        it 'returns true' do
          expect(subject).to be true
        end
      end

      context 'If the given input is a invalid selection' do
        subject { result = mock_game.valid_char?('W') }
        it 'returns false' do
          expect(subject).to be false
        end
      end
    end

    describe '#repeat_game?' do
      context 'If the input value is a Y or y' do
        subject { mock_game.repeat_game?('y') }
        it 'returns true ' do
          expect(subject).to be true
        end
      end

      context 'If the input value is different than Y or y' do
        subject { mock_game.repeat_game?('N') }
        it 'returns false' do
          expect(subject).to be false 
        end
      end
    end
end
