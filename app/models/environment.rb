class Environment < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name, :on => :create

  def as_json(options={})
    {
      :name => name,
      :updated_at => updated_at
    }
  end
end
