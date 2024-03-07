SELECT CONCAT(Username, ': ', FullName) AS UserInfo
FROM UserProfiles;


SELECT PostID, LENGTH(PostText) AS PostLength
FROM Posts;


SELECT Username, YEAR(JoinDate) AS JoinYear
FROM UserProfiles;


SELECT PostID, DATE_FORMAT(PostDate, '%Y-%m-%d %H:%i:%s') AS FormattedPostDate
FROM Posts;


SELECT PostID, COUNT(*) AS NumComments
FROM Comments
GROUP BY PostID;


SELECT MAX(SentimentScore) AS MaxSentimentScore
FROM Sentiments;


SELECT PostID, AVG(SentimentScore) AS AvgSentimentScore
FROM Sentiments
GROUP BY PostID;


SELECT PostID, IFNULL(LikeDate, 'No likes') AS LikeDate
FROM Likes;


SELECT PostID,
       CASE
           WHEN SentimentScore >= 0.7 THEN 'positive'
           WHEN SentimentScore <= 0.3 THEN 'negative'
           ELSE 'neutral'
       END AS SentimentCategory
FROM Sentiments;


SELECT Username, SUBSTRING_INDEX(Email, '@', -1) AS Domain
FROM UserProfiles;


SELECT MIN(JoinDate) AS OldestJoinDate, MAX(JoinDate) AS NewestJoinDate
FROM UserProfiles;


SELECT PostID, GROUP_CONCAT(TopicName) AS Topics
FROM PostTopics
JOIN TrendingTopics ON PostTopics.TopicID = TrendingTopics.TopicID
GROUP BY PostID;


SELECT p.PostID,
       (SELECT COUNT(*) FROM Likes WHERE PostID = p.PostID) AS Likes,
       (SELECT COUNT(*) FROM Comments WHERE PostID = p.PostID) AS Comments,
       (SELECT COUNT(*) FROM Shares WHERE PostID = p.PostID) AS Shares,
       ((SELECT COUNT(*) FROM Likes WHERE PostID = p.PostID) +
        (SELECT COUNT(*) FROM Comments WHERE PostID = p.PostID) +
        (SELECT COUNT(*) FROM Shares WHERE PostID = p.PostID)) AS TotalEngagement
FROM Posts p;


SELECT PostID, SIGN(SentimentScore) AS SentimentPolarity
FROM Sentiments;


SELECT Username, DATE_ADD(JoinDate, INTERVAL 30 DAY) AS After30Days
FROM UserProfiles;
