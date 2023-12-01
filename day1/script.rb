require_relative 'data'
require 'awesome_print'
require 'net/http'
require 'json'
require 'pry'

NUMBERS = {
  1_000_000 => 'million',
  1000 => 'thousand',
  100 => 'hundred',
  90 => 'ninety',
  80 => 'eighty',
  70 => 'seventy',
  60 => 'sixty',
  50 => 'fifty',
  40 => 'forty',
  30 => 'thirty',
  20 => 'twenty',
  19 => 'nineteen',
  18 => 'eighteen',
  17 => 'seventeen',
  16 => 'sixteen',
  15 => 'fifteen',
  14 => 'fourteen',
  13 => 'thirteen',
  12 => 'twelve',
  11 => 'eleven',
  10 => 'ten',
  9 => 'nine',
  8 => 'eight',
  7 => 'seven',
  6 => 'six',
  5 => 'five',
  4 => 'four',
  3 => 'three',
  2 => 'two',
  1 => 'one'
}.freeze

def calculate(list)
  list_numbers = find_numbers(list)
  get_real_digits = list_numbers.map { |e| e.scan(/\d/) }

  get_sum(get_real_digits).sum
end

def get_sum(digits)
  digits.uniq.map do |d|
    d.values_at(0, -1).join.to_i
  end
end

def find_numbers(list)
  list.map! do |string|
    Hash[NUMBERS.to_a.reverse].values.map do |word|
      next unless string.include?(word)

      string.gsub!(word, NUMBERS.key(word).to_s)
    end
  end.flatten.compact!
end

calculate(payload)
