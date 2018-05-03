# frozen_string_literal: true

class PresenterGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :forward_methods, type: :array, default: []

  def create_presenter_file
    template(
      'presenter.rb.tt',
      File.join('app', 'presenter', class_path, "#{file_name}_presenter.rb")
    )
  end

  private

  def forward_method_names
    forward_methods.map { |m| m.to_sym.inspect }
  end
end
