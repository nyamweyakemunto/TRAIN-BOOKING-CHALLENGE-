-- Create Train Stations Table
CREATE TABLE TrainStations (
    StationID INT AUTO_INCREMENT PRIMARY KEY,
    StationName VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

-- Create Trains Table
CREATE TABLE Trains (
    TrainID INT AUTO_INCREMENT PRIMARY KEY,
    TrainNumber VARCHAR(50) NOT NULL,
    TrainType VARCHAR(50),
    Capacity INT NOT NULL
);

-- Create Passengers Table
CREATE TABLE Passengers (
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Routes Table
CREATE TABLE Routes (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    StartStationID INT NOT NULL,
    EndStationID INT NOT NULL,
    Distance DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (StartStationID) REFERENCES TrainStations(StationID),
    FOREIGN KEY (EndStationID) REFERENCES TrainStations(StationID)
);

-- Create Train Schedules Table
CREATE TABLE TrainSchedules (
    ScheduleID INT AUTO_INCREMENT PRIMARY KEY,
    TrainID INT NOT NULL,
    RouteID INT NOT NULL,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

-- Create Bookings Table
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingDate DATETIME NOT NULL,
    PassengerID INT NOT NULL,
    TrainID INT NOT NULL,
    DepartureDate DATE NOT NULL,
    SeatNumber VARCHAR(10) NOT NULL,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);

-- Create Tickets Table
CREATE TABLE Tickets (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    TicketPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
