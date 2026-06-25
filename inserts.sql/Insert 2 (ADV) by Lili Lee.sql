
DECLARE 
@PhoneTypeName VARCHAR(30) = 'Home'
,@CountryCodeNumber VARCHAR(30) = '+44'
,@PhoneNumber VARCHAR(30) = '7458196926'
,@EmailAddressTypeName VARCHAR(30) = 'Secondary'
,@ApplicantEmailAddress VARCHAR(255) = 'harrypotter@gmail.com'
,@WrittenProficiencyLevel VARCHAR(30) = 'Fluent'
,@SpokenProficiencyLevel VARCHAR(30) = 'Fluent'
,@ReadingProficiencyLevel VARCHAR(30) = 'Fluent'
,@LanguageName VARCHAR(30) = 'Russian'
,@ProgramName VARCHAR(70) = 'GED'
,@HighestTotalScoreAchievable INT = 800
,@TotalScoreAchieved INT = 760
,@TestStartDate DATETIME = '2022-04-05'
,@TestEndDate DATETIME = '2022-06-07'
,@GraduationStatusName VARCHAR(30) = 'Did or Will Not Graduate'
,@SchoolCountryName VARCHAR(30) = 'England'
,@SchoolName VARCHAR(30) = 'Diagon Alley'
,@SchoolWebsite VARCHAR(255) = 'DiagonAlley.com'
,@SchoolPhone VARCHAR(30) = '+1 828339490'
,@SchoolCity VARCHAR(30) = 'Surrey'
,@GPAWeightingName VARCHAR(30) = 'Weighted'
,@CumulativeGPAScore DECIMAL(10,2) = 3.74
,@GPAScale DECIMAL(10,2) = 4.0
,@SchoolTypeName VARCHAR(30) = 'Middle School'
,@SchoolStartDate DATETIME = '2019-09-10'
,@SchoolEndDate DATETIME = '2022-05-10'
,@CampusName VARCHAR(30) = 'Shanghai'
,@CampusRankName VARCHAR(30) = 'First Choice'
,@SchoolofUnivesityName VARCHAR(50) = 'College of Arts & Sciences'
,@MajorName VARCHAR(30) = 'English'
,@MajorRankName VARCHAR(30) = 'Alternate Choice'
,@ProgramAdmissionResultsName VARCHAR(30) = 'Accepted'
,@ScholarshipName VARCHAR(30) = 'Slytherin Scholarship'
,@ScholarshipResultsName VARCHAR(30) = 'Accepted'

