class Item < ActiveRecord::Base
  validates :title, :description, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :title, :length => {:minimum  => 10,
                                :message => "should be at least 10 characters long"}

end
