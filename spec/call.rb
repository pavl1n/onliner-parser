# frozen_string_literal: true

require_relative 'info'

# Reek said to move it to another class o_O
class Call
  def self.links_call(links)
    links.each { |link| Info.new(link).get }
  end
end
