# Ardha

While Asana is a great web app, its mobile application is far from awesome. Hoping to create some grassroots movement for a great Asana client, I present you Ardha. Ardha is a highly asynchronous, block-based iOS framework for accessing the Asana API. 

This is still a very primitive framework. The goal for this first release is to be able to create a simple to-do app on Asana infrastructure. Chakrasana is an example of such a project using Ardha, listing out all your projects and tasks to do.

## Usage

To use Ardha in your project, drag and drop the `Ardha.xcodeproj` file in your project's *Frameworks* group and link the libArdha.a library to your project. Set up the *User Header Search Path* to recursively search the folder in which Ardha is placed. The model header files should then become available in your project. Import `Ardha.h` whenever you connect to Asana. Finally, create an `Ardha.plist` file, with an entry `AsanaAPIKey` containing the API key obtained from Asana and initialize the singleton by adding it to your app's delegate:

	 [Ardha sharedArdha];

[Asana's documentation](http://developers.asana.com/documentation) provides more detail about their API and the API keys. It may clarify some design decisions on my part.
	
## In works

Currently the following features are being developed:
 
 * Complete Asana API implementation - current implementation is a scaffolding for further work and implements only the most basic methods,
 * Core Data support - to minimize the amount of developer-side logic that needs to be implemented to keep a coherent data set,
 * KVO-based updates - to minimize the effort necessary to maintain a synchronized database between the app and the service,
 * Documentation - to make the usage of specific methods and models clearer.
 
## License

Ardha is by Bogo Giertler. Ardha is available under the MIT license. See the LICENSE file for more info.