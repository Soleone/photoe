require File.dirname(__FILE__) + "/../spec_helper"

describe Photo do
  context "when created" do
    before do
      @photo = Photo.new
    end
    
    it "should have a title with the default of nil" do
      @photo.title.should be_nil
    end

    it "should have a description with the default of nil" do
      @photo.description.should be_nil
    end

  
    it "should have an image as a paperclip model" do
      @photo.image.should be_instance_of(Paperclip::Attachment)
    end
  
    it do
      @photo.should have(0).photobooks
    end
  
    it do
      @photo.should have(0).appearances
    end
  end
end