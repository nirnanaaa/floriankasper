class ErrorsController < ApplicationController
  def show
    @exception = env["action_dispatch.exception"]
    Airbrake.notify_or_ignore(
      @exception,
      :parameters => params,
      :cgi_data => ENV.to_hash
    )
    respond_to do |format|
      format.html{ render action: params[:status]}
    end
  end

end
