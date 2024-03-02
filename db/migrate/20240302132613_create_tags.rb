class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table "tags" do |t|
      t.string "name", null: false
      t.string "color", null: false
      t.references :payment, foreign_key: true
      t.timestamps
    end

    create_table "payment_tags", id: false do |t|
      t.references :payment, foreign_key: true
      t.references :tag, foreign_key: true
    end

  end
end
