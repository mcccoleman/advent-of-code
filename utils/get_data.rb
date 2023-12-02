require 'open-uri'
require 'dotenv'

Dotenv.load

class GetData
  def self.get_daily_data(year_number, day_number)
    URI.open(
      "https://adventofcode.com/#{year_number}/day/#{day_number}/input",
      'Cookie' => ENV['COOKIE']
    ).read.split("\n")
  end

  def self.get_current_day_values
    URI.open(
      "https://adventofcode.com/#{Time.now.year}/day/#{Time.now.day}/input",
      'Cookie' => ENV['COOKIE']
    ).read.split("\n")
  end
end
