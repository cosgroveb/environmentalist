class Environment < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name, :on => :create
end
