This is an example project for working with Robot Framework in Python.  The website used for this is https://www.automationexercise.com/. 
# Test Structure
The general structure of the framework composes:
1. `/pages/` Files for the storing texts to be used as element selectors
2. `/keywords/` Files for custom keywords for common set of actions that can be re-used throughout tests
3. `/tests/` Files for the actual tests

# Storing Variables
1. When creating new pages, always add _page as a suffix to the file name.
2. When using variables, store them in the page folder but put it in the correct .py file. (e.g., the "CHECKOUTBUTTON" variable should be in checkout_page.py).
3. When naming a variable, use uppercase letters. 
4. Create a variable only when it is going to be used more than once. 
5. Ensure the variable name is clear and understandable. 
6. If the variable name does not clearly explain its purpose, add comments to clarify. 
7. Avoid duplicate variable names unless they are in a different page files. (i.e., Search button for page 1 uses a different selector from page 2, both can be named search_btn if they are in a different page files) 
8. Use consistent suffixes for variable names based on their type or purpose (e.g., CHECKOUT_BTN for buttons, USERNAME_TXT for text fields, COUNTRY_LABEL for labels or verification elements). 
9. If there are extensive changes need to reuse existing variables, create a new one instead.
10. Define commonly used values as constants in a constants.py and import them as needed.

# Using Keywords
1. When creating new keywords, always add _keyword as a suffix to the file name.
2. Existing keyword files are as follows:
   1. `action_keywords` file for keywords dealing with active actions against web elementgs
   2. `verification_keywords` file for keywords dealing with verifying text attributes, elements, etc.
   3. `api_keywords` file for keywords for setting up data through api
3. If there are extensive changes need to reuse existing keywords, create a new one instead.
4. Ensure the keyword name is clear and understandable. 
5. If the keyword name does not clearly explain its purpose, add comments to clarify. 

# CHROMEDRIVER
1. Always check chromedriver.exe version and update as needed

