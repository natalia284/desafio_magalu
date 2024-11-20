class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :archive, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.decimal :total, precision: 15, scale: 2
      t.date :date
    end
  end
end