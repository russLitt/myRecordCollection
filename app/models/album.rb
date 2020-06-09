class Album < ApplicationRecord
    validates :artist, presence: true,
                      length: {minimum: 1}
end
