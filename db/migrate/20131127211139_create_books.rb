class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string   "school_id"
      t.string   "email"
      t.string   "course"
      t.string   "title"
      t.string  "isbn"
      t.string   "condition"
      t.decimal  "asking_price"
      t.datetime "expiration",   default: (Time.now + 1209600).end_of_day
    end
  end
end
