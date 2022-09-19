class CreateHouseContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :house_contracts do |t|
      t.string :company_name, null: false, comment: "契約会社"
      t.string :management_company, null: false, comment: "管理会社"
      t.integer :rent, null: false, comment: "家賃"
      t.string :initial_cost, null: false, comment: "初期費用"
      t.integer :area, null: false, comment: "面積"
      t.string :place, null: false, comment: "場所"
      t.integer :age, null: false, comment: "築年数"
      t.text :property_detail, null: false, comment: "物件詳細"
      t.text :contract_detail, comment: "契約詳細"
      t.datetime :started_at, comment: "開始日時"
      t.datetime :ended_at, comment: "終了日時"

      t.timestamps
    end
  end
end
