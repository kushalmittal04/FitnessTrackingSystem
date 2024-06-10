CREATE DATABASE FitnessTrackingSystem;
USE FitnessTrackingSystem;

CREATE TABLE Users (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Password VARCHAR(100)
);

INSERT INTO Users (Name, Email, Password)
VALUES
    ('John Doe', 'john@example.com', 'password123'),
    ('Jane Smith', 'jane@example.com', 'password456'),
    ('Alice Johnson', 'alice@example.com', 'password789'),
    ('Bob Williams', 'bob@example.com', 'password321'),
    ('Emily Brown', 'emily@example.com', 'password654'),
    ('Michael Davis', 'michael@example.com', 'password987'),
    ('Sarah Wilson', 'sarah@example.com', 'password1234'),
    ('David Taylor', 'david@example.com', 'password5678'),
    ('Olivia Martinez', 'olivia@example.com', 'password9012'),
    ('Daniel Thompson', 'daniel@example.com', 'password3456');

CREATE TABLE Workouts (
    Workout_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Category VARCHAR(50)
);

INSERT INTO Workouts (Name, Description, Category)
VALUES
    ('Running', 'Run for 30 minutes at a moderate pace.', 'Cardio'),
    ('Weight Lifting', 'Work on biceps and triceps for 45 minutes.', 'Strength'),
    ('Yoga', 'Practice yoga poses for flexibility and relaxation.', 'Flexibility'),
    ('Cycling', 'Bike ride for 1 hour on a stationary bike.', 'Cardio'),
    ('HIIT', 'High-intensity interval training for 20 minutes.', 'Cardio'),
    ('Swimming', 'Swim laps in the pool for 45 minutes.', 'Cardio'),
    ('Pilates', 'Focus on core strength and stability for 30 minutes.', 'Strength'),
    ('Zumba', 'Dance workout for 45 minutes with upbeat music.', 'Cardio'),
    ('CrossFit', 'High-intensity functional movements for 1 hour.', 'Strength'),
    ('Barre', 'Ballet-inspired workout for toning muscles.', 'Flexibility');

CREATE TABLE DietPlans (
    Plan_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Duration INT
);

INSERT INTO DietPlans (Name, Description, Duration)
VALUES
    ('Balanced Diet', 'Balanced diet with a mix of proteins, carbs, and fats.', 30),
    ('Vegetarian Diet', 'Diet plan excluding meat and fish.', 30),
    ('Low Carb Diet', 'Diet plan focusing on low carbohydrate intake.', 30),
    ('Keto Diet', 'High-fat, low-carb diet aimed at achieving ketosis.', 30),
    ('Paleo Diet', 'Diet plan based on foods presumed to have been available to Paleolithic humans.', 30),
    ('Intermittent Fasting', 'Cycle between periods of eating and fasting.', 30),
    ('Mediterranean Diet', 'Diet inspired by the traditional eating habits of people living in Mediterranean countries.', 30),
    ('Gluten-Free Diet', 'Diet plan excluding gluten-containing foods.', 30),
    ('Vegan Diet', 'Diet plan excluding all animal products.', 30),
    ('Detox Diet', 'Diet plan aimed at cleansing the body of toxins.', 30);

CREATE TABLE WorkoutLogs (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Workout_ID INT,
    Date DATE,
    Duration INT,
    Calories_Burned INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID)
);

INSERT INTO WorkoutLogs (User_ID, Workout_ID, Date, Duration, Calories_Burned)
VALUES
    (1, 1, '2024-05-01', 30, 200),
    (2, 2, '2024-05-02', 45, 300),
    (3, 3, '2024-05-03', 60, 250),
    (1, 4, '2024-05-04', 60, 400),
    (2, 5, '2024-05-05', 20, 150),
    (3, 6, '2024-05-06', 45, 350),
    (1, 7, '2024-05-07', 30, 250),
    (2, 8, '2024-05-08', 45, 300),
    (3, 9, '2024-05-09', 60, 400),
    (1, 10, '2024-05-10', 60, 450);

CREATE TABLE DietLogs (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Plan_ID INT,
    Date DATE,
    Meal_Details TEXT,
    Calorie_Intake INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Plan_ID) REFERENCES DietPlans(Plan_ID)
);

