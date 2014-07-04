class BookingsMigration < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.column :bookable_id,      :integer
      t.column :bookable_type,    :string
      t.column :name,             :string
      t.column :summary,          :text
      t.column :terms,            :text
      t.column :starts_at,        :datetime
      t.column :ends_at,          :datetime
      t.column :requested_amount, :decimal
      t.column :confirmed_amount, :decimal
      t.column :state,            :string
    end

    add_index :bookings, [:bookable_id, :bookable_type]
  end

  def self.down
    drop_table :bookings
  end
end
