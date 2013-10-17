class Image < ActiveRecord::Base
  has_attached_file :input

#  validates_attachment_size :input, :less_than => 1.megabytes
#  validates_attachment_content_type :input, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
end
