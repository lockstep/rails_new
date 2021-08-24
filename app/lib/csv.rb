module CSV
    # Downloads an <tt>ActiveStorage</tt> attachement into a local tempfile and
    # yields it to the provided block.
    #
    # @example
    #   Utilities.with_local_tempfile(import.file) do |file|
    #     CSV.foreach(file) do |row|
    #       ...
    #     end
end