require_relative "characters_usage_counter"
require_relative "file_handler"

# Get the file name from the command line argument
filename = ARGV[0]

input_file  = open_input_file(filename)
output_file = open_output_file(filename)

file_text       = input_file.read
hash_with_count = count_the_usage_of_each_character(file_text)
result_text     = generate_characters_usage_report(hash_with_count)

output_file.write(result_text)

input_file.close
output_file.close

puts "Calculated successfully"
