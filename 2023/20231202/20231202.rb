require './utils/get_data'

def capture_data
  GetData.get_daily_data(2023, 2)
end

def games
  capture_data.split("\n")
end

def valid?(color_counts)
  max_color_count = { 'red' => 12, 'green' => 13, 'blue' => 14 }

  color_counts.each_key do |key|
    return false if color_counts[key] > max_color_count[key]
  end
  true
end

def get_valid_game_ids
  possible_game_ids = []
  games.each do |game|
    round_number = game.split(':')[0].split(' ')[1]
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
    possible_game_ids.push(round_number) if valid?(color_counts)
  end
  possible_game_ids
end

def runner
  valid_game_ids = get_valid_game_ids
  valid_game_ids.map(&:to_i).sum
end

print runner
