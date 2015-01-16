#! /usr/bin/ruby
require 'open-uri'
require 'json'
require 'colorize'
require 'csv'
require 'date'
require 'table_print'

## http://bugs.openweathermap.org/projects/api/wiki/Weather_Data
## http://bugs.openweathermap.org/projects/api/wiki/Weather_Condition_Codes

def get_weather(city)
  url = "http://api.openweathermap.org/data/2.5/weather?q=#{c}&mode=json&units=metric"
  contents = open(url).read
  parsed_json = JSON.parse(contents)
end


# arguments for country and time 
city = ARGV[0]
opts = ARGV[1]


