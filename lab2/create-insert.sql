
create table program_user(
 user_id serial primary key,
 username varchar(32) not null,
 pfp varchar(128) not null default 'default_pfp.jfif',
 email varchar(64) unique not null,
 user_password varchar(64) not null,
 is_admin boolean not null default False,
 date_joined date not null
);

create table subscriber(
 user_id int not null references program_user(user_id),
 subscriber_id int not null references program_user(user_id),
 primary key (user_id, subscriber_id)
);

create table video(
 video_id serial primary key,
 title varchar(128) not null,
 thumbnail varchar(128) not null default 'default_thumbnail.jfif',
 video_content varchar(128) not null,
 release_date timestamp not null,
 author_id int not null references program_user(user_id)
);

create table vid_views(
 viewer_id int references program_user(user_id),
 video_id int references video(video_id),
 primary key (viewer_id, video_id)
);

create table user_comment(
 comment_id serial primary key,
 comment_content text not null,
 date_left timestamp not null,
 author_id int not null references program_user(user_id),
 video_id int references video(video_id),
 parent_comment_id int references user_comment(comment_id)
);

create table score(
 score smallint not null check (score>=1 and score<=5),
 user_id int not null references program_user(user_id),
 video_id int references video(video_id),
 comment_id int references user_comment(comment_id),
 unique (user_id, video_id),
 unique (user_id, comment_id),
 check((video_id is not null and comment_id is null) or (video_id is null and comment_id is not null))
);

insert into program_user(user_id, username, email, user_password, is_admin, date_joined) values
	(1, 'john videohosting', 'johnvid@gmail.com', 'CX2NAEN3xwfataBD3vPu', true, '01/01/2026'),
	(2, 'user_user', 'user@gmail.com', 'G20uhmqQ@', false, '04/03/2026'),
	(3, 'temp', 'askmya@doesntexist.org', '123123123123Aa@', false, '07/03/2026'),
	(4, 'orest', 'orest@proton.me', 'zjqT2TaTRgr', false, '07/03/2026'),
	(5, 'khkh', 'xxDestructionxx@hotmail.com', 'password123', false, '08/03/2026');

insert into subscriber(user_id, subscriber_id) values
	(1, 2), (1, 4), (1, 5),
	(4, 2), (4, 5),
	(5, 3);

insert into video(video_id, author_id, title, thumbnail, video_content, release_date) values
	(1, 1, 'Introduction to VideoHost functionality', '1.jfif', '1.mp4', '2026-01-01 21:32:16'),
	(2, 1, 'advanced VideoHost functionality', '2.jfif', '2.mp4', '2026-01-01 22:32:16'),
	(3, 2, 'ПЕРШИЙ УКРАЇНСЬКИЙ ВІДЕОХОСТИНГ??? ОГЛЯД НА VideoHost.net', '3.jfif', '3.mp4', '2026-04-04 16:02:12'),
	(4, 4, 'hotline miami 3 trailer', '4.jfif', '4.mp4', '2026-03-09 15:22:22');

insert into vid_views(video_id, viewer_id) values
	(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
	(2, 1), (2, 2), (2, 4),
	(3, 2), (3, 1), (3, 5),
	(4, 4), (4, 5);

insert into user_comment(comment_id, author_id, video_id, parent_comment_id, comment_content, date_left) values
	(1, 4, 1, null, 'друже багато чого не розказав тобі треба зробити щось типу advanced версії цього відео', '2026-03-08 13:41:21'),
	(2, 4, null, 1, 'неважливо таке вже існує', '2026-03-08 14:00:11'),
	(3, 3, 3, null, 'навчись ВИРОБЛЯТЬ з ші за ТИЖДЕНЬ з www.www.ua', '2026-03-013 16:13:13'),
	(4, 3, null, 2, 'навчись ВИРОБЛЯТЬ з ші за ТИЖДЕНЬ з www.www.ua', '2026-03-013 16:13:21');

insert into score(user_id, video_id, comment_id, score) values
	(1, null, 2, 5), (1, 3, null, 2), (4, 2, null, 4), (4, null, 4, 1);
	