#Contribution Guide
######This is a guide to help users contribute to the project safely and efficiently

###Guidlines:
- In general, this project follows a centralized workflow (as described [here](https://git-scm.com/book/en/v2/Distributed-Git-Distributed-Workflows)).
In this design the main contributors added to the repository have full permissions to read and write to origin/master.
This means that contibutors should **always** `git fetch origin` **before** pushing, and especially before force pushing 
(which will cause quite a mess if not handled properly). 
Please refain from the `git push origin/<branch_name> --force` approach when possible. 

- New features of the app should be added in a new branch and developed in tandem with the master branch. In other words, if you are adding functionality to add books into the database from the app,
create a new branch (both local and remote ideally, so others can get what you've been working on if you need help or something) and then merge into master
when it is fully functional. This allows us to maintain integrity of the application between all of us, rather than cloning a broken application to our working versions.

For beginners to git and using remotes the [Git Documentation](https://git-scm.com/doc) is easily the best resource online for training (from the terminal, that is).

Happy contributing!