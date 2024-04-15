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

Product Spec

1. User Stories (Required and Optional)


Required Must-have Stories:

- [x] User can create an account, log in, and logout.
- [x] User can log workouts, including type, duration, and repetitions.
- [x] User can log their weight with every workout
- [x] User can create exercises
- [x] User should see every workout they log 


2. Screen Archetypes


Login Screen
- Required User Feature: User can log in.


Registration Screen
- Required User Feature: User can register an account.


Workout Log Screen
- Required User Feature: User can log and view past workouts.


Weight Tracking Screen
- Required User Feature: User can log and track their weight over time.


Routine Creation Screen
- Required User Feature: User can create and modify workout routines.


3. Navigation
Tab Navigation (Tab to Screen)

Home Feed
Workout Log
Weight Tracking
Profile

Flow Navigation (Screen to Screen)

Login Screen
- Leads to Home Feed

Registration Screen
- Leads to setup Screen

Setup screen
- Leads to Home feed

Workout Detail Screen
- Leads to Modifications and Historical Data

Wireframes

![draw](https://hackmd.io/_uploads/rJhVO2jAa.png)




Schema
Models

User

| Property       | Type     | Description                              |
| username       | String   | Unique id for the user                   |
| password       | String   | User's password for login authentication |
| email          | String   | User's email for account verification    |
| name           | String   | Name of the user                         |
| weight goal    | Int      | Weight goal for the user                 |
| current weight | Int      | current weight of the user               |

Workout
|Property	   |  Type	   |    Description                                 |
|workoutId	 |  String	 | Unique id for the workout session              |
|userId	     |  String	 | ID of the user who logged the workout          |
|date	       |  DateTime |	  Date and time when the workout was logged   |
|type	       |  String	 | Type of workout (e.g., Cardio, Strength)       |
|duration	   |  Number	 | Duration of the workout in minutes             |
|intensity	 |  String	 | Intensity of workout (Light, Moderate, Intense)|
|description |  String	 | Optional description of the workou             |

Networking
Home Feed Screen
- (Read/GET) Query logged workouts
- (Create/POST) Log a new workout

Workout Log Screen
- (Read/GET) Query all workouts
- (Update/PUT) Update workout details

Weight Tracking Screen
- (Read/GET) Query weight entries
- (Create/POST) Log a new weight entry
