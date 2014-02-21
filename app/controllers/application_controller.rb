class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :initialize_empty_meta


  private

  def initialize_empty_meta
    @meta ||= {}
  end
end
