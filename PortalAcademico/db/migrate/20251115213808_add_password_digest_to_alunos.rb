#Modificação dos atributos da tabela alunos.
class AddPasswordDigestToAlunos < ActiveRecord::Migration[7.0]
  def change
    remove_column :alunos, :senha, :string
    add_column :alunos, :password_digest, :string, null: false
  end
end