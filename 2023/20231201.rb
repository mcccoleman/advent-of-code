require './utils/get_data'
require 'numbers_in_words'

def convert_word_to_number
  hash = {}
  numbers = %w[1 2 3 4 5 6 7 8 9]
  numbers.each do |number|
    hash[NumbersInWords.in_words(number).sub('and ', '')] = number
  end
  hash
end

def get_numbers(string)
  numbers = %w[1 2 3 4 5 6 7 8 9]

  number_results = ''
  all_results = ''
  split_string = string.split('')

  split_string.each do |char|
    number_results += char if numbers.include? char
    all_results += char

    convert_word_to_number.each_key do |key|
      last_n_characters_string = all_results.chars.last(key.length).join
      next unless last_n_characters_string == key

      number_results += convert_word_to_number[key]
    end
  end

  number_results
end

def format_strings(data)
  data.map do |line|
    numbers = get_numbers(line)
    numbers[0] + numbers[numbers.length - 1]
  end
end

def sum_numbers(values)
  values.map(&:to_i).sum
end

def runner
  data = GetData.get_daily_data(2023, 1)
  values = format_strings(data)
  sum_numbers(values)
end

runner
