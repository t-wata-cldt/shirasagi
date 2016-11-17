module Cms
  class Initializer
    Cms::Node.plugin "cms/node"
    Cms::Node.plugin "cms/page"
    Cms::Node.plugin "cms/import_node"
    Cms::Node.plugin "cms/archive"
    Cms::Node.plugin "cms/photo_album"
    Cms::Node.plugin "cms/group_page"
    Cms::Part.plugin "cms/free"
    Cms::Part.plugin "cms/node"
    Cms::Part.plugin "cms/page"
    Cms::Part.plugin "cms/tabs"
    Cms::Part.plugin "cms/crumb"
    Cms::Part.plugin "cms/sns_share"
    Cms::Part.plugin "cms/calendar_nav"
    Cms::Part.plugin "cms/monthly_nav"

    Cms::Role.permissions cms: {
                            sites: :edit,
                            groups: :edit,
                            roles: :edit,
                            members: :edit,
                            editor_templates: :edit,
                            # body_layouts: :edit,
                            tools: :use,
                            editor_extensions: :use,
                          }

    basic_roles = [:nodes, :pages, :parts, :layouts, :files, :notices, :page_searches].reduce({}) do |res,v|
      res[v] = {
        read: [:other, :private],
        edit: [:other, :private],
        delete: [:other, :private],
      }
      res
    end
    Cms::Role.permissions cms: basic_roles

    Cms::Role.permissions cms: {
                            pages: {
                              release: [:other, :private],
                              approve: [:other, :private],
                              move: [:other, :private],
                              unlock: :other },
                            nodes: {
                              move: [:other, :private], }, }

    SS::File.model "cms/editor_template", SS::File
    SS::File.model "cms/file", Cms::File
    SS::File.model "cms/page", SS::File
  end
end
