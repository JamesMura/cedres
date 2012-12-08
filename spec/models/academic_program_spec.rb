require 'spec_helper'

describe AcademicProgram do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:department) }
  it { should belong_to(:department).of_type(Department) }
  it "should create a valid user" do
		academic_program = FactoryGirl.create(:academic_program)
		user = academic_program.users.new
		user.academic_program.name.should be academic_program.name
   end
end
