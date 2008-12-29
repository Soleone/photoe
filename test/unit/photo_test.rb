require File.dirname(__FILE__) + '/../test_helper'

class PhotoTest < ActiveSupport::TestCase
  should_belong_to :user
  should_have_many :photobooks, :through => :appearances
end
