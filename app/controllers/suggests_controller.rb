class SuggestsController < ApplicationController
	def index
	end

	def search
		suggest = Suggester.new(params)
		@plan = suggest.result
		@plan = suggest.result if @plan.empty? #reduce the probabilities to have empty page
		if @plan.empty?
			render 'no_place'
		else
			render 'search'
		end
	end

end
