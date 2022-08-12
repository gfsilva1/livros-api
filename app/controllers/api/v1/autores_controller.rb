class Api::V1::AutoresController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_autor, only: [ :show, :update, :destroy ]

  def index
    @autores = policy_scope(Autor)
  end

  def show
  end

  def update
    if @autor.update(autor_params)
      render :show
    else
      render_error
    end
  end

  def create
    @autor = Autor.new(autor_params)
    @autor.user = current_user
    authorize @autor
    if @autor.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @autor.destroy
    head :no_content
  end


  private

  def set_autor
    @autor = Autor.find(params[:id])
    authorize @autor  # For Pundit
  end

  def autor_params
    params.require(:autor).permit(:nome, :genero_predominante, :idade, :etc)
  end

  def render_error
    render json: { errors: @autor.errors.full_messages },
      status: :unprocessable_entity
  end
end
