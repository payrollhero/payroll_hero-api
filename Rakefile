require 'bundler/gem_tasks'
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

Rake::Task['release:rubygem_push'].clear
Rake::Task['release:rubygem_push'].enhance do
  gemspec_file = Dir['*.gemspec'].first
  specification = eval(File.read(gemspec_file), binding, gemspec_file)
  filename = "pkg/#{specification.name}-#{specification.version}.gem"
  system("fury push #{filename.inspect} --as=payrollhero")
end

desc "Updates the changelog"
task :changelog do
  sh "github_changelog_generator payrollhero/payroll_hero-api --simple-list"
end
