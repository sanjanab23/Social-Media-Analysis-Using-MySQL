INSERT INTO UserProfiles (Username, FullName, Email, JoinDate) VALUES
('user1', 'User One', 'user1@example.com', '2024-03-01'),
('user2', 'User Two', 'user2@example.com', '2024-03-02');


INSERT INTO Posts (UserID, PostText, PostDate) VALUES
(1, 'This is my first post!', '2024-03-01 10:00:00'),
(1, 'Another post here!', '2024-03-02 12:00:00'),
(2, 'Hello world!', '2024-03-03 15:00:00');


INSERT INTO Comments (PostID, UserID, CommentText, CommentDate) VALUES
(1, 2, 'Nice post!', '2024-03-01 11:00:00'),
(2, 1, 'Great!', '2024-03-02 13:00:00');


INSERT INTO Likes (PostID, UserID, LikeDate) VALUES
(1, 2, '2024-03-01 11:30:00'),
(2, 1, '2024-03-02 13:30:00');


INSERT INTO Shares (PostID, UserID, ShareDate) VALUES
(1, 1, '2024-03-01 12:00:00'),
(2, 2, '2024-03-02 14:00:00');


INSERT INTO Sentiments (PostID, SentimentScore, SentimentType) VALUES
(1, 0.8, 'positive'),
(2, 0.6, 'positive');



INSERT INTO UserEngagementMetrics (UserID, TotalPosts, TotalComments, TotalLikes, TotalShares) VALUES
(1, 2, 1, 1, 1),
(2, 1, 1, 1, 1);


INSERT INTO TrendingTopics (TopicName, TrendingDate) VALUES
('Technology', '2024-03-07'),
('Politics', '2024-03-07');


INSERT INTO PostTopics (PostID, TopicID) VALUES
(1, 1),
(2, 2);
