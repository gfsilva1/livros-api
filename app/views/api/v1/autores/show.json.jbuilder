json.extract! @autor, :id, :nome, :genero_predominante, :idade, :etc
json.livros @autor.livros do |livro|
  json.extract! livro, :id, :titulo, :descricao
end
