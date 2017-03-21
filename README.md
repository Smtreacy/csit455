# BookOrder App
######(Tentative Name)
###Final project for CSIT445

This is a Rails based application. A working version of **Ruby (2.2.2 or higher)** and **Rails (~5.0.1)** is required to run this application.

To see all necessary dependencies, please view the [Gemfile](/Gemfile) for more information. In most cases, building dependencies is as easy as running `bundler` or `bundle install`

###Useful Links:
Some useful links are outlined below to get you up and running with rails:

* [Ruby on Rails Home](https://rubyonrails.org)
* [Rails Guides - Getting Started](https://http://guides.rubyonrails.org/getting_started.html)
    - long tutorial, but definitely worth the time
* [SASS Basics](https://http://sass-lang.com/guide)
* [Rbenv](https://github.com/rbenv/rbenv)
    - a simple program to make installing Ruby very fast and easy. 
    
###Windows Users

To my Windows friends, good luck. Installing Rails can be a real pain. My recommendation is to set up Bash on Ubuntu on Windows
and run all the rails commands from the terminal. However there are some hoops to jump through in order to get the application working.
For example, Windows Bash (the aforementioned) does not support filewatchers, which rails uses while Puma is running to auto-load the site.
In order to get around this one would need to disable Listen from the command line.

Of course it is also possible to install Rails natively on Windows, though I personally was never able to make one work on Windows 10.
Either way, please **ensure** you have Rails version 5 otherwise the application will not work. I highly recommend biting the bullet
and working from a Linux OS either in a VM, LiveUSB or a native Linux OS, but to each their own!

