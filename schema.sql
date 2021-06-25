drop table record;
drop table playin;
drop table bookmark;
drop table player;
drop table team; 

create table team(id varchar(3), name varchar(20), championship int, primary key (id));
create table player(id varchar(3), name varchar(20), position varchar(1), all_nba_team int, primary key(id), CONSTRAINT position CHECK(position='G' or position='F' or position='C'));
create table bookmark(player_id varchar(3), mytag varchar(20), primary key(player_id), foreign key(player_id) references player);
create table playin(player_id varchar(3), team_id varchar(3), year numeric(4, 0), salary numeric(3,1), primary key(player_id, team_id, year), foreign key(player_id) references player, foreign key(team_id) references team);
create table record(player_id varchar(3), team_id varchar(3), year numeric(4, 0), ppg numeric(3,1), apg numeric(3,1), rpg numeric(3,1), primary key(player_id, team_id, year), foreign key(player_id, team_id, year) references playin);

insert into team values('101', 'Boston Celtics', 17);
insert into team values('201', 'Brooklyn Nets', 0);
insert into team values('301', 'New York Knicks', 2);
insert into team values('401', 'Philadelphia 76ers', 3);
insert into team values('501', 'Toronto Raptors', 1);

insert into player values('001', 'Jayson Tatum', 'F', 1);
insert into player values('002', 'JayLen Brown', 'G', 0);
insert into player values('003', 'Gordon Hayward', 'F', 0);
insert into player values('004', 'Marcus Smart', 'G', 2);
insert into player values('005', 'Kemba Walker', 'G', 1);
insert into player values('006', 'Robert Williams', 'F', 0);
insert into player values('007', 'Evan Fournier', 'G', 0);

insert into player values('008', 'Jarrett Allen', 'C', 0);
insert into player values('009', 'Kyrie Irving', 'G', 2);
insert into player values('010', 'DeAndre Jordan', 'C', 5);
insert into player values('011', 'Joe Harris', 'F', 0);
insert into player values('012', 'James Harden', 'G', 7);
insert into player values('013', 'Kevin Durant', 'F', 9);
insert into player values('014', 'Blake Griffin', 'F', 5);

insert into player values('015', 'Joel Embiid', 'C', 4);
insert into player values('016', 'Ben Simmons', 'F', 2);
insert into player values('017', 'Tobias Harris', 'F', 0);
insert into player values('018', 'Al Horford', 'C', 2);
insert into player values('019', 'Josh Richardson', 'G', 0);
insert into player values('020', 'Seth Curry', 'G', 0);

insert into player values('021', 'RJ Barrett', 'G', 0);
insert into player values('022', 'Julius Randle', 'F', 0);
insert into player values('023', 'Reggie Bullock', 'F', 0);
insert into player values('024', 'Taj Gibson', 'F', 0);
insert into player values('025', 'Kevin Knox', 'F', 0);
insert into player values('026', 'Derrick Rose', 'G', 1);
insert into player values('027', 'Dennis Smith', 'G', 0);

insert into player values('028', 'Serge Ibaka', 'C', 3);
insert into player values('029', 'OG Anunoby', 'F', 0);
insert into player values('030', 'Kyle Lowry', 'G', 1);
insert into player values('031', 'Pascal Siakam', 'F', 1);
insert into player values('032', 'Fred VanVleet', 'G', 0);

insert into playin values('001', '101', 2019, 7.8);
insert into playin values('001', '101', 2020, 9.8);
insert into playin values('002', '101', 2019, 6.5);
insert into playin values('002', '101', 2020, 25.0);
insert into playin values('003', '101', 2019, 32.7);
insert into playin values('004', '101', 2019, 12.6);
insert into playin values('004', '101', 2020, 12.9);
insert into playin values('005', '101', 2019, 32.7);
insert into playin values('005', '101', 2020, 34.3);
insert into playin values('006', '101', 2019, 1.9);
insert into playin values('006', '101', 2020, 2.0);
insert into playin values('007', '101', 2020, 17.1);

insert into playin values('008', '201', 2019, 2.3);
insert into playin values('009', '201', 2019, 31.7);
insert into playin values('009', '201', 2020, 33.4);
insert into playin values('010', '201', 2019, 9.8);
insert into playin values('010', '201', 2020, 10.3);
insert into playin values('011', '201', 2019, 7.6);
insert into playin values('011', '201', 2020, 16.0);
insert into playin values('012', '201', 2020, 41.2);
insert into playin values('013', '201', 2020, 39.0);
insert into playin values('014', '201', 2020, 33.9);

insert into playin values('015', '401', 2019, 27.5);
insert into playin values('015', '401', 2020, 29.5);
insert into playin values('016', '401', 2019, 8.1);
insert into playin values('016', '401', 2020, 30.5);
insert into playin values('017', '401', 2019, 32.7);
insert into playin values('017', '401', 2020, 34.3);
insert into playin values('018', '401', 2019, 28.0);
insert into playin values('019', '401', 2019, 10.1);
insert into playin values('019', '401', 2020, 10.8);
insert into playin values('020', '401', 2020, 7.8);

