# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  process :resize_to_fit => [800, 800]

  version :thumbnail do
    process :resize_to_fill => [50, 50]
  end

  version :mini do
    process :resize_to_fit => [30, 30]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def url(options = {})
    picture_url = super(options)
    if picture_url && picture_url.present? && self.file.exists?
      picture_url
    else
      'default_avatar.png'
    end
  end

end
