class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.belongs_to :archive, foreign_key: true 
      t.string :name, limit: 45
    end
  end
end