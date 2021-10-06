
-- Create table and constraint

create table students (
	student_id varchar(10) not null,
	first_name varchar(40),
	last_name varchar(20),
	faculty_id varchar(10),
	constraint students_pk primary key (student_id)
);

create table faculties (
	faculty_id varchar(10) not null,
	faculty_name varchar(50),
	description text,
	constraint faculties_pk primary key (faculty_id)
);

alter table public.students 
add constraint students_faculties_fk
	foreign key (faculty_id) references public.faculties(faculty_id); 

--drop table public.subject;

create table subjects (
	subject_id varchar(10) not null,
	subject_name varchar(50),
	lecture_id varchar(10),
	room_id varchar(10),
	constraint subject_pk primary key (subject_id)
);

	

create table rooms (
	room_id varchar(10) not null,
	room_name varchar(50),
	constraint room_pk primary key (room_id)
);

alter table public.subjects 
add constraint subject_room_fk
	foreign key (room_id) references public.rooms(room_id); 


create table lectures (
	lecture_id varchar(10) not null,
	first_name varchar(40),
	last_name varchar(20),
	faculty_id varchar(10),
	constraint lecture_pk primary key (lecture_id)
);


alter table public.lectures 
add constraint lecture_faculties_fk
	foreign key (faculty_id) references public.faculties(faculty_id); 



alter table public.subjects 
add constraint subject_lecture_fk
	foreign key (lecture_id) references public.lectures(lecture_id); 

-- faculty data
insert into faculties (faculty_id, faculty_name, description)
values('101','Fakultas Teknik Elektro', 'Electro');
insert into faculties (faculty_id, faculty_name, description)
values('102','Fakultas Ekonomi', 'Ekonomi');
insert into faculties (faculty_id, faculty_name, description)
values('103','Fakultas Teknik Informatika', 'IT');

-- student data
insert into students (student_id, first_name, last_name, faculty_id)
values('201','Cristiano', 'Ronaldo', '101');
insert into students (student_id, first_name, last_name, faculty_id)
values('202','Lionel', 'Messi', '102');
insert into students (student_id, first_name, last_name, faculty_id)
values('203','Rinaldy', 'Widyantoro', '103');

-- lecture data
insert into lectures (lecture_id, first_name, last_name, faculty_id)
values('301','Alex', 'Fergusion', '101');
insert into lectures (lecture_id, first_name, last_name, faculty_id)
values('302','Rahmat', 'Darmawan', '102');
insert into lectures (lecture_id, first_name, last_name, faculty_id)
values('303','Jose', 'Mourinho', '103');

-- room data
insert into rooms (room_id, room_name)
values('401','Camp Nou');
insert into rooms (room_id, room_name)
values('402','Stamford Bridge');
insert into rooms (room_id, room_name)
values('403','GBK');

-- subject
insert into subjects (subject_id, subject_name, lecture_id, room_id)
values('501','Membuat Robot', '301', '401');
insert into subjects (subject_id, subject_name, lecture_id, room_id)
values('502','Mengitung Kas', '302', '402');
insert into subjects (subject_id, subject_name, lecture_id, room_id)
values('503','Algoritma Pemrograman', '303', '403');


