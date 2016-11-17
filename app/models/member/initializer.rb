module Member
  class Initializer
    # login node
    Cms::Node.plugin "member/login"

    # registration node
    Cms::Node.plugin "member/registration"

    # mypage nodes
    Cms::Node.plugin "member/mypage"
    Cms::Node.plugin "member/my_profile"
    Cms::Node.plugin "member/my_blog"
    Cms::Node.plugin "member/my_photo"

    # public nodes
    Cms::Node.plugin "member/blog"
    Cms::Node.plugin "member/blog_page_location"
    Cms::Node.plugin "member/photo"
    Cms::Node.plugin "member/photo_search"
    Cms::Node.plugin "member/photo_category"
    Cms::Node.plugin "member/photo_location"
    Cms::Node.plugin "member/photo_spot"

    # anpi
    Cms::Node.plugin "member/my_anpi_post"
    Cms::Node.plugin "member/my_group"

    Cms::Part.plugin "member/login"
    Cms::Part.plugin "member/blog_page"
    Cms::Part.plugin "member/photo"
    Cms::Part.plugin "member/photo_search"
    Cms::Part.plugin "member/photo_slide"
    Cms::Part.plugin "member/invited_group"

    Cms::Role.permission member: {
                           blogs: {
                             read: [:other, :private],
                             edit: [:other, :private],
                             delete: [:other, :private],
                             release: [:other, :private],
                             approve: [:other, :private],
                           },
                           photos: {
                             read: [:other, :private],
                             edit: [:other, :private],
                             delete: [:other, :private],
                             release: [:other, :private],
                           },
                         }

    SS::File.model "member/photo", Member::PhotoFile
  end
end
