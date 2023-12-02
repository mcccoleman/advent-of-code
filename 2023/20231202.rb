require './utils/get_data'

def games
  GetData.get_current_day_values
end

def multiply_color_values(color_counts)
  color_counts.map { |option| option[1] }.reject(&:zero?).inject(:*)
end

def get_valid_game_ids
  possible_game_ids = []
  games.each do |game|
    rounds = game.split(':')[1].split(';')

    color_counts = { 'green' => 0, 'red' => 0, 'blue' => 0 }

    rounds.map do |round|
      colors = round.split(',').map { |color| color.sub(' ', '') }
      colors.each do |color|
        number = color.split(' ')[0].to_i
        color = color.split(' ')[1]

        color_counts[color] = number if color_counts[color] < number
      end
    end
    possible_game_ids.push(multiply_color_values(color_counts))
  end
  possible_game_ids
end

def runner
  valid_game_ids = get_valid_game_ids
  valid_game_ids.map(&:to_i).sum
end
