class AddReservedByToEnvironments < ActiveRecord::Migration
  def change
    add_column :environments, :reserved_by, :string
  end
end
