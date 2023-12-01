require './utils/get_data'

def get_numbers(string)
  numbers = %w[1 2 3 4 5 6 7 8 9]

  results = ''
  split_string = string.split('')

  split_string.each do |char|
    results += char if numbers.include? char
  end

  results
end

def format_strings(data)
  data.split("\n").map do |line|
    numbers = get_numbers(line)
    numbers[0] + numbers[numbers.length - 1]
  end
end

def sum_numbers(values)
  values.inject(0) { |sum, x| sum + x.to_i }
end

def runner
  data = GetData.get_daily_data(2023, 1)
  values = format_strings(data)
  sum_numbers(values)
end

print runner
