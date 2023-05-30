#DDL

CREATE database spotify;
use spotify;

create table USERS(
user_id int(10) AUTO_INCREMENT not null,
username varchar(20) not null,
user_email_id varchar(40) not null,
user_contact_no varchar(15),
user_loc varchar(25),
user_type char(12) not null,
CONSTRAINT users_pk PRIMARY KEY (user_id));


create table Free_Account(
user_id int(10) not null,
ad_freq int(10) not null,
duration int(10) not null,
constraint free_acc_fk foreign key(user_id) references Users(user_id)
);


create table Premium_Account(
user_id int(10) not null,
premium_type varchar(10) not null,
constraint prem_acc_fk foreign key(user_id) references Users(user_id)
);
create table ARTISTS(
artist_id int(25) AUTO_INCREMENT not null,
artist_name varchar(30) not null,
artist_genre varchar(20),
artist_follower int(15),
CONSTRAINT artists_pk PRIMARY KEY (artist_id));

create table ALBUMS(
album_id int(25) AUTO_INCREMENT not null,
artist_id int(25) not null,
album_name varchar(30),
album_genre char(20),
album_duration int(10),
album_release_date varchar(20),
no_of_songs int(10),
album_likes int(12),
CONSTRAINT albums_pk PRIMARY KEY (album_id),
CONSTRAINT albums_fk FOREIGN KEY (artist_id) references ARTISTS(artist_id)
ON UPDATE CASCADE ON DELETE CASCADE
);


create table SONGS(
song_id int(25) AUTO_INCREMENT not null,
album_id int(25) not null,
artist_id int(25) not null,
song_name varchar(30) not null,
song_genre char(20),
song_duration double(10,2),
song_release_date varchar(20),
song_streams int(10),
song_likes int(12),
constraint songs_pk primary key (song_id,album_id),
constraint songs_fk foreign key(artist_id) references ARTISTS(artist_id)
);


create table transactions(
tran_id int(10) auto_increment not null,
tran_date date,
user_id int(10) not null,
constraint tran_pk primary key (tran_id),
constraint tran_fk foreign key (user_id) references users(user_id));

create table user_activity(
user_id int(10),
song_id int(25),
constraint user_act_pk primary key(user_id,song_id)
);

#Insert Queries

insert into USERS (username,user_email_id,user_contact_no,user_loc,user_type)VALUES('prajyot','pkarnik@horizon.csueastbay.edu','5109985134','Hayward','P');
insert into USERS (username,user_email_id,user_contact_no,user_loc,user_type)VALUES('jeet','jraithatha@horizon.csueastbay.edu','5109345134','San Fransisco','P');
insert into USERS (username,user_email_id,user_contact_no,user_loc,user_type)VALUES('siva','schellapa@horizon.csueastbay.edu','5109983434','San Jose','F');
insert into USERS (username,user_email_id,user_contact_no,user_loc,user_type)VALUES('bhavya','bbhatti@horizon.csueastbay.edu','5109981234','Milpitas','F');


insert into ARTISTS VALUES(201,'Pink Floyd','Progressive Rock',150000);
insert into ARTISTS VALUES(202,'Metallica','Metal',23000);
insert into ARTISTS VALUES(203,'Beatles','Classic Rock',89000);
insert into ARTISTS VALUES(204,'Led Zeppeline','Rock',34500);


insert into ALBUMS VALUES(301,201,'The Wall','Progressive Rock',150,'1977-11-20',13,1300);
insert into ALBUMS VALUES(302,201,'Dark Side Of The Moon','Classic Rock',177,'1973-11-20',15,1200);
insert into ALBUMS VALUES(303,201,'Wish You Were Here','Classic Rock',197,'1975-11-20',11,1500);
insert into ALBUMS VALUES(304,203,'Abbey Road','Classic Rock',169,'1969-11-20',8,1900);
insert into ALBUMS VALUES(305,204,'Physical Graffiti','Rock',45,'1972-11-20',8,985);


