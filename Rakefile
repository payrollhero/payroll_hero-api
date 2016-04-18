require 'bundler/gem_tasks'
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

desc "Updates the changelog"
task :changelog do
  sh "github_changelog_generator payrollhero/payroll_hero-api --simple-list"
end
