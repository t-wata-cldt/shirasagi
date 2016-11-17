module Faq
  class Initializer
    Cms::Node.plugin "faq/page"
    Cms::Node.plugin "faq/search"
    Cms::Part.plugin "faq/search"

    Cms::Role.permissions faq: {
                            pages: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                              release: [:other, :private],
                              approve: [:other, :private],
                              move: [:other, :private],
                              unlock: :other,
                            }}
  end
end
