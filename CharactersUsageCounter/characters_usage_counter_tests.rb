require_relative "characters_usage_counter"
require_relative "file_handler"
require "test/unit"

RESULTS_OF_THE_LAST_THREE_TESTS = {"!"=>1,"a"=>3,"b"=>1,"c"=>1,"d"=>1,"e"=>2,"f"=>1,"g"=>1,"h"=>1,"i"=>3,"l"=>2,"n"=>1,"o"=>1,"s"=>3,"t"=>3}

class TestCharactersUsageCounter < Test::Unit::TestCase
  def test_generate_characters_usage_report
    hash_with_count = {"%"=>6, "m"=>1, "8"=>3, "ї"=>1}

    actual_result   = generate_characters_usage_report(hash_with_count)
    expected_result = "Char '%' occurs 6 times\nChar 'm' occurs only 1 time\nChar '8' occurs 3 times\nChar 'ї' occurs only 1 time\n"

    assert_equal(expected_result, actual_result)
  end
  
  def test_calculation_if_file_contains_special_characters
    text = "%%%%%%*8889"

    actual_result = count_the_usage_of_each_character(text)
    expected_result = {"%"=>6, "*"=>1, "8"=>3, "9"=>1}

    assert_equal(expected_result, actual_result)
  end

  def test_calculation_if_file_contains_whitespaces
    text = "it is a long established fact!"

    actual_result = count_the_usage_of_each_character(text)
    expected_result = RESULTS_OF_THE_LAST_THREE_TESTS

    assert_equal(expected_result, actual_result)
  end

  def test_calculation_if_file_contains_uppercase
    text = "It is A long Established Fact!"

    actual_result = count_the_usage_of_each_character(text)
    expected_result = RESULTS_OF_THE_LAST_THREE_TESTS

    assert_equal(expected_result, actual_result)
  end

  def test_calculation_if_file_contains_multiple_lines
    text = "It is\n A long\n established fact!\n"

    actual_result = count_the_usage_of_each_character(text)
    expected_result = RESULTS_OF_THE_LAST_THREE_TESTS

    assert_equal(expected_result, actual_result)
  end
end
