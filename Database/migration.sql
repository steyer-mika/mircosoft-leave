-- Create the Users table to store information about users

DROP TABLE IF EXISTS Exercises;
DROP TABLE IF EXISTS Workouts;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    UserName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    Height DECIMAL(5, 2), -- Height in meters
    Weight DECIMAL(5, 2), -- Weight in kilograms
    JoinDate DATETIME DEFAULT GETDATE()
);


-- Create the Workouts table to store information about workouts
CREATE TABLE Workouts (
    WorkoutID INT PRIMARY KEY IDENTITY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    WorkoutDate DATE,
    DurationMinutes INT,
    CaloriesBurned INT,
    Notes NVARCHAR(MAX)
);


-- Create the Exercises table to store information about exercises
CREATE TABLE Exercises (
    ExerciseID INT PRIMARY KEY IDENTITY,
    ExerciseName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
);

DROP TABLE IF EXISTS UserExercises;

-- Create the UserExercises table to store user-specific exercises
CREATE TABLE UserExercises (
    UserExerciseID INT PRIMARY KEY IDENTITY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    ExerciseID INT FOREIGN KEY REFERENCES Exercises(ExerciseID),
    Sets INT,
    Reps INT,
    Weight DECIMAL(5, 2), -- Weight in kilograms
    Notes NVARCHAR(MAX)
);

-- Create indexes for foreign keys to optimize query performance
CREATE INDEX idx_Workouts_UserID ON Workouts(UserID);
CREATE INDEX idx_UserExercises_UserID ON UserExercises(UserID);
CREATE INDEX idx_UserExercises_ExerciseID ON UserExercises(ExerciseID);