class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb "Dashboard", :root_path
  
end
