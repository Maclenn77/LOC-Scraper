#!/usr/bin/env ruby
require 'pry'
require_relative '../lib/sets_creator'
require_relative '../lib/imgsets'
require_relative '../lib/scraper'

class Nokogiri::HTML::Document
  include Scraper
end

# Output functions
def bar_start
puts '*'.center(80, '*')
end

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

def display(object)
  iterations = (0...object.imgsets_size(object.doc))

  puts 'Image sets of LoC'.center(80, ' ')
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

def display_set(object)
  bar_start
  puts ' ' * 10 + "- Set name: #{object.name}"
  space
  puts ' ' * 10 + "- Set url: #{object.url}"
  space
  puts ' ' * 10 + "- Number of images: #{object.total_images}"
  space
  bar_start
end

def check_image(option, set)
  choice = 1
  if option == 'a'
    until choice.negative?
      puts "Enter a number (from 1 to #{set.total_images} or 'exit')"
      choice = gets.chomp.to_i
      choice -= 1
      bar_start
      puts "DESCRIPTION: #{set.elements[choice][0]}"
      bar_start
    end
  elsif option == 'b'
    until choice.negative?
      puts "Enter a number (from 1 to #{set.total_images} or 'exit')"
      choice = gets.chomp.to_i
      choice -= 1
      bar_start
      puts ' ' * 10 + "- Url: #{set.elements[choice][1]}"
      bar_start
    end
  elsif option == 'c'
    until choice.negative?
      puts "Enter a number (from 1 to #{set.total_images} or 'exit')"
      choice = gets.chomp.to_i
      choice -= 1
      bar_start
      puts "DESCRIPTION: #{set.elements[choice][0]}"
      puts ' ' * 10 + "- Url: #{set.elements[choice][1]}"
      bar_start
    end
  elsif option == 'd'
    img_range = (1...set.total_images)
    img_range.each do |i|
      puts '--'.center(80, '-')
      puts "Image #{i}. \n  Description: #{set.elements[i][0]} \n Url: #{set.elements[i][1]}"
    end
  else
    puts '#### Invalid option ####'.center(80, ' ')
  end
end

def explore_set(answer, set)
  if answer == 'y'
    puts '>> What do you want to do?'
    puts 'a) Check a description b) Check an url c) Check description and url d) Check all images'.center(80, ' ')
    option = gets.chomp.downcase
    check_image(option, set)
  else
    puts 'Displaying menu again'
  end
end

# Start user interface
bar_start
puts 'Library of Congress'.center(80, ' ')
space
puts ' S C R A P E R'.center(80, ' ')
puts 'of'.center(80, ' ')
puts 'IMAGE SETS'.center(80, ' ')
space
bar_start
space
puts 'Wait a minute. Scraping the Library of Congress...'
space
img_sets = SetsCreator.new
set_menu = true
while set_menu == true
  display(img_sets)
  space
  puts '>> What do you want to do?'
  space
  puts '     a) Check a set b) Exit '
  choice = gets.chomp.downcase
  if choice == 'a'
    puts ">> Write the index of the set (from 1 to #{img_sets.imgsets_size(img_sets.doc)}):"
    choice = gets.chomp
    set = ImgSet.new(choice, img_sets)
    display_set(set)
    puts 'Do you want to explore the set? (Y/N)'
    answer = gets.chomp.downcase
    explore_set(answer, set)
  elsif choice == 'b'
    set_menu = false
  else
    puts 'Invalid option. Try again.'
    space
  end
end
exit_scrap
