create database if not exists exam_db;
USE exam_db;
create table if not exists Candidate (
CandidateID int auto_increment primary key,
CandidateFirstName nvarchar(50) not null,
CandidateLastName nvarchar(50) not null
);