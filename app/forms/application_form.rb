# frozen_string_literal: true

class ApplicationForm
  include ActiveModel::Model

  class << self
    # Form attributes defined via {.form_attributes}
    #
    # @return [Array<String>]
    attr_reader :attributes

    # Defines the attributes of the form object by using <tt>attr_accessor</tt>.
    #
    # @example
    #   class UserForm < ApplicationForm
    #     form_attributes :first_name, :last_name
    #   end
    # @param attributes [Array<Symbol>] - the attributes to be defined on the form
    # @return [void]
    def form_attributes(*attributes)
      @attributes ||= attributes.map do |attribute|
        attr_accessor attribute
        attribute.to_s
      end
    end

    # Sets or infers the resource name.
    #
    # @param klass [String] the name of the resource class
    # @return [Class]
    # @example A class where the form object name does not match the resource:
    #   class SignupForm < ApplicationForm
    #     resource_class User
    #   end
    def resource_class(klass = nil)
      @resource_class ||= (klass || name.chomp('Form').constantize)
    end

    # Hook used to override <tt>model_name</tt> on child classes.
    #
    # @return [void]
    def inherited(child_class)
      child_class.instance_eval do
        def model_name
          ActiveModel::Name.new(self, nil, resource_class.name)
        end
      end
    end
  end

  # The underlying model wrapped by the form.
  #
  # @return [Object]
  attr_reader :resource

  delegate :id, :persisted?, to: :resource

  # @param resource [Object] - the resource wrapped by the form
  # @param params [Hash{String=>Object}] - the changeset
  def initialize(resource = self.class.resource_class.new, params = {})
    @resource = resource
    @params = params.except('id', 'created_at', 'updated_at')
    resource.assign_attributes(resource_attributes)
    super(form_attributes)
  end

  # Validates the current form object and then calls <tt>save!</tt> on the
  # underlying resource.
  #
  # @return [Boolean]
  def save
    return false unless valid?
    resource.save!
  end

  private

  def resource_attributes
    @params.slice(*resource.attribute_names)
  end

  def form_attributes
    @params.slice(*self.class.attributes)
  end
end
