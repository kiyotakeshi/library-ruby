# frozen_string_literal: true

module Validators
  class DateValidator < ActiveModel::Validator

    DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/

    def validate(record)
      options[:fields].each do |field|
        unless record.public_send(field).to_s.match?(DATE_REGEX)
          record.errors.add(field, "is invalid data(not date format)")
        end
      end
    end
  end
end


