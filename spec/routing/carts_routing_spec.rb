require 'rails_helper'

RSpec.describe CartsController, type: :routing do
  it { expect(get:    "/cart").to route_to("carts#show") }

end
