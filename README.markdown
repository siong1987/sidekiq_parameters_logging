# Sidekiq::Parameters::Logging

`Sidekiq::Parameters::Logging` is a middleware for Sidekiq to log all the parameters that you pass to your worker.  For example:

```ruby
class Worker
  include Sidekiq::Worker

  def perform(*params)
    # do something
  end
end
```

When you run sidekiq, you will see this:

```
# without Sidekiq::Parameters::Logging
Worker JID-ae4889cc009b554132fed3a0 INFO: start
Worker JID-ae4889cc009b554132fed3a0 INFO: done: 3.363 sec

# with Sidekiq::Parameters::Logging
Worker JID-ae4889cc009b554132fed3a0 INFO: start
Worker JID-ae4889cc009b554132fed3a0 INFO: parameters: #{params.inspect}
Worker JID-ae4889cc009b554132fed3a0 INFO: done: 3.363 sec

```

## Installation

Make sure that you already have [sidekiq](http://sidekiq.org/) installed.  In your `Gemfile`:

```ruby
gem 'sidekiq_parameters_logging'
```

## Log Filtering

You can also filter the parameters that you want to get printed out to the log:

```ruby
class Worker
  include Sidekiq::Worker
  include Sidekiq::Parameters::Logger

  logger_filter do |param1, param2|
    params1 # only print out the last parameter
  end

  def perform(param1, param2)
    # do something
  end
end
```

`logger_filter` takes a block with parameters that are being passed to your `perform` method.  Logger will then print out whatever that is returned from this block with `.inspect`.

## Notes

`Sidekiq::Parameters::Logging` replaces the standard `Sidekiq::Middleware::Server::Logging`.

## License

(The MIT License)

Copyright (c) 2013 Teng Siong Ong

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
