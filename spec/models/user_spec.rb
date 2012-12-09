require 'spec_helper'

describe User do
  before(:each) do
    @college = College.new(:name => "MUK")
    @department = Department.new({:name => "DEPT", :college => @college})
    @program = AcademicProgram.new({:name => "Elec", :department => @department})
    @attr = {
        :name => "Example User",
        :email => "user@tech.mak.ac.ug",
        :password => "foobar",
        :password_confirmation => "foobar",
        :registration_number => "09",
        :academic_program => @program
    }
  end
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:registration_number) }
  it { should validate_presence_of(:academic_program) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:registration_number) }
  it { should belong_to(:academic_program).of_type(AcademicProgram) }
  it "should create a object when valid attributes are passed" do
    lambda {
      user =User.create!(@attr)
    }.should change(User, :count).by(1)
  end

  it "should require email" do
    user = User.new(@attr.merge(:email => ""))
    user.should_not be_valid

  end
  it "should be require a name" do
    user = User.new(@attr.merge(:name => ""))
    user.should_not be_valid

  end

  it "should be require a registration_number" do
    user = User.new(@attr.merge(:registration_number => ""))
    user.should_not be_valid

  end
  it "should be require a academic_program" do
    user = User.new(@attr.merge(:academic_program => ""))
    user.should_not be_valid

  end
  it "should accept valid email addresses" do
    addresses = %w[user@tech.mak.ac.ug THE_USER@mak.ac.ug  first.last@cit.mak.ac.ug ]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. jmu@gmail.com jmur@ac.ug]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  it "should reject duplicate registration_numbers" do
    User.create!(@attr)
    user = User.new(@attr)
    user.should_not be_valid
  end
  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
          should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
          should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end


end