insert into SONGS(song_id, album_id, artist_id, song_name, song_genre, song_duration, song_release_date, song_streams, song_likes) values
(407,309,208,"Why'd You Only",'Alt',2.41,'2013-09-9',98640,12638),
(408,309,208,"Fireside",'Alt',3.01,'2013-09-9',328640,112638),
(409, 314, 213, "Mantra", "Metal", 3.53, '2019-01-25', 876532, 1232325),
(410, 314, 213, "Mother Tongue", "Rock", 3.37, '2019-01-25', 4576437, 2342523),
(411, 314, 213, "Medicine", "Rock", 4.00, '2019-01-25', 23423523, 9582938),
(412, 315, 213, "Happy Song", "Rock", 3.37, '2015-09-11', 2423523, 5263422),
(413, 315, 213, "Doomed", "Rock", 4.34, '2015-09-11', 5763842, 3212123),
(414, 310, 209, "Sweetie Little", "Alt", 3.45, '2015-12-18', 231213, 31431),
(415, 306, 205, "Fire", "Alt", 2.45, '2017-09-29', 121213, 1331431);

insert into ALBUMS(album_id, artist_id, album_name, album_genre, album_duration, album_release_date, no_of_songs, album_likes) values
(306,205,'The Attractions of Youth','Alternate Rock',2500,'2017-09-29',14,1500),
(307,206,'a modern tragedy vol. 1','Alternate Rock',1140,'2018-06-15',5,1800),
(308,207,'Californication','Rock',3360,'1999-06-8',15,5000),
(309,208,'AM','Alternate Rock',2520,'2013-09-9',12, 10000),
(310,209,"Tell Me I'm Pretty",'Alternate Rock',2400,'2015-12-18',10,3000),
(311,210,"Let's Rock",'Alternate Rock',2400,'2019-06-28',12,11500),
(312,211,"Endless Summer",'Synthwave',3600,'2016-08-1',12,10500),
(313,212,"Sophomore",'Synthwave',660,'2020-11-28',11,1500),
(314,213,"amo",'Alternate Rock',3000,'2019-01-25',13,28415),
(315,213,"That's The Spirit",'Rock',2500,'2015-09-11',11,12700);

insert into artists(artist_id, artist_name, artist_genre, artist_follower) values
(205, "Barns Courtney", "Alt", 2373491),
(206, "Grandson", "Alt Rock", 7002611),
(207, "Red Hot Chilli Peppers", "Rock", 21566854),
(208, "Arctic Monkeys", "Rock", 21380850),
(209, "Cage The Elephand", "Alt", 10597709),
(210, "The Black Keys", "Alt", 6682725),
(211, "The Midnight", "Electronic", 868140),
(212, "Sunglasses Kid", "Synthwave", 59467),
(213, "Bring Me The Horion", "Heavy Metal", 8645769);

insert into transactions values(501,'2021-12-10',101);
insert into transactions values(502,'2020-12-10',101);
insert into transactions values(503,'2021-12-10',102);
insert into transactions values(504,'2020-12-10',102);
insert into transactions values(505,'2019-12-10',102);
insert into transactions values(506,'2021-12-10',103);
insert into transactions values(507,'2021-12-01',104);
insert into transactions values(508,'2020-11-29',104);


#Select queries

select * from users;
select * from free_account;
select * from premium_account;
select * from artists;
select * from albums;
select * from songs;
select * from transactions;
select * from user_activity;


#Joins and Views
#Equi Join
#User that are premium subscribers
select * from users join Premium_Account on users.user_id=Premium_Account.user_id;

#Inner Join
#Likelyhood that user is going to be retained(making assumptions 
#that playtime decides how much user enjoys spotify and will continue to use it)
select sum(s.song_duration),u.user_id from user_activity as u 
inner join songs as s on u.song_id=s.song_id group by user_id;


#Nested Select query
#Artist followed by or listened to by the users whose name starts with J and who are premium subscribers.
select distinct(a.artist_name) from user_activity as u,songs as s,artists as a where u.song_id=s.song_id
 and u.user_id=(select user_id from 
users where username like'p%');


#Natural Join
#Artist that has the most number of songs.
select artist_name,max(no_of_songs) from artists natural join albums group by artist_name;


#Left Join
#Most number of transacitions by a user from SF
select * from transactions left join users on transactions.user_id=users.user_id and user_loc like'S%F%';

#View 1
#Top Artists based on album likes
create view  billboard as
select artist_name,sum(album_likes) from artists,albums where artists.artist_id=albums.artist_id group by artists.artist_id;


#View 2
#View of People who are into Rock Music
create view rockfans as
select distinct(username) from artists,songs,user_activity,users where user_activity.song_id=songs.song_id and song_genre='Rock';


