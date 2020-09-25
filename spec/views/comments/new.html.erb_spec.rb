require 'rails_helper'

RSpec.describe 'comments/new', type: :view do
  let!(:user) { create :user }
  let(:post) { create :post }
  let(:comment) { post.comments.new }

  before(:each) do
    sign_in user
    assign(:comment, comment)
  end

  it 'renders new comment form' do
    render

    assert_select 'form[action=?][method=?]', post_comments_path(post), 'post' do

      assert_select 'textarea[name=?]', 'comment[body]'
    end
  end
end
