# Gollum file
class Page < GollumRails::Page
  
  
  def has_yaml?
    !!get_content_yaml
  end
  
  def meta
    raw_data.match(/^(?<headers>---\s*\n.*?\n?)^(---\s*$\n?)/m).to_s
  end
  def meta_yaml
    @meta ||= YAML.load(meta)
  end
  
  def title
    meta_yaml["title"] || super
  end
  
  def date
    meta_yaml["date"] || Time.at(0)
  end
    
  def html_data
    gollum_page.markup_class.render(raw_data.tap{|s| s.slice!(meta.to_s)})
  end
  
  # callbacks:
  #
  #  after_save :after_save
  #
  #  def after_save
  #
  #  end

  
end
