require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  it 'display example text' do
    render
    expect(rendered).to match /Post/
  end
end
