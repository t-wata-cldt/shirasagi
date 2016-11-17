module Ads
  class Initializer
    Cms::Node.plugin "ads/banner"
    Cms::Part.plugin "ads/banner"

    Cms::Role.permissions ads: {
                            banners: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                            }}

    SS::File.model "ads/banner", SS::File
  end
end
