class Image < ActiveRecord::Base
  has_attached_file :input

  paginates_per 30

  validates :input_file_name, presence: true
  validates :input_content_type, presence: true
  validates :input_file_size, presence: true
  validates :random_hash, presence: true

  scope :is_public_ok, ->{ where(public_flg:true) }
  scope :have_output, ->{ where('output_data is not null') }

  validates_attachment_size :input, :less_than => 10.megabytes
  validates_attachment_content_type :input, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
end
