class DisciplinasController < ApplicationController
  layout 'disciplinas'
  before_action :require_login
  def index
  end
end
