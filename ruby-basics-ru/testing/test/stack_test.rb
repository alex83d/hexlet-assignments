# frozen_string_literal: true

require_relative "test_helper"
require_relative "../lib/stack"

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
  end

  def test_add_element
    elem = @stack.push! "el"
    elem.to_a
    assert { elem.size == 1 }
  end

  def test_delete_element
    @stack.push! "one"
    @stack.to_a
    assert { "#{@stack.pop!}" != ["one"] }
  end

  def test_clear_stack
    @stack.push! "one"
    @stack.push! "two"
    @stack.to_a
    assert { @stack.clear! == [] }
  end

  def test_empty_stack
    ar1 = @stack.push! "java"
    ar2 = @stack.clear!
    assert { ar1.to_a.empty? != true }
    assert { ar2.to_a.empty? == true }
  end

  # END
end

test_methods =
  StackTest.new({}).methods.select { |method| method.start_with? "test_" }
raise "StackTest has not tests!" if test_methods.empty?
