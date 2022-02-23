# frozen_string_literal: true

module QuickStruct
  # Shorthand alternative to Struct that gets initialized like the
  # now deprecated OpenStruct
  #
  #  QuickStruct.new(name: 'John', age: 42)
  # is the same as the following syntaxes:
  #  Struct.new(:name, :age, keyword_init: true).new(name: 'John', age: 42)
  #  Struct.new(:name, :age).new('John', 42)
  def self.new(**args)
    Struct.new(*args.symbolize_keys.keys).new(*args.values)
  end
end
