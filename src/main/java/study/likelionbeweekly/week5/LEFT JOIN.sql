CREATE DATABASE IF NOT EXISTS likeliondb;
USE likeliondb;

DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Posts;	
DROP TABLE IF EXISTS Members;	-- 외래 키 제약조건 때문에 마지막에 삭제 


CREATE TABLE `Members` (
	`UserID` VARCHAR(10) PRIMARY KEY,	-- 기본 키들은 간편하게 테이블 생성할 때 생성하는 걸로 수정
	`email`	VARCHAR(50)	NOT NULL DEFAULT '@',
	`password`	VARCHAR(20)	NOT NULL DEFAULT 'dp'
);

CREATE TABLE `Posts` (
	`PostID`  BIGINT PRIMARY KEY,
	 UserID VARCHAR(10),
	`title`	VARCHAR(100)	NULL,
	`content`	TEXT	NULL,
	`likes`	int	NULL	DEFAULT  0,
    FOREIGN KEY (UserID) REFERENCES Members(UserID) ON DELETE CASCADE
);

CREATE TABLE `Comments` (
	`CommentID`	BIGINT PRIMARY KEY,
     UserID VARCHAR(10),
     PostID BIGINT,
	`comment`	VARCHAR(100)	NOT NULL,
	`comment_like`	int	NOT NULL,
    FOREIGN KEY (`PostID`) REFERENCES `Posts`(`PostID`),
    -- 외래 키 제약조건 해제
    FOREIGN KEY (UserID) REFERENCES Members(UserID) ON DELETE CASCADE
);

	-- Create
INSERT INTO Members VALUES("suji", "jesuji030502@naver.com","8005");
INSERT INTO Members VALUES("minseok", "user2@naver.com","1234");
INSERT INTO Members VALUES("Newjeans", "user3@naver.com","5678");
INSERT INTO Members VALUES("IVE", "user4@naver.com","1357");
INSERT INTO Members (UserID, email, password) VALUES ("yohan", "yy@naver.com", "LEFT JOIN");

INSERT INTO Posts VALUES("1", "suji", "IT", "응용공학과", "100");
INSERT INTO Posts VALUES("2", "suji", "선배 탕후루 사주세요", "그럼 제가 선배 맘에 탕탕 후루후루", "100");
INSERT INTO Posts VALUES("3", "minseok", "김치찜vs김치찌개", "김치찌개", "1");
INSERT INTO Posts VALUES("4", "Newjeans", "홍대 가는법", "뉴진스 하입보이", "500");
INSERT INTO Posts VALUES("5", "IVE", "해야", "널 삼켜버릴테야", "500");

INSERT INTO Comments VALUES("123", "minseok", "2", "후루후루", "1");
INSERT INTO Comments VALUES("234", "suji", "3", "김치 탕후루는 없나요?", "1");

	-- LEFT JOIN -> Members와 Posts 테이블 조인
SELECT Members.UserID, Members.email, Members.password, Posts.title, Posts.content, Posts.likes
	FROM Members AS Members
		LEFT JOIN Posts AS Posts
			ON Members.UserID = Posts.UserID