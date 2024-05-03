# frozen_string_literal: true

require_relative "lib/response_faker/version"

Gem::Specification.new do |spec|
  spec.name = "response_faker"
  spec.version = ResponseFaker::VERSION
  spec.authors = ["Lakhveer Singh Rajput"]
  spec.email = ["rajputlakhveer@gmail.com"]
  
  spec.summary = "Pretender is a lightweight Ruby gem designed for developers to easily mock third-party responses during testing or development. With Pretender, users can simulate responses from external APIs, services, or servers, enabling efficient testing and development without relying on live external dependencies."
  spec.description = "Pretender is a lightweight Ruby gem designed for developers to easily mock third-party responses during testing or development. With Pretender, users can simulate responses from external APIs, services, or servers, enabling efficient testing and development without relying on live external dependencies. Its simple and intuitive interface allows developers to configure custom responses, mimic various status codes, and handle dynamic data scenarios. Pretender enhances the development process by providing a flexible and reliable tool for mocking third-party interactions, ensuring smooth and effective testing of applications."
  spec.homepage = "https://github.com/rajputlakhveer/pretender"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.3.0"
  spec.metadata       = { "rubygems_mfa_required" => "false" }

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rajputlakhveer/pretender"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
