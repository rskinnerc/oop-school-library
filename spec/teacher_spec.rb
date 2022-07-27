require_relative '../teacher'

describe Teacher do
  it 'should be an object instance of Teacher' do
    teacher_object = Teacher.new 18, 'Specialization', 'Person', parent_permission: true
    expect(teacher_object).to be_an_instance_of Teacher
  end

  it 'should contain the appropriate instance variable age , name, specialization and parent_permission' do
    teacher_object = Teacher.new 18, 'Specialization', 'Person', parent_permission: true
    expect(teacher_object.age).to eq 18
    expect(teacher_object.specialization).to eq 'Specialization'
    expect(teacher_object.name).to eq 'Person'
    expect(teacher_object.parent_permission).to eq true
  end
end