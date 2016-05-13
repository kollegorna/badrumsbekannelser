class PagesController < ApplicationController
  def home
  end

  def dev_confessions
    render layout: "confessions"
  end
end
