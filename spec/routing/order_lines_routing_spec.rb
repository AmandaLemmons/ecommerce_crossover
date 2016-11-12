require 'rails_helper'

RSpec.describe OrdersController, type: :routing do
  it { expect(get:    "/order_lines/new").to   route_to("orders#new") }
  it { expect(post:   "/order_lines").to   route_to("orders#create") }
  it { expect(put:    "/order_lines/1").to route_to("orders#update", id: "1") }
  it { expect(delete: "/order_lines/1").to route_to("orders#destroy", id: "1") }

end
