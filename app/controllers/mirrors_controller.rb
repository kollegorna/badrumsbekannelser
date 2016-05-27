class MirrorsController < ApplicationController
  before_action :set_mirror

  layout 'mirror'

  def show
    @confession = @mirror.confessions.order(created_at: :desc).first
  end

  private

  def set_mirror
    @mirror = Mirror.find(mirror_params[:id])
  end

  def mirror_params
    params.permit(:id)
  end
end
