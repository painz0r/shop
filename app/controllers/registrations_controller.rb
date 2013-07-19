class RegistrationsController < Devise::RegistrationController
  skip_before_filter :require_no_authentication, :only => [:create, :new]

  def new
    @test = test
    super
  end
end