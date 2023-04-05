WHITESPACE   = /[[:space:]]/
EMPTY_STRING = ""

def count_the_usage_of_each_character(text)
  text.gsub(WHITESPACE, EMPTY_STRING).downcase.chars.tally
end
