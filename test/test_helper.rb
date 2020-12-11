ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def new_product_with(image:)
    new_product = Product.new(
      title: 'My cool Title',
      description: 'My cool description',
      price: 55.99,
      image_url: image
    )
  end
end
