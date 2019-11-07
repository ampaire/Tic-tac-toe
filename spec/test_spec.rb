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
      it 'returns an array with thw winning pattern' do
        mock_game.player_index(1)
        mock_game.player_index(4)
        mock_game.player_index(7)
        expect(subject).to eql([1, 4, 7])
      end
    end

    context 'If theres no win pattern in the board' do
      subject { empty_game.won }
      it 'returns nil' do
        expect(subject).to be nil
      end
    end
  end

  describe '#player_index' do
    context 'If is given an index and a symbol :X or :O' do
      subject { mock_game.player_index(2) }
      it 'Return the symbol to be placed on the slot' do
        expect(subject).to eql(:X)
      end
    end
  end

  describe '#board_full?' do
    context 'If all the slots in the board are filled with X or O' do
      subject { mock_game.board_full?(1) }
      it 'returns true' do
        expect(subject).to be true
      end
    end

    context 'If all the slots in the board are not filled' do
      subject { mock_game.board_full?(9) } 
      it 'returns false' do
        expect(subject).to be false
      end
    end
  end

  describe "#take_place" do
    context 'Recieve the position as string input' do
      subject { mock_game.take_place(3) }
      it 'returns the input as integer' do
        expect(subject).to be_a(Integer)
       end
    end

    context 'Recieves a letter as input for position' do
      subject { mock_game.take_place('w') }
      it 'returns -1' do
        expect(subject).to eql(-1)
      end
    end
  end

  describe '#count_turns' do
    context 'If there are some filled slots on the board' do
      subject { mock_game.count_turns }
      it 'returns the number of filled slots' do
        expect(subject).to eql(4)
      end
    end

    context 'If there are no filled slots in the board' do
      subject { empty_game.count_turns }
      it 'returns 0 slots filled' do
        expect(subject).to eql(0)
      end
    end
  end
  
  describe '#available_moves'
  context 'Returns the available moves on the board if tthere are any' do
    subject { mock_game.available_moves }
    it 'returns an array with the available moves' do
      expect(subject).to eql([1, 4, 6, 7, 9])
    end
  end

  context 'If there is no available moves in the board' do
    subject { full_game.available_moves }
    it 'return an empty array' do
      expect(subject).to eql([])
    end
  end

  describe '#valid_char' do
    context 'If the given input is a valid selection (y/n)' do
      subject { mock_game.valid_char?('Y') }
      it 'returns true' do
        expect(subject).to be true
      end
    end
    context 'If the given input is not a invalid selection' do
      subject { mock_game.valid_char?('W') }
      it 'returns invalid selection' do
        expect(subject).to be false
      end
    end
  end

end
