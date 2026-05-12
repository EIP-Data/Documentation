---  
  
title: Beta Test Plan  
  
subtitle: Datalyz  
  
author: Tom Blancheton, Mathieu Coulet, Cyprien Diederichs, Côme Terlecki  
  
module: G-EIP-700  
  
version: 1.0  
  
---  
  
## **1. Project context**  
  
### Data  
  
5.56 billion people use the Internet and generate personal data.  
  
Personal data has become an essential component of the digital age.    
Every day, users share a massive amount of information online, whether voluntarily or not. This data includes browsing habits, preferences, social interactions, and sensitive information.    
It is collected and analyzed to provide a more personalized experience, but also for commercial or security purposes. The ubiquity of personal data raises crucial questions about user privacy and protection.  
  
### Problematic  
  
How can we provide researchers with the necessary tools and resources to focus on analysis?  
  
### Description  
  
Dataliz is a toolset designed to empower researchers to focus on data analysis rather than data collection. Researchers simply deploy the tool to their users, enabling the automatic gathering of large-scale browser and interaction data. The platform highlights how individual user behavior contributes to overall patterns, while providing researchers with structured insights to support the creation of final analytical reports.  
  
The result: greater focus on analysis, not data gathering.  
  
## **2. User Roles**  
  
The following roles will be involved in beta testing.  
  
| **Role Name** | **Description** |  
|--------|----------------------|  
| User | Provides browser and interaction data by using the tool during normal web activity. The user’s actions contribute anonymously to the overall dataset used for analysis. |  
| Scientist | Deploys and manages the tool to collect large-scale interaction data, analyzes aggregated and individual contribution patterns, and produces structured analytical reports based on the collected insights. |  
| Admin | Admin is a sub-role of Scientist and inherits all Scientist permissions. In addition, this role can manage Scientist accounts, including creating, deleting, and modifying accounts, as well as assigning administrative privileges. |  
  
---  
  
## **3. Feature table**  
  
All of the listed features will be demonstrated during the beta presentation  
  
| **Feature ID** | **User role** | **Feature name** | **Short description** |  
|--------------|---------------|-------------------------|--------------------------------------|  
| F1 | User | Account creation | Create an account using email, first name, last name, birthdate, and password |  
| F2 | User | Login | Log in using email and password |  
| F3 | User | Dashboard view | Can see his contributions towards the general data collection operated by the searchers |  
| F4 | User | Email verification | Verify email during registration |  
| F5 | User | Manage user profile | Edit or delete user account |  
| F6 | User | Logout | Log out of the application, extension |  
| F7 | User | Installation VPN | Install VPN on device (mobile, tablet) |  
| F8 | User | Installation Proxy | Install Proxy on device (mobile, tablet) |  
| F9 | User | Login to te Proxy | Login to the Proxy |  
| F10 | User | Activate / Deactivate the Proxy | Activate and Deactivate the proxy on the device |  
| F11 | User | Internet Access | Access to internet after login to into the proxy|  
| F12 | User | Account Deletion | Can choose to delete his account when he desires |  
| F13 | User | Consent management | Accept, withdraw, or update consent regarding data collection and processing |  
| F14 | User | Data Deletion | Allow the user to request the removal of their contributed data from the aggregated dataset |  
| F15 | Scientist | Login | Can log in using their email and password |  
| F16 | Scientist | Dashboard access | Can access generated dashboards displaying collected and analyzed data |  
| F17 | Scientist | Logout | Can securely log out of the application 
| F18 | Admin | Role management | The admin can promote a user to the Scientist role |
| F19 | Admin | Account deletion | The admin can delete an existing user account |
| F20 | Admin | Role management | The admin can promote a Scientist to the Admin role to grant additional permissions |
| F21 | Admin | Management dashboard | Can access a management panel to view and modify Scientist profiles |  
| F22 | User | Password recovery | Can request a password reset via email |  
| F23 | Scientist | Password recovery | Can request a password reset via email |  
| F24 | Admin | Audit log | Can view a log of account and role management actions |  
| F25 | User | Data summary | Can view a summary of the types and volume of data contributed |  
  
---  
  
## **4. Success criteria**  
  
| **Feature ID** | **Key success criteria** | **Indicator/metric** | **Result** |  
| -------------- | ----------------------------------------------------------------- | -------------------------------------------- | -------------------------------------------------------------- |  
| F1 | A user can create an account without errors | 5 registrations, 0 blocking errors | User account was created successfully without errors |  
| F2 | A user logs in using email and password successfully | 5 login attempts, 0 failures | Successful login to the application using email and password |  
| F3 | The user dashboard displays contribution data correctly | Dashboard loads and shows contribution data | User contributions are displayed correctly |  
| F4 | Email verification is triggered and validated correctly | 5 registrations, 5 verified emails | Verification emails were sent and validated correctly |  
| F5 | User profile changes are saved and reflected immediately | 5 edits/deletions, all effective | Profile changes were saved and immediately reflected |  
| F6 | Logging out ends the session and blocks access to protected pages | 5 logouts, 0 session leaks | User session ended correctly and protected pages were blocked |  
| F7 | A user can download the profil of the vpn on the device (mobile, tablet) | 5 download attempts, 0 blocking errors | The user can see the profil installed in the parameters of the device |  
| F8 | A user can download the profil of the proxy on the device (mobile, tablet)| 5 download attempts, 0 blocking errors | user can see the profil installed in the parameters of the device |  
| F9 | The user can login to the proxy on the device (mobile, tablet) | 5 login attempts, 0 blocking errors | Successful login to the proxy using the user account |  
| F10 | User can activate and deactivate the proxy in the device parameters | 5 activation/deactivation, 0 blocking errors | Successful connected or unconnected to the proxy |  
| F11 | User can access to internet after login to the proxy with his account| 5 pages renders, 0 blocking errors| Render the internet pages |  
| F12 | The user can delete their account successfully | Account no longer accessible after deletion | User account was deleted successfully |  
| F13 | The user can manage consent preferences | Consent changes saved and visible in settings | Consent preferences were updated successfully |  
| F14 | The user can request deletion of contributed data | Data removal request visible in system logs | Data deletion request was registered successfully |  
| F15 | The scientist can log in successfully | 5 login attempts, 0 failures | Scientist logged in successfully |  
| F16 | The scientist can access analytical dashboards | Dashboards load and display data | Analytical dashboards were displayed successfully |  
| F17 | The scientist can log out securely | Session invalidated after logout | Scientist session ended successfully |  
| F18 | The admin can promote a user to scientist | Role updated in management panel | User role was updated successfully | 
| F19 | The admin can delete a user account | Deleted account cannot log in | Account was deleted successfully | 
| F20 | The admin can promote a scientist to admin | Role updated in management panel | User role was updated successfully | 
| F21 | The admin can access the management dashboard | Dashboard loads with gathered data | Management dashboard functioned correctly 
| F22 | The user can request a password reset | Password reset email received | Password reset process completed successfully |  
| F23 | The scientist can request a password reset | Password reset email received | Password reset process completed successfully |  
| F24 | The admin can view audit logs | Log entries visible for recent actions | Audit logs were displayed successfully |  
| F25 | The user can view a data contribution summary | Summary page displays data types and volumes | Data summary was displayed successfully |