INSERT INTO DietLogs (User_ID, Plan_ID, Date, Meal_Details, Calorie_Intake)
VALUES
    (4, 1, '2024-05-01', 'Breakfast: Oatmeal, Lunch: Grilled chicken salad, Dinner: Baked salmon with quinoa', 1800),
    (5, 2, '2024-05-02', 'Breakfast: Fruit smoothie, Lunch: Vegetable stir-fry, Dinner: Lentil soup', 1500),
    (6, 3, '2024-05-03', 'Breakfast: Scrambled eggs with avocado, Lunch: Tofu salad, Dinner: Grilled vegetables', 1600),
    (4, 4, '2024-05-04', 'Breakfast: Greek yogurt with berries, Lunch: Turkey wrap, Dinner: Grilled steak with veggies', 2000),
    (5, 5, '2024-05-05', 'Breakfast: Chia seed pudding, Lunch: Vegetable curry, Dinner: Cauliflower rice bowl', 1700),
    (6, 6, '2024-05-06', 'Breakfast: Almond butter toast, Lunch: Chickpea salad, Dinner: Stuffed bell peppers', 1800),
    (4, 7, '2024-05-07', 'Breakfast: Whole grain toast with avocado, Lunch: Mediterranean salad, Dinner: Grilled fish with couscous', 1900),
    (5, 8, '2024-05-08', 'Breakfast: Smoothie bowl, Lunch: Quinoa salad, Dinner: Ratatouille', 1600),
    (6, 9, '2024-05-09', 'Breakfast: Overnight oats, Lunch: Veggie wrap, Dinner: Lentil stew', 1700),
    (4, 10, '2024-05-10', 'Breakfast: Protein pancakes, Lunch: Buddha bowl, Dinner: Tofu stir-fry', 2000);

