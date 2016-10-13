# Overtime App   

## High level requirement: 
Company needs documentation that salaried people did or did not get overtime each week. 

## Models and tables we will use:   
* User: devise (x)
* Post: date:date rationale:text (x)
* AdminUser: devise - STI (x) 

## Features:   
* (x) Users should not be able to Sign Up, as this is an internal app for an organization. Only their users are allowed to log in. Customize devise to achieve this.
* Approval workflow: Admin Users will be able to approve or reject the overtime Posts created by Employee Users
* SMS Sending: With link to Approval of overtime input
* (x) Administrate Admin Dashboard
* (x) Block non admin and guest users
* Email Summary to admin Users(aka managers) for approval
* Needs to be documented if employee did not do overtime.   

## Gems we will use:   
* Bootstrap: Basic UI design
* Devise: For login User module
* Twillio: For SMS sending
* Administrate: For Admin Users
* RSpec & Capybara: For unit and integration Testing


## Refractor TODOS:   
- Add full_name method for users (x)
- Refractor user association integration test in post_spec (x)
