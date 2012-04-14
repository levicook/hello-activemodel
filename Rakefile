require './boot'

task :test do
  Bundler.require(:test)
  Cutest.run(Dir["test/*.rb"])
end

task :default => :test
