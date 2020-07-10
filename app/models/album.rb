class Album < ApplicationRecord
    belongs_to :user
    has_one_attached :album_image
    # after_create :set_filename
    
    validates :artist, presence: true,
                length: {minimum: 1}
    validates :album_title, presence: true,
                length: {minimum: 1}
    validates :year_released, 
                length: {minimum: 4, maximum: 4}

  #   def set_filename
  #     if self.active_storage_object.attached?
  #       self.active_storage_object.blob.update(filename: "desired_filename.#{self.active_storage_object.filename.extension}")
  #   end
  # end
end
