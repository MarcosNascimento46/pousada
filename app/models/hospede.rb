class Hospede < ApplicationRecord
  has_many :reservas, dependent: :destroy

  validates :nome, presence: true, length: { in: 2..30 }, numericality: false
  validates :email,presence: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: true }
  validates :telefone, presence: true, numericality: true, confirmation: { case_sensitive: false }
end
