require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << ["test", "lib"]
  t.pattern = "test/**/*_test.rb"

end

require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require_relative "config/initialize-database"
  end
end


