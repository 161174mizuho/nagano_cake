class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Admin
    admin_genres_path
    when public
    customer_path
    end
  end
end
