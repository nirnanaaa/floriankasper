class ErrorsController < ApplicationController
  def show
    @exception = env["action_dispatch.exception"]
    respond_to do |format|
      format.html{ render '404'}
    end
  end

end
