class Department
  include Mongoid::Document
  field :name, type: String
  belongs_to :college
  has_many :academic_programs
  validates_presence_of :name
  validates_presence_of :college
end
