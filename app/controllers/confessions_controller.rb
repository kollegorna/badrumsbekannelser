class ConfessionsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @confessions = current_user.confessions.order(created_at: :desc)
    @mirrors = current_user.family.mirrors
  end

  def new
    @confession = current_user.confessions.new
  end

  def show
    @confession = Confession.find(params[:id])
  end

  def edit
    @confession = current_user.confessions.find(params[:id])
  end

  def create
    @confession = current_user.confessions.new(confession_params)

    if @confession.save
      redirect_to confessions_url, notice: 'Confession was successfully created.'
    else
      render :new
    end
  end

  def update
    @confession = current_user.confessions.find(params[:id])

    if @confession.update_attributes(confession_params)
      redirect_to confessions_url, notice: 'Confession was successfully updated.'
    else
      render :update
    end
  end

  def destroy
    confession = current_user.confessions.find(params[:id])

    confession.destroy

    redirect_to confessions_path
  end

  private

  def confession_params
    params.fetch(:confession, {}).permit(:body)
  end
end
