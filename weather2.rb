#! /usr/bin/ruby
require 'open-uri'
require 'json'
require 'colorize'
require 'csv'
require 'date'
require 'table_print'


## http://www.glassgiant.com/ascii/

## http://bugs.openweathermap.org/projects/api/wiki/Weather_Data
## http://bugs.openweathermap.org/projects/api/wiki/Weather_Condition_Codes

def get_weather(city)
  url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&mode=json&units=metric"
  contents = open(url).read
  parsed_json = JSON.parse(contents)
  if parsed_json['main'].nil? 
    return nil
  else
    return parsed_json
  end
end

def print_weather(data)
  puts data["name"]
  puts "---------------------------------------"
  puts data["weather"][0]["description"]
  puts data["weather"][0]["icon"]
  puts "Temp. Act: #{data["main"]["temp"]}"
  puts "Humidity:  #{data["main"]["humidity"]}%"
  puts "Wind:      #{data["wind"]["speed"]}km/h"
end


# arguments for country and time 
city = ARGV[0]
opts = ARGV[1]


dd = get_weather(city)
if dd.nil?
  puts "NIL?"
else
  print_weather(dd)
end