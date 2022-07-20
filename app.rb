require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    @options = [
      { id: 1, name: '1 - List all books', action: 'list_books' },
      { id: 2, name: '2 - List all people', action: 'list_people' },
      { id: 3, name: '3 - Create a person', action: 'create_person' },
      { id: 4, name: '4 - Create a book', action: 'create_book' },
      { id: 5, name: '5 - Create a rental', action: 'create_rental' },
      { id: 6, name: '6 - List all rentals for a given person id', action: 'list_rentals' },
      { id: 7, name: '7 - Exit', action: 'exit_app' }
    ]

    @books = []
    @people = []
    @rentals = []
    puts 'Welcome to School Library App!'
    puts ''
  end

  def run
    puts 'Please choose an option by entering a number:'
    @options.each { |option| puts option[:name] }
    choice = gets.chomp.to_i
    action choice
  end

  def action(choice)
    if choice > @options.length || choice.zero?
      (puts 'Invalid option. Please try again.')
    else
      @options.each do |option|
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
    run
  end

  def list_people
    if @people.empty?
      puts 'There are no people.'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
    puts ''
    run
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i
    unless type.between?(1, 2)
      puts 'Invalid person type.'
      puts ''
      run
      return
    end

    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    type == 1 ? create_student(age, name) : create_teacher(age, name)

    puts 'Person created successfully!'
    puts ''
    run
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
    run
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
    run
  end

  def list_rentals
    print 'Enter the person ID: '
    id = gets.chomp.to_i
    filtered_rentals = @rentals.select do |rental|
      rental.person.id == id
    end
    filtered_rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
    puts ''
    run
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end
end
