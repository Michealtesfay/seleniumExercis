require 'selenium-webdriver' 
 browser = Selenium::WebDriver.for :firefox  
 browser.get "http://amazon.co.uk" 
serarchtextBox = browser.find_element(id: "twotabsearchtextbox").send_keys "Elequent Ruby" 
submitButton = browser.find_element(class: "nav-input").click
serarchtextBox = browser.find_element(class: "a-color-price" )
puts serarchtextBox.text 
browser.quit 
