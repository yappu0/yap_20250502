class Admins::SessionsController < Devise::SessionsController
  layout 'admins'

  private

  def after_sign_in_path_for(_resource)
    admins_root_path
  end

  def after_sign_out_path_for(_resource)
    new_administrator_session_path
  end
end
