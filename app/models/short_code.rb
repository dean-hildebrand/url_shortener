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

  # number = 0
  # string = "4c91"
  # number = 0 * 62 + ALPHABET.index("4") = 4
  # number = 4 * 62 + ALPHABET.index("c")
  # number = 4 * 62 + 12 = 260

  # number = 260 * 62 + ALPHABET.index("9")
  # number = 260 * 62 + 9 = 16129

  # number = 16129 * 62 + ALPHABET.index("1")
  # number = 16129 * 62 + 1 = 999_999

  def self.decode(string)
    return 0 if string.nil? || string.empty?

    number = 0

    string.each_char do |char|
      number = number * BASE + ALPHABET.index(char)
    end

    number
  end
end
