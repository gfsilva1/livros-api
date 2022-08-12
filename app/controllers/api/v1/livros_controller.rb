class Api::V1::LivrosController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_livro, only: [ :show, :update, :destroy ]

  def index
    @livros = policy_scope(Livro)
  end

  def show
  end

  def update
    if @autor.update(livro_params)
      render :show
    else
      render_error
    end
  end

  def create
    @livro = Livro.new(livro_params)
    @livro.user = current_user
    authorize @livro
    if @livro.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @livro.destroy
    head :no_content
  end


  private

  def set_livro
    @livro = Livro.find(params[:id])
    authorize @livro   # For Pundit
  end

  def autor_params
    params.require(:livro).permit(:nome, :genero_predominante, :idade, :etc)
  end

  def render_error
    render json: { errors: @autor.errors.full_messages },
      status: :unprocessable_entity
  end
end
