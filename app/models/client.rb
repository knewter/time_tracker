class Client < ActiveRecord::Base
  has_many :projects
  has_many :tickets,    :through => :projects
  has_many :work_units, :through => :tickets

  validates_presence_of :name
end
