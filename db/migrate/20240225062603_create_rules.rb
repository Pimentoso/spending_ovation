class CreateRules < ActiveRecord::Migration[7.1]
  def change
    create_table :rules do |t|
      t.integer :operator, null: false
      t.string :value, null: false
      t.integer :action, null: false
      t.integer :action_target
      t.timestamps
    end
  end
end
