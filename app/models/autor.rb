class Autor < ApplicationRecord
  belongs_to :user
  has_many :livros

  validates :nome, presence: true, uniqueness: true
end
