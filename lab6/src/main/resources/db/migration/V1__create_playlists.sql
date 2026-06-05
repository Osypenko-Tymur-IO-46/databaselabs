CREATE TABLE IF NOT EXISTS playlists(
    playlist_id SERIAL PRIMARY KEY,
    title varchar(128) NOT NULL,
    author_id int NOT NULL REFERENCES program_user(user_id),
);

CREATE TABLE IF NOT EXISTS vidlists(
  playlist_id int NOT NULL REFERENCES playlists(playlist_id) ON DELETE CASCADE,
  video_id int NOT NULL REFERENCES video(video_id) ON DELETE CASCADE,
  vid_order int NOT NULL,
  PRIMARY KEY (playlist_id, video_id)
);