class HomeController < ApplicationController
  def index
    @title = "デイトラ"
    @article = Article.first
  end

  def about
  end
end
