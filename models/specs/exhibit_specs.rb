require("minitest/autorun")
require_relative("../exhibit")

class TestExhibit < MiniTest::Test

  def setup
    options = {"id" => 1, "title" => "The persistent of memory",
      "date" => 1931, "artist_id" => 1}

      @exhibit = Exhibit.new(options)
  end

    def test_exhibit_has_a_title
      result = @exhibit.title()
      assert_equal("The persistent of memory", result)
    end


end
