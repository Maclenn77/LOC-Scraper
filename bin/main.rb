#!/usr/bin/env ruby
require 'pry'
require_relative '../lib/sets_creator'
require_relative '../lib/imgsets'

# binding.pry

# Output functions
bar_start = '*'.center(80, '*')

def space
  puts "\n"
end

def exit_scrap
  line = '-'.center(80, '-')
  puts line
  puts 'Scraper of Image Sets was developed by Juan Paulo Perez-Tejada'.center(80, ' ')
  puts 'Copyleft (c) 2020 - Some rights reserved.'.center(80, ' ')
  puts line
  exit
end

def display_img_sets(object)
  iterations = (0...object.imgsets_size)
  iterations.each do |i|
    num = i + 1
    if i.even?
      puts '-'.center(70, '-')
      print num.to_s + '. ' + object.sets[i] + ' || '
    else
      print num.to_s + '. ' + object.sets[i] + "\n"
    end
  end
end

# Start user interface
puts bar_start
puts 'Library of Congress'.center(80, ' ')
space
puts ' S C R A P E R'.center(80, ' ')
puts 'of'.center(80, ' ')
puts 'IMAGE SETS'.center(80, ' ')
space
puts bar_start
space
puts 'Wait a minute. Scraping the Library of Congress...'
space
create = SetsCreator.new
set_menu = true
while set_menu == true
  display_img_sets(create)
  space
  puts '>> What do you want to do?'
  space
  puts '     a) Check a set b) Exit '
  choice = gets.chomp.downcase
  if choice == 'a'
    puts ">> Write the index of the set (from 1 to #{create.imgsets_size}):"
    choice = gets.chomp
    # validate(choice)
    # choice.check
  elsif choice == 'b'
    set_menu = false
  else
    puts 'Invalid option. Try again.'
    space
  end
end
exit_scrap
