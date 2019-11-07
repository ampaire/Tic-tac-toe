# frozen_string_literal: true

require_relative '../lib/game_logic.rb'
players = %w[Effie David]
mock_game = GameLogic.new(players)
empty_game = GameLogic.new(players)
full_game = GameLogic.new(players)
o_game = GameLogic.new(players)
(0..8).each do |x|
  full_game.player_index(x)
  o_game.player_index(x, :O)
end

describe GameLogic do
  describe '#won' do
    context 'If theres a win pattern in the board' do
      subject { mock_game.won }
      it 'returns an array whit the winning pattern' do
        mock_game.player_index(1)
        mock_game.player_index(4)
        mock_game.player_index(7)
        expect(subject).to eql([1, 4, 7])
      end
    end

    context 'If theres no a win pattern in the board' do
      subject { empty_game.won }
      it 'returns nil' do
        expect(subject).to be nil
      end
    end
  end

  describe '#player_index' do
    context 'If is given an index and a symbol :X or :O' do
      subject { mock_game.player_index(2) }
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
      subject { mock_game.board_full?(5) }
      it 'returns false' do
        expect(subject).to be false
      end
    end
  end

  describe '#take_place' do
    context 'Recieve the position as string input' do
      subject { mock_game.take_place(3) }
      it 'returns the input as integer' do
        expect(subject).to be_a(Integer)
      end
    end

    context 'Recieve a letter as input for position' do
      subject { mock_game.take_place('w') }
      it 'returns -1' do
        expect(subject).to eql(-1)
      end
    end
  end

  describe '#count_turns' do
    context 'If there are filled  slots in the board' do
      subject { mock_game.count_turns }
      it 'returns the number of filled slots' do
        expect(subject).to eql(4)
      end
    end

    context 'If there is no filled slots in the board' do
      subject { empty_game.count_turns }
      it 'returns 0 slots filled' do
        expect(subject).to eql(0)
      end
    end
  end

  describe '#available_moves' do
    context 'If there is available moves in the board' do
      subject { mock_game.available_moves }
      it 'return an array with the available moves' do
        expect(subject).to eql([1, 4, 6, 7, 9])
      end
    end

    context 'If there is no available moves in the board' do
      subject { full_game.available_moves }
      it 'return an empty array' do
        expect(subject).to eql([])
      end
    end
  end

  describe '#valid_move?' do
    context 'If the given input is a valid move' do
      subject { mock_game.valid_move?(5) }
      it 'returns true' do
        expect(subject).to be true
      end
    end

    context 'If the given input is not a valid move' do
      subject { mock_game.valid_move?(2) }
      it 'return false' do
        expect(subject).to be false
      end
    end
  end

  describe '#valid_char?' do
    context 'If the given input is a valid selection (y/n)' do
      subject { mock_game.valid_char?('Y') }
      it 'returns true' do
        expect(subject).to be true
      end
    end

    context 'If the given input is a invalid selection' do
      subject { mock_game.valid_char?('W') }
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

  describe '#full?' do
    context 'If the counter of turns reach 9' do
      subject { full_game.full? }
      it 'returns true' do
        expect(subject).to be true
      end
    end

    context 'If the counter of turns is les than 9' do
      subject { mock_game.full? }
      it 'returns true' do
        expect(subject).to be false
      end
    end
  end

  describe '#draw?' do
    context 'If theres a won and the board is no full' do
      subject { mock_game.draw? }
      it 'returns false' do
        expect(subject).to be false
      end
    end
  end

  describe '#over?' do
    context 'If theres is a won pattern' do
      subject { mock_game.over? }
      it 'returns the pattern in an array' do
        expect(subject).to eql([1, 4, 7])
      end
    end

    context 'If theres no a won, full or draw' do
      subject { empty_game.over? }
      it 'returns false' do
        expect(subject).to be false
      end
    end
  end

  describe '#current_player' do
    context 'If the count is a even number' do
      subject { mock_game.current_player }
      it 'returns player :X' do
        expect(subject).to eql(:X)
      end
    end

    context 'If the count is a odd number' do
      it 'returns player :O' do
        mock_game.player_index(5, :O)
        expect(mock_game.current_player).to eql(:O)
      end
    end
  end

  describe '#winner?' do
    context 'If theres a won pattern and was the first player' do
      subject { mock_game.winner? }
      it 'returns :X' do
        expect(subject).to eql(:X)
      end
    end

    context 'If theres a won pattern and was the second player' do
      subject { o_game.winner? }
      it 'returns :O' do
        expect(subject).to eql(:O)
      end
    end
  end
end
