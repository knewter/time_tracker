class Ticket < ActiveRecord::Base
  belongs_to :project
  has_many :work_units

  validates_presence_of :name
end
