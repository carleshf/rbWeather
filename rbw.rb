#! /usr/bin/ruby
require 'open-uri' 
require 'json' 
require 'colorize' 
require 'csv' 
require 'date' 
require 'table_print'

require './iconum'

system "clear" unless system "cls" 


# arguments for country and time 
city = ARGV[0] 

url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}%20ES&mode=json&units=metric" 
contents = open(url).read 
parsed_json = JSON.parse(contents)
puts parsed_json
# if parsed_json['main'].nil? 
# puts "#{city.capitalize.colorize( :red )} does not appear to be a valid city name, or maybe you misspelled the country, try again" 
# elsif 
weather_in_c = (parsed_json['main']['temp']).to_i 
humidity = parsed_json['main']['humidity'] 

# puts "=================" 
# puts "Weather now in #{city.capitalize.colorize( :green )}  (#{parsed_json['sys']['country']}) is #{weather_in_c} ºC" 
# puts "Humidity is around #{humidity} and #{(parsed_json['weather'][0]['description']).downcase} (#{(parsed_json['weather'][0]['icon'])})" 
# puts "================="
# end       


x = display_ascii( [city, parsed_json['sys']['country']], 
  [parsed_json['wind']['deg'], parsed_json['wind']['speed']],
  "#{weather_in_c} ºC", parsed_json['weather'][0]['icon'])

puts ""
x.map do |line|
  puts line
end
puts ""