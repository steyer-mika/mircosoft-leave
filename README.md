# Microsoft Leave - Workout and Exercise Documentation System

## Overview
Microsoft Leave is a project aimed at facilitating the documentation of workouts and exercises for users. This system allows users to record their workouts, track exercises, and monitor their progress over time. The system is built using .NET WPF forms with ADO .NET for data access.

## Features
- **User Management**: Users can create accounts and manage their personal information.
- **Workout Tracking**: Users can record details of their workouts including date, duration, calories burned, and additional notes.
- **Exercise Documentation**: Users can document various exercises including their name, description, and track the amount performed during each workout.
- **Data Management**: The system utilizes a relational database to store user information, workouts, exercises, and user-specific exercise details.

## Database Structure
The system utilizes the following database schema:

1. **Users**: Stores information about users such as username, email, date of birth, gender, height, weight, and join date.
2. **Workouts**: Stores details of workouts including workout date, duration, calories burned, and notes. It has a foreign key reference to the Users table.
3. **Exercises**: Contains information about exercises such as exercise name and description.
4. **UserExercises**: Associates users with specific exercises performed during workouts. It includes the amount of exercise performed and any additional notes.

## Getting Started
To set up the system locally, follow these steps:

1. **Database Setup**: Execute the provided SQL script to create the necessary tables in your database.
2. **Project Setup**: Clone the repository and open the project in your preferred IDE.
3. **Configuration**: Update the database connection string in the application configuration file to point to your database.
4. **Build and Run**: Build the project and run the application to start using Microsoft Leave.

## Technologies Used
- **.NET WPF**: Framework for building desktop applications with rich user interfaces.
- **ADO .NET**: Data access technology for connecting to and working with databases.
- **SQL Server**: Relational database management system used to store application data.

## Contributions
Contributions to the project are welcome. Feel free to fork the repository, make improvements, and submit pull requests.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
