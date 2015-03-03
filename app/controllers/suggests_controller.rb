class SuggestsController < ApplicationController
	def index
	end

	def search
		suggest = Suggester.new(params)
		@plan = suggest.result
		render 'search'
	end

end
