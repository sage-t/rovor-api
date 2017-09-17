class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.integer :alert_id, null: true
      t.integer :price, null: false
      t.string :start_airport, null: false
      t.string :end_airport, null: false
      t.date :outbound, null: false
      t.date :inbound, null: true # one way flight if null
      t.text :link, null: false

      t.timestamps
    end
  end
end
