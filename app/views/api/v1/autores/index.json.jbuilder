json.array! @autores do |autor|
  json.extract! autor, :id, :nome
end
