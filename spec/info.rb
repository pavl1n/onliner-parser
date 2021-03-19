# frozen_string_literal: true

class Info
  attr_accessor :title, :text, :image

  def initialize(title, text, image)
    @title = title
    @text = text
    @image = image
  end
end
