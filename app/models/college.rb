class College
  include Mongoid::Document
  field :name, type: String
  has_many :departments
  validates_presence_of :name
end
