class PostsChannel < ApplicationCable::Channel
  def subscribed
    Post.published.each do |post|
      stream_from "post:#{post.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end
end
