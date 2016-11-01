# Overtime App   

## High level requirement: 
Company needs documentation that salaried people did or did not get overtime each week. 

## Models and tables we will use:   
* (x) User: devise
* (x) Post: date:date rationale:text
* (x) AdminUser: devise - STI
* AuditLog: To document if employee logs in overtime or not.

## Features:   
* (x) Users should not be able to Sign Up, as this is an internal app for an organization. Only their users are allowed to log in. Customize devise to achieve this.
* (x) Approval workflow: Admin Users will be able to approve or reject the overtime Posts created by Employee Users
* (x) SMS Sending: With link to Approval of overtime input
* (x) Administrate Admin Dashboard
* (x) Block non admin and guest users
* Email Summary to admin Users(aka managers) for approval
* Needs to be documented if employee did not do overtime.   
* Create Audit Log for text message.

## Gems we will use:   
* Bootstrap: Basic UI design
* Devise: For login User module
* Twillio: For SMS sending
* Administrate: For Admin Users
* RSpec & Capybara: For unit and integration Testing


## Refractor TODOS:   
- (x) Add full_name method for users
- (x) Refractor user association integration test in post_spec
- (x) Refactor posts/form for admin user with status.

## The Approval workflow:  
User submits a post. The *state* is *submitted*    
- (x) Case 1: The Admin approves it. The *state* is locked.
- (x) Case 2: The Admin rejects it. The *state* is rejected. The User gets to edit his post again.

## The Audit Log:  
Keep track if an employee had overtime or not.
Dependencies:  
	- User
Attr:
	- Status:int (enum) -> [ Pending, Complete ]
	- start_date:date -> default previous Monday
	- date_verified

<strong>ToDO:</strong>   
	- (x) Add a status/state to Post.
	- Overtime Post should not be submitted for the week if AuditLog has been confirmed saying no overtime was done for that week.
	- Audit Log status should differentiate between overtime submitted or no overtime for that week. 
