class PagesController < ApplicationController
  def home
    @cells = Cell.order(position: :asc)
  end

  def all_confessions
    @confessions = Confession.all.order(created_at: :desc)
  end
end
