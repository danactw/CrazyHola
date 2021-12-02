class PagesController < ApplicationController
  def index
    render html: params
  end

  def about
  end
end