module PostsHelper
  def post_links(post, user, actions)
    owner = post && post.author == user
    published = post && post.published?
    {
        new: -> { link_to('New Post', new_post_path, class: 'btn btn-primary') },
        show: -> { link_to('Show', post_path(post), class: 'btn btn-primary') },
        edit: -> { link_to('Edit', edit_post_path(post), class: 'btn btn-primary') if owner && !published },
        publish: -> { link_to('Publish', post_publishes_path(post), method: :post, class: 'btn btn-primary') if owner && !published },
        destroy: -> { link_to('Destroy', post_path(post), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-primary') if owner },
        back: -> { link_to('Back', :back, class: 'btn btn-secondary') }
    }.fetch_values(*Array(actions)).map(&:call)
  end
end
