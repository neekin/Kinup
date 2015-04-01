# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick #使用minimagick处理压缩图片，确保安装magickimage这个东东，ubuntu可以sudo apt-get install magickimage

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir #定义上传默认文件夹
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  #定义临时文件夹
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:

  # Process files as they are uploaded:
  #  process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [60, 60]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  #图片的处理，有不同版本大小，网站可以在不同的地方调用不同的图片大小
  version :normal do
    process :resize_to_fit =>[60,60]
  end
  version :small do
    process :resize_to_fit =>[30,30]
  end
  #
  # version :large do
  #   process :resize_to_fill => [120,120]
  # end
  version :big do
    process :resize_to_fit => [120, 120]
  end

  #指定上传格式
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