DECLARE @ApplicationsID INT = 1
DECLARE @ApplicantID INT = 1
DECLARE @PhoneTypeID INT = 2
DECLARE @CountryCodeID INT = 2
DECLARE @ApplicantPhoneID INT = 2
DECLARE @EmailAddressTypeID INT = 2
DECLARE @ApplicantEmailID INT = 2
DECLARE @WrittenProficiencyID INT = 2
DECLARE @SpokenProficiencyID INT = 2
DECLARE @ReadingProficiencyID INT = 2
DECLARE @LanguagesID INT = 2
DECLARE @LanguageListID INT = 2
DECLARE @NumericalTestProgramID INT = 2
DECLARE @NumericalTestTakenID INT = 2
DECLARE @GraduationStatusID INT = 2
DECLARE @SchoolCountryID INT = 2
DECLARE @SchoolID INT = 2
DECLARE @GPAWeightingID INT = 2
DECLARE @SchoolTypeID INT = 2
DECLARE @SchoolListID INT = 2
DECLARE @CampusID INT = 2
DECLARE @CampusRankID INT = 2
DECLARE @CampusInterestListID INT = 2
DECLARE @SchoolofUnivesityID INT = 2
DECLARE @MajorID INT = 2
DECLARE @MajorRankID INT = 2
DECLARE @ProgramAdmissionResultsID INT = 2
DECLARE @MajorInterestListID INT = 2
DECLARE @ScholarshipID INT = 2
DECLARE @ScholarshipResultsID INT = 2
DECLARE @ScholarshipInterestListID INT = 2

						---------------------------------CountryCode
	IF NOT EXISTS(SELECT * FROM CountryCode WHERE CountryCodeNumber = @CountryCodeNumber)
	BEGIN
		PRINT 'CountryCodeID CountryCodeNumber NOT EXIST'
		INSERT INTO CountryCode(CountryCodeNumber)
		VALUES(@CountryCodeNumber)
	END
	SET @CountryCodeID = (SELECT @CountryCodeID FROM CountryCode WHERE CountryCodeNumber = @CountryCodeNumber)
	PRINT '@CountryCodeID'
	PRINT @CountryCodeID

							---------------------------------PhoneType
	IF NOT EXISTS(SELECT * FROM PhoneType WHERE PhoneTypeName = @PhoneTypeName)
	BEGIN
		PRINT 'PhoneTypeID PhoneTypeName NOT EXIST'
		INSERT INTO PhoneType(PhoneTypeName)
		VALUES(@PhoneTypeName)
	END
	SET @PhoneTypeID = (SELECT @PhoneTypeID FROM PhoneType WHERE PhoneTypeName = @PhoneTypeName)
	PRINT '@PhoneTypeID'
	PRINT @PhoneTypeID

						---------------------------------ApplicantPhone
	IF NOT EXISTS(SELECT * FROM ApplicantPhone WHERE ApplicantPhoneID = @ApplicantPhoneID AND CountryCodeID = @CountryCodeID AND PhoneNumber = @PhoneNumber AND PhoneTypeID = @PhoneTypeID AND ApplicantID = @ApplicantID)
	BEGIN
		PRINT ' ApplicantPhoneID CountryCodeID PhoneNumber PhoneTypeID ApplicantID NOT EXIST'
		INSERT INTO ApplicantPhone(CountryCodeID, PhoneNumber, PhoneTypeID, ApplicantID)
		VALUES(@CountryCodeID, @PhoneNumber, @PhoneTypeID, @ApplicantID)
	END
	SET @ApplicantPhoneID = (SELECT ApplicantPhoneID FROM ApplicantPhone WHERE CountryCodeID = @CountryCodeID AND PhoneNumber = @PhoneNumber AND PhoneTypeID = @PhoneTypeID AND ApplicantID = @ApplicantID)
	PRINT '@ApplicantPhoneID'
	PRINT @ApplicantPhoneID

							---------------------------------EmailAddressType
	IF NOT EXISTS(SELECT * FROM EmailAddressType WHERE EmailAddressTypeName = @EmailAddressTypeName)
	BEGIN
		PRINT 'EmailAddressTypeID EmailAddressTypeName NOT EXIST'
		INSERT INTO EmailAddressType(EmailAddressTypeName)
		VALUES(@EmailAddressTypeName)
	END
	SET @EmailAddressTypeID = (SELECT @EmailAddressTypeID FROM EmailAddressType WHERE EmailAddressTypeName = @EmailAddressTypeName)
	PRINT '@EmailAddressTypeID'
	PRINT @EmailAddressTypeID

								---------------------------------ApplicantEmail
	IF NOT EXISTS(SELECT * FROM ApplicantEmail WHERE ApplicantEmailAddress = @ApplicantEmailAddress AND EmailAddressTypeID = @EmailAddressTypeID AND ApplicantID = @ApplicantID)
	BEGIN
		PRINT 'ApplicantEmailID ApplicantEmailAddress EmailAddressTypeID ApplicantID NOT EXIST'
		INSERT INTO ApplicantEmail(ApplicantEmailAddress, EmailAddressTypeID, ApplicantID)
		VALUES(@ApplicantEmailAddress, @EmailAddressTypeID, @ApplicantID)
	END
	SET @ApplicantEmailID = (SELECT @ApplicantEmailID FROM ApplicantEmail WHERE ApplicantEmailAddress = @ApplicantEmailAddress AND EmailAddressTypeID = @EmailAddressTypeID AND ApplicantID = @ApplicantID)
	PRINT '@ApplicantEmailID'
	PRINT @ApplicantEmailID

						---------------------------------WrittenProficiency
	IF NOT EXISTS(SELECT * FROM WrittenProficiency WHERE WrittenProficiencyLevel = @WrittenProficiencyLevel)
	BEGIN
		PRINT 'WrittenProficiencyID WrittenProficiencyLevel NOT EXIST'
		INSERT INTO WrittenProficiency(WrittenProficiencyLevel)
		VALUES(@WrittenProficiencyLevel)
	END
	SET @WrittenProficiencyID = (SELECT @WrittenProficiencyID FROM WrittenProficiency WHERE WrittenProficiencyLevel = @WrittenProficiencyLevel)
	PRINT '@WrittenProficiencyID'
	PRINT @WrittenProficiencyID

							---------------------------------SpokenProficiency
	IF NOT EXISTS(SELECT * FROM SpokenProficiency WHERE SpokenProficiencyLevel = @SpokenProficiencyLevel)
	BEGIN
		PRINT 'SpokenProficiencyID SpokenProficiencyLevel NOT EXIST'
		INSERT INTO SpokenProficiency(SpokenProficiencyLevel)
		VALUES(@SpokenProficiencyLevel)
	END
	SET @SpokenProficiencyID = (SELECT @SpokenProficiencyID FROM SpokenProficiency WHERE SpokenProficiencyLevel = @SpokenProficiencyLevel)
	PRINT '@SpokenProficiencyID'
	PRINT @SpokenProficiencyID

							---------------------------------ReadingProficiency
	IF NOT EXISTS(SELECT * FROM ReadingProficiency WHERE ReadingProficiencyLevel = @ReadingProficiencyLevel)
	BEGIN
		PRINT 'ReadingProficiencyID ReadingProficiencyLevel NOT EXIST'
		INSERT INTO ReadingProficiency(ReadingProficiencyLevel)
		VALUES(@ReadingProficiencyLevel)
	END
	SET @ReadingProficiencyID = (SELECT @ReadingProficiencyID FROM ReadingProficiency WHERE ReadingProficiencyLevel = @ReadingProficiencyLevel)
	PRINT '@ReadingProficiencyID'
	PRINT @ReadingProficiencyID

								---------------------------------Languages
	IF NOT EXISTS(SELECT * FROM Languages WHERE LanguageName = @LanguageName)
	BEGIN
		PRINT 'LanguagesID LanguageName NOT EXIST'
		INSERT INTO Languages(LanguageName)
		VALUES(@LanguageName)
	END
	SET @LanguagesID = (SELECT @LanguagesID FROM Languages WHERE LanguageName = @LanguageName)
	PRINT '@LanguagesID'
	PRINT @LanguagesID

	
							---------------------------------LanguageList
	IF NOT EXISTS(SELECT * FROM LanguageList WHERE ApplicantID = @ApplicantID AND LanguagesID = @LanguagesID AND WrittenProficiencyID = @WrittenProficiencyID AND SpokenProficiencyID = @SpokenProficiencyID AND ReadingProficiencyID = @ReadingProficiencyID)
	BEGIN
		PRINT 'LanguageListID ApplicantID LanguagesID WrittenProficiencyID SpokenProficiencyID ReadingProficiencyID NOT EXIST'
		INSERT INTO LanguageList(ApplicantID, LanguagesID, WrittenProficiencyID, SpokenProficiencyID, ReadingProficiencyID)
		VALUES(@ApplicantID, @LanguagesID, @WrittenProficiencyID, @SpokenProficiencyID, @ReadingProficiencyID)
	END
	SET @LanguageListID = (SELECT @LanguageListID FROM LanguageList WHERE ApplicantID = @ApplicantID AND LanguagesID = @LanguagesID AND WrittenProficiencyID = @WrittenProficiencyID AND SpokenProficiencyID = @SpokenProficiencyID AND ReadingProficiencyID = @ReadingProficiencyID)
	PRINT '@LanguageListID'
	PRINT @LanguageListID

								---------------------------------NumericalTestProgram
	IF NOT EXISTS(SELECT * FROM NumericalTestProgram WHERE ProgramName = @ProgramName AND HighestTotalScoreAchievable = @HighestTotalScoreAchievable)
	BEGIN
		PRINT 'NumericalTestProgramID ProgramName HighestTotalScoreAchievable NOT EXIST'
		INSERT INTO NumericalTestProgram(ProgramName, HighestTotalScoreAchievable)
		VALUES(@ProgramName, @HighestTotalScoreAchievable)
	END
	SET @NumericalTestProgramID = (SELECT @NumericalTestProgramID FROM NumericalTestProgram WHERE ProgramName = @ProgramName AND HighestTotalScoreAchievable = @HighestTotalScoreAchievable)
	PRINT '@NumericalTestProgramID'
	PRINT @NumericalTestProgramID
		
								---------------------------------NumericalTestTaken
	IF NOT EXISTS(SELECT * FROM NumericalTestTaken WHERE NumericalTestProgramID = @NumericalTestProgramID AND TotalScoreAchieved = @TotalScoreAchieved AND ApplicantID = @ApplicantID  AND TestStartDate = @TestStartDate AND TestEndDate = @TestEndDate )
	BEGIN
		PRINT 'NumericalTestTakenID NumericalTestProgramID TotalScoreAchieved ApplicantID TestStartDate TestEndDate  NOT EXIST'
		INSERT INTO NumericalTestTaken(NumericalTestProgramID, TotalScoreAchieved, ApplicantID, TestStartDate, TestEndDate)
		VALUES(@NumericalTestProgramID, @TotalScoreAchieved, @ApplicantID, @TestStartDate, @TestEndDate)
	END
	SET @NumericalTestTakenID = (SELECT @NumericalTestTakenID FROM NumericalTestTaken WHERE NumericalTestProgramID = @NumericalTestProgramID AND TotalScoreAchieved = @TotalScoreAchieved AND ApplicantID = @ApplicantID  AND TestStartDate = @TestStartDate AND TestEndDate = @TestEndDate )
	PRINT '@NumericalTestTakenID'
	PRINT @NumericalTestTakenID

							---------------------------------GraduationStatus
	IF NOT EXISTS(SELECT * FROM GraduationStatus WHERE GraduationStatusName = @GraduationStatusName)
	BEGIN
		PRINT 'GraduationStatusID GraduationStatusName NOT EXIST'
		INSERT INTO GraduationStatus(GraduationStatusName)
		VALUES(@GraduationStatusName)
	END
	SET @GraduationStatusID = (SELECT @GraduationStatusID FROM GraduationStatus WHERE GraduationStatusName = @GraduationStatusName)
	PRINT '@GraduationStatusID'
	PRINT @GraduationStatusID
	
								---------------------------------SchoolCountry
	IF NOT EXISTS(SELECT * FROM SchoolCountry WHERE SchoolCountryName = @SchoolCountryName)
	BEGIN
		PRINT 'SchoolID SchoolCountryName NOT EXIST'
		INSERT INTO SchoolCountry(SchoolCountryName)
		VALUES(@SchoolCountryName)
	END
	SET @SchoolCountryID = (SELECT @SchoolCountryID FROM SchoolCountry WHERE SchoolCountryName = @SchoolCountryName)
	PRINT '@SchoolCountryID'
	PRINT @SchoolCountryID

								---------------------------------School
	IF NOT EXISTS(SELECT * FROM School WHERE SchoolName = @SchoolName AND SchoolCountryID = @SchoolCountryID AND SchoolWebsite = @SchoolWebsite AND SchoolPhone = @SchoolPhone AND SchoolCity = @SchoolCity)
	BEGIN
		PRINT 'SchoolID SchoolName SchoolCountryID SchoolWebsite SchoolPhone SchoolCity NOT EXIST'
		INSERT INTO School(SchoolName, SchoolCountryID, SchoolWebsite, SchoolPhone, SchoolCity)
		VALUES(@SchoolName, @SchoolCountryID, @SchoolWebsite, @SchoolPhone, @SchoolCity)
	END
	SET @SchoolID = (SELECT @SchoolID FROM School WHERE SchoolName = @SchoolName AND SchoolCountryID = @SchoolCountryID AND SchoolWebsite = @SchoolWebsite AND SchoolPhone = @SchoolPhone AND SchoolCity = @SchoolCity)
	PRINT '@SchoolID'
	PRINT @SchoolID

	
							---------------------------------SchoolType
	IF NOT EXISTS(SELECT * FROM SchoolType WHERE SchoolTypeName = @SchoolTypeName)
	BEGIN
		PRINT 'SchoolTypeID SchoolTypeName NOT EXIST'
		INSERT INTO SchoolType(SchoolTypeName)
		VALUES(@SchoolTypeName)
	END
	SET @SchoolTypeID = (SELECT @SchoolTypeID FROM SchoolType WHERE SchoolTypeName = @SchoolTypeName)
	PRINT '@SchoolTypeID'
	PRINT @SchoolTypeID
								---------------------------------GPAWeighting
	IF NOT EXISTS(SELECT * FROM GPAWeighting WHERE GPAWeightingName = @GPAWeightingName)
	BEGIN
		PRINT 'GPAWeightingID GPAWeightingName NOT EXIST'
		INSERT INTO GPAWeighting(GPAWeightingName)
		VALUES(@GPAWeightingName)
	END
	SET @GPAWeightingID = (SELECT @GPAWeightingID FROM GPAWeighting WHERE GPAWeightingName = @GPAWeightingName)
	PRINT '@GPAWeightingID'
	PRINT @GPAWeightingID

									---------------------------------SchoolList
	IF NOT EXISTS(SELECT * FROM SchoolList WHERE SchoolID = @SchoolID AND SchoolTypeID = @SchoolTypeID AND CumulativeGPAScore = @CumulativeGPAScore AND GPAWeightingID = @GPAWeightingID AND GPAScale = @GPAScale AND GraduationStatusID = @GraduationStatusID AND SchoolStartDate = @SchoolStartDate AND SchoolEndDate = @SchoolEndDate AND ApplicantID = @ApplicantID)
	BEGIN
		PRINT 'SchoolListID SchoolID SchoolTypeID CumulativeGPAScore GPAScale GPAWeightingID GraduationStatusID SchoolStartDate SchoolEndDate ApplicantID NOT EXIST'
		INSERT INTO SchoolList(SchoolID, SchoolTypeID, CumulativeGPAScore, GPAScale, GPAWeightingID, GraduationStatusID, SchoolStartDate, SchoolEndDate, ApplicantID)
		VALUES(@SchoolID, @SchoolTypeID, @CumulativeGPAScore, @GPAScale, @GPAWeightingID, @GraduationStatusID, @SchoolStartDate, @SchoolEndDate, @ApplicantID)
	END
	SET @SchoolListID = (SELECT @SchoolTypeID FROM SchoolList WHERE SchoolID = @SchoolID AND SchoolTypeID = @SchoolTypeID AND CumulativeGPAScore = @CumulativeGPAScore AND GPAScale = @GPAScale AND GPAWeightingID = @GPAWeightingID AND GraduationStatusID = @GraduationStatusID AND SchoolStartDate = @SchoolStartDate AND SchoolEndDate = @SchoolEndDate AND ApplicantID = @ApplicantID)
	PRINT '@SchoolListID'
	PRINT @SchoolListID
	
									---------------------------------Campus
	IF NOT EXISTS(SELECT * FROM Campus WHERE CampusName = @CampusName)
	BEGIN
		PRINT 'CampusID CampusName NOT EXIST'
		INSERT INTO Campus(CampusName)
		VALUES(@CampusName)
	END
	SET @CampusID = (SELECT @CampusID FROM Campus WHERE CampusName = @CampusName)
	PRINT '@CampusID'
	PRINT @CampusID
										---------------------------------CampusRank
	IF NOT EXISTS(SELECT * FROM CampusRank WHERE CampusRankName = @CampusRankName)
	BEGIN
		PRINT 'CampusRankID CampusRankName NOT EXIST'
		INSERT INTO CampusRank(CampusRankName)
		VALUES(@CampusRankName)
	END
	SET @CampusRankID = (SELECT @CampusRankID FROM CampusRank WHERE CampusRankName = @CampusRankName)
	PRINT '@CampusRankID'
	PRINT @CampusRankID
									---------------------------------CampusInterestList
	IF NOT EXISTS(SELECT * FROM CampusInterestList WHERE CampusID = @CampusID AND CampusRankID = @CampusRankID AND ApplicationsID = @ApplicationsID)
	BEGIN
		PRINT 'CampusInterestListID CampusID CampusRankID ApplicationsID NOT EXIST'
		INSERT INTO CampusInterestList(CampusID, CampusRankID, ApplicationsID)
		VALUES(@CampusID, @CampusRankID, @ApplicationsID)
	END
	SET @CampusInterestListID = (SELECT @CampusInterestListID FROM CampusInterestList WHERE CampusID = @CampusID AND CampusRankID = @CampusRankID AND ApplicationsID = @ApplicationsID)
	PRINT '@CampusInterestListID'
	PRINT @CampusInterestListID
										---------------------------------SchoolofUnivesity
	IF NOT EXISTS(SELECT * FROM SchoolofUnivesity WHERE SchoolofUnivesityName = @SchoolofUnivesityName)
	BEGIN
		PRINT 'CampusID SchoolofUnivesityName NOT EXIST'
		INSERT INTO SchoolofUnivesity(SchoolofUnivesityName)
		VALUES(@SchoolofUnivesityName)
	END
	SET @SchoolofUnivesityID = (SELECT @SchoolofUnivesityID FROM SchoolofUnivesity WHERE SchoolofUnivesityName = @SchoolofUnivesityName)
	PRINT '@SchoolofUnivesityID'
	PRINT @SchoolofUnivesityID

										---------------------------------ProgramAdmissionResults
	IF NOT EXISTS(SELECT * FROM ProgramAdmissionResults WHERE ProgramAdmissionResultsName = @ProgramAdmissionResultsName)
	BEGIN
		PRINT 'ProgramAdmissionResultsID ProgramAdmissionResultsName NOT EXIST'
		INSERT INTO ProgramAdmissionResults(ProgramAdmissionResultsName)
		VALUES(@ProgramAdmissionResultsName)
	END
	SET @ProgramAdmissionResultsID = (SELECT @ProgramAdmissionResultsID FROM ProgramAdmissionResults WHERE ProgramAdmissionResultsName = @ProgramAdmissionResultsName)
	PRINT '@ProgramAdmissionResultsID'
	PRINT @ProgramAdmissionResultsID

										---------------------------------Major
	IF NOT EXISTS(SELECT * FROM Major WHERE MajorName = @MajorName)
	BEGIN
		PRINT 'MajorID MajorName NOT EXIST'
		INSERT INTO Major(MajorName)
		VALUES(@MajorName)
	END
	SET @MajorID = (SELECT @MajorID FROM Major WHERE MajorName = @MajorName)
	PRINT '@MajorID'
	PRINT @MajorID
										---------------------------------MajorRank
	IF NOT EXISTS(SELECT * FROM MajorRank WHERE MajorRankName = @MajorRankName)
	BEGIN
		PRINT 'MajorRankID MajorRankName NOT EXIST'
		INSERT INTO MajorRank(MajorRankName)
		VALUES(@MajorRankName)
	END
	SET @MajorRankID = (SELECT @MajorRankID FROM MajorRank WHERE MajorRankName = @MajorRankName)
	PRINT '@MajorRankID'
	PRINT @MajorRankID


										---------------------------------MajorInterestList
	IF NOT EXISTS(SELECT * FROM MajorInterestList WHERE MajorID = @MajorID AND MajorRankID = @MajorRankID AND ApplicationsID = @ApplicationsID AND ProgramAdmissionResultsID = @ProgramAdmissionResultsID)
	BEGIN
		PRINT 'MajorInterestListID MajorID MajorRankID ApplicationsID ProgramAdmissionResultsID NOT EXIST'
		INSERT INTO MajorInterestList(MajorID, MajorRankID, ApplicationsID, ProgramAdmissionResultsID)
		VALUES(@MajorID, @MajorRankID, @ApplicationsID, @ProgramAdmissionResultsID)
	END
	SET @MajorInterestListID = (SELECT @MajorInterestListID FROM MajorInterestList WHERE MajorID = @MajorID AND MajorRankID = @MajorRankID AND ApplicationsID = @ApplicationsID AND ProgramAdmissionResultsID = @ProgramAdmissionResultsID)
	PRINT '@@MajorInterestListID'
	PRINT @MajorInterestListID

									---------------------------------Scholarship
	IF NOT EXISTS(SELECT * FROM Scholarship WHERE ScholarshipName = @ScholarshipName)
	BEGIN
		PRINT 'ScholarshipID ScholarshipName NOT EXIST'
		INSERT INTO Scholarship(ScholarshipName)
		VALUES(@ScholarshipName)
	END
	SET @ScholarshipID = (SELECT @ScholarshipID FROM Scholarship WHERE ScholarshipName = @ScholarshipName)
	PRINT '@ScholarshipID'
	PRINT @ScholarshipID
										---------------------------------ScholarshipResults
	IF NOT EXISTS(SELECT * FROM ScholarshipResults WHERE ScholarshipResultsName = @ScholarshipResultsName)
	BEGIN
		PRINT 'ScholarshipResultsID ScholarshipResultsName NOT EXIST'
		INSERT INTO ScholarshipResults(ScholarshipResultsName)
		VALUES(@ScholarshipResultsName)
	END
	SET @ScholarshipResultsID = (SELECT @ScholarshipResultsID FROM ScholarshipResults WHERE ScholarshipResultsName = @ScholarshipResultsName)
	PRINT '@ScholarshipResultsID'
	PRINT @ScholarshipResultsID

									---------------------------------ScholarshipInterestList
	IF NOT EXISTS(SELECT * FROM ScholarshipInterestList WHERE ScholarshipID = @ScholarshipID AND ScholarshipResultsID = @ScholarshipResultsID  AND ApplicationsID = @ApplicationsID)
	BEGIN
		PRINT 'ScholarshipInterestListID ScholarshipID ScholarshipResultsID ApplicationsID NOT EXIST'
		INSERT INTO ScholarshipInterestList(ScholarshipID, ScholarshipResultsID, ApplicationsID)
		VALUES(@ScholarshipID, @ScholarshipResultsID, @ApplicationsID)
	END
	SET @ScholarshipInterestListID = (SELECT @ScholarshipInterestListID FROM ScholarshipInterestList WHERE ScholarshipID = @ScholarshipID AND ScholarshipResultsID = @ScholarshipResultsID AND ApplicationsID = @ApplicationsID)
	PRINT '@ScholarshipInterestListID'
	PRINT @ScholarshipInterestListID

