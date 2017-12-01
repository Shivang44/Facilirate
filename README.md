# Project 6
### Ruby on Rails Project

### Roles
* Overall Project Manager: Matt Deavers
* Coding Manager: Hunter Bernhardt
* Testing Manager: Nishant Rimal
* Documentation Manager: Shivang Saxena

###Project Description
    For this project, the team created an OSU facilities rating site, a.k.a. Facilirate. Using Devise to manage user accounts,  

###Running the Project

    The following steps should be followed in order to run this project (Also see the Notes section below):

    1. Clone the repository
    2. In the terminal, navigate to the facilirate directory and run the following commands
        bundle install
        rake db:migrate
        rake db:seed
        rails s
    3. In the browser, navigate to localhost:3000
    4. Create an account using the link at the top right of the home page

    Once these steps are complete, you will be logged in and on the home page. From here, you can search for rooms and post reviews (a room will not appear unless a review has been created for it already! Note that room numbers are not confirmed as existing to allow for unusual rooms and rooms without numbers). From your account page, you can edit your account and edit/delete posts you have made.

###Notes
    -When entering fields into the reviews/search fields, click on the auto-complete text to auto-fill. DO NOT press enter, as this will submit the entire form as is. (And you will receive an error message if you were making a post that was incomplete at the time you pressed enter.)


###Test Plan

    The team tested the website by each validating the code of each built page and clicking each of the links on every page. Futhermore, the team met to agree upon design decisions and were approved as a group to serve as the "testing" of the design.

### Contributions

    Matt Deavers (Overall Project Manager): Implemented Devise user account management, repaired and cleaned up controllers and views throughout. Repaired user account creation with error, then refresh on resulting page requesting an invalid path via routing to user_controller#refresh. 

    Nishant Rimal (Testing Manager):


    Hunter Bernhardt (Coding Manager): Wrote the controller code to find all buildings and facility types for the home page, give the information needed from the table for the user's account page and to delete reviews from the table. Also designed the HTML/CSS to format most of the pages to be similar and wrote the partial for the posts to have the same format. On top of that, pair programmed with Shivang to set up the initial tables for the project and write the seed file to have preset reviews.

    Shivang Saxena (Documentation Manager):

    Dil Raju
