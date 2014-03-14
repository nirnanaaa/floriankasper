class ApplicationController < ActionController::Base
   
  session :off 
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :initialize_empty_meta


  private

  def initialize_empty_meta
    @meta ||= {}
  end
end
