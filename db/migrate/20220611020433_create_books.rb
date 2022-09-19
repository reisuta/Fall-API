class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, comment: "タイトル"
      t.string :author, null: false, comment: "著者"
      t.integer :amount, null: false, comment: "金額"
      t.boolean :is_library, null: false, default: 0, comment: "図書館フラグ"
      t.datetime :bought_at, comment: "購入日時"
      t.datetime :started_at, comment: "開始日時"
      t.datetime :ended_at, comment: "終了日時"

      t.timestamps
    end
  end
end
