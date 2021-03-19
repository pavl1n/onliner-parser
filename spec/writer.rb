# frozen_string_literal: true

require 'csv'

class Writer
  def self.write(topics, file)
    CSV.open(file, 'w') do |writer|
      topics.each { |topic| writer << ["#{topic.title} - #{topic.size}", topic.image] }
    end
  end
end
