# Gollum file
class Page < GollumRails::Page
  alias_method :title, :meta_title

  def date
    meta["date"] || Time.at(0)
  end

  def keywords
    meta["keywords"] || nil
  end

  def description
    meta["description"] || nil
  end
  alias_method :html_data, :html_without_yaml 
end
