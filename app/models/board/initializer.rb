module Board
  class Initializer
    Cms::Node.plugin "board/post"
    Cms::Node.plugin "board/anpi_post"

    Cms::Role.permissions board: {
                            posts: [:read, :edit, :delete],
                            anpi_posts: [:read, :edit, :delete],
                          }

    SS::File.model "board/post", Board::File
  end
end
