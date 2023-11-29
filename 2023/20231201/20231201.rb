require './utils/get_data'

def runner
    data = GetData.get_daily_data(2023,1)
    data
end

print runner()