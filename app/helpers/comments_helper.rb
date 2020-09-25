module CommentsHelper
  def comment_links(comment, actions)
    owner = comment && comment.author == current_user
    member_method = comment && comment.id.present?
    post = comment.post
    published = post.published?
    {
        new: -> { link_to('New comment', new_post_comment_path(post), class: 'btn btn-primary') if published },
        show: -> { link_to('Show', post_comment_path(post,comment), class: 'btn btn-primary') if member_method },
        edit: -> { link_to('Edit', edit_post_comment_path(post, comment), class: 'btn btn-primary') if member_method && owner },
        destroy: -> { link_to('Destroy', post_comment_path(post, comment), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-primary') if member_method && owner },
        back: -> { link_to('Back', :back, class: 'btn btn-secondary') }
    }.fetch_values(*Array(actions)).map(&:call)
  end
end
