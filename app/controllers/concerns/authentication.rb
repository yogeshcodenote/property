module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :set_current_user
  end

  private

  def set_current_user
    @current_user = current_user
  end

  def admin_required!
    unless current_user&.admin_user?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

  def buyer_required!
    unless current_user&.buyer_user?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
