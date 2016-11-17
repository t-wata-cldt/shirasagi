module Opendata
  class Initializer
    Cms::Node.plugin "opendata/category"
    Cms::Node.plugin "opendata/area"
    Cms::Node.plugin "opendata/dataset"
    Cms::Node.plugin "opendata/dataset_category"
    Cms::Node.plugin "opendata/search_dataset_group"
    Cms::Node.plugin "opendata/search_dataset"
    Cms::Node.plugin "opendata/sparql"
    Cms::Node.plugin "opendata/api"
    Cms::Node.plugin "opendata/app"
    Cms::Node.plugin "opendata/app_category"
    Cms::Node.plugin "opendata/search_app"
    Cms::Node.plugin "opendata/idea"
    Cms::Node.plugin "opendata/idea_category"
    Cms::Node.plugin "opendata/search_idea"
    Cms::Node.plugin "opendata/mypage"
    Cms::Node.plugin "opendata/member"
    Cms::Node.plugin "opendata/my_profile"
    Cms::Node.plugin "opendata/my_dataset"
    Cms::Node.plugin "opendata/my_app"
    Cms::Node.plugin "opendata/my_idea"

    Cms::Part.plugin "opendata/app"
    Cms::Part.plugin "opendata/idea"
    Cms::Part.plugin "opendata/dataset"
    Cms::Part.plugin "opendata/dataset_group"
    Cms::Part.plugin "opendata/mypage_login"

    Cms::Role.permissions opendata: {
                            datasets: {
                              read: [:other, :private, :member],
                              edit: [:other, :private, :member],
                              delete: [:other, :private, :member],
                              release: [:other, :private, :member],
                              approve: [:other, :private, :member],
                            },
                            apps: {
                              read: [:other, :private, :member],
                              edit: [:other, :private, :member],
                              delete: [:other, :private, :member],
                              release: [:other, :private, :member],
                              approve: [:other, :private, :member],
                            },
                            ideas: {
                              read: [:other, :private, :member],
                              edit: [:other, :private, :member],
                              delete: [:other, :private, :member],
                              release: [:other, :private, :member],
                              approve: [:other, :private, :member],
                            },
                          }
  end
end
