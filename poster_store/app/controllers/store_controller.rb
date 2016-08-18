#Team No:11
#Date of submission: 6/6/2014
class StoreController < ApplicationController
  def index
  # orders the posters by title
  @posters = Poster.order(:title)
  end
  
end
