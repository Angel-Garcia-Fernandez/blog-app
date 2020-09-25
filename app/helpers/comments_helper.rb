module CommentsHelper
  def comment_links(comment, user, actions)
    owner = comment && comment.author == user
    post = comment.post
    published = post.published?
    {
        new: -> { link_to('New comment', new_post_comment_path(post), class: 'btn btn-primary') if published },
        show: -> { link_to('Show', post_comment_path(post,comment), class: 'btn btn-primary') },
        edit: -> { link_to('Edit', edit_post_comment_path(post, comment), class: 'btn btn-primary') if owner },
        destroy: -> { link_to('Destroy', post_comment_path(post, comment), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-primary') if owner },
        back: -> { link_to('Back', :back, class: 'btn btn-secondary') }
    }.fetch_values(*Array(actions)).map(&:call)
  end
end
