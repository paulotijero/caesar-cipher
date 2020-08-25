def cipher(message, factor)
  message.bytes.map do |byte|
    if [*65..90].include?(byte)
      byte + (factor%26) > 90 ? (byte + (factor%26) - 26).chr : (byte + (factor%26)).chr
    elsif [*97..122].include?(byte)
      byte + (factor%26) > 122 ? (byte + (factor%26) - 26).chr : (byte + (factor%26)).chr
    else
      byte.chr
    end
  end.join
end

p cipher("What a string!", 5) #=> "Bmfy f xywnsl!"
p cipher("This is a secret!!", 40) #=> "Hvwg wg o gsqfsh!!"