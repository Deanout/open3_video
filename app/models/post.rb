class Post < ApplicationRecord
  after_commit :broadcast_number, on: %i[ create update ]

  def broadcast_number
    broadcast_replace_to(:postable,
      target: "post_#{id}",
      partial: "posts/post",
      locals: { post: self })
  end
end
