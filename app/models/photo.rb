class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :appearances
  has_many :photobooks, :through => :appearances
  belongs_to :user

end