CREATE TABLE Progress (
    Progress_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Date DATE,
    Weight DECIMAL(5, 2),
    Body_Fat_Percentage DECIMAL(5, 2),
    Notes TEXT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

INSERT INTO Progress (User_ID, Date, Weight, Body_Fat_Percentage, Notes)
VALUES
    (7, '2024-05-01', 70.5, 18.5, 'Feeling good!'),
    (8, '2024-05-02', 65.2, 20.0, 'Making progress');


-- Retrieve all workouts performed by a specific user:
SELECT w.Name, w.Description, w.Category, wl.Date, wl.Duration, wl.Calories_Burned
FROM Workouts w
JOIN WorkoutLogs wl ON w.Workout_ID = wl.Workout_ID
WHERE wl.User_ID = [user_id];

-- Retrieve the total calories burned by a specific user in a given time period:
SELECT SUM(Calories_Burned) AS Total_Calories_Burned
FROM WorkoutLogs
WHERE User_ID = [user_id]
AND Date BETWEEN [start_date] AND [end_date];

-- Retrieve all diet plans followed by a specific user:
SELECT dp.Name, dp.Description, dp.Duration, dl.Date, dl.Meal_Details, dl.Calorie_Intake
FROM DietPlans dp
JOIN DietLogs dl ON dp.Plan_ID = dl.Plan_ID
WHERE dl.User_ID = [user_id];

-- Calculate the average weight and body fat percentage of a specific user over a certain period:
SELECT AVG(Weight) AS Average_Weight, AVG(Body_Fat_Percentage) AS Average_Body_Fat
FROM Progress
WHERE User_ID = [user_id]
AND Date BETWEEN [start_date] AND [end_date];

-- Retrieve the latest workout log entry for each user:
SELECT wl.User_ID, w.Name AS Workout_Name, wl.Date, wl.Duration, wl.Calories_Burned
FROM (
    SELECT User_ID, MAX(Date) AS Latest_Date
    FROM WorkoutLogs
    GROUP BY User_ID
) latest
JOIN WorkoutLogs wl ON latest.User_ID = wl.User_ID AND latest.Latest_Date = wl.Date
JOIN Workouts w ON wl.Workout_ID = w.Workout_ID;

-- Retrieve the most commonly performed workout category:
SELECT w.Category, COUNT(*) AS Frequency
FROM Workouts w
JOIN WorkoutLogs wl ON w.Workout_ID = wl.Workout_ID
GROUP BY w.Category
ORDER BY Frequency DESC
LIMIT 1;

-- Retrieve the top 5 users who have burned the most calories:
SELECT u.User_ID, u.Name, SUM(wl.Calories_Burned) AS Total_Calories_Burned
FROM Users u
JOIN WorkoutLogs wl ON u.User_ID = wl.User_ID
GROUP BY u.User_ID, u.Name
ORDER BY Total_Calories_Burned DESC
LIMIT 5;

-- Retrieve the total number of workout logs for each user:
SELECT User_ID, COUNT(*) AS Total_Workout_Logs
FROM WorkoutLogs
GROUP BY User_ID;

-- Retrieve the average duration of workouts for each category:
SELECT w.Category, AVG(wl.Duration) AS Average_Duration
FROM Workouts w
JOIN WorkoutLogs wl ON w.Workout_ID = wl.Workout_ID
GROUP BY w.Category;

-- Retrieve the top 5 most recent progress updates for a specific user:
SELECT Date, Weight, Body_Fat_Percentage, Notes
FROM Progress
WHERE User_ID = [user_id]
ORDER BY Date DESC
LIMIT 5;

-- Calculate the total calorie intake for each day for a specific user:
SELECT Date, SUM(Calorie_Intake) AS Total_Calories_Intake
FROM DietLogs
WHERE User_ID = [user_id]
GROUP BY Date;

-- Retrieve the workout logs with a duration longer than the average duration of all workouts:
SELECT wl.*
FROM WorkoutLogs wl
JOIN (
    SELECT AVG(Duration) AS Avg_Duration
    FROM WorkoutLogs
) avg_dur ON wl.Duration > avg_dur.Avg_Duration;

-- Retrieve the top 3 most commonly followed diet plans:
SELECT dp.Plan_ID, dp.Name, COUNT(dl.Log_ID) AS Frequency
FROM DietPlans dp
LEFT JOIN DietLogs dl ON dp.Plan_ID = dl.Plan_ID
GROUP BY dp.Plan_ID, dp.Name
ORDER BY Frequency DESC
LIMIT 3;

-- Calculate the total weight loss percentage for each user from their first progress entry to their latest progress entry:
SELECT p.User_ID, 
       ((p.First_Weight - p.Last_Weight) / p.First_Weight) * 100 AS Weight_Loss_Percentage
FROM (
    SELECT User_ID, 
           MIN(Date) AS First_Date, 
           MAX(Date) AS Last_Date, 
           FIRST_VALUE(Weight) OVER (PARTITION BY User_ID ORDER BY Date) AS First_Weight, 
           LAST_VALUE(Weight) OVER (PARTITION BY User_ID ORDER BY Date) AS Last_Weight
    FROM Progress
    GROUP BY User_ID
) p;

-- Retrieve users who have not logged any workouts:
SELECT u.*
FROM Users u
LEFT JOIN WorkoutLogs wl ON u.User_ID = wl.User_ID
WHERE wl.Log_ID IS NULL;

-- Retrieve the total number of workout logs per month for a specific user in the current year:
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, COUNT(*) AS Total_Workout_Logs
FROM WorkoutLogs
WHERE User_ID = [user_id] AND YEAR(Date) = YEAR(CURRENT_DATE())
GROUP BY Month;

-- Retrieve the top 5 users with the highest average daily calorie intake:
SELECT User_ID, AVG(Calorie_Intake) AS Avg_Calorie_Intake
FROM DietLogs
GROUP BY User_ID
ORDER BY Avg_Calorie_Intake DESC
LIMIT 5;

-- Retrieve the workout logs for a specific user within a date range, ordered by date in descending order:
SELECT *
FROM WorkoutLogs
WHERE User_ID = [user_id]
AND Date BETWEEN [start_date] AND [end_date]
ORDER BY Date DESC;

-- Calculate the total duration and calories burned for each workout category:
SELECT w.Category, SUM(wl.Duration) AS Total_Duration, SUM(wl.Calories_Burned) AS Total_Calories_Burned
FROM Workouts w
JOIN WorkoutLogs wl ON w.Workout_ID = wl.Workout_ID
GROUP BY w.Category;

-- Retrieve the most recent progress update for each user:
SELECT p.*
FROM Progress p
JOIN (
    SELECT User_ID, MAX(Date) AS Latest_Date
    FROM Progress
    GROUP BY User_ID
) latest ON p.User_ID = latest.User_ID AND p.Date = latest.Latest_Date;

-- Retrieve the users who have achieved a weight loss of more than 5% since their first progress entry:
SELECT User_ID, 
       ((First_Weight - Last_Weight) / First_Weight) * 100 AS Weight_Loss_Percentage
FROM (
    SELECT User_ID, 
           FIRST_VALUE(Weight) OVER (PARTITION BY User_ID ORDER BY Date) AS First_Weight, 
           LAST_VALUE(Weight) OVER (PARTITION BY User_ID ORDER BY Date) AS Last_Weight
    FROM Progress
    GROUP BY User_ID
) p
HAVING Weight_Loss_Percentage > 5;

-- Retrieve the top 3 most common workout durations:
SELECT Duration, COUNT(*) AS Frequency
FROM WorkoutLogs
GROUP BY Duration
ORDER BY Frequency DESC
LIMIT 3;