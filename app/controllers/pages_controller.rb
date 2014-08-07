class PagesController < ApplicationController
  def index
    @pages = Page.all(folder: 'articles')
    @pages.sort!{ |b,a| a.date <=> b.date}
    respond_to do |format|
      format.html{}
      format.json do
        render json: @pages.map{ |p| {title: p.title,date: p.date.to_i * 1000, text: p.html_data}}
      end
    end
  end

  def show
    @page = Page.find(params[:id], Page.wiki.ref, true, false)
    if @page
      @meta[:description] = @page.description if @page.description
      @meta[:keywords] = @page.keywords if @page.keywords
    else
      render_404
    end
  end

  private
  def render_404
    raise ActionController::RoutingError.new('No such Article found')
  end
end
