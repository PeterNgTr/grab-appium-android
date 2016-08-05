require File.expand_path('spec/spec_helper')

describe 'Register' do
  before :each do
    LoginPage.loaded?
    LoginPage.mobile_login_click
  end

  context 'click mobile login button' do
    it 'should display the register page' do
      expect(RegisterPage.loaded?).to eq(true)
    end
  end

  context 'input valid info to register' do
    it 'should enable the Next button' do
      RegisterPage.input_info
      expect(RegisterPage.is_next_enabled?).to eq(true)
    end

    context 'continue to register with valid info' do
      it 'should display the verification code page' do
        RegisterPage.input_info
        RegisterPage.click_next
        expect(VerificationCodePage.loaded?).to eq(true)
      end
    end
  end


end