require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "album should not save without artist" do
  album = Album.new
    assert !album.save, "saved album without an artist"
end

end
