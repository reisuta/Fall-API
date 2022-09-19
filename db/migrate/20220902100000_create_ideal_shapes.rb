class CreateIdealShapes < ActiveRecord::Migration[7.0]
  def change
    create_table :ideal_shapes do |t|
      t.datetime :date
      t.string :figure
      t.string :job
      t.text :career
      t.string :location

      t.timestamps
    end
  end
end
