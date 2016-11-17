module Gws::Workflow
  class Initializer
    Gws::Role.permissions 'gws/workflow' => {
                            routes: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                            },
                            files: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                              approve: [:other, :private],
                            },
                          }
  end
end
