# **📌 Privilee Project Documentation**

## **🚀 Project Overview**

This Privilee project follows **Clean Architecture** combined with **MVVM (Model-View-ViewModel) pattern**. It utilizes **Provider** for state management and features **efficient API handling** with proper testing strategies.

---

## **🛠 Project Architecture**

### **Clean Architecture + MVVM**

The project is structured into multiple layers to maintain modularity and scalability:

### **1️⃣ Presentation Layer**

- UI components and ViewModels.
- Manages UI state using **Provider**.

### **2️⃣ Domain Layer**

- Contains **business logic** and **use cases**.
- Acts as an intermediary between UI and Data layers.

### **3️⃣ Data Layer**

- Handles API interactions and data sources.
- Implements repositories to abstract external dependencies.

This architecture ensures **testability, maintainability, and separation of concerns**.

---

## **🚀 How to Run the Application**

### **1️⃣ Install Dependencies**

**Run:**
flutter pub get
flutter run

**Running on Specific Platforms**

**Android**
flutter run -d android

**iOS**
flutter run -d ios

**Web**
flutter run -d chrome

**Testing Approach**
This project includes both manual and automated testing using flutter_test, Mockito, and Mocktail.
Types of Tests Implemented
✅ Widget Testing - Ensures UI elements render correctly.
✅ Unit Testing - Validates ViewModel logic and state updates.
✅ API/HTTP Testing - Uses Mockito & Mocktail to simulate API calls without hitting real endpoints.
Running Tests
Execute:
flutter test

**Third-Party Libraries Used**
**State Management**

- Provider – Used for efficient state management.

**Testing**

- Mockito & Mocktail – Helps mock API calls and dependencies.
- flutter_test – Provides built-in testing framework for widgets.

**UI Enhancements**

- Various UI libraries for design improvements.
- video_player – Handles media playback.

**Design Decisions & Challenges Faced**

**Key Design Choices**

- MVVM enhances modularity by keeping UI separate from logic.
- Provider simplifies state management while keeping performance optimal.
- Mocked API requests improve testing by avoiding external dependencies.

**Challenges Encountered**

- Extracting API Data – Parsing JSON responses and managing dynamic structures.
- Handling Async Code – Ensuring smooth UI updates with FutureBuilders and ChangeNotifiers.

**Conclusion**
This project is built using Flutter, Clean Architecture, MVVM, and Provider to ensure scalability and efficiency. It includes unit, widget, and API testing to maintain high-quality code.
