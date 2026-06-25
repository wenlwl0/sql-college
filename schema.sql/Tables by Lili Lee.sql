CREATE TABLE LegalSex
(
	LegalSexID INT PRIMARY KEY IDENTITY(1,1)
	,LegalSexName VARCHAR(30)
)
CREATE TABLE USArmedForcesStatus
(
	USArmedForcesStatusID INT PRIMARY KEY IDENTITY(1,1)
	,USArmedForcesStatusName VARCHAR(30)
)
CREATE TABLE Ethnicity
(
	EthnicityID INT PRIMARY KEY IDENTITY(1,1)
	,EthnicityName VARCHAR(30)
)
CREATE TABLE CitizenshipStatus
(
	CitizenshipStatusID INT PRIMARY KEY IDENTITY(1,1)
	,CitizenshipStatusName VARCHAR(30)
)
CREATE TABLE HouseholdIncome
(
	HouseholdIncomeID INT PRIMARY KEY IDENTITY(1,1)
	,HouseholdIncomeRange VARCHAR(30)
)
CREATE TABLE AdmissionNotificationPlan
(
	AdmissionNotificationPlanID INT PRIMARY KEY IDENTITY(1,1)
	,AdmissionNotificationPlanType VARCHAR(30)
)
CREATE TABLE AppliedGraduationClass
(
	AppliedGraduationClassID INT PRIMARY KEY IDENTITY(1,1)
	,GraduationClassYear VARCHAR(30) 
	,TotalApplicants INT
	,TotalAdmitted INT
	,TotalEnrolled INT
	,FinalAcceptanceRate DECIMAL(10,2)
	,MaxAcceptanceRate DECIMAL(10,2)
	,ApplicationsOpenDate DATETIME 
	,ApplicationsCloseDate DATETIME
)
CREATE TABLE Applicant
(
	ApplicantID INT PRIMARY KEY IDENTITY(1,1)
	,LegalSexID INT FOREIGN KEY REFERENCES LegalSex(LegalSexID)
	,USArmedForcesStatusID INT FOREIGN KEY REFERENCES USArmedForcesStatus(USArmedForcesStatusID)
	,EthnicityID INT FOREIGN KEY REFERENCES Ethnicity(EthnicityID)
	,CitizenshipStatusID INT FOREIGN KEY REFERENCES CitizenshipStatus(CitizenshipStatusID)
	,HouseholdIncomeID INT FOREIGN KEY REFERENCES HouseholdIncome(HouseholdIncomeID)
	,LegalFirstName VARCHAR(30)
	,LegalMiddleName VARCHAR(30)
	,LegalLastName VARCHAR(30)
	,Birthdate DATETIME
)
CREATE TABLE Applications
(
     ApplicationsID INT PRIMARY KEY IDENTITY(1,1)
	,AppliedGraduationClassID INT FOREIGN KEY REFERENCES AppliedGraduationClass(AppliedGraduationClassID)
	,AdmissionNotificationPlanID INT FOREIGN KEY REFERENCES AdmissionNotificationPlan(AdmissionNotificationPlanID)
	,ApplicantID INT FOREIGN KEY REFERENCES Applicant(ApplicantID)
	,DateApplied DATETIME
)
CREATE TABLE CountryCode
(
	CountryCodeID INT PRIMARY KEY IDENTITY(1,1)
	,CountryCodeNumber VARCHAR(10)
)
CREATE TABLE PhoneType
(
	PhoneTypeID INT PRIMARY KEY IDENTITY(1,1)
	,PhoneTypeName VARCHAR(30)
)
CREATE TABLE ApplicantPhone
(
	ApplicantPhoneID INT PRIMARY KEY IDENTITY(1,1)
	,CountryCodeID INT FOREIGN KEY REFERENCES CountryCode(CountryCodeID)
	,PhoneTypeID INT FOREIGN KEY REFERENCES PhoneType(PhoneTypeID)
	,ApplicantID INT FOREIGN KEY REFERENCES Applicant(ApplicantID)
	,PhoneNumber VARCHAR(30)
)
CREATE TABLE EmailAddressType
(
	EmailAddressTypeID INT PRIMARY KEY IDENTITY(1,1)
	,EmailAddressTypeName VARCHAR(30)
)
CREATE TABLE ApplicantEmail
(
	ApplicantEmailID INT PRIMARY KEY IDENTITY(1,1)
	,EmailAddressTypeID INT FOREIGN KEY REFERENCES EmailAddressType(EmailAddressTypeID)
	,ApplicantID INT FOREIGN KEY REFERENCES Applicant(ApplicantID)
	,ApplicantEmailAddress VARCHAR(255)
)
CREATE TABLE WrittenProficiency
(
	WrittenProficiencyID INT PRIMARY KEY IDENTITY(1,1)
	,WrittenProficiencyLevel VARCHAR(30)
)
CREATE TABLE SpokenProficiency
(
	SpokenProficiencyID INT PRIMARY KEY IDENTITY(1,1)
	,SpokenProficiencyLevel VARCHAR(30)
)
CREATE TABLE ReadingProficiency
(
	ReadingProficiencyID INT PRIMARY KEY IDENTITY(1,1)
	,ReadingProficiencyLevel VARCHAR(30)
)
CREATE TABLE Languages
(
	LanguagesID INT PRIMARY KEY IDENTITY(1,1)
	,LanguageName VARCHAR(30)
)
CREATE TABLE LanguageList
(
	LanguageListID INT PRIMARY KEY IDENTITY(1,1)
	,ApplicantID INT FOREIGN KEY REFERENCES Applicant(ApplicantID)
	,LanguagesID INT FOREIGN KEY REFERENCES Languages(LanguagesID)
	,WrittenProficiencyID INT FOREIGN KEY REFERENCES WrittenProficiency(WrittenProficiencyID)
	,SpokenProficiencyID INT FOREIGN KEY REFERENCES SpokenProficiency(SpokenProficiencyID)
	,ReadingProficiencyID INT FOREIGN KEY REFERENCES ReadingProficiency(ReadingProficiencyID)
)
CREATE TABLE NumericalTestProgram
(
	NumericalTestProgramID INT PRIMARY KEY IDENTITY(1,1)
	,ProgramName VARCHAR(70)
	,HighestTotalScoreAchievable INT
)
CREATE TABLE NumericalTestTaken
(
	NumericalTestTakenID INT PRIMARY KEY IDENTITY(1,1)
	,NumericalTestProgramID INT FOREIGN KEY REFERENCES NumericalTestProgram(NumericalTestProgramID)
	,ApplicantID INT FOREIGN KEY REFERENCES Applicant(ApplicantID)
	,TotalScoreAchieved INT
	,TestStartDate DATETIME
	,TestEndDate DATETIME
)
CREATE TABLE GraduationStatus
(
	GraduationStatusID INT PRIMARY KEY IDENTITY(1,1)
	,GraduationStatusName VARCHAR(30)
)
CREATE TABLE SchoolCountry
(
	SchoolCountryID INT PRIMARY KEY IDENTITY(1,1)
	,SchoolCountryName VARCHAR(30)
)
CREATE TABLE School
(
	SchoolID INT PRIMARY KEY IDENTITY(1,1)
	,SchoolCountryID INT FOREIGN KEY REFERENCES SchoolCountry(SchoolCountryID)
	,SchoolName VARCHAR(30)
	,SchoolWebsite VARCHAR(255)
	,SchoolPhone VARCHAR(30)
	,SchoolCity VARCHAR(30)
)
CREATE TABLE SchoolType
(
	SchoolTypeID INT PRIMARY KEY IDENTITY(1,1)
	,SchoolTypeName VARCHAR(30)
)
CREATE TABLE GPAWeighting
(
	GPAWeightingID INT PRIMARY KEY IDENTITY(1,1)
	,GPAWeightingName VARCHAR(30)
)
CREATE TABLE SchoolList
(
	SchoolListID INT PRIMARY KEY IDENTITY(1,1)
	,SchoolID INT FOREIGN KEY REFERENCES School(SchoolID)
	,SchoolTypeID INT FOREIGN KEY REFERENCES SchoolType(SchoolTypeID)
	,GraduationStatusID INT FOREIGN KEY REFERENCES GraduationStatus(GraduationStatusID)
	,ApplicantID INT FOREIGN KEY REFERENCES Applicant(ApplicantID)
	,GPAWeightingID INT FOREIGN KEY REFERENCES GPAWeighting(GPAWeightingID)
	,CumulativeGPAScore DECIMAL(10,2)
	,GPAScale DECIMAL(10,2)
	,SchoolStartDate DATETIME
	,SchoolEndDate DATETIME
)
CREATE TABLE Campus
(
	CampusID INT PRIMARY KEY IDENTITY(1,1)
	,CampusName VARCHAR(30)
)
CREATE TABLE CampusRank
(
	CampusRankID INT PRIMARY KEY IDENTITY(1,1)
	,CampusRankName VARCHAR(30)
)
CREATE TABLE CampusInterestList
(
	CampusInterestListID INT PRIMARY KEY IDENTITY(1,1)
	,CampusID INT FOREIGN KEY REFERENCES Campus(CampusID) 
	,CampusRankID INT FOREIGN KEY REFERENCES CampusRank(CampusRankID) 
	,ApplicationsID INT FOREIGN KEY REFERENCES Applications(ApplicationsID)
)
CREATE TABLE SchoolofUnivesity
(
	SchoolofUnivesityID INT PRIMARY KEY IDENTITY(1,1)
	,SchoolofUnivesityName VARCHAR(50)
)
CREATE TABLE Major
(
	MajorID INT PRIMARY KEY IDENTITY(1,1)
	,SchoolofUnivesityID INT FOREIGN KEY REFERENCES SchoolofUnivesity(SchoolofUnivesityID)
	,MajorName VARCHAR(30)
)
CREATE TABLE MajorRank
(
	MajorRankID INT PRIMARY KEY IDENTITY(1,1)
	,MajorRankName VARCHAR(30)
)
CREATE TABLE ProgramAdmissionResults
(
	ProgramAdmissionResultsID INT PRIMARY KEY IDENTITY(1,1)
	,ProgramAdmissionResultsName VARCHAR(30)
)
CREATE TABLE MajorInterestList
(
	MajorInterestListID INT PRIMARY KEY IDENTITY(1,1)
	,MajorID INT FOREIGN KEY REFERENCES Major(MajorID)
	,MajorRankID INT FOREIGN KEY REFERENCES MajorRank(MajorRankID)
	,ApplicationsID INT FOREIGN KEY REFERENCES Applications(ApplicationsID)
	,ProgramAdmissionResultsID INT FOREIGN KEY REFERENCES ProgramAdmissionResults(ProgramAdmissionResultsID)
)
CREATE TABLE Scholarship
(
	ScholarshipID INT PRIMARY KEY IDENTITY(1,1)
	,ScholarshipName VARCHAR(30)
)
CREATE TABLE ScholarshipResults
(
	ScholarshipResultsID INT PRIMARY KEY IDENTITY(1,1)
	,ScholarshipResultsName VARCHAR(30)
)
CREATE TABLE ScholarshipInterestList
(
	ScholarshipInterestListID INT PRIMARY KEY IDENTITY(1,1)
	,ScholarshipID INT FOREIGN KEY REFERENCES Scholarship(ScholarshipID)
	,ApplicationsID INT FOREIGN KEY REFERENCES Applications(ApplicationsID)
	,ScholarshipResultsID INT FOREIGN KEY REFERENCES ScholarshipResults(ScholarshipResultsID)
)