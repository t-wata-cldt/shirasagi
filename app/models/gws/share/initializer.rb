module Gws::Share
  class Initializer
    Gws::GroupSetting.plugin Gws::Share::GroupSetting, ->{ gws_share_setting_path }

    Gws::Role.permissions 'gws/share' => {
                            files: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                            },
                            categories: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                            },
                          }
  end
end
