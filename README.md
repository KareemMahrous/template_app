# Template

## Overview

This Flutter application template provides a structured foundation for building scalable and maintainable applications. It integrates essential components such as state management with BLoC, GraphQL and RestAPI integration, dependency injection, and localization. The template follows a modular architecture to promote code organization and reusability, making it ideal for starting new projects or refactoring existing ones.

## Features

 - Modular Architecture: Organized into distinct modules for commands, contracts, core functionalities, queries, routing, blocs, and widgets.
 - State Management with BLoC: Implements the BLoC pattern for managing application state and business logic.
 - GraphQL Integration: Configured to work with GraphQL APIs for efficient data fetching and mutation handling.
 - RestAPI Integration: Ready for integration with RestAPIs for additional data sources and backend communication.
 - Dependency Injection: Utilizes GetIt for managing dependencies and promoting loose coupling.
 - Localization: Supports internationalization with ARB files and includes base translations for English and Arabic.
 - Extensible and Customizable: Designed to be easily extended and customized according to specific project requirements.
  
## Folder Structure
lib
├── app
│   ├── commands
│   ├── contracts
│   ├── core
│   │   ├── base_types
│   │   └── primitives
│   ├── queries
│   └── routing
├── bloc_observer.dart
├── core
│   ├── constants
│   ├── extensions
│   ├── generated
│   │   ├── l10n
│   │   │   └── langs
│   ├── network
│   │   ├── dio
│   │   ├── errors
│   │   ├── graph
│   ├── theme
│   └── utils
├── di_container.dart
├── domain
│   ├── entities
│   └── repos
├── infrastructure
│   ├── data_source
│   │   ├── abstractions
│   │   └── implementations
│   └── repo
├── main.dart
└── presentation
    ├── bloc
    │   ├── auth
    ├── view
    └── widget