require 'pry'

class StringCalculator
	def add(str)
		return 0 if str.nil?

		sum = 0
		delimiter = ','

		if str[0..1] == '//'
			# this will give the delimiter from string
			delimiter = str[2]
			str = str[3..-1]
		end

		# scanning negative numbers from string
		negative_numbers = delimiter == '-' ? str.scan(/--\d+/) : str.scan(/-\d+/)

		return "negative numbers not allowed #{negative_numbers.join(',')}" if !negative_numbers.empty?

		str.chars.each.with_index do |char, index|
			# Checking for invalid input
			return 'InvalidInput' unless (char.match?(/\d/) || char == delimiter || char == "\n")

			if char == "\n"
				# Again checking for invalid input
				return 'InvalidInput' if str[index - 1] == delimiter || str[index + 1] == delimiter
			else
				sum += char.to_i
			end
		end

		sum
	end
end