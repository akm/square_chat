# coding: utf-8
class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships, comment: '所属' do |t|
      t.references :organization, null: false, foreign_key: true, comment: '組織'
      t.references :user, null: false, foreign_key: true, comment: 'ユーザー'
      t.string :name, null: false, comment: 'ユーザ名'
      t.integer :role, null: false, comment: '役割'

      t.timestamps
    end
  end
end
