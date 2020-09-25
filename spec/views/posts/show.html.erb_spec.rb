require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
    @post = assign(:post, create(:post, :with_author, title: 'Title', body: 'MyText'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
