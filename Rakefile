# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/manifest/task"
require "minitest/test_task"

Minitest::TestTask.create

require "rubocop/rake_task"

RuboCop::RakeTask.new

Rake::Manifest::Task.new do |t|
  t.patterns = ["lib/**/*.rb", "*.md", "COPYING.LIB"]
end

task default: [:test, :rubocop, "manifest:check"]
