# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      @user.password = pass
      @user.password_confirmation = pass
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass

    end

    session['devise.regist_data'] = { user: @user.attributes }
    session['devise.regist_data'][:user]['password'] = params[:user][:password]
    @symptom = @user.build_symptom

    render :new and return unless @user.valid?

    render :new_symptom
    # super
  end

  def create_symptom
    @user = User.new(session['devise.regist_data']['user'])
    @symptom = Symptom.new(symptom_params)
    if @symptom.valid?
      @user.build_symptom(@symptom.attributes)
      @user.save
      session['devise.regist_data']['user'].clear
      sign_in(:user, @user)
      redirect_to root_path
    else
      render :new_symptom
    end
  end

  protected

  def symptom_params
    params.require(:symptom).permit(:cc, :from_when, :where, :situation, :ph, :allergies, :medicine)
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
