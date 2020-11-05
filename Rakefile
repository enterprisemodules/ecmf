require 'rubygems'
require 'pathname'

def optional_require(file)
  begin
    require "#{file}"
  rescue LoadError
    puts "#{file} not loaded."
  end
end

import '../easy_type/lib/tasks/docs.rake' if File.exists?('../easy_type/lib/tasks/docs.rake')
optional_require 'puppet-lint/tasks/puppet-lint'
optional_require 'puppet-syntax/tasks/puppet-syntax'
optional_require 'puppetlabs_spec_helper/rake_tasks'
optional_require 'puppet_blacksmith/rake_tasks'
optional_require 'puppet_litmus'
optional_require 'puppet_litmus/rake_tasks'
optional_require 'bolt_spec/run'
optional_require 'em_tasks/rake_tasks'

if defined?(RSpec)
  desc "Run the tests"
  RSpec::Core::RakeTask.new(:test) do |t|
    t.rspec_opts = ['--color', '-f d']
    t.pattern = 'spec/*/*_spec.rb'
  end
end

@module_name = 'ecmf'

desc "Run Litmus setup"
task :litmus do
  docker_image =  'enterprisemodules/acc_base'
  node_name = 'ecmf.example.com'
  Rake::Task['litmus:litmus_setup'].invoke(docker_image, node_name)
end

if defined?(PuppetLint)
  PuppetLint.configuration.send("disable_140chars")
  exclude_paths = [
    "pkg/**/*",
    "vendor/**/*",
    "spec/**/*",
  ]
  PuppetLint.configuration.ignore_paths = exclude_paths
end

if defined?(PuppetSyntax)
  PuppetSyntax.exclude_paths = exclude_paths
end

desc "Run syntax, lint, and spec tests."
task :default => [
	:spec_prep,
	:syntax,
	:test,
	:lint,
	:spec_clean
]

begin
  require 'rubocop/rake_task'
  desc 'Run RuboCop on the lib directory'
  Rubocop::RakeTask.new(:rubocop) do |task|
    task.patterns = ['lib/**/*.rb']
    task.fail_on_error = true
  end
rescue LoadError, NameError
end
