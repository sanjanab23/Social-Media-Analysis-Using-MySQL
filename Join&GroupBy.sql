SELECT UserProfiles.Username, COUNT(Posts.PostID) AS NumPosts
FROM UserProfiles
LEFT JOIN Posts ON UserProfiles.UserID = Posts.UserID
GROUP BY UserProfiles.Username;


SELECT UserProfiles.Username, AVG(Sentiments.SentimentScore) AS AvgSentimentScore
FROM UserProfiles
LEFT JOIN Posts ON UserProfiles.UserID = Posts.UserID
LEFT JOIN Sentiments ON Posts.PostID = Sentiments.PostID
GROUP BY UserProfiles.Username;


SELECT Posts.PostID, Posts.PostText, COUNT(Comments.CommentID) AS NumComments
FROM Posts
LEFT JOIN Comments ON Posts.PostID = Comments.PostID
GROUP BY Posts.PostID, Posts.PostText;


SELECT Posts.PostID, Posts.PostText, 
       COUNT(DISTINCT Likes.LikeID) AS NumLikes,
       COUNT(DISTINCT Comments.CommentID) AS NumComments,
       COUNT(DISTINCT Shares.ShareID) AS NumShares,
       COUNT(DISTINCT Likes.LikeID) + COUNT(DISTINCT Comments.CommentID) + COUNT(DISTINCT Shares.ShareID) AS TotalEngagement
FROM Posts
LEFT JOIN Likes ON Posts.PostID = Likes.PostID
LEFT JOIN Comments ON Posts.PostID = Comments.PostID
LEFT JOIN Shares ON Posts.PostID = Shares.PostID
GROUP BY Posts.PostID, Posts.PostText;


SELECT TrendingTopics.TopicName, COUNT(PostTopics.PostID) AS NumPosts
FROM TrendingTopics
LEFT JOIN PostTopics ON TrendingTopics.TopicID = PostTopics.TopicID
GROUP BY TrendingTopics.TopicName;
