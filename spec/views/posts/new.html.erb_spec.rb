require 'rails_helper'

RSpec.describe 'posts/new', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
    assign(:post, build(:post))
  end

  it 'renders new post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do

      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[body]'
    end
  end
end
