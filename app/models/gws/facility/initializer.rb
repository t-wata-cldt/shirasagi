module Gws::Facility
  class Initializer
    Gws::GroupSetting.plugin Gws::Facility::GroupSetting, ->{ gws_facility_setting_path }

    Gws::Role.permission 'gws/facility' => {
                           items: {
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
