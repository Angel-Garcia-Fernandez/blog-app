require 'rails_helper'

RSpec.describe 'posts/edit', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
    @post = assign(:post, create(:post))
  end

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', post_path(@post), 'post' do

      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[body]'
    end
  end
end
