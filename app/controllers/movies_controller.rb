class MoviesController < ApplicationController
  
  def index
  	@movies = Movie.all
  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def update
  	@movie = Movie.find(params[:id])
  	
		@movie.update(params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross))
		redirect_to movie_url
  end

end