insert into playin values('021', '301', 2019, 7.8);
insert into playin values('021', '301', 2020, 8.2);
insert into playin values('022', '301', 2019, 18.0);
insert into playin values('022', '301', 2020, 19.8);
insert into playin values('023', '301', 2019, 4.0);
insert into playin values('023', '301', 2020, 4.2);
insert into playin values('024', '301', 2019, 9.0);
insert into playin values('024', '301', 2020, 3.2);
insert into playin values('025', '301', 2019, 4.3);
insert into playin values('025', '301', 2020, 4.5);
insert into playin values('026', '301', 2020, 7.6);
insert into playin values('027', '301', 2019, 4.4);

insert into playin values('028', '501', 2019, 23.2);
insert into playin values('028', '501', 2020, 9.2);
insert into playin values('029', '501', 2019, 2.2);
insert into playin values('029', '501', 2020, 3.8);
insert into playin values('030', '501', 2019, 33.2);
insert into playin values('030', '501', 2020, 30.5);
insert into playin values('031', '501', 2019, 2.3);
insert into playin values('031', '501', 2020, 30.5);
insert into playin values('032', '501', 2019, 9.3);
insert into playin values('032', '501', 2020, 21.2);

insert into record values('001', '101', 2019, 23.4, 3.0, 7.0);
insert into record values('001', '101', 2020, 26.4. 4.3, 7.4);
insert into record values('002', '101', 2019, 20.3, 1.4, 4.2);
insert into record values('002', '101', 2020, 24.7, 3.4, 6.0);
insert into record values('003', '101', 2019, 17.5, 4.1, 6.7);
insert into record values('004', '101', 2019, 20.4, 4.8, 3.9);
insert into record values('004', '101', 2020, 19.3, 4.9, 4.0);
insert into record values('005', '101', 2019, 13.1, 4.9, 3.8);
insert into record values('005', '101', 2020, 10.2, 5.7, 3.5);
insert into record values('006', '101', 2019, 5.2, 0.9, 4.4);
insert into record values('006', '101', 2020, 8.0, 1.8, 6.9);
insert into record values('007', '101', 2020, 13.0, 3.1, 3.3);

insert into record values('008', '201', 2019, 13.2, 10.4, 1.7);
insert into record values('009', '201', 2019, 27.4, 6.4, 5.2);
insert into record values('009', '201', 2020, 33.4, 6.0, 4.8);
insert into record values('010', '201', 2019, 8.3, 1.9, 10.0);
insert into record values('010', '201', 2020, 7.5, 1.6, 7.5);
insert into record values('011', '201', 2019, 14.5, 2.1, 4.3);
insert into record values('011', '201', 2020, 14.1, 1.9, 3.6);
insert into record values('012', '201', 2020, 24.6, 10.9, 8.5);
insert into record values('013', '201', 2020, 26.9, 5.6, 7.1);
insert into record values('014', '201', 2020, 10.0, 2.4, 4.7);

insert into record values('015', '401', 2019, 23.0, 3.0, 11.6);
insert into record values('015', '401', 2020, 28.5, 2.8, 10.6);
insert into record values('016', '401', 2019, 16.4, 7.8, 8.0);
insert into record values('016', '401', 2020, 14.3, 6.9, 7.2);
insert into record values('017', '401', 2019, 19.6, 3.2, 6.9);
insert into record values('017', '401', 2020, 19.5, 3.5, 6.8);
insert into record values('018', '401', 2019, 11.9, 4.0, 6.8);
insert into record values('019', '401', 2019, 13.7, 2.9, 3.2);
insert into record values('019', '401', 2020, 12.1, 2.6, 3.3);
insert into record values('020', '401', 2020, 12.5, 2.7, 2.4);

insert into record values('021', '301', 2019, 14.3, 2.6, 5.0);
insert into record values('021', '301', 2020, 17.6, 3.0, 5.8);
insert into record values('022', '301', 2019, 19.5, 3.1, 9.7);
insert into record values('022', '301', 2020, 24.1, 6.0, 10.2);
insert into record values('023', '301', 2019, 8.1, 1.4, 2.3);
insert into record values('023', '301', 2020, 10.9, 1.5, 3.4);
insert into record values('024', '301', 2019, 6.1, 0.8, 4.3);
insert into record values('024', '301', 2020, 5.4, 0.8, 5.6);
insert into record values('025', '301', 2019, 6.4, 0.9, 2.8);
insert into record values('025', '301', 2020, 3.9, 0.5, 1.5);
insert into record values('026', '301', 2020, 14.9, 4.2, 2.9);
insert into record values('027', '301', 2019, 5.5, 2.9, 2.3);

insert into record values('028', '501', 2019, 15.4, 1.4, 8.2);
insert into record values('028', '501', 2020, 11.1, 1.8, 6.7);
insert into record values('029', '501', 2019, 10.6, 1.6, 5.3);
insert into record values('029', '501', 2020, 15.9, 2.2, 5.5);
insert into record values('030', '501', 2019, 19.4, 7.5, 5.0);
insert into record values('030', '501', 2020, 17.2, 7.3, 5.4);
insert into record values('031', '501', 2019, 22.9, 3.5, 7.3);
insert into record values('031', '501', 2020, 21.4, 4.5, 7.2);
insert into record values('032', '501', 2019, 17.6, 6.6, 3.8);
insert into record values('032', '501', 2020, 19.6, 6.3, 4.2);

