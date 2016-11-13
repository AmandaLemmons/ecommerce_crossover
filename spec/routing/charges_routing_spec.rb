require 'rails_helper'

RSpec.describe ChargesController, type: :routing do
  it { expect(get:    "/new-charge/:order_id/:customer_id").to   route_to("orders#new", order_id: "1", customer_id: "2") }
  it { expect(post:   "/new-charge/:order_id/:customer_id").to   route_to("orders#create", order_id: "1", customer_id: "2") }


end
