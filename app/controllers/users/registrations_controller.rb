module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      if registration_allowed?
        super
      else
        build_resource
        flash[:error] = I18n.t('registration.not_allowed')
        redirect_to action: :new
      end
    end

    private

    def registration_allowed?
      RegistrationWhitelist.allowed?(params[:user][:email])
    end
  end
end
