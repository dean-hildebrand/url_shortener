class ShortCode
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length

  def self.encode(number)
    return ALPHABET.first if number.zero? || number.nil?

    result = ""

    # eg: 1024
    # 1024 % 62 = 32 -> ALPHABET[32] = "g"
    # 1024 / 62 = 16
    # 16 % 62 = 16 -> ALPHABET[16] = "g"
    # 16 / 62 = 0
    # result = "gw"

    while number > 0 do
      remainder = number % BASE
      result = ALPHABET[remainder] + result
      number /= BASE
    end

    result
  end

  def self.decode(string)
  end
end
