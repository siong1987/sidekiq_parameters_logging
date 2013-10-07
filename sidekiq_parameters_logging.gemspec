# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sidekiq_parameters_logging"
  s.version     = "1.0.0"
  s.authors     = ["Teng Siong Ong"]
  s.email       = ["siong1987@gmail.com"]
  s.homepage    = "https://github.com/siong1987/sidekiq_parameters_logging"
  s.summary     = "Sidekiq::Paramters::Logging middleware to log parameters passsed to each worker."
  s.description = "Sidekiq::Paramters::Logging middleware to log parameters passsed to each worker."
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "README.markdown"]

  s.add_dependency "sidekiq", ">= 2.0.0"
end
