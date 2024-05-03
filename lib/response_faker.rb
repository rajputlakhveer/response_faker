# frozen_string_literal: true

require_relative "response_faker/version"

module ResponseFaker
  class Error < StandardError; end
    
  directory_path = "lib/response_faker/responses/"

  # Iterate over each file in the directory
  Dir.glob(File.join(directory_path, "*")).each do |file|
    # Get the filename without extension
    class_name = File.basename(file, ".*").split('_').map(&:capitalize).join
    klass = Class.new do 
      def self.load_responses(file)

        responses = JSON.parse(File.read(file))
        responses.each do |key, value|
          define_singleton_method(key) { value }
        end
      end
    end

    # Load responses into the dynamically created class
    klass.load_responses(file)

    # Define the class within the module
    const_set(class_name, klass)
  end
end
