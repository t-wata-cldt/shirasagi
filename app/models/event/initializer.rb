module Event
  class Initializer
    Cms::Node.plugin "event/page"
    Cms::Part.plugin "event/calendar"

    Cms::Role.permissions event: {
                            pages: {
                              read: [:other, :private],
                              edit: [:other, :private],
                              delete: [:other, :private],
                              release: [:other, :private],
                              approve: [:other, :private],
                              move: [:other, :private],
                            }}
  end
end
