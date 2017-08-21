# frozen_string_literal: true

require 'forwardable'

class ApplicationDecorator
  extend Forwardable

  # Forwards (and optionally renames) methods to the wrapped object.
  #
  # @param methods [Array<Symbol>] the method(s) to forward
  # @param aliases [Hash<Symbol, Symbol>] the methods to alias
  # @return [void]
  # @example Forward some methods
  #   forward :first_name, :last_name
  # @example Forward and rename a method
  #   forward age: :user_age
  # @example Forward and rename at the same time
  #   forward :first_name, :last_name, age: :user_age
  def self.forward(*methods, **aliases)
    def_delegators :wrapped, *methods

    aliases.each do |old_name, new_name|
      def_delegator :wrapped, old_name, new_name
    end
  end

  # Forwards all methods to the wrapped object via <tt>method_missing</tt>.
  #
  # @note This is not recommend, prefer explicitly forwarding required methods.
  # @return [void]
  def self.forward_all
    define_method :method_missing do |m, *args, &block|
      return super(m, *args, &block) unless wrapped.respond_to?(m)

      wrapped.send(m, *args, &block)
    end

    define_method :respond_to_missing? do |m, include_private = false|
      wrapped.respond_to?(m) || super(m, include_private)
    end
  end

  attr_reader :wrapped

  # @param wrapped [Type<Object>] the object to be wrapped by the decorator
  def initialize(wrapped)
    @wrapped = wrapped
  end
end
