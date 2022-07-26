class Rental
  attr_accessor :person, :book, :date

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end

  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ date, person.id, book.title]
    }.to_json(*args)
  end
 
  def self.json_create(object)
    {
      date: object['a'][0],
      person_id: object['a'][1],
      book_title: object['a'][2]
    }
  end
end
