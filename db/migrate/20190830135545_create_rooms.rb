class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :password, :default => 'empty'
      t.integer :max_counter, :default => 0
      t.integer :counter_value, :default => 0

      t.timestamps
    end
  end
end
