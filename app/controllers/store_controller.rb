class StoreController < ApplicationController
  include IndexCounter
  include CurrentCart

  before_action :increment_counter, only: [:index]
  before_action :set_counter, only: [:index]
  before_action :set_cart, only: [:index]

  def index
    @products = Product.order :title
  end
end
