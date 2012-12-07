require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:registration_number) }
  it { should validate_presence_of(:academic_program) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:registration_number) }
end