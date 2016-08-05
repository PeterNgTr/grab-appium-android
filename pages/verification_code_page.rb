module VerificationCodePage

      def self.loaded?
        wait {id('com.grabtaxi.passenger:id/activate_pin_code').displayed?}
        id('com.grabtaxi.passenger:id/activate_pin_code').displayed?
      end

end
