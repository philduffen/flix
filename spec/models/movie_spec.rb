require 'spec_helper'

describe "A movie" do
	it "is a flop if total gross less than £50M" do
		movie = Movie.new(total_gross: 40000000.00)

		expect(movie.flop?).to be_true
	end

	it "is a hit if total gross exceeds £50M" do
		movie = Movie.new(total_gross: 60000000.00)

		expect(movie.flop?).to be_false
	end

	it "is released when the released on date is in the past" do
  	movie = Movie.create(movie_attributes(released_on: 3.months.ago))
 
  	expect(Movie.released).to include(movie)
	end

	it "is has not been released yet when the released date is in the future" do
		movie = Movie.create(movie_attributes(released_on: 3.months.from_now))

		expect(Movie.released).not_to include(movie)
	end


end