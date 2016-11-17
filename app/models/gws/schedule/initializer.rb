module Gws::Schedule
  class Initializer
    Gws::GroupSetting.plugin Gws::Schedule::GroupSetting, ->{ gws_schedule_setting_path }
    Gws::User.include Gws::Schedule::UserSetting

    Gws::Role.permissions 'gws/schedule' => { holidays: :edit }
    Gws::Role.permissions 'gws/schedule' => {
                            plans: {
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
