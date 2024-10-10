class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, [:admin, :funcionario, :hospede]

  def admin?
    role == 'admin'
  end

  def funcionario?
    role == 'funcionario'
  end

end
