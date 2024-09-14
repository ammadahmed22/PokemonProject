PokémonProject
Welcome to the PokémonProject project made by Ammad Ahmed, a SwiftUI application designed to fetch and display Pokémon data using a modern, user-friendly interface. This README provides essential information on the libraries used, the app architecture, and how to build and run the application.

Libraries Used
SwiftUI: Chosen for building a native iOS user interface to ensure smooth, performant animations and a native look and feel.
Alamofire: Selected for network requests due to its powerful, yet simple API for handling HTTP network operations.
Kingfisher: This library is used for downloading and caching images from the web, essential for efficiently handling Pokémon images in our app.

App Architecture
The PokémonProject app is structured around the Model-View-ViewModel (MVVM) architecture pattern to ensure a clean separation of concerns and to enhance the manageability and scalability of the codebase.

Model: Defines the data structures for Pokémon and detailed Pokémon data, adhering to the Codable protocol for easy serialization and deserialization of JSON data.
View: SwiftUI views are used to create the user interface. The main view (PokemonMainView) manages the display of a grid of Pokémon, each of which can be tapped to view more details in PokemonDetailView.
ViewModel: PokeViewModel serves as an intermediary between the model and the view, handling all business logic, including network requests to fetch data from the Pokémon API using Alamofire.


Building and Running the App
To build and run the PokémonProject app, please follow make sure your running Xcode Version 15.3

If not then open the compress zip, go to project and right click and hit Show Package Contents. 
It will take to 3 files, open project.pbxproj once opened change objectVersion to 46 and save and quit. 
Now you should be able to open the project with a previous version of Xcode. 



