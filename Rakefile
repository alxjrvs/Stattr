# encoding: utf-8

require 'rubygems'
require 'rake/testtask'
require 'bundler'
Bundler::GemHelper.install_tasks

Rake::TestTask.new(:spec) do |t|
  t.test_files = FileList['spec/*_spec.rb']
  t.ruby_opts << '-w -I.'
end

task :kicker do
  exec 'kicker -l 2 -r ruby -e "clear && rake" spec lib'
end
