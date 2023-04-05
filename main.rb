require_relative "character_usage_count"

# Get the file name from the command line argument
filename = ARGV[0]

input_file  = open_input_file(filename)
output_file = open_output_file(filename)

file_text       = input_file.read
hash_with_count = counting_the_usage_of_each_character(file_text)
result_text     = forrmating_for_output_file(hash_with_count)

output_file.write(result_text)

input_file.close
output_file.close

puts "Calculated successfully"
