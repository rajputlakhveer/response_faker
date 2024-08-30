# frozen_string_literal: true

require_relative "response_faker/version"
require 'json'
require 'listen'

module ResponseFaker
  class Error < StandardError; end

  class << self
    def load_responses(file)
      begin
        responses = JSON.parse(File.read(file))
      rescue JSON::ParserError => e
        raise ResponseFaker::Error, "Invalid JSON format in file: #{file}. Error: #{e.message}"
      end

      class_name = File.basename(file, ".*").split('_').map(&:capitalize).join
      klass = const_set(class_name, Class.new)

      responses.each do |key, value|
        klass.define_singleton_method(key) { value }
      end
    end

    def reload_responses
      directory_path = "./lib/response_faker/responses/"

      # Iterate over each file in the directory
      Dir.glob(File.join(directory_path, "*")).each do |file|
        begin
          load_responses(file)
          puts "Loaded: #{file}"
        rescue ResponseFaker::Error => e
          puts "Skipping file due to error: #{e.message}"
        end
      end
    end
  end

  # Initial load of responses
  reload_responses

  # Watch for file changes in the responses directory
  listener = Listen.to('./lib/response_faker/responses/') do |modified, added, _removed|
    (modified + added).each do |file|
      begin
        load_responses(file)
        puts "Reloaded: #{file}"
      rescue ResponseFaker::Error => e
        puts "Error reloading #{file}: #{e.message}"
      end
    end
  end

  listener.start
end
