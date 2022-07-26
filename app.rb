require './book'
require './student'
require './teacher'
require './rental'
require 'json'

class App
  def initialize 
    @books = File.exists?("./books.json") ? JSON.parse(File.read("./books.json"),create_additions: true) : []
    @people = File.exists?("./people.json") ? JSON.parse(File.read("./people.json"),create_additions: true) : []
    @rentals = File.exists?("./rentals.json") ? JSON.parse(File.read("./rentals.json"), {create_additions: true}).map {|rental| load_rental_details(rental)} : []
    puts 'Welcome to School Library App!'
    puts ''
  end

  def action(choice, options)
    if choice > options.length || choice.zero?
      (puts 'Invalid option. Please try again.')
    else
      options.each do |option|
        send(option[:action]) if option[:id] == choice
      end
    end
  end

  def list_books
    if @books.empty?
      puts 'There are no books.'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    puts ''
  end

  def list_people
    if @people.empty?
      puts 'There are no people.'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
    puts ''
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i
    unless type.between?(1, 2)
      puts 'Invalid person type.'
      puts ''
      return
    end

    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    type == 1 ? create_student(age, name) : create_teacher(age, name)

    puts 'Person created successfully!'
    puts ''
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase == 'Y'
    @people << Student.new(age, nil, name, parent_permission: parent_permission)
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully!'
    puts ''
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    selected_book = @books[gets.chomp.to_i]
    puts ''

    puts 'Select a person from the following list by number (not ID): '
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = @people[gets.chomp.to_i]
    puts ''

    print 'Enter the rental date (YYYY/MM/DD): '
    rental_date = gets.chomp
    @rentals << Rental.new(rental_date, selected_person, selected_book)
    print 'Rental created successfully!'
    puts ''
  end

  def list_rentals
    print 'Enter the person ID: '
    id = gets.chomp.to_i
    filtered_rentals = @rentals.select do |rental|
      rental.person.id == id
    end
    filtered_rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
    puts ''
  end

  def save_data
    File.write('books.json', JSON.generate(@books))
    File.write('people.json', JSON.generate(@people))
    File.write('rentals.json', JSON.fast_generate(@rentals))
  end

  
  def load_rental_details(rental)
    person = @people.filter { |per| per.id == rental[:person_id]}.first
    book = @books.filter { |b| b.title == rental[:book_title]}.first
    Rental.new(rental[:date], person, book)
  end
end
