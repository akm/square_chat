# coding: utf-8
class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations, comment: '組織' do |t|
      t.string :name, null: false, comment: '組織名'

      t.timestamps
    end
  end
end
