WHITESPACE = /[[:space:]]/

def open_input_file(filename)
  if filename.nil?
    puts "Enter the file name"
    exit
  end

  unless File.exists?(filename)
    puts "File not found"
    exit
  end

  File.open(filename, "r")
end

def generate_output_file_name(filename)
  File.basename(filename, ".*") + ".tmp"
end

def open_output_file(filename)
  output_file_name = generate_output_file_name(filename)

  File.open(output_file_name, "w")
end

def counting_the_usage_of_each_character(text)
  text.gsub(WHITESPACE, "").downcase.chars.tally
end

def forrmating_for_output_file(hash)
  output_text = ""
  hash.each do |key, value|
    output_text += value == 1 ? "Char '#{key}' occurs only 1 time\n" : "Char '#{key}' occurs #{value} times\n"
  end

  output_text
end
