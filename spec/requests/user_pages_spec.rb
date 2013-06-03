require 'spec_helper'

describe "UserPages" do
 
  subject { page }	 

  describe "signup page" do
  
  before { visit signup_path }	
   	
    it { should have_selector('h1',text: 'Sign up')}

    it { should have_selector('title',text: full_title('Sign up'))}

  end

  describe "signup page" do
    let(:user) { FactoryGirl.create(:user) }

    before { visit user_path(user) }
    
    it { should have_selector('h1',text: user.name ) }
    it { should have_selector('title',text: user.name ) }
  end

  describe "signup" do
    before { visit signup_path }
    #Create my account is the label for the button
    # that creates a new user, 
    let(:submit) {"Create my account"}
    #Equals send an empty form
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    describe "with valid information" do
      before do # FactoryGirl should be useful
        fill_in "Name", 	with:"Willy E. Coyote"
        fill_in "Email", 	with:"willy@acme.canion.us"
        fill_in "Password",	with:"beep-beep"
        fill_in "Confirmation", with:"beep-beep"
      end 

      it "should create a user" do
        expect { click_button submit }.to change(User,:count).by(1)
      end
    end
  end
end
