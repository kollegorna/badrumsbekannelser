class ConfessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_confession, only: [:edit, :update, :destroy]

  def index
    @confessions = Confession.all
  end

  def new
    @confession = Confession.new
  end

  def edit
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
    if @confession.update(confession_params)
      redirect_to confessions_url, notice: 'Confession was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @confession.destroy

    redirect_to confessions_url, notice: 'Confession was successfully destroyed.'
  end

  private

  def set_confession
    @confession = Confession.find(params[:id])
  end

  def confession_params
    params.fetch(:confession, {}).permit(:body)
  end
end
