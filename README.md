# **The Odin Project - Ruby Programming**

### **Project: [Caesar Cipher](cipher.rb)**

### **Introduction:**

In cryptography, a Caesar cipher, also known as Caesar’s cipher, the shift cipher, Caesar’s code or Caesar shift, is one of the simplest and most widely known encryption techniques. 

It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. 

For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence.

Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

```irb
  > caesar_cipher("What a string!", 5)
  => "Bmfy f xywnsl!"
```

### **Solution:**

    • The function is called with two arguments, the message and the factor to be added.
    • Use the function `bytes` on the message, this returns an array with the ascii code of each element of the string, for example:
      - 'hello'.bytes # => [104,101,108,108,111]
    • Then `map` to iterate over the generated array and return a new one.
    • Continued asking if that ASCII code is within the numerical range.
      - [*65..90] this returns an array of numbers that represent the numerical range of the ASCII code between [A...Z] respectively.
      - [*97..122] this returns an array of numbers that represent the numerical range of the ASCII code between [a...z] respectively.
    • If it belongs to some of the ranges, I ask if the `byte + (factor%26)` exceeds the maximum ASCII number to make the return of 'z' || 'Z' to 'a' || 'A' respectively, otherwise I return the 'byte' transformed to string using the `chr` function.
    • If exceeds the value of the given range can return errors, so we use the formula 'byte + (factor% 26) - 26', let's see:
      - we have a function with parameters => cipher("z",30)
      - "z".bytes // Return the ASCII of 'z' in an array => [122]
      - (30 % 26) // Here we are left with the residue of the division, the division would mean the number of turns that the factor gave, and the residue the numbers to advance, which would be what really matters.
      - 122 + (30 % 26) // We add the original ASCII to the residue.
      - 122 + (30 % 26) - 26 // To later be subtracted by 26, the amount of the alphabet, and thus make sure that the value is within our alphabetical range.
      - (122 + (30 % 26) - 26).chr // Finally, we transform from ASCII to string.
    • If isn't exceeds the value we just add 'byte + (factor % 26)' and transform the result from ASCII to string.
    • The `map` returns an array of strings ['a', 'f', 'e'], so we will use the `join` function without a parameter to return a unified string, like this: "afe"
    • And this is how the cipher function ("What a string!", 5), returns "Bmfy f xywnsl!"

### **References:**

* [bytes (String)](https://ruby-doc.org/core-2.6/String.html#method-i-bytes)
* [chr (String) Ruby-Doc.or](https://ruby-doc.org/core-2.7.1/String.html#method-i-chr)
* [map (Array)](https://ruby-doc.org/core-2.7.0/Array.html#method-i-map)
* [join (Array)](https://ruby-doc.org/core-2.7.0/Array.html#method-i-join)
* [include? (Array)](https://ruby-doc.org/core-2.5.0/Array.html#method-i-include-3F)