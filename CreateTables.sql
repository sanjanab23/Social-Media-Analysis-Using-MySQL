CREATE TABLE UserProfiles (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE,
    CONSTRAINT uc_Username UNIQUE (Username)
);


CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    PostText TEXT,
    PostDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);


CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    UserID INT,
    CommentText TEXT,
    CommentDate DATETIME,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);


CREATE TABLE Likes (
    LikeID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    UserID INT,
    LikeDate DATETIME,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);


CREATE TABLE Shares (
    ShareID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    UserID INT,
    ShareDate DATETIME,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);


CREATE TABLE Sentiments (
    SentimentID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    SentimentScore FLOAT,
    SentimentType ENUM('positive', 'negative', 'neutral'),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);


CREATE TABLE UserEngagementMetrics (
    UserID INT PRIMARY KEY,
    TotalPosts INT DEFAULT 0,
    TotalComments INT DEFAULT 0,
    TotalLikes INT DEFAULT 0,
    TotalShares INT DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES UserProfiles(UserID)
);


CREATE TABLE TrendingTopics (
    TopicID INT PRIMARY KEY AUTO_INCREMENT,
    TopicName VARCHAR(255),
    TrendingDate DATE
);


CREATE TABLE PostTopics (
    PostID INT,
    TopicID INT,
    PRIMARY KEY (PostID, TopicID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (TopicID) REFERENCES TrendingTopics(TopicID)
);


