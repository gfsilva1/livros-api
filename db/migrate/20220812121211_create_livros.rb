class CreateLivros < ActiveRecord::Migration[6.1]
  def change
    create_table :livros do |t|
      t.string :titulo
      t.string :descricao
      t.string :genero
      t.string :data_de_publicacao
      t.string :editora
      t.references :autor, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :etc

      t.timestamps
    end
  end
end
