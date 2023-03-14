# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

# класс для работы с адресами
class Url
  # подключение зависимостей
  include Comparable
  extend Forwardable

  def_delegators :@uri, :scheme, :host, :port

  def initialize(url)
    @uri = URI(url)
  end

  # query_params() - возвращает параметры запроса в виде пар ключ-значение объекта
  def query_params
    query = @uri.query
    return {} if query.nil?

    hash = query.split('&').each_with_object({}) do |pair, params|
      key, value = pair.split('=')
      params[key] = value
    end
    hash.transform_keys(&:to_sym)
  end

  # query_param() — принимает ключ и дефолтное значение (по-умолчанию оно равно nil).
  # Если указанный ключ отсутствует в параметрах запроса,
  # то возвращается дефолтное значение
  def query_param(key, default = nil)
    query_params[key] || default
  end

  # == (Через Comparable) — принимает объект класса Url
  # и возвращает результат сравнения с текущим объектом — true или false
  def ==(other)
    return false unless other.is_a?(self.class)

    query_params == other.query_params &&
      scheme == other.scheme &&
      host == other.host &&
      port == other.port
  end
end
# END
