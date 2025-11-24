class CreatePaaSchema < ActiveRecord::Migration[7.0]
  def change
    # Tabela ALUNO
    create_table :alunos do |t|
      t.string :matricula, null: false
      t.string :nome, null: false
      t.string :email, null: false
      t.string :senha, null: false
      t.string :cpf, null: false
      t.datetime :data_nascimento, null: false
      t.datetime :data_criacao, null: false
      t.boolean :ativo, null: false, default: true
      t.timestamps
    end

    # Tabela AVALIACAO
    create_table :avaliacoes do |t|
      t.references :turma, null: false, foreign_key: true
      t.string :tipo, null: false
      t.string :descricao, null: false
      t.float :peso, null: false
      t.datetime :data_avaliacao, null: false
      t.timestamps
    end


    # Tabela NOTA
    create_table :notas do |t|
      t.references :matricula, null: false, foreign_key: true
      t.references :avaliacao, null: false, foreign_key: true
      t.float :valor, null: false
      t.timestamps
    end

    # Tabela FREQUENCIA
    create_table :frequencias do |t|
      t.references :matricula, null: false, foreign_key: true
      t.date :data, null: false
      t.boolean :presente, null: false  # Corrigindo o nome da coluna
      t.timestamps
    end

    # Tabela CALENDARIO
    create_table :calendarios do |t|
      t.string :titulo, null: false
      t.text :descricao, null: false
      t.datetime :data_inicio, null: false
      t.datetime :data_fim, null: false
      t.string :tipo, null: false
      t.boolean :recorrente, null: false, default: false
      t.timestamps
    end

    # Tabela AVISO
    create_table :avisos do |t|
      t.references :autor, polymorphic: true, null: false  # Pode ser Professor ou outro tipo
      t.string :titulo, null: false
      t.text :conteudo, null: false
      t.string :tipo_autor, null: false
      t.datetime :data_publicacao, null: false
      t.datetime :data_expiracao, null: false
      t.boolean :importante, null: false, default: false
      t.timestamps
    end

    # Tabela DESTINATARIO_AVISO
    create_table :destinatario_avisos do |t|
      t.references :aviso, null: false, foreign_key: true
      t.references :aluno, null: false, foreign_key: true
      t.boolean :lido, null: false, default: false
      t.timestamps
    end

    # Tabela FINANCEIRO
    create_table :financeiros do |t|
      t.references :aluno, null: false, foreign_key: true
      t.string :descricao, null: false
      t.decimal :valor, precision: 8, scale: 2, null: false
      t.date :data_vencimento, null: false
      t.date :data_pagamento  # Pode ser null se não foi pago ainda
      t.string :status, null: false
      t.string :tipo, null: false
      t.timestamps
    end

    # Tabela SOLICITACAO
    create_table :solicitacoes do |t|
      t.references :aluno, null: false, foreign_key: true
      t.string :tipo, null: false
      t.text :descricao, null: false
      t.string :status, null: false
      t.datetime :data_criacao, null: false
      t.datetime :data_atualizacao, null: false
      t.timestamps
    end

    # Adicionar índices únicos
    add_index :alunos, :matricula, unique: true
    add_index :alunos, :email, unique: true
    add_index :alunos, :cpf, unique: true
    
    add_index :professors, :matricula, unique: true
    add_index :professors, :email, unique: true
    
    add_index :disciplinas, :codigo, unique: true
    add_index :turmas, :codigo_turma, unique: true
    add_index :matriculas, [:aluno_id, :turma_id], unique: true
    add_index :notas, [:matricula_id, :avaliacao_id], unique: true
    add_index :frequencias, [:matricula_id, :data], unique: true
  end
end