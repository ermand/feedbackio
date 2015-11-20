class Profile < ActiveRecord::Base

  mount_uploader :picture, PictureUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
