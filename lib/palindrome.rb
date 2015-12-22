class String
  def is_palindrome?
    normalize == palindrome
  end

  private

  def palindrome
    normalize.reverse
  end

  def normalize
    gsub(/\W+/, '').downcase
  end
end
