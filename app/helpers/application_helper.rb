module ApplicationHelper
  def dart_include_tag
    javascript_include_tag "main.dart", type: 'application/dart'
  end
end
