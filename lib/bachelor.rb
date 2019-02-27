require "pry"

def get_first_name_of_season_winner(data, season)
  winner = ""
  data[season].each do |contestant|
    if contestant["status"] == "Winner"
      winner = contestant["name"].split[0]
    end
  end
  winner
end

def get_contestant_name(data, occupation)
  contestant = ""
  data.each do |season,all_contestant_data|
    all_contestant_data.each do |contestant_data|
      if contestant_data["occupation"] == occupation
        contestant = contestant_data["name"]
      end
    end
  end
  contestant
end

def count_contestants_by_hometown(data, hometown)
  i = 0
  data.each do |season,all_contestant_data|
    all_contestant_data.each do |contestant_data|
      if contestant_data["hometown"] == hometown
        i += 1
      end
    end
  end
  i
end

def get_occupation(data, hometown)
  occupation = ""
  data.each do |season,all_contestant_data|
    all_contestant_data.find do |contestant_data|
      if contestant_data["hometown"] == hometown
        occupation = contestant_data["occupation"]
      end
    end
  end
  occupation
end

def get_average_age_for_season(data, season)
  ages = []
  data[season].each do |contestant|
      ages << contestant["age"].to_f
    end
  (ages.inject(:+) / ages.size).round
end
