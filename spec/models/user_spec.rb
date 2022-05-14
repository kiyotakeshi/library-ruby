require "rails_helper"

describe 'User' do
  let!(:expected) { create(:user)}

  it 'succeeds' do
    id = expected.id
    # p ENV['LOG_LEVEL']
    p id
  end
end
