module Workflow
  class Initializer
    Cms::Role.permissions workflow: {
                            routes: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                            }
                          }
  end
end
