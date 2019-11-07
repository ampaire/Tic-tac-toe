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