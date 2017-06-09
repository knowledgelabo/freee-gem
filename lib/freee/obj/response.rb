require 'active_support/inflector'

module Freee::Response

  class Csv
    attr_accessor :val
    def initialize(val)
       @val = val
    end
  end

  class Base
    attr_reader :val

    def initialize(val)
      @val = Hash.try_convert(val)
    end

    def method_missing(name, *args)
      @val[name.to_s]
    end

    def [](name)
      @val[name.to_s]
    end

    def has_key?(name)
      if @val[name.to_s]
        return true
      else
        return false
      end
    end
    alias_method :key, :has_key?
    alias_method :include?, :has_key?
    alias_method :member?, :has_key?
  end

  class Type
    def self.convert(response, type=nil)
      klass = "Freee::Response::#{type.to_s.classify}".constantize
      klass.new(response)
    end
  end
end
