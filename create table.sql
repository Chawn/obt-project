CREATE TABLE USER
(
	ID varchar(8) NOT NULL,
	Prefix varchar(10) ,
	Firstname varchar(30) NOT NULL,
	Lastname varchar(30) NOT NULL,
	Sex varchar(1) ,
	Birthday datetime ,
	Address varchar(100) ,
	Phone varchar(10) ,
	Email varchar(30) ,
	Username varchar(10) NOT NULL,
	Password varchar(15) NOT NULL,
	Position varchar(30) ,
	Department varchar(30) ,
	MyUserRole varchar(8) NOT NULL,
	PRIMARY KEY (ID)
)

CREATE TABLE Post
(
	ID varchar(8) NOT NULL,
	Topic varchar(30) NOT NULL,
	Detail varchar(50) NOT NULL,
	AttachFile varchar(30) NOT NULL,
	Time varchar(30) NOT NULL,
	Category varchar(30) NOT NULL,
	Author varchar(8) NOT NULL,
	PRIMARY KEY (ID)
)

CREATE TABLE postcategory
(
	ID varchar(8) NOT NULL,
	Name varchar(30) NOT NULL,
	Description varchar(30),
	PRIMARY KEY (ID)
)

CREATE TABLE PostComment
(
	ID varchar(8) NOT NULL,
	Comment varchar(100) NOT NULL,
	Order int(3) NOT NULL,
	Timestamp datetime  NOT NULL,
	Author varchar(8) NOT NULL,
	PostID varchar(8) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (Author) REFERENCES user(ID),
	FOREIGN KEY (PostID) REFERENCES Post(ID)
	)

CREATE TABLE UserRole
(
	ID varchar(8) NOT NULL,
	Name varchar(30) NOT NULL,
	PRIMARY KEY (ID)
)

CREATE TABLE TaskRole
(
	ID varchar(8) NOT NULL,
	Name varchar(30) NOT NULL,
	Value varchar(30) NOT NULL,
	PRIMARY KEY (ID)
)

CREATE TABLE Role
(
	UserRoleID varchar(8) NOT NULL,
	TaskRoleID varchar(8) NOT NULL,
	CONSTRAINT pk_Role PRIMARY KEY (UserRoleID,TaskRoleID)
)

CREATE TABLE OTOPPhoto
(
	ID varchar(8) NOT NULL,
	Photo varchar(30) NOT NULL,
	Description varchar(50),
	PRIMARY KEY (ID)
)

CREATE TABLE OTOPProduct
(
	ID varchar(8) NOT NULL,
	Name varchar(100) NOT NULL,
	Description varchar(300),
	Type varchar(30) NOT NULL,
	Price varchar(7),
	Producer varchar(30) NOT NULL,
	Contact varchar(100) NOT NULL,
	PRIMARY KEY (ID)
)

CREATE TABLE Complaint
(
	ID varchar(8) NOT NULL,
	Prefix varchar(100),
	FirstName varchar(30),
	LastName varchar(30),
	Email varchar(30),
	Phone varchar(8) NOT NULL,
	Topic varchar(30) NOT NULL,
	Massage varchar(300) NOT NULL,
	PRIMARY KEY (ID)
)

CREATE TABLE LocationPhoto
(
	ID varchar(8) NOT NULL,
	Photo varchar(100) NOT NULL,
	Description varchar(50),
	Location varchar(8) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (Location) REFERENCES Location(ID)
)

CREATE TABLE Location
(
	ID varchar(8) NOT NULL,
	Name varchar(50) NOT NULL,
	Description varchar(50),
	Photo varchar(50) NOT NULL,
	Map varchar(300) NOT NULL,
	PRIMARY KEY (ID)
)

CREATE TABLE EstimateResult
(
	ID varchar(8) NOT NULL,
	Name varchar(30) NOT NULL,
	Result int(1),
	PRIMARY KEY (ID)
)

CREATE TABLE SurveyAnswer
(
	ID varchar(8) NOT NULL,
	Name varchar(50) NOT NULL,
	Value int(1) NOT NULL,
	Result int(4),
	PRIMARY KEY (ID)
)

CREATE TABLE GalleryPhoto
(
	ID varchar(8) NOT NULL,
	Photo varchar(100) NOT NULL,
	Description varchar(30),
	GalleryAlbum varchar(8) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (GalleryAlbum) REFERENCES GalleryAlbum(ID)
)

CREATE TABLE GalleryAlbum
(
	ID varchar(8) NOT NULL,
	Name varchar(100) NOT NULL,
	Description varchar(30),
	Timestamp datetime NOT NULL,
	Author varchar(8) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (Author) REFERENCES user(ID)
	)

CREATE TABLE SurveyForm
(
	ID varchar(8) NOT NULL,
	Name varchar(100) NOT NULL,
	ChoiceID varchar(8) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ChoiceID) REFERENCES SurveyAnswer(ID)
)

CREATE TABLE Menu
(
	ID varchar(8) NOT NULL,
	Name varchar(100) NOT NULL,
	Type int(1) NOT NULL,
	URL varchar(100) NOT NULL,
	Order int(2) NOT NULL,
	MainMenu varchar(8),
	PRIMARY KEY (ID)
)

CREATE TABLE Link
(
	URL varchar(300) NOT NULL,
	Text varchar(100) NOT NULL,
	Order int(2) NOT NULL,
	PRIMARY KEY (URL)
)

CREATE TABLE Page
(
	id varchar(8) NOT NULL,
    page_order int(2) not null default 0,
	title varchar(50) NOT NULL,
	detail longtext NOT NULL ,
	parent varchar(8) NOT NULL,
	comment_role varchar(1) NOT NULL DEFAULT '0',
	last_update datetime NOT NULL,
	PRIMARY KEY (ID)
)

CREATE TABLE Contact
(
	ID varchar(8) NOT NULL,
	Prefix varchar(100) ,
	Firstname varchar(30) NOT NULL,
	Lastname varchar(30) ,
	Email varchar(30) NOT NULL,
	Topic varchar(30) NOT NULL,
	Massage varchar(300) NOT NULL,
	PRIMARY KEY (ID)
)

CREATE TABLE NewsComment
(
	ID varchar(8) NOT NULL,
	Comment varchar(100) ,
	Order int(2) NOT NULL,
	Timestamp datetime NOT NULL,
	Author varchar(8) NOT NULL,
	NewsID varchar(8) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (NewsID) REFERENCES News(ID)
)

CREATE TABLE News
(
	ID varchar(8) NOT NULL,
	Topic varchar(100) ,
	Detail varchar(500) NOT NULL,
	AttchFile varchar(300) ,
	Timestamp datetime NOT NULL,
	CommentRole boolean NOT NULL,
	Category varchar(30) NOT NULL,
	Author varchar(8) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (Author) REFERENCES user(ID)
)

CREATE TABLE NewsCategory
(
	ID varchar(8) NOT NULL,
	Name varchar(30) NOT NULL,
	Description varchar(100),
	PRIMARY KEY (ID)
)

CREATE TABLE NewsTag
(
	ID varchar(8) NOT NULL,
	Name varchar(20) NOT NULL,
	Description varchar(100),
	PRIMARY KEY (ID)
)
