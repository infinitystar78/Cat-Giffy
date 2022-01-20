# Cat-Giffy


# Instructions

   Requirements:
  * Xcode 13.2 / Swift 5.5 
  * iOS >= 15.0 
  * Swift Package Manager


# Objectives

The application is required to do the following :

1. Display Cat Gifs from The Cat API
2. This project solely uses SwiftUI.
3. Allows the user to select between Gifs and static images.
4. Implements an infite scroll / pagination.


# Architecture

The application is fairly straightforward, but essentially is a basis MVVM structure that could be scaled up following thei architecture.

As the app uses SwiftUI , any logic in the ContentView has been split into a separate function called from the Views, so as to allow testing. Additinally the model implements text strings and communicates with the networking layer.

The networking layer follows a protocol based approach, using URLSession, and also has been written in a way to allow testing. Combine has been used, as this is a good approach in pure SwiftUI application.

The token / secret for the API is stored in a config file, to allow easier obfuscation for security purposes and follows a common pattern used by Apple.

Basic tests have been included for the networking layer and the logic in the main View and the ViewModel.

For the display of static images, the new AsyncImage struct is used to display images from the network.


# Libraries

1. FLAnimatedImage  - To allow the displaying of GIFs as these are not suppported natively in an easy manner.


# Next Steps - Challenges

# Next Steps - Further Development / TODO

* Improve test coverage by writing additinoal tests for the networking layer using mock objects and stubs.
* Possibly split out some of the component views from the main ContentView to allow these views to be easily resusable.
* Could add offline ususage , using Core Data.

Tools:

A gitignore file has been included to exclude the config file from the commit for security purposes.
