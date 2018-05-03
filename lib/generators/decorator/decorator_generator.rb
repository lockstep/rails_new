# frozen_string_literal: true

class DecoratorGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :forward_methods, type: :array, default: []

  def create_decorator_file
    template(
      'decorator.rb.tt',
      File.join('app', 'decorators', class_path, "#{file_name}_decorator.rb")
    )
  end

  private

  def forward_method_names
    forward_methods.map { |m| m.to_sym.inspect }
  end
end
