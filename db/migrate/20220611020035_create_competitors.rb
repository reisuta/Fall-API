class CreateCompetitors < ActiveRecord::Migration[7.0]
  def change
    create_table :competitors do |t|
      t.string :name, null: false, comment: "競合名"
      t.integer :month_cost, null: false, comment: "月額料金"
      t.string :cancel_cost, comment: "解約金"
      t.text :plan_detail, null: false, comment: "プラン詳細"
      t.datetime :started_at, comment: "開始日時"
      t.datetime :ended_at, comment: "終了日時"

      t.timestamps
    end
  end
end
