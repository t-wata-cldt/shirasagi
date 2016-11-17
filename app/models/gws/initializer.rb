module Gws
  class Initializer
    Gws::GroupSetting.plugin Gws::GroupSetting::System, ->{ gws_system_setting_path }

    Gws::Role.permissions gws: {
                            groups: :edit,
                            users: :edit,
                            user_titles: :edit,
                            roles: :edit,
                            histories: :read,
                            job: :read,
                          }

    Gws::Role.permissions gws: {
                            custom_groups: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                            },
                            notices: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                            },
                            links: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                            }
                          }

    SS::File.model "share/file", Gws::Share::File
  end
end
