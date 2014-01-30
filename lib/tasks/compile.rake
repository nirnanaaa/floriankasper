require 'rake'


namespace :fk do
  
  desc "Compile assets and link dart"
  task :compile => :environment do
    dir = Rails.root.join("public", "assets")
    #main_dart = Rails.root.join("app", "assets", "main.")
    Rake::Task["assets:precompile"].invoke
    files = Dir.glob("#{dir}/main.dart*.js").sort_by{|f| File.mtime(f)}
    main= files.last
    
    Dir.glob("#{dir}/main*.dart").each do |f|
      FileUtils.cp main, "#{f}.js"
    end
    manifest = Dir.glob("#{dir}/manifest*").first
    
    json = JSON.parse(File.read(manifest))
  end
end