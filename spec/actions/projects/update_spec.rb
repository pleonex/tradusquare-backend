# frozen_string_literal: true

RSpec.describe Backend::Actions::Projects::Update do
  let(:params) { Hash[] }

  it "works" do
    response = subject.call(params)
    expect(response).to be_successful
  end
end
