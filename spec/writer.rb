# Writing into csv file
class Writer
  def self.writer(title, text, img)
    CSV.open('output.csv', 'a+') do |writer|
      writer << [title, text, img]
    end
  end
end
