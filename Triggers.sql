CREATE TRIGGER UpdateEngagementMetricsAfterPostInsert
AFTER INSERT ON Posts
FOR EACH ROW
BEGIN
    UPDATE UserEngagementMetrics
    SET TotalPosts = TotalPosts + 1
    WHERE UserID = NEW.UserID;
END;


CREATE TRIGGER UpdateEngagementMetricsAfterPostDelete
AFTER DELETE ON Posts
FOR EACH ROW
BEGIN
    UPDATE UserEngagementMetrics
    SET TotalPosts = TotalPosts - 1
    WHERE UserID = OLD.UserID;
END;


CREATE TRIGGER UpdateTrendingTopicsAfterPostInsert
AFTER INSERT ON PostTopics
FOR EACH ROW
BEGIN
    UPDATE TrendingTopicsWithPostsCount
    SET NumPosts = NumPosts + 1
    WHERE TopicName = (SELECT TopicName FROM TrendingTopics WHERE TopicID = NEW.TopicID);
END;


CREATE TRIGGER UpdateTrendingTopicsAfterPostDelete
AFTER DELETE ON PostTopics
FOR EACH ROW
BEGIN
    UPDATE TrendingTopicsWithPostsCount
    SET NumPosts = NumPosts - 1
    WHERE TopicName = (SELECT TopicName FROM TrendingTopics WHERE TopicID = OLD.TopicID);
END;


CREATE TRIGGER UpdateEngagementMetricsAfterCommentInsert
AFTER INSERT ON Comments
FOR EACH ROW
BEGIN
    UPDATE UserEngagementMetrics
    SET TotalComments = TotalComments + 1
    WHERE UserID = NEW.UserID;
END;
