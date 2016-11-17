module Kana
  class Initializer
    Cms::Role.permissions kana: {
                            dictionaries: [:read, :edit, :delete, :build]
                          }
  end
end
