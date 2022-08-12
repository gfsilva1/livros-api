json.array! @livros do |livro|
  json.extract! livro, :id, :titulo
end
