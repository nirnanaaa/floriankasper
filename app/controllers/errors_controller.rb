class ErrorsController < ApplicationController
  def show
    @exception = env["action_dispatch.exception"]
    respond_to do |format|
      format.html{ render action: params[:status]}
    end
  end

end
