# encoding: utf-8

require 'rubygems'
require 'rake/testtask'

task :default => :spec

Rake::TestTask.new(:spec) do |t|
  t.test_files = FileList['spec/*_spec.rb']
  t.ruby_opts << '-w -I.'
end

task :kicker do
  exec 'kicker -l 2 -r ruby -e "clear && rake" spec lib'
end
