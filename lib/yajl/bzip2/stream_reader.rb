# encoding: UTF-8
module Yajl
  module Bzip2
    # This is a wrapper around Bzip::Reader to allow it's #read method to adhere
    # to the IO spec, allowing for two parameters (length, and buffer)
    class StreamReader < ::Bzip2::Reader
      # Helper method for one-off parsing from a bzip2-compressed stream
      #
      # See Yajl::Parser#parse for parameter documentation
      def self.parse(input, options={}, buffer_size=nil, &block)
        if input.is_a?(String)
          input = StringIO.new(input)
        end

        Yajl::Parser.new(options).parse(new(input), buffer_size, &block)
      end
    end
  end
end