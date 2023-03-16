# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
  end
  TRUTHY_VALUES = %w[true yes 1].freeze
  CONVERTERS = {
    'string' => ->(v) { v.to_s },
    'integer' => lambda do |v|
      v.to_i
    rescue StandardError
      v.to_s.to_i
    end,
    'boolean' => ->(v) { TRUTHY_VALUES.include?(v.to_s.downcase) },
    'datetime' => lambda do |v|
      DateTime.parse(v)
    rescue StandardError
      v
    end
  }.freeze

  module ClassMethods
    attr_reader :schema

    def attribute(name, options = {})
      register_attribute(name, options)

      define_attribute_methods(name, options[:type])
    end

    private

    def register_attribute(name, options)
      @schema ||= {}
      @schema[name] = options
    end

    def define_attribute_methods(name, type)
      define_method(name) do
        value = instance_variable_get("@#{name}")
        converter = CONVERTERS[type.to_s]
        converter ? converter.call(value) : value
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end

  def initialize(attributes = {})
    load_attributes(attributes)
  end

  def attributes
    self.class.schema.keys.map { |name| [name, send(name)] }.to_h
  end

  def load_attributes(attributes)
    attributes.each do |name, value|
      set_attribute(name, value) if attribute_exists?(name)
    end
  end

  def attribute_exists?(name)
    self.class.schema.keys.include?(name)
  end

  def set_attribute(name, value)
    send("#{name}=", value)
  end
end


# END
