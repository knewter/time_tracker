class WorkUnit < ActiveRecord::Base
  belongs_to :ticket

  validates_presence_of :description
  validates_presence_of :hours
end
