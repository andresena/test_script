require 'selenium'
require 'spec_helper'

describe "Functional Tests Cases for User Creation" do
  before(:each) do
    visit "https://podio.com/"
  end
  
  describe "Creating a valid user" do  
    fill_in "user_mail", :with => "aaaaaa@gmail.com"    
    click_button "signup-button"
    page.should have_content "Verify your email address to keep your account secure."
    page.should have_content "You have mail."
    page.should have_content "We've sent your confirmation email to"
    page.should have_content "aaaaaa@gmail.com"
  end
   
  describe "Trying to create a user through invalid email" do  
    fill_in "user_mail", :with => "aaa"    
    click_button "signup-button"
    page.should have_content "The mail address aaa is not valid"    
  end
  
  describe "Login in Podio system using valid user already created" do  
    click_link "Sign in."  
    page.should have_content "Email:"	  
    page.should have_xpath("//input[@id='email']")  
    page.should have_content "Password:"
    page.should have_xpath("//input[@id='password']")     
    page.should have_link('I forgot my password')	     
    page.should have_content "Don't have an account?:"  
    page.should have_link('Sign up')	
    select 'email', :from => 'andre.sena@gmail.com'  
    select 'password', :from => 'British_4545'
    click_button "Login"  
    page.should have_link('Podio')
    page.should have_xpath("//div[@class='default-title'] 'Go to a workspace...'")
    page.should have_xpath("//span[@class='icon-hover icon-16 icon-16-white-home']")	
    page.should have_xpath("//span[@class='icon-hover icon-16 icon-16-white-contacts']")
    page.should have_xpath("//span[@class='icon-hover icon-16 icon-16-white-calendar']")
    page.should have_xpath("//span[@class='icon-hover icon-16 icon-16-white-tasks']")
    page.should have_xpath("//div[@class='icon-nav icon-nav-blue-help']")	
    page.should have_xpath("//div[@class='icon-nav icon-nav-blue-search']")	
    page.should have_xpath("//div[@class='icon-nav icon-nav-blue-my-account']")	
  end  
end
