class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validate :product_present
  validate :order_present
  before_save :finalize

  def get_unit_price
    self.unit_price = Product.find(self.product_id).price
  end


  def finalize
    self.total_price = quantity * self.unit_price
  end

  private
    def product_present
      if product.nil?
        errors.add(:product, "Has to be greater than 0")
      end
    end

    def order_present
      if order.nil?
        errors.add(:order, "Has to be greater than 0")
      end
    end

end
