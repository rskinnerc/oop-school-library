#!/usr/bin/env ruby
require './app'

def main
  options = [
    { id: 1, name: '1 - List all books', action: 'list_books' },
    { id: 2, name: '2 - List all people', action: 'list_people' },
    { id: 3, name: '3 - Create a person', action: 'create_person' },
    { id: 4, name: '4 - Create a book', action: 'create_book' },
    { id: 5, name: '5 - Create a rental', action: 'create_rental' },
    { id: 6, name: '6 - List all rentals for a given person id', action: 'list_rentals' },
    { id: 7, name: '7 - Exit', action: 'exit_app' }
  ]
  app = App.new
  exit = 0
  while exit.zero?
    puts 'Please choose an option by entering a number:'
    options.each { |option| puts option[:name] }
    choice = gets.chomp.to_i
    choice == 7 ? exit = 1 : app.action(choice, options)
  end
end

main
puts 'Thank you for using this app!'
