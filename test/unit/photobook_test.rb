require File.dirname(__FILE__) + '/../test_helper'

class PhotobookTest < ActiveSupport::TestCase
  should_have_many :photos, :through => :appearances
end
