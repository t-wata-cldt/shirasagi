module Sys
  class Initializer
    Sys::Role.permissions sys: {
                            sites: :edit,
                            groups: :edit,
                            users: :edit,
                            roles: :edit }
  end
end
