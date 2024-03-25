class RandomPostNumberJob < ApplicationJob
  queue_as :default

  def perform(post)
    target_dir = Rails.root.join("lib", "random_number.py")
    command = "python3 #{target_dir}"
    result = CommandRunnerService.instance.execute(command)
    post.update(random_number: result.to_i)
  end
end
