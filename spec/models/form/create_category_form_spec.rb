# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Form::CreateCategoryForm" do
  let(:hash) { build(:category_json) }
  let(:form) { Form::CreateCategoryForm.new(params) }

  context "name" do
    where(:case, :val, :expected) do
      [
        ["valid", "a" * Form::CreateCategoryForm::NAME_LENGTH_MAX, true],
        ["blank", "", false],
        ["over max length", "a" * (Form::CreateCategoryForm::NAME_LENGTH_MAX + 1), false]
      ]
    end

    with_them do
      let(:params) do
        hash[:name] = val
        hash
      end
      it { expect(form.valid?).to eq expected }
    end
  end
end
