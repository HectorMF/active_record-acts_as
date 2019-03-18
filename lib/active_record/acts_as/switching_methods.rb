module ActiveRecord
  module Actable
    module InstanceMethods
      def actable
        begin
          return self.public_send(self.current_role)
        rescue NoMethodError => e
          return nil
        rescue => e
          print_exception(e, false)
        end  
      end

      def specific
        self.actable
      end
    end
  end
end
