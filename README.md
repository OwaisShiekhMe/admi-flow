# AdmiFlow

An Ed-Tech mobile application built with Flutter, Riverpod, and MVVM designed to streamline school admissions and recruitment workflows.

## 🚀 Key Features

* **Parent Portal:** Register children for school admission and track application updates.
* **Faculty Portal:** Submit detailed CVs and job applications to registered schools.
* **Principal Dashboard:** Review incoming student admission requests and evaluate faculty CVs in real time.

## 🛠 Tech Stack & Architecture

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **Architecture:** MVVM (Model-View-ViewModel) + Service Layer
* **State Management:** Riverpod 2.0
* **Networking:** Dio HTTP Client

## 📁 Project Structure

```text
admi_flow/
├── lib/
│   ├── core/               # Global configuration, utilities, and styling
│   ├── model/              # Data models (Student, Faculty, Application entities)
│   ├── reusable_components/# Common UI widgets and buttons
│   ├── services/           # API layer and network endpoints
│   ├── view/               # UI screens (Parent, Faculty, Principal modules)
│   ├── view_model/         # Riverpod providers and state handlers
│   └── main.dart           # Entry point
└── test/                   # Automated tests
