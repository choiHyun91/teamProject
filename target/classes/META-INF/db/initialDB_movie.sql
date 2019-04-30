-- initailDB
DROP TABLE BOOKINGSEAT;
DROP TABLE BOOKING;
DROP TABLE SEATSTATE;
DROP TABLE SEAT;
DROP TABLE TIME;
DROP TABLE SCREENUP;
DROP TABLE SCREEN;
DROP TABLE CINEMA;
DROP TABLE MOVIERATING;
DROP TABLE MOVIE;
DROP TABLE MEMBER;
DROP TABLE MEMBERGRADE;
CREATE TABLE MEMBERGRADE (
    MemberGradeNo VARCHAR2(20) PRIMARY KEY,
    MemberGradeName VARCHAR2(20) NOT NULL
);
CREATE TABLE MEMBER (
    MemberId VARCHAR2(30) PRIMARY KEY,
    MemberPw VARCHAR2(30) NOT NULL,
    MemberName VARCHAR2(30) NOT NULL,
    MemberBirth DATE NOT NULL,
    MemberPhone VARCHAR2(30) NOT NULL,
    MemberEmail VARCHAR2(100) NOT NULL,
    MemberAddress VARCHAR2(255) NOT NULL,
    MemberPoint NUMBER(8) DEFAULT 0 NOT NULL,
    MemberAmount NUMBER(10) NOT NULL,
    MemberState NUMBER(1) DEFAULT 0 NOT NULL,
    MemberGradeNo REFERENCES MEMBERGRADE(MemberGradeNo)
);
DROP SEQUENCE MOVIE_SEQ;
CREATE SEQUENCE MOVIE_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE MOVIE (
    MovieNo NUMBER(10) PRIMARY KEY,
    MovieName VARCHAR2(200) NOT NULL,
    MovieDirector VARCHAR2(100) NOT NULL,
    MovieActor VARCHAR2(500) NOT NULL,
    MovieGenre VARCHAR2(20) NOT NULL,
    MovieCountry VARCHAR2(30) NOT NULL,
    MovieGrade VARCHAR2(30) NOT NULL,
    MovieRunningtime VARCHAR2(30) NOT NULL,
    MovieRelease DATE NOT NULL,
    MovieImage VARCHAR2(200) NOT NULL,
    MovieTrailer VARCHAR2(50) NOT NULL,
    MovieStory VARCHAR2(4000)
);
DROP SEQUENCE MOVIERATING_SEQ;
CREATE SEQUENCE MOVIERATING_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE MOVIERATING (
    MovieRatingNo NUMBER(10) PRIMARY KEY,
    MovieNo REFERENCES MOVIE(MovieNo),
    MemberId REFERENCES MEMBER(MemberId),
    MovieRatingPoint NUMBER(2) NOT NULL,
    MovieRatingComment VARCHAR2(300)
);
CREATE TABLE CINEMA (
    CinemaNo VARCHAR2(20) PRIMARY KEY,
    CinemaName VARCHAR2(30) NOT NULL
);
CREATE TABLE SCREEN (
    ScreenNo VARCHAR2(20) PRIMARY KEY,
    ScreenName VARCHAR2(20) NOT NULL,
    CinemaNo REFERENCES CINEMA(CinemaNo)
);
DROP SEQUENCE SCREENUP_SEQ;
CREATE SEQUENCE SCREENUP_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE SCREENUP (
    ScreenupNo NUMBER(10) PRIMARY KEY,
    MovieNo REFERENCES MOVIE(MovieNo),
    ScreenNo REFERENCES SCREEN(ScreenNo),
    ScreenupStartdate DATE NOT NULL,
    ScreenupEnddate DATE NOT NULL
);
CREATE TABLE TIME (
    TimeNo VARCHAR2(20) PRIMARY KEY,
    TimeSet VARCHAR2(30) NOT NULL
);
CREATE TABLE SEAT (
    SeatNo VARCHAR2(10) PRIMARY KEY,
    SeatRow VARCHAR2(20) NOT NULL,
    SeatCol NUMBER(2) NOT NULL
);
DROP SEQUENCE SEATSTATE_SEQ;
CREATE SEQUENCE SEATSTATE_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE SEATSTATE (
    SeatStateNo NUMBER(10) PRIMARY KEY,
    SeatNo REFERENCES SEAT(SeatNo),
    TimeNo REFERENCES TIME(TimeNo),
    ScreenNo REFERENCES SCREEN(ScreenNo),
    SeatStateDate DATE NOT NULL
);
DROP SEQUENCE BOOKING_SEQ;
CREATE SEQUENCE BOOKING_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE BOOKING (
    BookingNo NUMBER(10) PRIMARY KEY,
    ScreenupNo REFERENCES SCREENUP(ScreenupNo),
    MemberId REFERENCES MEMBER(MemberId),
    TimeNo REFERENCES TIME(TimeNo),
    BookingDate DATE NOT NULL,
    BookingCount NUMBER(1) NOT NULL,
    BookingPrice NUMBER(6) NOT NULL
);
DROP SEQUENCE BOOKINGSEAT_SEQ;
CREATE SEQUENCE BOOKINGSEAT_SEQ MAXVALUE 9999999999 NOCYCLE NOCACHE;
CREATE TABLE BOOKINGSEAT (
    BookingSeatNo NUMBER(10) PRIMARY KEY,
    BookingNo REFERENCES BOOKING(BookingNo),
    SeatNo REFERENCES SEAT(SeatNo)
);