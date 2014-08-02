class MoviesController < ApplicationController
  
  def index
  	@movies = Movie.released
  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def update
  	@movie = Movie.find(params[:id])
		@movie.update(required_params)
		redirect_to movie_url 
    # without argument this redirects to movie_url[:id]??? Hidden value in html?
    # In edit.html.erb Form: action="/movies/1"
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(required_params)
    @movie.save
    redirect_to @movie
    # without argument this  redirects to movies_url??? Hidden value in html? 
    # In new.html.erb Form: action="/movies"
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url
  end

  private

  def required_params
    params.require(:movie).
      permit(:title, :description, :rating, :released_on, :total_gross, 
        :cast, :director, :duration, :image_file_name)
  end

end
