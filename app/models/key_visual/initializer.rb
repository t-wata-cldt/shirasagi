module KeyVisual
  class Initializer
    Cms::Node.plugin "key_visual/image"
    Cms::Part.plugin "key_visual/slide"

    Cms::Role.permissions 'key_visual' => {
                            images: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                            }
                          }

    SS::File.model "key_visual/image", SS::File
  end
end
