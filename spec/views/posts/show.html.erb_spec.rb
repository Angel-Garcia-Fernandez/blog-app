require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user, title: 'Title', body: 'MyText') }

  before(:each) do
    sign_in user
    assign(:post, post)
    assign(:comment, post.comments.new )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
