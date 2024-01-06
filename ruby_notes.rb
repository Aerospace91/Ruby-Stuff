1 + 1 # Int
1 + 1.0 # Float
13.to_f # Int -> Float
13.9.to_i # Float -> Int
6.even? # true
7.even? # false
6.odd? # false
7.odd? # true
"Welcome " + "to " + "Ruby!" # String
"Welcome " << "to " << "Ruby!" # String
"Welcome ".concat("to ").concat("Ruby!") # String
#SubStrings
"hello"[0] # "h"
"hello"[0..1] # "he"
"hello"[0, 2] # "he"
"hello"[0, 4] # "hell"
"hello"[-1] # "o"

\\ # Backslash
\b # Backspace
\r # Carriage return
\n # Newline
\s # Space
\t # Tab
\# # Pound sign
\{ # Left curly bracket
\} # Right curly bracket
\" "# Double quotation mark
\' '# Single quotation mark

# STRINGS

name = "Odin"

puts "Hello, #{name}!" # "Hello, Odin!"
puts 'Hello, #{name}!' # "Hello, #{name}!"

"hello".capitalize # "Hello"

"hello".include?("lo") # true
"hello".include?("z") # false

"hello".upcase # "HELLO"

"hello".empty? # false

"HELLO.downcase" # "hello"

"hello".reverse # "olleh"
"hello".reverse.upcase # "OLLEH"

"hello".length # 5

"hello world".split # ["hello", "world"]
"hello".split("") # ["h", "e", "l", "l", "o"]

5.to_s # "5"
nil.to_s # ""
:symbol.to_s # "symbol"

#SYMBOLS

:my_symbol # :my_symbol
"string" == "string" # true
"string".object_id == "string".object_id # false
:symbol.object_id == :symbol.object_id # true
# Strings can be changed, so every time a string is used, Ruby has to store it in memory even if an existing string with the same value exists.
# Symbols are immutable, meaning they can't be changed. Every time a symbol is used, Ruby simply has to point to it in memory, saving time and memory.
# Symbols are also useful for referencing method names.
# One common application for symbols is the key in a hash

# HASHES

my_hash = {
    "a random word" => "ahoy",
    "Dorothy's math test score" => 94,
    "an array" => [1, 2, 3],
    "an empty hash within a hash" => {}
} # basically a dictionary in python

my_hash = Hash.new #=> {} 
hash = { 9 => "nine", :six => 6}

shoes = {
  "summer" => "sandals",
  "winter" => "boots"
}

shoes["summer"]   #=> "sandals"
shoes["hiking"]   #=> nil
shoes.fetch("hiking")   #=> KeyError: key not found: "hiking"

shoes["fall"] = "sneakers"
shoes # => {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}

shoes.delete("summer") # => "sandals"
shoes # => {"winter"=>"boots", "fall"=>"sneakers"}

books = {
    "Infinite Jest" => "David Foster Wallace",
    "Into the Wild" => "Jon Krakauer"
}

books.keys # ["Infinite Jest", "Into the Wild"]
books.values # ["David Foster Wallace", "Jon Krakauer"]

hash1 = { "a" => 1, "b" => 2 }
hash2 = { "b" => 2, "a" => 1 }
hash1.merge(hash2) # {"a"=>1, "b"=>2}

# Symbols as hash keys
american_cars = {
    :chevrolet => "Corvette",
    :ford => "Mustang",
    :dodge => "Ram"
}

# Symbols syntax
japanese_cars = {
    honda: "Accord",
    toyota: "Corolla",
    nissan: "Altima"
}

american_cars[:ford] # "Mustang"
japanese_cars[:honda] # "Accord"

# METHODS

#Calling
"anything".reverse

#Creating a Method
def function_name #Snake Case
    "Function body"
end

puts function_name # "Function body"

#Method with Arguments

def function_name_argument(argument)
    "Hello. " + argument + "!"
end

puts function_name_argument("Odin") # "Hello. Odin!"

#Default Arguments
def function_default_argument(name = "stranger")
    "Hello, " + name + "!"
end

puts greet # "Hello, stranger!"
puts greet("Odin") # "Hello, Odin!"

#Predicate Methods
5.even? # false
5.odd? # true

#Any method that ends in a question mark is a predicate method.
#Predicate methods return a boolean value.
#Making a Predicate Method
def multiple_of_three?(n)
    n % 3 == 0
end

puts multiple_of_three?(7) # false
puts multiple_of_three?(9) # true

#Bang Methods
whisper = "HELLO EVERYBODY"
puts whisper.downcase # "hello everybody"
puts whisper # "HELLO EVERYBODY"

