require 'rails_helper'

RSpec.describe OrdersController, type: :routing do
  it { expect(get:    "/orders").to   route_to("orders#index") }
  it { expect(get:    "/orders/1").to route_to("orders#show", id: "1") }
  it { expect(post:   "/orders").to   route_to("orders#create") }
  it { expect(put:    "/orders/1").to route_to("orders#update", id: "1") }
  it { expect(delete: "/orders/1").to route_to("orders#destroy", id: "1") }

end
