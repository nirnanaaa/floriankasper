require 'rake'


namespace :fk do
  
  desc "Compile assets and link dart"
  task :compile => :environment do
    dir = Rails.root.join("public", "assets")
    assets = Rails.root.join("app", "assets", "javascripts")
    Rake::Task["assets:precompile"].invoke
    Dir.glob(assets+"main.*").each do |e|
      FileUtils.cp e, dir.join(File.split(e).last)
    end

  end
end