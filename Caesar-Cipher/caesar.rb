# require 'pry-byebug'
# binding.pry

def caesar_cipher(string, shift)
    lower = ("a".."z").to_a
    upper = ("A".."Z").to_a
    length = lower.length
    
    chars = string.split("")
    ciphered = ""
    
    chars.each do |char|
        if lower.include?(char)
            index = lower.index(char)
            shifted = (index + 5) % length
            ciphered << lower[shifted]
        elsif upper.include?(char)
            index = upper.index(char)
            shifted = (index + 5) % length
            ciphered << upper[shifted]
        else
            ciphered << char
        end
    end
    ciphered
end

def reverse(string, shift)
    lower = ("a".."z").to_a
    upper = ("A".."Z").to_a
    length = lower.length
    
    chars = string.split("")
    ciphered = ""
    
    chars.each do |char|
        if lower.include?(char)
            index = lower.index(char)
            shifted = (index - 5) % length
            ciphered << lower[shifted]
        elsif upper.include?(char)
            index = upper.index(char)
            shifted = (index - 5) % length
            ciphered << upper[shifted]
        else
            ciphered << char
        end
    end
    ciphered
end
    
string = "ODIN, LOKI, sitting in a tree"
puts caesar_cipher(string, 5)
puts reverse(caesar_cipher(string, 5), 5)