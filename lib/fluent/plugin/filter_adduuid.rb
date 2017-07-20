require 'fluent/filter'

module Fluent
  class AddUuidFilter < Filter
    Fluent::Plugin.register_filter('adduuid', self)

    config_param :key, :string, :default => '_uuid'

    def initialize
      super
    end

    def configure(conf)
      super
    end

    def start
      super
      # init
    end

    def shutdown
      super
      # destroy
    end

    def filter(tag, time, record)
      record[key] = SecureRandom.uuid;
      record
    end

  end
end
