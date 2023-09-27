# Pokedex-Lite
A Lite Pokédex application that uses the pokeapi api (https://pokeapi.co/)

## Current functionality:
The app currently provides very limited functionality. We list the first 100 pokemon from the API in a locally searchable list.
You can also view limited details for each pokemon

### Functionality I'd like to add
If time was permitting there's a few things I'd like to add to the application:
- Pagination so that we could display more than just the first 100 pokemon as the API does seem to support pagination quite well
- Localisation - The API does support localization to some level so it would be great to add handling to support multiple languages
- Dynamic searching: Instead of just searching the local results, I'd like to query the API itself
- Caching. Although the images are being cached, I had originally intended to cache the Pokemon data as well, however, after seeing how fast the API calls actually were, I decided that this was less urgent but is something I would still like to add.
(Note: The repository currently serves an identical purpose to the `Service` layer for this reason. Once caching is implemented, the purpose of the repository would be more visible)
- Better model handling. To save time, I created one model for the response that is used across the application. However, the data structure of these models leaves a lot to be desired. Ideally I would map the models received to our own custom models that were easier to work with.
- More details on the details screen: eg. displaying Evolution lines that let you visit other pokemon details directly

## Technical notes:
- The application has been split into multiple modules using Swift Packages. 
- All logic within the app has been unit tested
- MVVM
- A custom Dependency Container has been used for Dependency Injection
- Attempts were made to use the latest iOS technology where possible (SwiftUI, Async/Await, etc)
- `Lottie` was used for a fun animated loading screen

## App Preview:
![](https://github.com/Zamo22/Pokedex-Lite/blob/main/App%20Preview.gif)
