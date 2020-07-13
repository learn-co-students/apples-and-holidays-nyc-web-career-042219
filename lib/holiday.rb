require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday_hash[season][:christmas].push(supply)
      holiday_hash[season][:new_years].push(supply)
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday|
    if season == :spring
      holiday_hash[season][:memorial_day].push(supply)
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  temp_hash = {season => {holiday_name => supply_array}}
  holiday_hash.merge!(temp_hash)
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  result = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, list|
        list.each do |item|
          result.push(item.to_s)
        end
      end
    end
  end
  result
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  msg = ""
  holiday_hash.each do |season, holiday|
    season_format = season.to_s.capitalize
    msg += "#{season_format}:"
    msg += "\n"
    holiday.each do |holiday, list|
      holiday_format = holiday.to_s.capitalize
      if holiday_format.include?("_")
        holiday_arr = holiday_format.split("_")
        holiday_arr.each {|w| w.capitalize!}
        holiday_format = holiday_arr.join(" ")
      end
      
      msg += "  #{holiday_format}: "
      list.each_with_index do |item, i|
        item_format = item
        if item_format.include?(" ")
          item_arr = item_format.split(" ")
          item_arr.each {|w| w.capitalize!}
          item_format = item_arr.join(" ")
        end
        
        msg += "#{item_format}"
        
        if i != list.length - 1
          msg += ", "
        elsif i == list.length - 1
          msg += "\n"
        end
      end
    end
  end
  puts msg
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  res = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, list|
      list.each do |item|
        if item == "BBQ"
          res.push(holiday)
        end
      end
    end
  end
  res
end







