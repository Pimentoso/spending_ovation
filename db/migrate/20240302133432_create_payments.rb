class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.date "date"
      t.string "description"
      t.integer "amount", null: false
      t.integer "direction", null: false
      t.references :tags
      t.timestamps
    end
  end
end
