module ApplicationHelper
  def dart_include_tag
    content_tag(:script, nil, :src => asset_path("main.dart"), :type => 'application/dart') +
    content_tag(:script, nil, src: asset_path("runtime.dart"), type: 'text/javascript')
  end
end
