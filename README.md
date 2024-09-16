# Flutter App with Supabase and Clean Architecture

This project is a **Flutter** application that leverages **Supabase** as the backend service. The app is designed with **Clean Architecture** principles to ensure maintainability, scalability, and a clear separation of concerns. It utilizes the **BLoC (Business Logic Component)** pattern for effective state management, providing seamless interaction between the UI and business logic.

## Features

- **Supabase Integration**: Provides database management, authentication, and real-time capabilities.
- **Clean Architecture**: Ensures clear separation of layers (presentation, domain, and data) for maintainability and scalability.
- **BLoC Pattern**: Efficient state management, keeping business logic separate from the UI.
- **Responsive Design**: Adapts to different screen sizes for a smooth user experience across devices.
- **Real-time Data**: Utilizes Supabase’s real-time features for immediate updates across the app.

## Project Structure

The project follows **Clean Architecture** principles:

- **Presentation Layer**: Contains the UI components (widgets) and BLoC files responsible for state management.
- **Domain Layer**: Contains business logic and entities.
- **Data Layer**: Manages data sources and repositories (Supabase integration).



## Getting Started

1. Clone the repository:
    ```bash
    git clone https://github.com/your-repo.git
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Set up **Supabase**:
    - Go to [Supabase](https://supabase.io) and create an account.
    - Create a new project and copy your API URL and API Key.
    - Add them to your environment variables or directly into the app's configuration file.

4. Run the app:
    ```bash
    flutter run
    ``` 
## Contributing

Feel free to submit issues and pull requests!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.