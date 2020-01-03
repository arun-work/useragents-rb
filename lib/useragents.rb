require 'zlib'
require_relative 'useragents/fetch'

module UserAgents

  FILE = File.expand_path '../useragents.txt', __FILE__

  class << self

    def list
      @@list ||= File.readlines FILE
    end

    def rand
      list.sample
    end

    def match_list(send_match_word)
      @@match_list = [] if !@@match_list
      @@match_list[send_match_word] ||= list.select{|l| l.include?(send_match_word) }
    end

    def rand_with_match(send_match_word)
      match_list.sample
    end

  end

end

