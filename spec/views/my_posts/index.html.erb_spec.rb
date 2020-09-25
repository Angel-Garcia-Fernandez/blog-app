require 'rails_helper'

RSpec.describe 'my_posts/index', type: :view do
  let!(:user) { create :user }
  before(:each) do
    sign_in user
    assign(:draft, create_list(:post, 1, author: user, title: 'Title', body: 'MyText'))
    assign(:published, create_list(:post, 1, :published, author: user, title: 'Title', body: 'MyText'))
  end
  it 'renders a list of drafts' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
