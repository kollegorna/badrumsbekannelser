class PagesController < ApplicationController
  def home
    @cells = Cell.order(position: :asc)
  end
end
