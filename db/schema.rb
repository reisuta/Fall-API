# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_02_100000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aim_categories", force: :cascade do |t|
    t.integer "aim_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aims", force: :cascade do |t|
    t.integer "future_aim_id", null: false
    t.string "title", null: false, comment: "タイトル"
    t.text "reason", null: false, comment: "理由"
    t.text "advantage", null: false, comment: "得られるもの"
    t.string "genre", null: false, comment: "ジャンル"
    t.integer "difficulty", null: false, comment: "難易度"
    t.datetime "started_at", comment: "開始日時"
    t.datetime "ended_at", comment: "終了日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル"
    t.string "author", null: false, comment: "著者"
    t.integer "amount", null: false, comment: "金額"
    t.boolean "is_library", default: false, null: false, comment: "図書館フラグ"
    t.datetime "bought_at", comment: "購入日時"
    t.datetime "started_at", comment: "開始日時"
    t.datetime "ended_at", comment: "終了日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false, comment: "カテゴリー名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitors", force: :cascade do |t|
    t.string "name", null: false, comment: "競合名"
    t.integer "month_cost", null: false, comment: "月額料金"
    t.string "cancel_cost", comment: "解約金"
    t.text "plan_detail", null: false, comment: "プラン詳細"
    t.datetime "started_at", comment: "開始日時"
    t.datetime "ended_at", comment: "終了日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "future_aims", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_contracts", force: :cascade do |t|
    t.string "company_name", null: false, comment: "契約会社"
    t.string "management_company", null: false, comment: "管理会社"
    t.integer "rent", null: false, comment: "家賃"
    t.string "initial_cost", null: false, comment: "初期費用"
    t.integer "area", null: false, comment: "面積"
    t.string "place", null: false, comment: "場所"
    t.integer "age", null: false, comment: "築年数"
    t.text "property_detail", null: false, comment: "物件詳細"
    t.text "contract_detail", comment: "契約詳細"
    t.datetime "started_at", comment: "開始日時"
    t.datetime "ended_at", comment: "終了日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideal_shapes", force: :cascade do |t|
    t.datetime "date"
    t.string "figure"
    t.string "job"
    t.text "career"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mobile_contracts", force: :cascade do |t|
    t.string "company_name", null: false, comment: "契約会社"
    t.integer "month_cost", null: false, comment: "月額料金"
    t.string "cancel_cost", comment: "解約金"
    t.text "contract_detail", null: false, comment: "契約詳細"
    t.datetime "started_at", comment: "開始日時"
    t.datetime "ended_at", comment: "終了日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name", null: false, comment: "サブスクリプション名"
    t.integer "month_cost", null: false, comment: "月額料金"
    t.integer "importance", default: 1, null: false, comment: "重要性"
    t.text "alternative", comment: "代替手段"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル"
    t.integer "status", null: false, comment: "ステータス"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
