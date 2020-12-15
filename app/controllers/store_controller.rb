class StoreController < ApplicationController
  include IndexCounter

  before_action :increment_counter, only: [:index]
  before_action :set_counter, only: [:index]

  def index
    @products = Product.order :title
  end
end
