require 'date'

puts 'Before applicate monkey patching'

p Date.methods.include?(:leap_year?)

class Date
    def leap_year?
        (year % 4 == 0 && year % 100 !=0) || (year % 400 == 0)
    end
end

p 'after monkey patch'

date = Date.new(2024, 10, 29)
p date.leap_year?