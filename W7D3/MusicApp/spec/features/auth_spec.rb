feature "the signup process" do

    scenario "has a new user page" do
      visit new_user_url
      expect(page).to have_content "Sign Up Page"
    end
  
    feature "signing up a user" do
      before(:each) do
        visit new_user_url
        fill_in 'email', :with => "test@example.com"
        fill_in 'password', :with => "hunter12"
        click_on "Create Account"
      end
  
      scenario "redirects to bands index page after signup" do 
        expect(page).to have_content "Bands"
      end
    end
  
    feature "with an invalid user" do
      before(:each) do
        visit new_user_url
        fill_in 'Email', :with => "test@example.com"
        click_on "Create Account"
      end
  
      scenario "re-renders the signup page after failed signup" do 
        expect(page).to have_content "Sign Up Page"
      end
    end
  
  end