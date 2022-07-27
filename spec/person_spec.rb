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
end