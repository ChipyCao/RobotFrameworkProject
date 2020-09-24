 
   *** Settings ****
Library | SeleniumLibrary

*** Variables *** 
${USERNAME}  standard_user 
${PASSWORD}  secret_sauce



*** Keywords *** 	
Login
	input text   user-name  ${USERNAME}
    input text   password  ${PASSWORD}
	click button   login-button

Add items to the cart
	click button   //*[@id="inventory_container"]/div/div[6]/div[3]/button
	click button   //*[@id="inventory_container"]/div/div[5]/div[3]/button
Go to Checkout
	click element   //*[@id="shopping_cart_container"]
    click element   //*[@id="cart_contents_container"]/div/div[2]/a[2]
Submit Credentials
	input text   first-name   prenume
    input text   last-name   nume
    input text   postal-code   4201337
Price Check and Finalisation
	click element   //*[@id="checkout_info_container"]/div/form/div[2]/input
    element text should be  //*[@id="checkout_summary_container"]/div/div[2]/div[7]   Total: $25.90
    click element   //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

*** Test cases ***
Plasare Comanda
   Open Browser	 https://www.saucedemo.com/	chrome
   Login
   Add items to the cart
   Go to Checkout
   Submit Credentials
   Price Check and Finalisation
   
   close browser