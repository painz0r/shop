class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  belongs_to :cart

  def total_price
    item.price * quantity
  end

  def item_quantity
    self.quantity
  end

  def item_price
    item.price
  end

end
