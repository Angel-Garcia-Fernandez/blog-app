class PostRelayJob < ApplicationJob
  queue_as :default

  def perform(post, user)
    post_html = PostsController.render(partial: 'post', format: :html, locals: { post: post, user: user })
    ActionCable.server.broadcast "post:#{post.id}", post: post_html
  end
end
