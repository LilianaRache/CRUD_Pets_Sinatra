class CreatePetsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
            t.string :name
            t.string :raza
            t.integer :edad
            t.string :foto
          end
  end
end
