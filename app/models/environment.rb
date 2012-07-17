class Environment < ActiveRecord::Base
  attr_accessible :name, :reserved_by
  validates_presence_of :name, :on => :create

  def as_json(options={})
    {
      :id => id,
      :name => name,
      :reserved_by => reserved_by.blank? ? ' ' : reserved_by,
      :updated_at => updated_at
    }
  end
end
