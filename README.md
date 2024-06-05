# MovieDB

MovieDB is an iOS application built with SwiftUI that showcases Now Playing movies and Popular movies using data from the TMDB (The Movie Database) API. This app leverages the [NetworkSDK](https://github.com/Rimesh/NetworkSDK) to handle network operations.

## Features

- Display a list of Now Playing movies.
- Display a list of Popular movies.
- Detail view for each movie with additional information.

## Installation

**Configure API Key:**

Obtain an API key from [TMDB](https://developer.themoviedb.org/docs/getting-started) and add it to  `Config.xcconfig` file in the project with the following content:

```swift
API_KEY = YOUR_API_KEY
```
