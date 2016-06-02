class MirrorsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  layout 'mirror'

  def show
    @mirror = Mirror.find(params[:id])
    @confession = @mirror.confessions.order(created_at: :desc).first
  end

  def update
    mirror = current_user.family.mirrors.find(params[:id])

    mirror.update_attributes(mirror_params)

    redirect_to confessions_url
  end

  private

  def mirror_params
    params.fetch(:mirror, {}).permit(:on)
  end
end
