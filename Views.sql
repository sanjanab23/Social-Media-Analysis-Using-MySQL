CREATE VIEW TotalPostsByUser AS
SELECT UserID, COUNT(*) AS TotalPosts
FROM Posts
GROUP BY UserID;


CREATE VIEW AverageSentimentPerPost AS
SELECT PostID, AVG(SentimentScore) AS AvgSentiment
FROM Sentiments
GROUP BY PostID;


CREATE VIEW RecentComments AS
SELECT *
FROM Comments
ORDER BY CommentDate DESC
LIMIT 10;


CREATE VIEW TrendingTopicsWithPostsCount AS
SELECT TopicName, COUNT(PostID) AS NumPosts
FROM TrendingTopics
LEFT JOIN PostTopics ON TrendingTopics.TopicID = PostTopics.TopicID
GROUP BY TopicName;


CREATE VIEW TopEngagedUsers AS
SELECT UserID, (TotalLikes + TotalComments + TotalShares) AS TotalEngagement
FROM UserEngagementMetrics
ORDER BY TotalEngagement DESC
LIMIT 10;

