class CommandRunnerService
  include Singleton
  def initialize; end

  def execute(command)
    Open3.popen3(command) do |_stdin, stdout, stderr, wait_thr|
      exit_status = wait_thr.value
      Rails.logger.debug("Command execution status: #{exit_status}")
      if exit_status.success?
        Rails.logger.debug("Command execution successful")
        result = stdout.read
        return result
      else
        Rails.logger.error("Command execution failed: #{exit_status}")
        result = -1
        return result
      end
    end
  rescue StandardError => e
    Rails.logger.error("Command execution failed: #{e}")
    return -2
  end
end
