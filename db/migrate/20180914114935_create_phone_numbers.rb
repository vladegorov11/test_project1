class CreatePhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_numbers do |t|
      t.string :number, uniq: true
      t.timestamps
    end
    add_index :phone_numbers, :number
  end
end
