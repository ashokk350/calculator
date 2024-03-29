require './lib/string_calculator'

RSpec.describe StringCalculator do
	let(:string_calculator) { StringCalculator.new }

	describe '#add' do
		# Test cases for point 1.
		# Create a simple String calculator with a method signature similar to this

		it 'should return 0 for empty string.' do
			result = string_calculator.add('')
			expect(result).to eq(0)
		end

		it 'should return 0 for nil string.' do
			result = string_calculator.add(nil)
			expect(result).to eq(0)
		end

		it 'should return sum of passing one value in string.' do
			result = string_calculator.add('1')
			expect(result).to eq(1)
		end

		it 'should return sum of passing three value in string.' do
			result = string_calculator.add('1,2,3')
			expect(result).to eq(6)
		end

		# We can also test the limit of number of comman seprated value in string but it is not mentioned in assignment so i am not checking it.

		# Test cases for point 3.
		# Allow the add method to handle new lines between numbers (instead of commas).

		it 'should return zero for passing new line only as input in string' do
			result = string_calculator.add("\n")
			expect(result).to eq(0)
		end

		it 'should raise exception for invalid input' do
			result = string_calculator.add("1,\n")
			expect(result).to eq('InvalidInput')
		end

		it 'hould raise exception for invalid input' do
			result = string_calculator.add("1\n,2,3\n")
			expect(result).to eq('InvalidInput')
		end

		it 'should return sum of values for valid input' do
			result = string_calculator.add("1\n2,3")
			expect(result).to eq(6)
		end

		it 'should return sum of values for adding new line at the end of input' do
			result = string_calculator.add("2,2,3\n")
			expect(result).to eq(7)
		end

		it 'should return sum of values for adding new line at the beginning of input' do
			result = string_calculator.add("\n2\n4\n3")
			expect(result).to eq(9)
		end

		# Test cases for point 4.
		# Allow the add method to support different delimiters.

		it "should raise an exception if the input string does not start with '//' and it contains a different delimiter than comma ','" do
			result = string_calculator.add("1\n2;3")
			expect(result).to eq('InvalidInput')
		end

		it "should raise an exception if the input string start with '//' and invalid delimiter used" do
			result = string_calculator.add("//;\n2,3")
			expect(result).to eq('InvalidInput')
		end

		it 'should raise exception for invalid input' do
			result = string_calculator.add("//;\n;2;3")
			expect(result).to eq('InvalidInput')
		end

		it "should return the sum" do
			result = string_calculator.add("//;\n1;2")
			expect(result).to eq(3)
		end

		it "should return the sum for one value" do
			result = string_calculator.add("//;\n1")
			expect(result).to eq(1)
		end

		it "should raise exception for negative value in input string" do
			result = string_calculator.add("1,-3,-4")
			expect(result).to eq('negative numbers not allowed -3,-4')
		end

		it "should return the sum for delimiter is '-' one value" do
			result = string_calculator.add("//-\n2-3")
			expect(result).to eq(5)
		end

		it "should raise an exception for delimiter is '-' and next value is negative" do
			result = string_calculator.add("//-\n2--3")
			expect(result).to eq("negative numbers not allowed --3")
		end
	end
end