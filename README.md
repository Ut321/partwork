# Quotes App

This is a Flutter application that displays real-time quotes fetched from the Binance API. The application follows the Flutter Bloc pattern and uses a clean architecture approach. It is designed to showcase the implementation of a real-time data fetching and displaying mechanism using Flutter and the Bloc pattern.

## Project Overview

The Quotes App fetches real-time quotes for the BTCUSDT trading pair from the Binance API and displays them in a user-friendly interface. The application is built using Flutter, a cross-platform framework for building mobile applications.

The project follows the Bloc pattern, which is a state management solution for Flutter applications. It separates the presentation layer from the business logic, making the code more modular, testable, and maintainable.

The application also follows a clean architecture approach, which separates the project into layers: data, domain, and presentation. This approach promotes separation of concerns, making the code more organized and easier to maintain.

## Implementation Details

The project is implemented using the following components:

1. **Data Layer**: This layer contains the data sources and repositories. The `BinanceDataSource` is responsible for fetching data from the Binance API, while the `BinanceRepository` provides an abstraction over the data source.

2. **Domain Layer**: This layer contains the entities, use cases, and repository interfaces. The `Quote` entity represents a quote object, the `GetQuotes` use case encapsulates the logic for fetching quotes, and the `BinanceRepository` interface defines the contract for fetching quotes.

3. **Presentation Layer**: This layer contains the UI implementation and the Bloc implementation. The `QuotesScreen` is the main UI component that displays the quotes, while the `QuotesBloc` manages the state of the quotes screen.

The project also utilizes the `flutter_bloc` package for implementing the Bloc pattern and the `dio` package for making API requests.
![Quotes App Screenshot](https://github.com/Ut321/partwork/raw/main/assets/Screenshot_2024-04-27-12-43-05-20_991c6ae33fa8cb114f365509ad12e629.png)



## Features

- Real-time data fetching from the Binance API
- User-friendly UI for displaying quotes
- Periodic data refresh every 5 seconds
- Error handling and loading state management
- Modular and testable code structure

## Future Enhancements

- Implement search functionality for quotes
- Add watchlist and favorites functionality
- Implement chart visualization for quote history
- Improve error handling and display more informative error messages
- Add unit tests and integration tests

