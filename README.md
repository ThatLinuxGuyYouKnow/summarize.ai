AI Summarizer

Welcome to the AI Summarizer application! This app allows users to input an article link and receive a summarized version of the content using advanced AI techniques. The app is built using Flutter and leverages state management to ensure smooth and responsive user interactions.
Table of Contents

    Overview
    Features
    Installation
    Usage
    Relevant Files
    Technical Description

Overview

The AI Summarizer app provides a user-friendly interface for summarizing articles. By pasting an article link into the app, users can quickly generate a summary, which can then be viewed in a dedicated summary screen.
Features

    Article Summarization: Paste an article link and get a summarized version of the content.
    State Management: Efficient state management to handle loading states and summary availability.
    Clean UI: User-friendly interface with reusable components for consistency.

Installation

To install and run the AI Summarizer app locally, follow these steps:

    Clone the repository:

    bash

git clone https://github.com/yourusername/aisummarizer.git

Navigate to the project directory:

bash

cd aisummarizer

Install dependencies:

bash

flutter pub get

Run the app:

bash

    flutter run

Usage

    Open the app.
    Paste the article link into the provided text field.
    Click the "Summarize" button to generate the summary.
    View the summary by clicking the "View Summary" button once the summary is available.

Relevant Files

Here is a list of key files relevant to the functionality of the AI Summarizer app:

    Main Application Entry Point: main.dart
    State Management: summary_alert.dart
    Summarizer Screen: summarizerScreen.dart
    Summary Screen: summaryScreen.dart
    Reusable Components:
        AppBar: appBar.dart
        Button: button.dart
        TextField: resuableTextField.dart
    AI Interactions: gpt_functions.dart

Technical Description
State Management

The app uses the Provider package for state management, specifically through the ChangeNotifier class. The main state management logic is implemented in the SummaryNotifier class (summary_alert.dart), which handles the state of whether a summary is available.

    SummaryNotifier: This class extends ChangeNotifier and includes a boolean property summaryIsAvailable to track the availability of the summary. The alertSummaryIsAvailable method sets this property to true and calls notifyListeners to update the UI accordingly.

UI Structure

    Summarizer Screen (summarizerScreen.dart): This screen is the main interface where users input the article link and trigger the summarization process. It uses various reusable components for consistency in design.
    Summary Screen (summaryScreen.dart): This screen displays the generated summary. It is navigated to when the user clicks the "View Summary" button after a summary is available.

Interactions with AI

    GPT Functions (gpt_functions.dart): This file contains functions that interact with the GPT model to generate the article summary. The summarization process is triggered asynchronously when the user clicks the "Summarize" button.

Reusable Components

The app includes several reusable UI components to maintain a consistent design and simplify code maintenance:

    ReusableAppBar: Custom app bar used across different screens.
    ReusableButton: Custom button widget with configurable properties.
    ReusableTextField: Custom text field for user input.
