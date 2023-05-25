-- Create the Users table
CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Name VARCHAR(255),
  Email VARCHAR(255),
  Password VARCHAR(255),
  Address VARCHAR(255),
  Phone VARCHAR(20),
  PaymentDetails VARCHAR(255)
);

-- Create the Restaurants table
CREATE TABLE Restaurants (
  RestaurantID INT PRIMARY KEY,
  Name VARCHAR(255),
  Address VARCHAR(255),
  Phone VARCHAR(20),
  CuisineType VARCHAR(255),
  OpeningHours VARCHAR(255)
);

-- Create the MenuItems table
CREATE TABLE MenuItems (
  ItemID INT PRIMARY KEY,
  RestaurantID INT,
  Name VARCHAR(255),
  Description VARCHAR(255),
  Price DECIMAL(10, 2),
  Ingredients VARCHAR(255),
  FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- Create the Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  UserID INT,
  RestaurantID INT,
  OrderDate DATE,
  TotalAmount DECIMAL(10, 2),
  Status VARCHAR(20),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

-- Create the OrderItems table
CREATE TABLE OrderItems (
  OrderItemID INT PRIMARY KEY,
  OrderID INT,
  ItemID INT,
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

-- Create the Reviews table
CREATE TABLE Reviews (
  ReviewID INT PRIMARY KEY,
  UserID INT,
  RestaurantID INT,
  Rating INT,
  Comment VARCHAR(255),
  Date DATE,
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);
