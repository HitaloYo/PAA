# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_11_24_051911) do
  create_table "alunos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "matricula", null: false
    t.string "nome", null: false
    t.string "email", null: false
    t.string "cpf", null: false
    t.datetime "data_nascimento", null: false
    t.datetime "data_criacao", null: false
    t.boolean "ativo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.string "curso", default: "Não informado", null: false
    t.string "cor_raca"
    t.string "estado_civil"
    t.string "sexo"
    t.string "estado_nascimento"
    t.string "cidade_nascimento"
    t.string "tipo_documento"
    t.string "numero_documento"
    t.date "data_expedicao"
    t.string "orgao_emissor"
    t.string "uf_emissao"
    t.string "nome_pai"
    t.string "nome_mae"
    t.string "ddd"
    t.string "celular"
    t.string "cep"
    t.string "logradouro"
    t.string "numero"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "periodo"
    t.string "turno"
    t.string "unidade"
    t.index ["cpf"], name: "index_alunos_on_cpf", unique: true
    t.index ["email"], name: "index_alunos_on_email", unique: true
    t.index ["matricula"], name: "index_alunos_on_matricula", unique: true
  end

  create_table "avaliacaos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "turma_id", null: false
    t.string "tipo"
    t.string "descricao"
    t.float "peso"
    t.datetime "data_avaliacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turma_id"], name: "index_avaliacaos_on_turma_id"
  end

  create_table "avaliacoes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "turma_id", null: false
    t.string "tipo", null: false
    t.string "descricao", null: false
    t.float "peso", null: false
    t.datetime "data_avaliacao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turma_id"], name: "index_avaliacoes_on_turma_id"
  end

  create_table "avisos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "autor_type", null: false
    t.bigint "autor_id", null: false
    t.string "titulo", null: false
    t.text "conteudo", null: false
    t.datetime "data_publicacao", null: false
    t.datetime "data_expiracao"
    t.boolean "importante", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autor_type", "autor_id"], name: "index_avisos_on_autor"
  end

  create_table "calendarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "titulo", null: false
    t.text "descricao"
    t.datetime "data_inicio", null: false
    t.datetime "data_fim", null: false
    t.string "tipo", null: false
    t.boolean "recorrente", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinatario_avisos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "aviso_id", null: false
    t.bigint "aluno_id", null: false
    t.boolean "lido", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_destinatario_avisos_on_aluno_id"
    t.index ["aviso_id"], name: "index_destinatario_avisos_on_aviso_id"
  end

  create_table "diciplinas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "turma"
    t.string "matricula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplinas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "professor_id", null: false
    t.string "codigo", null: false
    t.string "nome", null: false
    t.integer "carga_horaria", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codigo"], name: "index_disciplinas_on_codigo", unique: true
    t.index ["professor_id"], name: "index_disciplinas_on_professor_id"
  end

  create_table "financeiros", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.string "descricao", null: false
    t.decimal "valor", precision: 8, scale: 2, null: false
    t.date "data_vencimento", null: false
    t.date "data_pagamento"
    t.string "status", null: false
    t.string "tipo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_financeiros_on_aluno_id"
  end

  create_table "frequencia", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "matricula_id", null: false
    t.date "data"
    t.boolean "presente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matricula_id"], name: "index_frequencia_on_matricula_id"
  end

  create_table "frequencias", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "matricula_id", null: false
    t.date "data", null: false
    t.boolean "presente", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matricula_id"], name: "index_frequencias_on_matricula_id"
  end

  create_table "matriculas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.bigint "turma_id", null: false
    t.string "situacao", null: false
    t.float "nota_final"
    t.integer "frequencia", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id", "turma_id"], name: "index_matriculas_on_aluno_id_and_turma_id", unique: true
    t.index ["aluno_id"], name: "index_matriculas_on_aluno_id"
    t.index ["turma_id"], name: "index_matriculas_on_turma_id"
  end

  create_table "nota", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "matricula_id", null: false
    t.bigint "avaliacao_id", null: false
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaliacao_id"], name: "index_nota_on_avaliacao_id"
    t.index ["matricula_id"], name: "index_nota_on_matricula_id"
  end

  create_table "professors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "matricula", null: false
    t.string "nome", null: false
    t.string "email", null: false
    t.string "departamento", null: false
    t.boolean "ativo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_professors_on_email", unique: true
    t.index ["matricula"], name: "index_professors_on_matricula", unique: true
  end

  create_table "solicitacaos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.string "tipo"
    t.text "descricao"
    t.string "status"
    t.datetime "data_criacao"
    t.datetime "data_atualizacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_solicitacaos_on_aluno_id"
  end

  create_table "solicitacoes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.string "tipo", null: false
    t.text "descricao", null: false
    t.string "status", null: false
    t.datetime "data_criacao", null: false
    t.datetime "data_atualizacao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_solicitacoes_on_aluno_id"
  end

  create_table "turmas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "disciplina_id", null: false
    t.string "codigo_turma", null: false
    t.integer "semestre", null: false
    t.integer "ano", null: false
    t.integer "vagas_totais", null: false
    t.integer "vagas_ocupadas", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codigo_turma"], name: "index_turmas_on_codigo_turma", unique: true
    t.index ["disciplina_id"], name: "index_turmas_on_disciplina_id"
  end

  add_foreign_key "avaliacaos", "turmas"
  add_foreign_key "avaliacoes", "turmas"
  add_foreign_key "destinatario_avisos", "alunos"
  add_foreign_key "destinatario_avisos", "avisos"
  add_foreign_key "disciplinas", "professors"
  add_foreign_key "financeiros", "alunos"
  add_foreign_key "frequencia", "matriculas"
  add_foreign_key "frequencias", "matriculas"
  add_foreign_key "matriculas", "alunos"
  add_foreign_key "matriculas", "turmas"
  add_foreign_key "nota", "avaliacaos"
  add_foreign_key "nota", "matriculas"
  add_foreign_key "solicitacaos", "alunos"
  add_foreign_key "solicitacoes", "alunos"
  add_foreign_key "turmas", "disciplinas"
end
