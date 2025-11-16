class Aluno < ApplicationRecord
  has_secure_password
  
  validates :matricula, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validates :nome, presence: true
  validates :data_nascimento, presence: true
  validates :data_criacao, presence: true
  
  def self.authenticate(matricula, password)
    aluno = find_by(matricula: matricula, ativo: true)
    aluno&.authenticate(password)
  end
end