# WhatsApp Clone

**WhatsApp Clone** is a fully functional chat application built with **Flutter** for the frontend and **Firebase** for the backend. This app mimics core features of WhatsApp, such as real-time chat, media sharing, user authentication, and push notifications. It allows users to send and receive messages, create groups, and share images and videos, all in real-time.

This project leverages **Flutter** for building a cross-platform mobile app (iOS & Android) and **Firebase** to handle authentication, real-time messaging, cloud storage, and notifications.

## Features

- **User Authentication**  
  Users can sign up and log in using their phone number via **Firebase Authentication**. The app uses phone number verification to ensure secure registration and login.

- **Real-Time Messaging**  
  Chat messages are exchanged in real-time using **Firebase Firestore** as the database. Users can send text, images, and videos, with real-time updates for sent and received messages.

- **Group Chats**  
  Users can create and join groups, send group messages, and share media files with all group members.

- **Push Notifications**  
  **Firebase Cloud Messaging (FCM)** sends push notifications to users when they receive new messages or group notifications.

- **Media Sharing**  
  Users can send and receive images, videos, and other media. The media is stored in **Firebase Storage** for easy retrieval.

- **Profile Customization**  
  Users can update their profile picture, status, and other details, which are stored in **Firebase Firestore**.

- **Real-Time Presence**  
  Displays the status of users (online/offline) and when they were last seen, using **Firebase Firestore**.

## Tech Stack

- **Frontend**  
  - **Flutter** for building a cross-platform mobile app (iOS & Android).  
  - **Dart** as the primary programming language for the app.
  - **Provider** for state management (optional, but recommended for managing global states such as user authentication).

- **Backend**  
  - **Firebase Authentication** for secure user authentication via phone number.  
  - **Firebase Firestore** for real-time chat data storage (messages, users, groups).
  - **Firebase Cloud Messaging (FCM)** for sending push notifications to users.
  - **Firebase Storage** for storing media files (images, videos, etc.).

- **Local Storage**  
  - **SharedPreferences** (or similar) for storing app settings like user authentication state and local preferences.

## Setup Instructions

To get started with **WhatsApp Clone**, follow these steps:

### 1. Clone the Repository

```bash
git clone https://github.com/pukarnepali/whatsapp_clone.git
cd whatsapp_clone
