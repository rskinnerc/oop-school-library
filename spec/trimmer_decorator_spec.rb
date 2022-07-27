require_relative '../namable'
require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  it 'should return a trimmed name when the name is more than 10 chars' do
    person = double('person')
    allow(person).to receive(:name) { 'maximillianus' }
    allow(person).to receive(:correct_name) { 'maximillianus' }

    trimmer = TrimmerDecorator.new(person)
    expect(trimmer.correct_name).to eq 'maximillia'
  end
end
