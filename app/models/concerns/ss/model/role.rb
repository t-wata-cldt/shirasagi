module SS::Model::Role
  extend ActiveSupport::Concern
  extend SS::Translation
  include SS::Document
  include SS::Reference::User

  included do
    cattr_accessor(:_permission_names) { [] }
    cattr_accessor(:_module_permission_names) { {} }

    seqid :id
    field :name, type: String
    field :permissions, type: SS::Extensions::Words

    permit_params :name, permissions: [] #TODO:

    validates :name, presence: true, length: { maximum: 80 }

    scope :search, ->(params) {
      criteria = where({})
      return criteria if params.blank?

      criteria = criteria.keyword_in params[:keyword], :name if params[:keyword].present?
      criteria
    }
  end

  module ClassMethods
    def mod_name(mod)
      I18n.t("modules.#{mod}")
    end

    def permission(name, opts = {})
      module_name = opts[:module_name] || name.to_s.sub(/^[a-z]+_(private_|other_|users_|member_)?(.*?)_.*/, '\\2')
      module_name = :"#{module_name}"

      self._permission_names << name.to_s
      self._module_permission_names[module_name] ||= []
      self._module_permission_names[module_name] << name
    end

    # 権限名は:
    # ${アクション}_(${権限範囲})?_${モジュール名}_${リソース}
    # なので、以下のように構造化して一気に登録:
    # {
    #  ${モジュール}: {
    #   ${リソース}: {
    #    ${アクション}: [${権限範囲}]
    #   }
    #  }
    # }
    # または、権限範囲なしの場合
    # {
    #  ${モジュール}: {
    #   ${リソース}: [${アクション}*]
    #  }
    # }
    def permissions mods
      mods.each do |mod,resources|
        mod = mod.to_sym

        # モジュール単位の権限名のリスト
        mod_res = (self._module_permission_names[mod] ||= [])

        # gwsでの'/'を'_'に置き換え
        mod_key = mod.to_s.gsub /[\/]/, '_'

        resources.each do |res,acts|
          if acts.kind_of? Hash # 4層
            acts.each do |act,perms|
              [perms].flatten.each do |perm|
                raise "invalid permission: #{perm}" if
                  [:private, :other, :users, :member].find{|v| v == perm}.nil?
                name = "#{act}_#{perm}_#{mod_key}_#{res}".freeze
                self._permission_names << name
                mod_res << name.to_sym
              end
            end
          else # 3層
            [acts].flatten.each do |act|
              name = "#{act}_#{mod_key}_#{res}".freeze
              self._permission_names << name
              mod_res << name.to_sym
            end
          end
        end
      end
    end

    def permission_names
      _permission_names.sort
    end

    def module_permission_names(opts = {})
      permissions = _module_permission_names.sort_by { |k, v| k }.map do |mod, names|
        [mod, names.sort_by { |name| name.to_s.split('_').reverse.join } ]
      end.to_h

      return separate_names(permissions) if opts[:separator]
      permissions
    end

    def separate_names(permissions)
      permissions.each do |mod, names|
        new_names = []
        last_name = nil
        names.each do |name|
          cur_name = name.to_s.sub(/.*?#{mod.to_s.tr('/', '_')}_/, '')
          new_names << :separator if last_name.present? && cur_name != last_name
          new_names << name
          last_name = cur_name
        end
        permissions[mod] = new_names
      end
      permissions
    end
  end
end
