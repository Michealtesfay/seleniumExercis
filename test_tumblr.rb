require 'selenium-webdriver'
require 'yaml'
browser = Selenium::WebDriver.for :firefox
browser.get "https://www.tumblr.com/login"
file = YAML.load_file('./details.yml')
 file["user"].each do |yaml_user|
 		browser.find_element(id: "signup_email").send_keys "#{yaml_user["email"]}" 
        browser.find_element(id: "signup_password").send_keys "#{yaml_user["password"]}"
    end

#singUpEmail = browser.find_element(id: "signup_email").send_keys "nightmar@live.co.uk" 
#singUpPassword = browser.find_element(id: "signup_password").send_keys "example2"
logInButton = browser.find_element(id: "signup_forms_submit").click
iconPostText = browser.find_element(class: "icon_post_text").click
textBoxSpace = browser.find_element(class: "editor-richtext").send_keys "Testing something here"
titleSpace = browser.find_element(class: "editor").send_keys "hello ruby"
click_button = browser.find_element(class: "create_post_button").click

#verification
body = browser.find_elements(class: "post_body")
body.each_with_index do |o, post| puts "your post is: #{o.text}"

  if o.text.match /Testing something here/
    puts  "Post #{post+1}: success"
  else  
    puts "Post #{post+1}: failure"
  end 
 end