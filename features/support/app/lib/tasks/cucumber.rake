$:.unshift(RAILS_ROOT + '/vendor/plugins/cucumber/lib')
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--require ../env.rb --require ../steps.rb --format progress --language es ../../../features"
end
task :features => 'db:test:prepare'