class RegistrationWhitelistsController < ApplicationController
  before_action :authorize_admin
  before_action :set_registration_whitelist, only: :destroy

  def index
    @registration_whitelists = RegistrationWhitelist.all
  end

  def new
    @registration_whitelist = RegistrationWhitelist.new
  end

  def create
    @registration_whitelist = RegistrationWhitelist.new(registration_whitelist_params)

    if @registration_whitelist.save
      flash.notice = 'Updated allowed users list.'
      redirect_to action: :index
    else
      render action: 'new'
    end
  end

  def destroy
    @registration_whitelist.destroy
    redirect_to registration_whitelists_url, notice: 'Updated allowed users list.'
  end

  private
    def set_registration_whitelist
      @registration_whitelist = RegistrationWhitelist.find(params[:id])
    end

    def registration_whitelist_params
      params.require(:registration_whitelist).permit(:email)
    end
end
