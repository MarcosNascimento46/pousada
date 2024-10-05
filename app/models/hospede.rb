class Hospede < ApplicationRecord
  has_many :reservas, dependent: :destroy

  validates :nome, presence: true, length: { in: 2..30 }, numericality: false
  validates :email, presence: true, format: { with: /\A\d{11}\z/, message: "Deve ter 11 dígitos númericos" }, uniqueness: true
  validates :telefone, presence: true, numericality: true, confirmation: { case_sensitive: false }
end
