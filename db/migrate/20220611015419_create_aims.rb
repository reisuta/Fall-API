class CreateAims < ActiveRecord::Migration[7.0]
  def change
    create_table :aims do |t|
      t.integer :future_aim_id, commet: "年間目標ID"
      t.string :title, null: false, comment: "タイトル"
      t.text :reason, null: false, comment: "理由"
      t.text :advantage, null: false, comment: "得られるもの"
      t.string :genre, null: false, comment: "ジャンル"
      t.integer :difficulty, null: false, comment: "難易度"
      t.datetime :started_at, comment: "開始日時"
      t.datetime :ended_at, comment: "終了日時"

      t.timestamps
    end
  end
end
