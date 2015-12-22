require_relative '../lib/palindrome'

RSpec.describe 'Palindrome#is_palindrome?' do
  context 'normal cases' do
    it 'checks normal case no. 1' do
      expect(''.is_palindrome?).to be true
    end

    it 'checks normal case no. 2' do
      expect('a'.is_palindrome?).to be true
    end

    it 'checks normal case no. 3' do
      expect('1'.is_palindrome?).to be true
    end

    it 'checks normal case no. 4' do
      expect('a2a'.is_palindrome?).to be true
    end

    it 'checks normal case no. 5' do
      expect('tattarrattat'.is_palindrome?).to be true
    end

    it 'checks normal case no. 6' do
      expect('Doc Note: I dissent. A fast never prevents a fatness. I diet on cod'.is_palindrome?).to be true
    end

    it 'checks normal case no. 7' do
      expect('abc'.is_palindrome?).to be false
    end
  end

  context 'weird cases' do
    it 'checks weird case no. 1' do
      expect('  asd, ,dsa ;/'.is_palindrome?).to be true
    end

    it 'checks weird case no. 2' do
      expect('AaAz;;;;;\][/.,,,>>/\]aaa'.is_palindrome?).to be true
    end

    it 'checks weird case no. 3' do
      expect('abba007_00abba'.is_palindrome?).to be false
    end
  end
end