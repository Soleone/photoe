require File.dirname(__FILE__) + '/../test_helper'

class PhotobooksControllerTest < ActionController::TestCase
  context "index" do
    setup { get :index }

    should_render_with_layout 'application'
    should_render_template :index
  end
  
  context "new" do
    setup { get :new }
    
    should_render_template :new
  end
  
end
