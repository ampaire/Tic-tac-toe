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
      it 'returns an array whit thw winning pattern' do
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
end
