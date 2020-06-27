require 'rails_helper'

RSpec.describe Album, type: :model do
    subject { Album.new(artist: "Tool", album_title: "Undertow", year_released: 1993) }

    before { subject.save }

    it 'artist should be present' do
      if subject.artist = nil
        expect{subject}.to_not be_valid
      end
    end

    it 'album title should be present' do
      if subject.album_title = nil
        expect{subject}.to_not be_valid
      end
    end

    it 'year released should be present' do
      if subject.year_released = nil
        expect{subject}.to_not be_valid
      end
    end

    it 'year released should be a four digit number' do
      if subject.year_released = 199
        expect(subject).to_not be_valid
      end
    end

    it 'year released should be a four digit number' do
      if subject.year_released = 19993
        expect(subject).to_not be_valid
      end
    end
end
