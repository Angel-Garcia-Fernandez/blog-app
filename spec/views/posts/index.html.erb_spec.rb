require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
    assign(:posts, create_list(:post, 2, :with_author, title: 'Title', body: 'MyText'))
  end

  it 'renders a list of posts' do
    render

    assert_select '.card h5.card-title', text: 'Title'.to_s, count: 2
    assert_select '.card p.card-text', text: 'MyText'.to_s, count: 2
  end
end
