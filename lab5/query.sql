DROP TABLE score;

CREATE TABLE vid_score(
     score smallint NOT NULL CHECK (score>=1 and score<=5),
     user_id int NOT NULL REFERENCES program_user(user_id),
     video_id int NOT NULL REFERENCES video(video_id),
     PRIMARY KEY (user_id, video_id)
);

CREATE TABLE com_score(
    score smallint NOT NULL CHECK (score>=1 and score<=5),
    user_id int NOT NULL REFERENCES program_user(user_id),
    comm_id int NOT NULL REFERENCES user_comment(comment_id),
    PRIMARY KEY (user_id, comm_id)
);
