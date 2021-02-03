require 'pry'

def all_contestants(data)
  contestant_hash = []
  data.each do |season, people|
    contestant_hash.concat(people)
  end
  contestant_hash
end

  

def get_first_name_of_season_winner(data, season)
  winner = data[season].filter do |person|
    person["status"] == "Winner"
  end
  winner = winner[0]["name"].split(" ").first
  
end

def get_contestant_name(data, occupation)
  data.each do |seasons, people|
    people.each do |person|
      return person["name"] if person["occupation"] == occupation
    end
  end
end


def count_contestants_by_hometown(data, hometown)
  # code here
  contestants = all_contestants(data)
  locals = contestants.filter do |person|
    person["hometown"] == hometown
  end
  locals.length
end

def get_occupation(data, hometown)
  # code here
  contestants = all_contestants(data)
  contestants.each do |person|
    return person["occupation"] if person["hometown"] == hometown
  end
end

def get_average_age_for_season(data, season)
  total_age = data[season].map do |person|
    person["age"].to_f
  end
  (total_age.sum/ total_age.length.to_f).round
end