puts whisper.downcase! # "hello everybody"
puts whisper # "hello everybody"

#Enumerable Methods
friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
invited_list = []
for friend in friends do
    if friend != 'Brian'
    invitied_list.push(friend)
    end
end

invited_list # ["Sharon", "Leo", "Leila", "Arun"]
# do is optional in a for loop and can cause problems in irb

friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
friends.select { |friend| friend != "Brian" }
invited_list # ["Sharon", "Leo", "Leila", "Arun"]

friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
friends.reject { |friend| friend == "Brian"}
invited_list # ["Sharon", "Leo", "Leila", "Arun"]

#Each Method
friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
friends.each {|friend| puts "Hello, " + friend}

my_array = [1, 2]

my_array.each do |num|
    num *= 2
    puts "The new number is #{num}."
end

fruits = ["apple", "banana", "strawberry", "pineapple"]
fruits.each_with_index { |fruit, index| puts fruit if index.even? }
# apple
# strawberry
# ["apple", "banana", "strawberry", "pineapple"]

#Map Method
friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
friends.map { |friend| friend.upcase}
# ["SHARON", "LEO", "LEILA", "BRIAN", "ARUN"]

#Select Method
friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
friends.select { |friend| friend != "Brian" }
# ["Sharon", "Leo", "Leila", "Arun"]

#Predicate Enumerable Methods
friends = ["Sharon", "Leo", "Leila", "Brian", "Arun"]
invited_list = friends.select { |friend| friend != "Brian" }
invited_list.include?("Brian") # false

numbers = [1, 2, 3, 4, 6, 60]
numbers.any? { |number| number > 100 } # false
numbers.any? { |number| number < 7 } # true

fruits = ["apple", "banana", "strawberry", "pineapple"]
fruits.all? { |fruit| fruit.length > 3 } # true
fruits.all? { |fruit| fruit.length > 10 } # false

#Nested Arrays
test_scores = [[92, 87, 75], [88, 76, 67], [94, 86, 90]]
teacher_mailboxes = [["David", "Avi", "Jerry"], ["Sean", "David", "Avi"], ["Jerry", "Sean", "Avi"]]
test_scores[0][0] # 92
test_scores[1][2] # 67

#Create Nested Array
mutable = Array.new(3, Array.new(2))
mutable # [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
mutable # [[1000, nil], [1000, nil], [1000, nil]]
#Chaninging the value of the first element in the first array changes the value of the first element in all the arrays.
immutable = Array.new(3) { Array.new(2) }
immutable # [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
immutable # [[1000, nil], [nil, nil], [nil, nil]]

test_scores = [[92, 87, 75], [88, 76, 67], [94, 86, 90]]
test_scores[0].push(100)
test_scores # [[92, 87, 75, 100], [88, 76, 67], [94, 86, 90]]
test_scores.pop # [94, 86, 90]
test_scores[0].pop # 100
test_scores # [[92, 87, 75], [88, 76, 67]]

#Iterate over nested array
teacher_mailboxes.each_with_index do |row, row_index|
    puts "Row:#{row_index} = #{row}"
end
# Row:0 = ["David", "Avi", "Jerry"]
# Row:1 = ["Sean", "David", "Avi"]
# Row:2 = ["Jerry", "Sean", "Avi"]
# => [["David", "Avi", "Jerry"], ["Sean", "David", "Avi"], ["Jerry", "Sean", "Avi"]]

teacher_mailboxes.each_with_index do |row, row_index|
    row.each_with_index do |teacher, column_index|
        puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
    end
end
# Row:0 Column:0 = David
# Row:0 Column:1 = Avi
# Row:0 Column:2 = Jerry
# Row:1 Column:0 = Sean
# Row:1 Column:1 = David
# Row:1 Column:2 = Avi

teacher.mailboxes.flatten.each do |teacher|
    puts "#{teacher} has mail!"
end
# David has mail!
# Avi has mail!
# Jerry has mail!

#Nested Hashes
vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}

#Accessing Nested Hashes
vehicles[:alice] # {:year=>2019, :make=>"Toyota", :model=>"Corolla"}
vehicles[:alice][:year] # 2019
vehicles[:alice][:make] # "Toyota"
vehicles[:blake][:model] # "Beetle"

vehicles.select {|name, data| data[:year] == 2020}
# {:blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}}

vehicles.collect {|name, data| name if data[:year] == 2020}
# [:blake, :caleb]

#DEBUGGING
require 'pry-byebug'

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end