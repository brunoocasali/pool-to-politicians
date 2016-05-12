class Medium < ActiveRecord::Base
  mount_uploader :filename, FileUploader
end
