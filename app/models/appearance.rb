class Appearance < ActiveRecord::Base
  belongs_to :photo
  belongs_to :photobook
end
