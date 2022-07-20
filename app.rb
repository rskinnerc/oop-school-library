require './book'

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
      puts ''
      run
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
      puts ''
      run
    end
  end

  def list_people
    puts 'Listing all people:'
  end

  def create_person
    puts 'Creating a person:'
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
    puts 'Creating a rental:'
  end

  def list_rentals
    puts 'Listing all rentals:'
  end

  def exit_app
    puts 'Exiting app...'
    exit
  end
end
