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
  holiday_hash.collect do |season, holidays|
#    binding.pry
    holidays.collect do |holiday|
      holiday[1] << supply
#      binding.pry
    end
#   binding.pry


  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  list = []

      holiday_hash[:winter].each do |holiday|
        holiday[1].each do |value|

       list << value

      end
    end

      list
end

def all_supplies_in_holidays(holiday_hash)

final_string = ""

    holiday_hash.each do |value|
#     binding.pry

     #adds season and enter to final string

      season = value[0]
      season = season.to_s
      season.capitalize!
      season = season + ":"
#      binding.pry
#      final_string = final_string + season + " "
      puts season
#     binding.pry

      #capitalizes the holiday name and adds it to string it out
      value[1].each do |holiday, supply_list|
        holiday = holiday.to_s
#     binding.pry
        holiday_name = holiday.split("_")
#        binding.pry
        length = holiday_name.length
        counter = 0
        while counter < length
          holiday_name[counter].capitalize!
          counter = counter + 1
        end
        holiday_name = holiday_name.join(" ")
#        binding.pry
        holiday_name = holiday_name.to_s
#        binding.pry

#    binding.pry
        holiday_name = holiday_name + ": "
#        final_string = final_string + holiday_name

#   binding.pry
        counter = 0
        length = supply_list.length
        while counter < length
#          final_string = final_string + supply_list[counter]
            holiday_name = holiday_name + supply_list[counter]
          counter = counter + 1
          if counter !=length
            holiday_name = holiday_name + ", "

          else
#            final_string = final_string + "\n"
              puts "  " + holiday_name
          end
        end
#        binding.pry
      end

#      final_string = final_string + " "

    end

#puts final_string

  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  list_keys = []
  holiday_hash.each do |value|
    value[1].each do |holiday, supply_list|
  
    if supply_list.include?("BBQ")
      list_keys << holiday
    end
  end
  end
  list_keys

end
