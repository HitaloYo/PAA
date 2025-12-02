# Portal Acadêmico do Aluno
![Ruby](https://img.shields.io/badge/Ruby-3.2.2-red)
![Rails](https://img.shields.io/badge/Rails-7.0.8-red)
![Bootstrap](https://img.shields.io/badge/Bootstrap-Icons-purple)

URL PARA TESTES: https://site-qnxh.onrender.com/login
Sistema web completo para gestão acadêmica de alunos, desenvolvido em Ruby on Rails com interface moderna e responsiva.

## 📋 Sobre o Projeto

O Portal Acadêmico do Aluno é uma aplicação web que centraliza todos os serviços acadêmicos em uma plataforma única, oferecendo aos alunos acesso fácil às suas informações acadêmicas, financeiras e administrativas.

### 🎯 Objetivos
- Modernizar a experiência acadêmica dos alunos
- Centralizar serviços e informações
- Oferecer acesso 24/7 via web
- Reduzir processos manuais e burocráticos

## 🚀 Funcionalidades

### ✅ Implementadas
- **🔐 Autenticação Segura** - Login com matrícula e senha
- **📊 Dashboard Personalizado** - Visão geral da vida acadêmica
- **👤 Perfil Completo** - Edição de dados pessoais e acadêmicos
- **📚 Disciplinas** - Consulta de matérias matriculadas
- **💰 Financeiro** - Situação financeira e solicitação de boletos
- **📝 Solicitações** - Sistema de requerimentos online
- **🎓 Aluno Online** - Notas, frequência e histórico
- **📞 Páginas Institucionais** - Sobre, Contato, Ajuda

### 🚧 Em Desenvolvimento
- Biblioteca Virtual
- Integração com sistemas legados
- Aplicativo mobile

## 🛠 Tecnologias Utilizadas

### Backend
- **Ruby 3.2.2**
- **Rails 7.0.8**
- **PG**
- **BCrypt** - Para hash de senhas
- **ActiveRecord** - ORM

### Frontend
- **HTML5** - Estrutura semântica
- **CSS3** - Design system customizado
- **Bootstrap Icons** - Ícones
- **Poppins** - Tipografia
- **JavaScript** - Interatividade

### Arquitetura
- **MVC** - Pattern arquitetural
- **RESTful** - Design de APIs
- **Responsive Design** - Mobile-first

## 📦 Estrutura do Projeto

```
app/
├── controllers/          # Lógica da aplicação
│   ├── application_controller.rb
│   ├── sessions_controller.rb
│   ├── dashboard_controller.rb
│   ├── perfil_controller.rb
│   ├── disciplinas_controller.rb
│   ├── financeiro_controller.rb
│   └── ...
├── models/              # Modelos de dados
│   ├── aluno.rb
│   ├── professor.rb
│   ├── disciplina.rb
│   ├── turma.rb
│   ├── matricula.rb
│   └── ...
├── views/               # Templates das páginas
│   ├── layouts/         # Layouts principais
│   ├── dashboard/       # Dashboard
│   ├── perfil/          # Perfil do aluno
│   ├── disciplinas/     # Disciplinas
│   └── ...
└── assets/
    ├── stylesheets/     # CSS organizado por módulo
    └── ...
```

## 🏗 Modelos do Banco de Dados

### Principais Entidades

```ruby
# Aluno (usuário principal)
Aluno
├── matricula (string, unique)
├── nome (string)
├── email (string, unique)
├── password_digest (string)
├── cpf (string, unique)
├── data_nascimento (datetime)
├── curso (string)
├── ativo (boolean)
└── + 20 campos de perfil

# Relacionamentos Acadêmicos
Aluno → Matricula → Turma → Disciplina → Professor
```

### Schema Principal
```sql
-- Tabelas principais
alunos, professors, disciplinas, turmas, matriculas
avaliacoes, notas, frequencias, solicitacoes, financeiros
```

## ⚙️ Configuração e Instalação

### Pré-requisitos
- Ruby 3.2.2
- Rails 7.0.8
- Pg
- Node.js (para assets)

### 🛠 Passos para Instalação

1. **Clone o repositório**
```bash
git clone https://github.com/seu-usuario/portal-academico.git
cd portal-academico
```

2. **Instale as dependências**
```bash
bundle install
yarn install
```

3. **Configure o banco de dados**
```bash
# Crie o database
rails db:create

# Execute as migrations
rails db:migrate

# Popule com dados de exemplo (opcional)
rails db:seed
```

4. **Configure as variáveis de ambiente**
```bash
cp .env.example .env
# Edite .env com suas configurações
```

5. **Inicie o servidor**
```bash
rails server
# Acesse http://localhost:3000
```

### 🔧 Configuração do Banco

Edite `config/database.yml`:
```yaml
development:
  adapter: Pg
  encoding: utf8mb4
  database: portal_academico_development
  username: seu_usuario
  password: sua_senha
  host: localhost
  port: 3306
```

## 🎨 Design System

### Cores Principais
```css
--primary-color: #840ec9;    /* Roxo principal */
--dark-color: #222222;       /* Cinza escuro */
--accent-color: #9b30ff;     /* Roxo claro */
--success-color: #27ae60;    /* Verde */
--warning-color: #e67e22;    /* Laranja */
--danger-color: #c0392b;     /* Vermelho */
```

### Tipografia
- **Fonte Principal:** Poppins
- **Pesos:** 300 (light), 500 (medium), 700 (bold)
- **Hierarquia consistente em todas as páginas**

## 🔐 Sistema de Autenticação

### Implementação
```ruby
class SessionsController < ApplicationController
  def create
    aluno = Aluno.authenticate(params[:matricula], params[:password])
    if aluno
      session[:aluno_id] = aluno.id
      redirect_to root_path, notice: 'Login realizado com sucesso!'
    else
      flash.now[:alert] = 'Matrícula ou senha inválida'
      render :new
    end
  end
end
```

### Segurança
- Hash de senhas com BCrypt
- Controle de sessões
- Proteção CSRF
- Validações de entrada

## 📱 Layouts e Responsividade

### Layouts Principais
- `authenticated.html.erb` - Área logada
- `sessions.html.erb` - Login
- `sobre.html.erb` - Páginas institucionais
- Específicos por módulo (financeiro, disciplinas, etc.)

### Breakpoints Responsivos
```css
/* Mobile First */
@media (min-width: 768px) { /* Tablet */ }
@media (min-width: 1024px) { /* Desktop */ }
```

## 🧪 Testes

### Executando Testes
```bash
# Testes unitários
rails test

# Testes de sistema
rails test:system

# Testes específicos
rails test test/controllers/sessions_controller_test.rb
```

### Cobertura de Testes
- ✅ Testes de controle de acesso
- ✅ Testes de autenticação
- ✅ Testes de validação de modelos
- ✅ Testes de interface (em desenvolvimento)

## 🚀 Deploy

### Produção
```bash
# Compile os assets
rails assets:precompile

# Configure o servidor web (ex: Puma)
# Configure o banco de dados de produção
RAILS_ENV=production rails db:migrate
```

### Variáveis de Ambiente de Produção
```bash
SECRET_KEY_BASE=sua_chave_secreta
DATABASE_URL=pg://usuario:senha@host:porta/database
RAILS_ENV=production
```

## 📊 Status do Projeto

**✅ COMPLETO - PRONTO PARA PRODUÇÃO**

| Módulo | Status | Conclusão |
|--------|--------|-----------|
| Autenticação | ✅ | 100% |
| Dashboard | ✅ | 100% |
| Perfil | ✅ | 100% |
| Disciplinas | ✅ | 95% |
| Financeiro | ✅ | 90% |
| Solicitações | ✅ | 85% |
| Biblioteca | 🚧 | 70% |

## 👥 Equipe de Desenvolvimento

| Função | Responsável |
|--------|-------------|
| **Gerente / Analista de Requisitos** | Hitalo Gustavo Feitosa Bastos |
| **Desenvolvedor Back-end** | Wallisson Gomes |
| **Desenvolvedor Front-end / UX/UI** | Luís André |
| **Analista de Testes / QA** | Henrique Hemã |
| **Orientador** | Prof. Me. Aucionio Marcelo Coélho de Miranda |

## 📄 Licença

Este projeto é desenvolvido para fins acadêmicos na Unip.

## 🤝 Contribuições

Contribuições são bem-vindas! Para contribuir:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 🔄 Changelog

### v1.0.0 (Novembro 2025)
- ✅ Sistema completo de autenticação
- ✅ Módulos acadêmicos implementados
- ✅ Interface responsiva
- ✅ Banco de dados normalizado

---
