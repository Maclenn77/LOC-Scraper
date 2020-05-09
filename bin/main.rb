#!/usr/bin/env ruby
require_relative '../lib/scraper'
require_relative '../lib/imgsets'

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
puts 'Scraping...'
space
# scrap_loc
set_menu = true
while set_menu == true
  # puts display_img_sets
  space
  puts '>> What do you want to do?'
  space
  puts '     a) Check a set b) Exit '
  choice = gets.chomp.downcase
  if choice == 'a'
    puts '>> Write the name of the set:'
    choice = gets.chomp
    # validate(choice)
    # choice.check
  elsif choice == 'b'
    exit_scrap
  else
    puts 'Invalid option. Try again.'
  end
end
