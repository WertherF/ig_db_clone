/* Trigger to avoid self follows */

DELIMITER $$

CREATE TRIGGER prevent_self_follow
    BEFORE INSERT ON follows FOR EACH ROW
    BEGIN
    	IF NEW.follower_id = NEW.followee_id
        	THEN
            	SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = "You can't follow yourself!";
        END IF;
    END;

$$

DELIMITER ;
