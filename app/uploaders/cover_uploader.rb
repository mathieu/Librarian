# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process :resize_to_fit => [800, 800]

  # Create medium version
  version :medium do
    process :resize_to_fit => [400, 400]
  end

  # Create small version
  version :small do
    process :resize_to_fit => [150, 150]
  end

  # Create mini
  version :mini do
    process :resize_to_fit => [50, 50]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end