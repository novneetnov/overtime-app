# Overtime App   

## High level requirement: 
Company needs documentation that salaried people did or did not get overtime each week. 

## Models and tables we will use:   
* Post: date:date rationale:text
* User: devise
* AdminUser: devise 

## Features:   
* Approval workflow: Admin Users will be able to approve or reject the overtime Posts created by Employee Users
* SMS Sending: With link to Approval of overtime input
* Administrate Admin Dashboard
* Email Summary to admin Users(aka managers) for approval
* Needs to be documented if employee did not do overtime.   

## Gems we will use:   
* Bootstrap: Basic UI design
* Devise: For login User module
* Twillio: For SMS sending
* Administrate: For Admin Users
* RSpec & Capybara: For unit and integration Testing
