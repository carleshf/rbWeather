#! /usr/bin/ruby   
require 'open-uri' 
require 'json' 
require 'colorize' 
require 'csv' 
require 'date' 
require 'table_print'     


# arguments for country and time 
c = ARGV[0] 
time = ARGV[1]   

# if argument time was set to now 
if time == 'now' 
  url = "http://api.openweathermap.org/data/2.5/weather?q=#{c}&mode=json&units=metric" 
  contents = open(url).read 
  parsed_json = JSON.parse(contents)   
  if parsed_json['main'].nil? 
    puts "#{c.capitalize.colorize( :red )} does not appear to be a valid city name, or maybe you misspelled the country, try again" 
  elsif 
    weather_in_c = (parsed_json['main']['temp']).to_i 
    humidity = parsed_json['main']['humidity'] 
    system "clear" unless system "cls" 
    puts "=================" 
    puts "Weather now in #{c.capitalize.colorize( :blue )} is #{weather_in_c} ºC" 
    puts "Humidity is around #{humidity} and #{(parsed_json['weather'][0]['description']).downcase}" 
    puts "================="
  end       

# if argument time was set to 7days 
elsif time == '7days' 
  url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=#{c}&mode=json&units=metric&cnt=7" 
  contents = open(url).read 
  parsed_json = JSON.parse(contents)
  days = []   

  if parsed_json['list'].nil? 
    puts "#{c.capitalize.colorize( :red )} does not appear to be a valid city name, or maybe you misspelled the country, try again" 
  elsif 
    parsed_json['list'].each do |day| 
      days.push('Day' => Time.at((day['dt']).to_i).strftime("%d-%m-%Y"), 'Temp ºC' => (day['temp']['day']).to_i) 
    end 
    system "clear" unless system "cls" 
    puts "=================" 
    puts "7 days weather in #{c.capitalize.colorize( :blue )}", "\n" 
    puts tp days 
    puts "=================", "\n" 
  end 
end