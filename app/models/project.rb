class Project < ActiveRecord::Base
  belongs_to :client
  has_many :tickets
  has_many :work_units, :through => :tickets

  validates_presence_of :name
end
