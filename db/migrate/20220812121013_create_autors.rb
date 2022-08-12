class CreateAutors < ActiveRecord::Migration[6.1]
  def change
    create_table :autors do |t|
      t.string :nome
      t.string :genero_predominante
      t.string :idade
      t.string :etc
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
