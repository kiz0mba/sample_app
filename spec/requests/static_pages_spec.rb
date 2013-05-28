
require 'spec_helper'

describe "StaticPages" do
   subject { page } #Capybara: Tells that this is the subject of tests
	
   #let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  describe "Home Page" do
  
    before { visit root_path }
	
    it { should have_selector('h1',text:'Sample App') } 
    
    it { should have_selector('title',:text => full_title("")) }
 
    it { should_not have_selector('title',:text => "| Home")  }

  end

  describe "Help Page" do

    before { visit help_page}

    it { should have_selector('h1','Help') }
    
    it { should have_selector('title',text: full_title(""))}

    it { should_not have_selector('title',text :"| Help")}

  end

  describe "About Page" do

	before {visit about_page}

 	it { should have_selector('h1','About Us') }

 	it { should have_selector('title', text: full_title("")) }

	it { should_not have_selector('title',text: "| About")  }
    	
  end
 describe "Contact Page" do

	before {visit contact_page}
 	
	it { should have_selector('h1','Contact') }

 	it { should have_selector('title',text:full_title("")) }

	it { should_not have_selector('title',
				:text => "| Contact")}
  end

end
end
