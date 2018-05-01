# frozen_string_literal: true

class FormGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  class_option :resource,
               type: :string,
               default: nil,
               aliases: '-r',
               banner: 'CLASS',
               desc: 'Specifies the resource class'
  argument :form_attributes, type: :array, default: []

  def create_form_file
    template 'form.rb.tt',
             File.join('app', 'forms', class_path, "#{file_name}_form.rb")
  end

  private

  def resource_class_name
    options['resource']
  end

  def form_attribute_names
    form_attributes.map { |a| a.to_sym.inspect }
  end
end
