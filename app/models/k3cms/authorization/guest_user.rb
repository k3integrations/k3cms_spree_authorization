module K3cms
  module Authorization
    class GuestUser
      def initialize
        @@k3cms_permission_sets = Rails.application.railties.engines.
          collect {|e| e.class.authorization.default_suggested_permission_set}.
          compact
      end
      
      def k3cms_permitted?(perm)
        k3cms_permissions.include?(perm)
      end
      
      def k3cms_permissions
        @@guest_perms ||= @@k3cms_permission_sets.compact.inject([].to_set) {|result, permission_set|
          result + permission_set.guest}
      end
      
      def k3cms_guest?
        true
      end
    end
  end
end
