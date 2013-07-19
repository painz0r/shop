class SessionsController < Devise::RegistrationController
  skip_before_filter :require_no_authentication, :only => [:create, :new, :cancel]

  def new
    super
  end
end