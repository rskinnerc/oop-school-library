require_relative '../classroom'

describe Classroom do
  it 'should be an object instance of Classroom' do
    classroom = Classroom.new 'ClassRoom Label'
    expect(classroom).to be_an_instance_of Classroom
  end

  it 'should contain the appropriate instance variable label' do
    classroom = Classroom.new 'ClassRoom Label'
    expect(classroom.label).to eq 'ClassRoom Label'
  end

  
  it 'should contain the appropriate instance variable students as an empty array' do
    classroom = Classroom.new 'ClassRoom Label'
    expect(classroom.students).to match_array []
  end

  it 'should contain a new student when the method add_stdent is called' do
    classroom = Classroom.new 'ClassRoom Label'
    student = double('student')
    allow(student).to receive(:classroom=) {classroom}

    classroom.add_student(student)
    expect(classroom.students.length).to be 1
  end
end
