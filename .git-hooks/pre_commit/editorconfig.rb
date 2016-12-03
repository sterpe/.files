module Overcommit::Hook::PreCommit
  # Runs `editorconfig-tools check` against any modified files
  #
  # @see https://github.com/sterpe/editorconfig-tools#release
  class Editorconfig < Base
    # There is no consistent message format, unfortunately
    MESSAGE_REGEX =/^.*$/

    def run
      result = execute(command, args: applicable_files)
      output = result.stdout.chomp
      return :pass if result.success? && output.empty?

      # example message:
      # message formats are all over the place
      extract_messages(
        output.split("\n").grep(MESSAGE_REGEX),
        MESSAGE_REGEX
      )
    end
  end
end
