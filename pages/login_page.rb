module LoginPage
      def self.loaded?
        wait { text('Log in with mobile number').displayed? }
      end

      def self.mobile_login_click
        loaded?
        wait { text('Log in with mobile number').click }
      end
end

