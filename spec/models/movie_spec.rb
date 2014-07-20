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
end