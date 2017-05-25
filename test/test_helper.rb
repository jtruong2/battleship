require 'simplecov'            # These two lines must go first
SimpleCov.start

require 'minitest/autorun'    # Sets up minitest
                               # You could require other shared gems here, too
require_relative 'player'
require_relative 'computer'
require_relative 'test_helper'
