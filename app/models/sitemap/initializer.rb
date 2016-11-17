module Sitemap
  class Initializer
    Cms::Node.plugin "sitemap/page"

    Cms::Role.permissions sitemap: {
                            pages: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                              move: [:other, :private],
                              release: [:other, :private],
                              approve: [:other, :private],
                            }
                          }
  end
end
