class StoreController < ApplicationController
	include ActionView::Helpers::TextHelper
    include CurrentCart
    before_action :set_cart
before_action :increment_counter, only: [:index]

    def index
        @products = Product.order(:title)
    end

    private
        def increment_counter
            if session[:counter].nil?
                session[:counter] = 0
            end
            session[:counter] += 1
            @counter = session[:counter]
            @counter_message = "You have visited this page #{pluralize(@counter, "time")}" if @counter > 65
        end  
end