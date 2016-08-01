# coding: utf-8
class AddNameToMembership < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :name, :string, null: false, comment: 'ユーザ名', after: 'user_id'
  end
end
