module ReactionsHelper
  def reaction_links(comment)
    types = { smile: { icon: 'fa-smile-wink', color: 'yellow'},
              thumbs_up: { icon: 'fa-thumbs-up', color: 'royalblue'},
              like: { icon: 'fa-heart', color: 'red'} }
    types.keys.map do |type|
      reaction = comment.reactions.find_or_initialize_by(author: current_user, reaction_type: type)
      if reaction.persisted?
        link_to comment_reaction_path(comment, reaction), method: :delete, class: 'btn btn-dark' do
          concat content_tag(:i,'', class: "fas #{types[type][:icon]}", style: "color: #{types[type][:color]}")
          concat content_tag(:div, comment.reactions.send(type).count, class: 'badge badge-light', style: "background-color: #{types[type][:color]}")
        end
      else
        link_to comment_reactions_path(comment, reaction: { reaction_type: type }), method: :post, class: 'btn btn-dark' do
          concat content_tag(:i,'', class: "fas #{types[type][:icon]}")
          concat content_tag(:div, comment.reactions.send(type).count, class: 'badge badge-light')
        end
      end
    end
  end
end