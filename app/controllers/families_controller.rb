class FamiliesController < ApplicationController
  before_action :set_family

  layout 'mirror'

  def mirror
    @confessions = @family.confessions.order(created_at: :desc)
  end

  private

  def set_family
    @family = Family.find(params[:id])
  end

  def confession_params
    params.permit(:id)
  end
end
