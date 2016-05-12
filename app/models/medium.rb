class Medium < ActiveRecord::Base
  mount_uploader :filename, FileUploader

  def to_s
    File.basename(filename.path)
  end
end
