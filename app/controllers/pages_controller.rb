class PagesController < ApplicationController
  def home
    @cells = Cell.order("RANDOM()")
  end

  def all_confessions
    @confessions = Confession.published.order(created_at: :desc)
  end
end
