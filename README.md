# Ardha

While Asana is a great web app, their mobile application is far from awesome. Hoping to create some grassroots movement for a great Asana client, this is an iOS framework for accessing the API of the Asana service. The goal for this release is to be able to create a to-do app on Asana infrastructure. Chakrasana is an example of such a project using Ardha.

## Usage

To use Ardha in your project, drag and drop the `Ardha.xcodeproj` file in your project's Frameworks group and link the libArdha.a library to your project. The model header files should then become available in your project. Next, create an `Ardha.plist` file, with an entry `AsanaAPIKey` containing the API key obtained from Asana. [Asana's documentation](http://developers.asana.com/documentation) provides more detail about their API.

The available models are so far:

 * AObject - an abstract Asana object
 * AUser - an implementation of Asana's User object
 * AWorkspace - an implementation of Asana's Workspace object
 * ATask - an implementation of Asana's Task object
 * AProject - an implementation of Asana's Project object
 * AStory - an implementation of Asana's Story object

## In works

Currently the following features are being developed:
 
 * Core Data support - to minimize the amount of developer-side logic that needs to be implemented to keep a coherent data set,
 * KVO-based updates - to minimize the effort necessary to maintain a synchronized database between the app and the service,
 * Documentation - to make the usage of specific methods and models clear.
 
## License

Ardha is available under the MIT license. See the LICENSE file for more info.