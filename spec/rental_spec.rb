require_relative '../rental'

describe Rental do
  it 'should be an object instance of Rental' do
    person = double('person')
    book = double('book')

    allow(person).to receive(:rentals) {[]}
    allow(book).to receive(:rentals) {[]}

    rental = Rental.new '2022/07/27', person, book
    expect(rental).to be_an_instance_of Rental
  end

  it 'should contain the appropriate instance variable date, person and book' do
    person = double('person')
    book = double('book')

    allow(person).to receive(:rentals) {[]}
    allow(book).to receive(:rentals) {[]}

    rental = Rental.new '2022/07/27', person, book
    expect(rental.date).to eq '2022/07/27'
    expect(rental.person).to eq person
    expect(rental.book).to eq book
  end
end
