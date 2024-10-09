class Quarto < ApplicationRecord
  has_many :reservas, dependent: :destroy

  validates :numero, presence: true, uniqueness: true, confirmation: { case_sensitive: false }
  validates :tipo, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 5}
end
