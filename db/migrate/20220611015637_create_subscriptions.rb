class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :name, null: false, comment: "サブスクリプション名"
      t.integer :month_cost, null: false, comment: "月額料金"
      t.integer :importance, null: false, default: 1, comment: "重要性"
      t.text :alternative, comment: "代替手段"

      t.timestamps
    end
  end
end
