INSERT INTO UserProfiles (Username, FullName, Email, JoinDate)
VALUES ('user3', 'User Three', 'user3@example.com', '2024-03-04');


UPDATE Posts
SET PostText = 'Updated post text'
WHERE PostID = 1;


DELETE FROM Comments
WHERE CommentID = 1;


UPDATE UserEngagementMetrics
SET TotalLikes = TotalLikes + 1
WHERE UserID = 1;


SELECT COUNT(*)
FROM Likes
WHERE PostID = 2;


SELECT DISTINCT UserID
FROM (
    SELECT UserID FROM Posts
    UNION ALL
    SELECT UserID FROM Comments
) AS CombinedUserActivities;
