require("minitest/autorun")
require_relative("../artist")

class TestArtist < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Salvador Dali",
      "style" => "Surrealism", "image" => "/images/Dali.jpeg"}

    @artist = Artist.new(options)
  end

  def test_artist_has_a_name
    result = @artist.name()
    assert_equal("Salvador Dali", result)
  end

  def test_artist_has_style
    result = @artist.style()
    assert_equal("Surrealism", result)
  end

  def test_artist_has_an_image
    result = @artist.image()
    assert_equal("/images/Dali.jpeg", result)
  end

end
