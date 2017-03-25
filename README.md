# Petitest::Spec

[![Gem Version](https://badge.fury.io/rb/petitest-spec.svg)](https://rubygems.org/gems/petitest-spec)
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/github/petitest/petitest-spec)

BDD style DSL for [Petitest](https://github.com/petitest/petitest).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "petitest"
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install petitest
```

## Usage

Require `"petitest/spec"` and extend `Petitest::Spec` into your test class.

```ruby
require "petitest/autorun"
require "petitest/spec"

class ExampleTest < Petitest::Test
  include ::Petitest::Spec

  # ... your tests ...
end
```

### .describe and .context

Nest a test group with description. `.context` is an alias.

```ruby
describe do "GET /me"
  context "without logged-in" do
    it "returns 401" do
      assert { response.status == 200 }
    end
  end
end
```

### .it and .specify

Define a test with description. `.specify` is an alias.

```ruby
it "returns foo" do
  assert { x == "foo" }
end

specify "x is foo" do
  assert { x == "foo" }
end
```
