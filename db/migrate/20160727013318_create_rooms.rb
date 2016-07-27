# coding: utf-8
class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms, comment: 'ルーム' do |t|
      t.references :organization, null: false, foreign_key: true, comment: '組織'
      t.string :name, null: false, comment: 'ルーム名'

      t.timestamps
    end
  end
end
