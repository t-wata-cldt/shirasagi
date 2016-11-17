module Article
  class Initializer
    Cms::Node.plugin "article/page"
    Cms::Part.plugin "article/page"

    Cms::Role.permissions article: {
                           pages: {
                             read: [:other, :private],
                             edit: [:other, :private],
                             delete: [:other, :private],
                             release: [:other, :private],
                             approve: [:other, :private],
                             move: [:other, :private],
                             unlock: :other,
                           }}

    SS::File.model "article/page", SS::File
  end
end
