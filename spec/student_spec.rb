require_relative '../student'

describe Student do
  it 'should be an object instance of Student' do
    student_object = Student.new 18, nil, 'Person', parent_permission: true
    expect(student_object).to be_an_instance_of Student
  end

  it 'should contain the appropriate instance variable age , name, classroom and parent_permission' do
    student_object = Student.new 18, nil, 'Person', parent_permission: true
    expect(student_object.age).to eq 18
    expect(student_object.classroom).to be_nil
    expect(student_object.name).to eq 'Person'
    expect(student_object.parent_permission).to eq true
  end
end
