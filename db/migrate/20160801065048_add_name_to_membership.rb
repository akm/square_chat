class AddNameToMembership < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :name, :string
  end
end
