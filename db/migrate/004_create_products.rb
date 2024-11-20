class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :archive, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.decimal :value, precision: 12, scale: 2
    end
  end
end