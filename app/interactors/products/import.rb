# frozen_string_literal: true

module Products
  class Import
    include Interactor::Organizer

    organize HeadersConverters, ParseCsv, Persist
  end
end
