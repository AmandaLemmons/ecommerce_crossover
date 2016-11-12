class Order < ActiveRecord::Base
  has_many :order_lines
  before_save :update_total
  before_create :set_order_number

  scope :in_cart, -> {where('order_no =?', '1')}
  scope :processed_order, -> {where('order_no =?', '2')}




  def subtotal
    order_lines.collect { |order_line| order_line.valid? ? (order_line.qty * order_line.unit_price) : 0}.sum
  end

  private

  def set_order_number
    self.order_no = 1
  end

  def update_total
    self[:total] = total
  end
end
