class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.integer :user_id, null: true
      t.integer :state, null: false, default: 1 # 1 means 'active'
      t.date :outbound_start, null: false
      t.date :outbound_end, null: false
      t.date :inbound_start, null: true # null means one way flight
      t.date :inbound_end, null: true
      t.string :start_airports, null: false
      t.string :end_airports, null: false
      t.integer :trip_len_min, null: false, default: -1 # no minimum
      t.integer :trip_len_max, null: false, default: -1 # no maximum
      t.integer :price_limit, null: false, default: -1 # no price limit
      t.boolean :auto_alert, null: false, default: false
      t.datetime :last_searched, null: true

      t.timestamps
    end
  end
end
