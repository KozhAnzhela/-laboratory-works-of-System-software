require_relative "character_usage_count"
require "test/unit"

RESULTS_OF_THE_LAST_THREE_TESTS = "Char 'i' occurs 3 times
Char 't' occurs 3 times
Char 's' occurs 3 times
Char 'a' occurs 3 times
Char 'l' occurs 2 times
Char 'o' occurs only 1 time
Char 'n' occurs only 1 time
Char 'g' occurs only 1 time
Char 'e' occurs 2 times
Char 'b' occurs only 1 time
Char 'h' occurs only 1 time
Char 'd' occurs only 1 time
Char 'f' occurs only 1 time
Char 'c' occurs only 1 time
Char '!' occurs only 1 time
"

class TestCommentRemove < Test::Unit::TestCase
  def test_calculation_if_file_contains_special_characters
    text = "%%%%%%*8889"

    hash_with_count = counting_the_usage_of_each_character(text)
    actual_result   = forrmating_for_output_file(hash_with_count)
    expected_result = "Char '%' occurs 6 times\nChar '*' occurs only 1 time\nChar '8' occurs 3 times\nChar '9' occurs only 1 time\n"

    assert_equal(expected_result, actual_result)
  end

  def test_calculation_if_file_contains_whitespaces
    text = "it is a long established fact!"

    hash_with_count = counting_the_usage_of_each_character(text)
    actual_result   = forrmating_for_output_file(hash_with_count)
    expected_result = RESULTS_OF_THE_LAST_THREE_TESTS

    assert_equal(expected_result, actual_result)
  end

  def test_calculation_if_file_contains_uppercase
    text = "It is A long Established Fact!"

    hash_with_count = counting_the_usage_of_each_character(text)
    actual_result   = forrmating_for_output_file(hash_with_count)
    expected_result = RESULTS_OF_THE_LAST_THREE_TESTS

    assert_equal(expected_result, actual_result)
  end

  def test_calculation_if_file_contains_multiple_lines
    text = "It is\n A long\n established fact!\n"

    hash_with_count = counting_the_usage_of_each_character(text)
    actual_result   = forrmating_for_output_file(hash_with_count)
    expected_result = RESULTS_OF_THE_LAST_THREE_TESTS

    assert_equal(expected_result, actual_result)
  end
end
