class RobotsController < ApplicationController
  def index
    render 'index.text.erb',layout: false
  end
  def sitemap
    @pages = Page.all(folder: 'articles')
    render 'sitemap.xml.erb', layout: false
  end
end
