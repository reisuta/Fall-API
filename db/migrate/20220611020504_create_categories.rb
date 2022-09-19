class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, comment: "カテゴリー名"

      t.timestamps
    end
  end
end
