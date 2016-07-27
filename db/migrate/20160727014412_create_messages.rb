# coding: utf-8
class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages, comment: 'メッセージ' do |t|
      t.references :room, null: false, foreign_key: true, comment: 'ルーム'
      t.references :user, null: false, foreign_key: true, comment: 'ユーザ'
      t.text :content, comment: '内容'

      t.timestamps
    end
  end
end
