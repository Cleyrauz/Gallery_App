require("minitest/autorun")
require_relative("../exhibit")

class TestExhibit < MiniTest::Test

  def setup
    options = {"id" => 1, "title" => "The persistent of memory",
      "date" => 1931, "artist_id" => 1, "category" => "Surrealism", "image" => "/images/the_persistence_of_memory.jpeg"}

      @exhibit = Exhibit.new(options)
  end

    def test_exhibit_has_a_title
      result = @exhibit.title()
      assert_equal("The persistent of memory", result)
    end

    def test_exhibit_has_a_date
      result = @exhibit.date()
      assert_equal(1931, result)
    end

    def test_exhibit_has_a_category
      result = @exhibit.category()
      assert_equal("Surrealism", result)
    end

    def test_exhibit_has_an_image
      result = @exhibit.image()
      assert_equal("/images/the_persistence_of_memory.jpeg", result)
    end

end
