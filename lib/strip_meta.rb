class StripMeta < Gollum::Filter
  def extract(data)
    data.gsub!(/^(---+)?\r?\n(.+?)\r?\n\1(---+)*$/m) do
      ""
    end
    data
  end
  def process(data)
    data
  end
end
