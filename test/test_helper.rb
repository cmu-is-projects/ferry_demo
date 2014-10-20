require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'turn/autorun'
require 'contexts'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  # Add more helper methods to be used by all tests here...
  # start by including the Contexts module
  include Contexts

  def deny(condition, msg="")
    # a simple transformation to increase readability IMO
    assert !condition, msg
  end
end

# Formatting test output a litte nicer
Turn.config.format = :outline
