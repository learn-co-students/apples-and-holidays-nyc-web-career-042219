require 'pry'

def second_supply_for_fourth_of_july(holiday_supplies)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply      
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply  
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array 
return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_supplies[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season, data|
    puts "#{season.capitalize}:"
    data.each do |holiday, list|
      if holiday.length < 2
        puts "  #{holiday.to_s.capitalize}: #{list.join(", ")}"
      else
        upper = holiday.to_s.split("_")
        upper.each {|word | word.capitalize!}
        puts "  #{upper.join(" ")}: #{list.join(", ")}"
      end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array = []
  holiday_hash.each do |season, data|
    data.each do |holiday, list|
      if list.include?("BBQ")
        array << holiday
      end
    end
  end
  return array
end







