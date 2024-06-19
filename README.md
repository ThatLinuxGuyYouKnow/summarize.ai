# AI Summarizer App

## Overview
The AI Summarizer App is a Flutter application designed to summarize articles using AI technology. Users can input the link to an article, and the app will provide a concise summary of the content.

## Features
- Input an article link to get a summary.
- View the summarized content on a separate screen.
- Visual indicators for loading states.
- State management to handle summary availability.

## Project Structure
The project is structured into various components, each responsible for different functionalities within the app. Below is a breakdown of the key files and their roles:

### Main Application Entry Point
- **main.dart**
  - Initializes the application and sets up the `SummaryNotifier` using `MultiProvider`.
  - Loads environment variables using `flutter_dotenv`.
  - Sets `SummarizerScreen` as the home screen of the app.

### Screens
- **summarizerScreen.dart**
  - Main screen where users input the article link.
  - Contains the logic to handle the summarization process, display loading indicators, and navigate to the summary screen.

- **summaryScreen.dart**
  - Displays the summarized content of the article.
  - Uses a `ReusableAppBar` for consistent UI.

### State Management
- **summary_alert.dart**
  - Defines the `SummaryNotifier` class, a `ChangeNotifier` that manages the state of summary availability.
  - Methods include `alertSummaryIsAvailable` to notify listeners when a summary is ready.

### AI Interactions
- **gpt_functions.dart**
  - Contains functions to interact with the AI model for summarizing articles.
  - Uses a function `summarizeArticleSequence` to process the article URL and return the summary.

### Reusable Components
- **button.dart**
  - Defines a reusable button component used across different screens.
  
- **appBar.dart**
  - Defines a reusable app bar component for consistent navigation.
  
- **resuableTextField.dart**
  - Defines a reusable text field component for input fields.

## Technical Description

### State Management
State management in this app is handled using the `Provider` package, specifically with a `ChangeNotifier` class, `SummaryNotifier`. This notifier maintains the state of whether a summary is available or not. The state is updated and notified through the `alertSummaryIsAvailable` method.

- **summary_alert.dart**: Contains the `SummaryNotifier` class that extends `ChangeNotifier`.
  - `summaryIsAvailable`: A boolean to track if a summary is ready.
  - `alertSummaryIsAvailable`: Method to update `summaryIsAvailable` and notify listeners.

In `main.dart`, the `SummaryNotifier` is provided at the root of the widget tree using `ChangeNotifierProvider`. This allows any widget in the tree to listen for changes and react accordingly, ensuring a reactive UI.

### User Interface
The user interface is built using Flutter widgets. The main screen (`SummarizerScreen`) includes:
- An input field for the article link.
- A button to trigger the summarization process.
- A loading indicator while the summary is being generated.
- A conditional button to navigate to the `SummaryScreen` if a summary is available.

### Navigation
Navigation between screens is handled using Flutter's `Navigator` class. When the summarization process completes, and if the summary is available, the user can navigate to `SummaryScreen` to view the summary.

## How to Run
1. Clone the repository.
2. Install the required dependencies using `flutter pub get`.
3. Set up your `.env` file with necessary environment variables.
4. Run the app using `flutter run`.

## Dependencies
- Flutter
- Provider
- Google Fonts
- flutter_dotenv

## Conclusion
This README provides a comprehensive overview of the AI Summarizer App, detailing the project structure, state management, user interface components, and navigation. For a deeper understanding, refer to the specific files mentioned above.

**Note:** No code snippets are included in this README as per the given instructions.
