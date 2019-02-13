require "tdd"
require "rspec"

describe "my_uniq" do
    subject(:arr) {Array.new(){[]}}
    it "returns array of unique values" do
        arr = [1, 2, 1, 3, 3]
        expect(arr.my_uniq).to eq([1, 2, 3])
    end
     it "should not modify original array" do
        arr = [1, 2, 1, 3, 3]
        arr.my_uniq
        expect(arr).to eq([1, 2, 1, 3, 3])
    end
end

describe "two_sum" do
    it "should return array of two indexes that equal to 0" do
        arr = [-1, 0, 2, -2, 1]
        expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "should raise OnlyIntegerError" do
        arr = ["a","b","-a","-b"]
        expect{arr.two_sum}.to raise_error(OnlyIntegerError)
    end
end

describe "my_transpose" do 
    it "which will convert between the row-oriented and column-oriented representations" do 
        rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
        expect(rows.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    it "return nil if the number of rows does not equal number of columns" do 
        rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8, 8]]
        expect(rows.my_transpose).to eq(nil)
    end
end

describe "stock_picker" do 
    it "It should return two indexes with the greatest difference in an array in order" do
        arr = [5, 3, 1, 10, 4, 2, 6, 9, 8, 7]
        expect(stock_picker(arr)).to eq([2,3])
    end

    it "first index value should be less than second array value" do 
        arr = [3, 6, 8, 4, 5, 2, 7, 9, 10, 1]
        index = stock_picker(arr)
        first_small = index[0] < index[1]
        expect(first_small).to eq(true)
    end
end