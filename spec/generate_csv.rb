# Writing into csv file
class GenerateCsv
  def self.generate(title, text, img)
    CSV.open('output.csv', 'a+') do |writer|
      writer << [title, text, img]
    end
  end
end
