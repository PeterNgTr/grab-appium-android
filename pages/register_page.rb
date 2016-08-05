module RegisterPage

  @register_name_id         = 'com.grabtaxi.passenger:id/register_name'
  @register_email_id        = 'com.grabtaxi.passenger:id/register_email'
  @register_country_code_id = 'com.grabtaxi.passenger:id/register_country_code'
  @register_phone_number_id = 'com.grabtaxi.passenger:id/register_phone_number'
  @default_info             = { name:     Faker::Name.first_name + ' ' + Faker::Name.last_name,
                                email:    Faker::Internet.safe_email,
                                phone_no: Faker::Base.numerify('91#######') }

  def self.loaded?
    wait { id(@register_name_id).displayed? }
    id(@register_name_id).displayed?
  end

  def self.input_info
    self.loaded?
    wait { id(@register_name_id).send_keys @default_info[:name] }
    wait { id(@register_email_id).send_keys @default_info[:email] }
    wait { id(@register_country_code_id).click }
    wait { text('Vietnam (VN)').click }
    wait { id(@register_phone_number_id).send_keys @default_info[:phone_no] }
    sleep 2
  end

  def self.is_next_enabled?
    wait { id('com.grabtaxi.passenger:id/register_next').enabled? }
    id('com.grabtaxi.passenger:id/register_next').enabled?
  end

  def self.click_next
    id('com.grabtaxi.passenger:id/register_next').click
  end
end