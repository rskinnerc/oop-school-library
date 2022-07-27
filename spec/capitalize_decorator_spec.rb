require_relative '../namable'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  it 'should return a capitalized name' do 
    person = double('person')
    allow(person).to receive(:name) {'maximillianus'}
    allow(person).to receive(:correct_name) {'maximillianus'}

    capitalized = CapitalizeDecorator.new(person)
    expect(capitalized.correct_name).to eq 'Maximillianus'
  end
end