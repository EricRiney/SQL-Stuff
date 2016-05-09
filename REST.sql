 CREATE DATABASE REST_PROJECT;
 use REST_PROJECT;
 
 CREATE TABLE USERS (
	UserName   VARCHAR(30)        PRIMARY KEY     NOT NULL,
    UserAccountID INT,
    UserTransferID INT,
	FOREIGN KEY (UserAccountID )	REFERENCES USERS_ACCOUNT(UserAccountID)
);

Delimiter //
 CREATE TRIGGER makeUserAccount
 AFTER INSERT ON USERS
 For each row
 BEGIN
	SET @last_insert_user = LAST_INSERT_ID;
	INSERT INTO USER_ACCOUNT (UserAccountName, UserAccountBalence) values ('defaultAccount', 100);
	SET @last_insert_account = LAST_INSERT_ID;
	UPDATE USERS SET UserAccountID=last_insert_account
	WHERE UserName = @last_insert_user;
END //

CREATE TABLE USER_ACCOUNT (
	UserAccountID         INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	UserAccountName       VARCHAR(30)                    NOT NULL,
    UserAccountBalence INT
);
