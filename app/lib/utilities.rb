# frozen_string_literal: true

module Utilities
  # Downloads an <tt>ActiveStorage</tt> attachement into a local tempfile and
  # yields it to the provided block.
  #
  # @example
  #   Utilities.with_local_tempfile(import.file) do |file|
  #     CSV.foreach(file) do |row|
  #       ...
  #     end
  #   end
  # @param attached [ActiveStorage::Attached::One] the attachement to download
  # @return void
  def self.with_local_tempfile(attached)
    tempfile = Tempfile.new
    tempfile.write(attached.download)
    tempfile.rewind
    yield tempfile if block_given?
  ensure
    tempfile&.close!
  end
end
