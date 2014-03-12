module TextAnalyzer
  def analyze_occurrencies_words(text)
    bare = {}
    text.split(' ').each do |kw|
      word = kw.downcase
      bare[word].nil? ? bare[word] = 1 : bare[word] += 1
    end
    bare
  end
end
