require_relative '../person'

describe Person do
  it 'should be an object instance of Person' do
    person_object = Person.new 18, 'Person', parent_permission: true
    expect(person_object).to be_an_instance_of Person
  end

  it 'should contain the appropriate instance variable age , name and parent_permission' do
    person_object = Person.new 18, 'Person', parent_permission: true
    expect(person_object.age).to eq 18
    expect(person_object.name).to eq 'Person'
    expect(person_object.parent_permission).to eq true
  end

  it 'should return true if age is higher than 18 or if parent_permission is true' do
    person_object = Person.new 18, 'Person', parent_permission: false
    expect(person_object.can_use_services?).to eq true
    person_object = Person.new 12, 'Person', parent_permission: true
    expect(person_object.can_use_services?).to eq true
    person_object = Person.new 12, 'Person', parent_permission: false
    expect(person_object.can_use_services?).to eq false
  end

  it 'should add a new rental' do
    person_object = Person.new 12, 'Person', parent_permission: true
    book = double('book')
    allow(book).to receive(:rentals) { [] }
    person_object.add_rental(book, '27-07-2022')
    expect(person_object.rentals.length).to be 1
  end
end
