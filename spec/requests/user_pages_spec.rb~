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
    
    describe "with invalid information" do
    
      it "should not create a user" do #Equals send an empty form
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }
          it { should have_selector('title', text: 'Sign up')}
	
          it { should have_content( 'error' ) }
	  
	  it { should have_selector('li', text: "* Password can't be blank") }

	  it { should have_selector('li', text: "* Name can't be blank") }

	  it { should have_selector('li', text: "* Email can't be blank") }

	  it { should have_selector('li', text: "* Email is invalid") }

	  it { should have_selector('li', 
		text: "* Password is too short (minimum is 6 characters)") }

	  it { should have_selector('li', text: "* Password confirmation can't be blank") }
	  
      end
      #describe "check error passwords that don't match" do
      #  before { click_button submit }
      #  fill_in "Name", 	with:"Willy E. Coyote"
      #  fill_in "Email", 	with:"willy@acme.canion.us"
      #  fill_in "Password",	with:"abcdefg"
      #  fill_in "Confirmation", with:"1234567" 
 
#	it { should have_selector('li', text: "* Password doesn't match confirmation")}
#      end	 
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
      describe "after saving a user" do
        before { click_button submit}

        let(:user) { User.find_by_email("willy@acme.canion.us") }
  
        it { should have_selector('title', text: user.name ) }

        it { should have_selector('div.alert.alert-success', text: 'Welcome' ) }

      end
    end
  end
end
