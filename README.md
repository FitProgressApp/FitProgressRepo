FitProgress

Description

FitProgress is a comprehensive workout and weight tracking app designed for fitness enthusiasts, gym-goers, and anyone seeking a structured approach to improve their physical fitness. This app allows users to log exercises, track weight progression, create custom workout routines, and set fitness goals. It provides visualizations of progress through charts and graphs and offers suggestions for workout adjustments based on user performance. FitProgress aims to be a unified platform for tracking, analysis, and improvement recommendations to support users in achieving their fitness goals.

App Evaluation

Category: Health & Fitness
Mobile: This app is primarily developed for mobile use, taking advantage of features such as notifications, camera, and GPS when appropriate.

Story: Helps users to track their workout and weight progress, visualize their achievements, and stay motivated on their fitness journey.

Market: Aimed at fitness enthusiasts, gym-goers, and those looking to monitor their physical progress closely.

Habit: This app is designed for daily use, encouraging users to log their workouts and weight consistently.

Scope: FitProgress starts as a focused app for workout and weight tracking, with the potential to expand into a broader health and fitness platform.

GIF - Video

https://www.loom.com/share/ff65e0bed2d7490aae9fbdc6493bc20a

Product Spec

1. User Stories (Required and Optional)


Required Must-have Stories:

- [x] User can create an account, log in, and logout.
- [x] User can log workouts, including type, duration, and repetitions.
- [x] User can create exercises
- [x] User should see every workout they log

Optional Stories
- [x] User can change their weight on the profile screen
- [x] User can see the weight change as they browse the gyms


2. Screen Archetypes


Login Screen
- Required User Feature: User can log in.


Registration Screen
- Required User Feature: User can register an account.


Workout Log Screen
- Required User Feature: User can log and view past workouts.


Profile View Screen
- Required User Feature: User can view their information: username, display name, weight goal, current weight
- Required User Feature: User can update weight on profile view


Workout Feed Screen:
- Required User Feature: Displays buttons for each individual workout, user should be able to click on it and see the details of the exercise


3. Navigation
Tab Navigation (Tab to Screen)

Login Screen
Signup screen
Workout Feed
Workout Display
Workout Log
Profile

Flow Navigation (Screen to Screen)

Login Screen
- Leads to workout feed if user signs in
- If user wants to sign up, leads to registration screen

Signup Screen
- Leads to workout feed when user signs up with valid credentials

Workout Feed
- Leads to screen where exercise details are shown
- Can navigate to workout log page or profile page

Workout Detail Screen
- Leads back to the workout feed

Workout Log:
- Can navigate to profile page or workout feed

Profile page:
- Leads to signin screen if user decides to log out
- Can navigate to workout log or workout feed

Wireframes


![wireframe](https://github.com/FitProgressApp/FitProgressRepo/assets/133716455/93517b47-db78-4bef-a825-680ddedfb365)



Schema
Models

User

Property, Type, Description
- username, String, Unique id for the user
- password, String, User's password for login authentication
- email, String, User's email for account verification
- name, String, Name of the user
- weight goal, Int, Weight goal for the user   
- current weight, Int, current weight of the user          

Workout
- Property, Type, Description                           
- title, String, Title for the exercise                    
- type, String, Type of workout (e.g., Cardio, Strength)   
- duration, Number, Duration of the workout in minutes        
- sets, Int, Amount fo sets worked out in exercise       
- repetitions, Int, Amount of repetitions per set of exercise    
- user, User, User that associates with the workout        

Networking

Each screen in the application interfaces with our backend services to perform specific networking tasks essential for functionality:

- **LoginScreen**: Executes a POST request to authenticate users.
- **SignupScreen**: Performs a POST request to register new users and their data.
- **WorkoutFeed**: Uses GET requests to fetch a list of user-specific workouts.
- **WorkoutLog**: Sends POST requests to log new workouts into the system.
- **Profile**: Retrieves user data with a GET request and updates user information using PUT requests when changes are made.
- **WorkoutDetail**: Utilizes a GET request to fetch detailed information on a specific workout.
