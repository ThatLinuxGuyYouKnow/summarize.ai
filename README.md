# AI Summarizer App

This repository contains the code for an AI-based summarizer application built using Flutter. The app allows users to input a link to an article, and it generates a summary using AI.

## Features

- Paste an article link to get a summary.
- View the generated summary in a separate screen.
- State management using the `Provider` package.
- Custom reusable components for UI consistency.

## State Management

The app uses the `Provider` package for state management. The main state management class is `SummaryNotifier`, which is responsible for notifying listeners when a summary is available.

### Relevant Files

- **`lib/State Management/summary_alert.dart`**: Defines the `SummaryNotifier` class used for state management.
- **`lib/summarizerScreen.dart`**: Main screen where users can input the article link and get the summary.
- **`lib/summaryScreen.dart`**: Screen that displays the generated summary.
- **`lib/main.dart`**: Entry point of the app where the `Provider` is set up.

## Running the App

To run the app, follow these steps:

1. **Clone the repository**:
    ```sh
    git clone https://github.com/your-username/aisummarizer.git
    cd aisummarizer
    ```

2. **Install dependencies**:
    ```sh
    flutter pub get
    ```

3. **Run the app**:
    ```sh
    flutter run
    ```

## App Structure

The app is structured as follows:

- **Reusable Components**:
  - `lib/Reusbale Components/button.dart`: Custom button widget.
  - `lib/Reusbale Components/appBar.dart`: Custom app bar widget.
  - `lib/Reusbale Components/resuableTextField.dart`: Custom text field widget.

- **Screens**:
  - `lib/summarizerScreen.dart`: Main screen for inputting the article link and viewing the summary.
  - `lib/summaryScreen.dart`: Screen for displaying the summary.

- **State Management**:
  - `lib/State Management/summary_alert.dart`: Contains the `SummaryNotifier` class.

- **AI Interactions**:
  - `lib/ai_interactions/gpt_functions.dart`: Functions for interacting with the AI to generate summaries.

## Technical Description

### `SummaryNotifier`

The `SummaryNotifier` class extends `ChangeNotifier` and manages the state for whether a summary is available. It provides a method `alertSummaryIsAvailable` to update this state and notify listeners.

### Main Screen (`SummarizerScreen`)

This screen allows users to input the article link and triggers the summarization process. It uses a `TextEditingController` to manage the input and a `Consumer<SummaryNotifier>` to react to state changes.

### Summary Screen (`SummaryScreen`)

This screen displays the summary text generated by the AI. It receives the summary text as a parameter and shows it in a scrollable view.

## Environment Setup

Make sure to set up the environment file (`.env`) with the necessary configurations.

## Contribution

Feel free to fork this repository and contribute by submitting a pull request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License.
