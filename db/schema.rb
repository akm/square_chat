# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160727014412) do

  create_table "memberships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "所属" do |t|
    t.integer  "organization_id", null: false, comment: "組織"
    t.integer  "user_id",         null: false, comment: "ユーザー"
    t.string   "name",            null: false, comment: "ユーザ名"
    t.string   "image_url",       null: false, comment: "画像URL"
    t.integer  "role",            null: false, comment: "役割"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_memberships_on_organization_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "メッセージ" do |t|
    t.integer  "room_id",                     null: false, comment: "ルーム"
    t.integer  "membership_id",               null: false, comment: "ユーザ"
    t.text     "content",       limit: 65535,              comment: "内容"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["membership_id"], name: "index_messages_on_membership_id", using: :btree
    t.index ["room_id"], name: "index_messages_on_room_id", using: :btree
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "組織" do |t|
    t.string   "name",       null: false, comment: "組織名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ルーム" do |t|
    t.integer  "organization_id", null: false, comment: "組織"
    t.string   "name",            null: false, comment: "ルーム名"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_rooms_on_organization_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ユーザ" do |t|
    t.string   "email",                  default: "", null: false, comment: "メールアドレス"
    t.string   "encrypted_password",     default: "", null: false, comment: "暗号化済みパスワード"
    t.string   "reset_password_token",                             comment: "パスワードトークン"
    t.datetime "reset_password_sent_at",                           comment: "パスワードトークン送信日時"
    t.datetime "remember_created_at",                              comment: "ログイン記憶日時"
    t.integer  "sign_in_count",          default: 0,  null: false, comment: "ログイン回数"
    t.datetime "current_sign_in_at",                               comment: "現在ログイン日時"
    t.datetime "last_sign_in_at",                                  comment: "前回ログイン日時"
    t.string   "current_sign_in_ip",                               comment: "現在ログインIP"
    t.string   "last_sign_in_ip",                                  comment: "前回ログインIP"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "memberships", "organizations"
  add_foreign_key "memberships", "users"
  add_foreign_key "messages", "memberships"
  add_foreign_key "messages", "rooms"
  add_foreign_key "rooms", "organizations"
end
