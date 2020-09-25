require 'rails_helper'

RSpec.describe 'comments/edit', type: :view do
  let!(:user) { create :user }
  let(:post) { create :post }
  let(:comment) { create(:comment, body: 'MyText', author: user, post: post)}

  before(:each) do
    sign_in user
    assign(:comment, comment)
  end

  it 'renders the edit comment form' do
    render

    assert_select 'form[action=?][method=?]', post_comment_path(post, comment), 'post' do
      assert_select 'textarea[name=?]', 'comment[body]'
    end
  end
end
