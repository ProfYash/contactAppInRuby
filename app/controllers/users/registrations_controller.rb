# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_admin_user!, only: [:new, :create, :allUsers]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :require_no_authentication, except: [:new, :create, :allUsers]

  def allUsers
    @users = User.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :is_admin, :full_name])
  end

  def new
    super
  end

  def create
    if current_user.is_admin
      puts "?????????????????????if??????????"
      super
    else
      redirect_to root_path, notice: "Only admins can create new users."
    end
  end

  private

  def authenticate_admin_user!
    if !current_user.is_admin?
      redirect_to root_path
    end
  end
end
