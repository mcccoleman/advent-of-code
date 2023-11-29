require 'open-uri'
require 'dotenv'

Dotenv.load

class GetData
    def self.get_daily_data(year_number, day_number)
        open(
            "https://adventofcode.com/#{year_number}/day/#{day_number}/input",
            "Cookie" => ENV["COOKIE"]
        ).read
    end
end