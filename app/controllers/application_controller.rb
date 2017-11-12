class ApplicationController < ActionController::API
  def request_from_telegram
    params[:from_telegram].present?
  end
end
