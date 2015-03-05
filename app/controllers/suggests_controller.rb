class SuggestsController < ApplicationController
	def index
	end

	def search
		suggest = Suggester.new(params)
		@plan, i = [], 0
		while @plan.count == 0
			@plan = suggest.result
			i += 1
			break if i == 10
		end

		if @plan.empty?
			render 'no_place'
		else
			render 'search'
		end
	end

end
