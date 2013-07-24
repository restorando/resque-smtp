require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/mock'

require 'resque'
require 'resque_unit'

require 'resque/smtp'

MiniTest::Unit::TestCase.send :include, ResqueUnit::Assertions
