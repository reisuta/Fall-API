class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false, comment: "タイトル"
      t.integer :status, null: false, comment: "ステータス"

      t.timestamps
    end
  end
end
