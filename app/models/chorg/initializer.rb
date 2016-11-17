module Chorg
  class Initializer
    Cms::Role.permissions chorg: {revisions: [:edit]}
  end
end
