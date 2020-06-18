# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-adduuid"
  spec.version       = "0.1.0"
  spec.authors       = ["chaeyk"]
  spec.email         = ["chaeyk@gmail.com"]

  spec.summary       = %q{add uuid to record}
  spec.description   = %q{add uuid to record}
  spec.homepage      = "https://github.com/chaeyk/fluent-plugin-add-uuid"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "fluentd", ">= 0.12", "< 2"
end
