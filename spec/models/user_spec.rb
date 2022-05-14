require "rails_helper"

describe 'User' do
  let!(:expected) { create(:user)}

  it 'succeeds' do
    id = expected.id
    p id
  end
end
