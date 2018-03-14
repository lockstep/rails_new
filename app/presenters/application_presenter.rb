# Base class for presenters. Presenters should be limited to view-only concerns
# (e.g. which text to display based on object state), and may include actual
# markup tags, so <tt>ActionView::Helpers::TagHelper</tt> is included.
#
# Since they are view-specific treating them like better helpers™ and
# invoking them in the view is fine.
class ApplicationPresenter < ApplicationDecorator
  include ActionView::Helpers::TagHelper

  # Wraps the provided object in a presenter and yields it to an optional block.
  # If no block is provided, this essentially behaves like <tt>.new</tt>.
  #
  # @overload call(model)
  #   @param model [Type<Object>] the object to be wrapped by the presenter
  #   @return [Type<self>] the presenter instance
  #   @example
  #     presenter = TestPresenter.(object)
  # @overload call(model)
  #   @param model [Type<Object>] the object to be wrapped by the presenter
  #   @return [Type<self>] the presenter instance
  #   @yield [presenter] invokes the block with the presenter instance
  #   @example
  #     class TestPresenter < ApplicationPresenter
  #       forward :meaning_of_life
  #     end
  #
  #     object = OpenStruct.new(meaning_of_life: 42)
  #     TestPresenter.(object) do |presenter|
  #       puts presenter.meaning_of_life
  #     end
  #     #=> prints 42
  def self.call(model)
    new(model).tap { |presenter| yield(presenter) if block_given? }
  end

  # Wraps all elements of the  provided collection in a presenter. If a block is
  # provided it will be passed through to <tt>.call</t>.
  #
  # @param models [Array<Object>] the objects to be wrapped by the presenter
  # @return [Array<self>] an array of presenter instances
  def self.present_collection(models, &block)
    models.map { |model| call(model, &block) }
  end
end
