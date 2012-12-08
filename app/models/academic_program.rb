class AcademicProgram
  include Mongoid::Document
  field :name, type: String
  belongs_to :department
  has_many :users
  validates_presence_of :name
  validates_presence_of :department
end
