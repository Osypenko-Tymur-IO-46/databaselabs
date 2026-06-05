ALTER TABLE user_comment
    DROP CONSTRAINT user_comment_author_id_fkey,
    ADD CONSTRAINT user_comment_author_id_fkey
        FOREIGN KEY (author_id) REFERENCES program_user(user_id) ON DELETE CASCADE;

ALTER TABLE subscriber
    DROP CONSTRAINT subscriber_user_id_fkey,
    DROP CONSTRAINT subscriber_subscriber_id_fkey,
    ADD CONSTRAINT subscriber_user_id_fkey
        FOREIGN KEY (user_id) REFERENCES program_user(user_id) ON DELETE CASCADE,
    ADD CONSTRAINT subscriber_subscriber_id_fkey
        FOREIGN KEY (subscriber_id) REFERENCES program_user(user_id) ON DELETE CASCADE;

ALTER TABLE video
    DROP CONSTRAINT video_author_id_fkey,
    ADD CONSTRAINT video_author_id_fkey
        FOREIGN KEY (author_id) REFERENCES program_user(user_id) ON DELETE CASCADE;

ALTER TABLE vid_views
    DROP CONSTRAINT vid_views_viewer_id_fkey,
    ADD CONSTRAINT vid_views_viewer_id_fkey
        FOREIGN KEY (viewer_id) REFERENCES program_user(user_id) ON DELETE CASCADE;

ALTER TABLE vid_score
    DROP CONSTRAINT vid_score_user_id_fkey,
    ADD CONSTRAINT vid_score_user_id_fkey
        FOREIGN KEY (user_id) REFERENCES program_user(user_id) ON DELETE CASCADE;

ALTER TABLE com_score
    DROP CONSTRAINT com_score_user_id_fkey,
    ADD CONSTRAINT com_score_user_id_fkey
        FOREIGN KEY (user_id) REFERENCES program_user(user_id) ON DELETE CASCADE;