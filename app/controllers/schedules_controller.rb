class SchedulesController < ApplicationController
  def index
    
    @pages = Page.all(folder: 'schedules')
    @pages.sort!{ |a,b| a.date <=> b.date}
    @pages.reject!{ |p| p.date < Time.zone.now }
  end
end
