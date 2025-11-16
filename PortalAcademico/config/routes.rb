Rails.application.routes.draw do
  get 'financeiro', to: "financeiro#index"
  get 'aluno_online', to: "aluno_online#index"
  get 'disciplinas', to: "disciplinas#index"
  
  #Area de Login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #Solicitações
  get 'solicitacoes', to: 'solicitacoes#index'
  
  # Paginas Estaticas
  get 'sobre', to: 'staticpages#sobre'
  get 'contato', to: 'staticpages#contato'
  get 'ajuda-login', to: 'staticpages#ajudalogin'
  
  #Perfil do aluno
  get 'perfil', to: "perfil#index"
  
  #ambiente virtual
  get 'ambiente_virtual', to: "ambiente_virtual#index"
  
  # root "posts#index"
  root "dashboard#index"
end
