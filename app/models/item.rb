class Item < ActiveRecord::Base
  validates :title, :description, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :title, :length => {:minimum  => 5,
                                :message => "should be at least 5 characters long"}

  has_many :line_items
  has_many :carts
  has_many :orders, :through => :line_items
  has_many :categories

  before_destroy :ensure_not_referenced_by_any_line_item

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Line Items present' )
      return false
    end
  end
end
