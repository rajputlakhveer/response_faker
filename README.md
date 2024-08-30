# Response Faker Gem

The `response_faker` gem provides a way to generate fake responses for third-party calls using JSON files. It dynamically creates methods based on the JSON files in the `lib/response_faker/responses/` directory, and automatically reloads these responses when files are added or modified.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'response_faker'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install response_faker
```

## Usage

### Setup

1. **Create JSON Response Files**

   Place your JSON files in the `lib/response_faker/responses/` directory. Each file should contain a valid JSON object. The filename will be used to create a class with corresponding methods.

   Example JSON file (`lib/response_faker/responses/example_response.json`):
   ```json
   {
     "example_method_1": "This is a fake response.",
     "example_method_2": "Another fake response."
   }
   ```

2. **Load Responses**

   The gem automatically loads all JSON files from the `responses` directory when it's first initialized. The methods defined in these files will be available as class methods on the dynamically created classes.

   ```ruby
   ResponseFaker::ExampleResponse.example_method_1 # => "This is a fake response."
   ```

### Auto-Reload

The gem watches the `lib/response_faker/responses/` directory for changes. If you add or modify any JSON files, the gem will automatically reload the responses and update the available methods.

## Error Handling

If a JSON file is improperly formatted, the gem will skip that file and print an error message. Ensure that all JSON files in the directory are valid to avoid issues.

## Development

To contribute to the development of `response_faker`, follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create a new Pull Request.

## License

This gem is available as open-source software under the terms of the MIT License. See the [LICENSE](LICENSE) file for more information.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/rajputlakhveer/response_faker](https://github.com/rajputlakhveer/response_faker).

## Contact

For any questions or support, please reach out to [your email] or create an issue on the GitHub repository.

---

Thank you for using `response_faker`!