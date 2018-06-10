require("minitest/autorun")
require_relative("../artist")

class TestArtist < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Salvador Dali",
      "style" => "Surrealism"}

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

end
