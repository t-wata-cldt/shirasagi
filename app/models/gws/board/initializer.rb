module Gws::Board
  class Initializer
    Gws::GroupSetting.plugin Gws::Board::GroupSetting, ->{ gws_board_setting_path }

    Gws::Role.permissions 'gws/board' => {
                            posts: {
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
