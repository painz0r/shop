class User < ActiveRecord::Base
  after_create :registration_confirmation
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def registration_confirmation
    Notifier.registration_confirmation(self).deliver
  end
end
