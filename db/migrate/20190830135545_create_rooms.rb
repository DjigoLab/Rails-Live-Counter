class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, :default => 'Boring Name'
      t.string :password, :default => 'empty'
      t.integer :max_counter, :default => 100
      t.integer :counter_value, :default => 0
      t.boolean :accepts_negative
      t.timestamps
    end
  end
end
