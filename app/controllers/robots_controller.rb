class RobotsController < ApplicationController
  def index
    render 'index.text.erb',layout: false
  end
end
