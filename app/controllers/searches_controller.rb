class SearchesController < ApplicationController
  before_action :authenticate_user!

  # def search
  #   @range = params[:range]
  #   word = params[:word]
  
  #   if @range == "User"
  #     @users = User.looks(word) 
  #     @blogs = Array.new
  #     # Userモデルの検索
  #   else 
  #     @blogs = Blog.looks(word)
  #     @users = Array.new
  #     # Blogモデルの検索
  #   end

  #   render 'searches/search_result'
  # end

  def search
  word = params[:word]

  @users = User.looks(word)
  @blogs = Blog.looks(word)

  render 'searches/search_result'
  end

end
