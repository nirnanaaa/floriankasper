class SchedulesController < ApplicationController
  def index

    date = DateTime.current
    @cur_month = Date::MONTHNAMES[date.month]
    @cur_year = date.year

    @pages = Page.tree(folder: "schedule/#{date.year}/#{@cur_month}")

    @pages.map!{|p| Page.find(File.join(File.dirname(p.path),File.basename(p.path,File.extname(p.path))))}
    @pages.sort!{ |a,b| a.start <=> b.start}
    @pages.reject!{ |p| p.end < Time.zone.now }

    respond_to do |format|
      format.json do
        render json: @pages.map{ |p| {title: p.title,start: p.start.to_i * 1000, text: p.html_data}}
       end
      format.html { render :index}
    end
  end
end
