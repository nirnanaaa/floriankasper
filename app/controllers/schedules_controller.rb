class SchedulesController < ApplicationController
  def index
    
    @pages = Page.all(folder: 'schedules')
    @pages.sort!{ |a,b| a.date <=> b.date}
    @pages.reject!{ |p| p.date < Time.zone.now }
    
    respond_to do |format|
      format.json do
        render json: @pages.map{ |p| {title: p.title,date: p.date.to_i * 1000, text: p.html_data}}
       end
      format.html { render :index}
    end
  end
end
