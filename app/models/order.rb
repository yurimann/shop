class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items

  before_save :update_subtotal

  def subtotal
    order_items.collect { |x| x.valid? ? (x.quantity * x.unit_price) : 0}.sum
  end

  def set_order_status
    self.order_status_id = 1
  end

  def summarize
    if self.delivery.nil?
      self.delivery = 0
    end
    if self.tax.nil?
      self.tax = 0
    end
    self.total = self.tax + self.delivery + self.subtotal
  end

  private


    def update_subtotal
      self[:subtotal] = subtotal
    end

end
