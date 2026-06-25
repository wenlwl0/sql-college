DECLARE 
@LegalSexName VARCHAR(30) = 'Male'
,@USArmedForcesStatusName VARCHAR(30) = 'None'
,@EthnicityName VARCHAR(30) = 'White'
,@CitizenshipStatusName VARCHAR(30) = 'Citizen of Non-US Country'
,@AdmissionNotificationPlanType VARCHAR(30) = 'Early Decision'
,@GraduationClassYear VARCHAR(30) = 'Class of 2029'
,@HouseholdIncomeRange VARCHAR(30) = 'USD$500,000+'
,@LegalFirstName VARCHAR(30) = 'Harry'
,@LegalMiddleName VARCHAR(30) = 'James'
,@LegalLastName VARCHAR(30) = 'Potter'
,@Birthdate DATETIME = '2007-12-01'
,@DateApplied DATETIME = '2025-01-01'
,@PhoneTypeName VARCHAR(30) = 'Mobile'
,@CountryCodeNumber VARCHAR(10) = '+1'
,@PhoneNumber VARCHAR(30) = '9171230987'
,@EmailAddressTypeName VARCHAR(30) = 'Primary'
,@ApplicantEmailAddress VARCHAR(255) = 'harrypotter@hogwarts.com'
,@WrittenProficiencyLevel VARCHAR(30) = 'Native'
,@SpokenProficiencyLevel VARCHAR(30) = 'Native'
,@ReadingProficiencyLevel VARCHAR(30) = 'Native'
,@LanguageName VARCHAR(30) = 'English'
,@ProgramName VARCHAR(70) = 'SAT'
,@HighestTotalScoreAchievable INT = 1600
,@TotalScoreAchieved INT = 1550
,@TestStartDate DATETIME = '2024-04-05'
,@TestEndDate DATETIME = '2024-06-07'
,@GraduationStatusName VARCHAR(30) = 'Did or Will Graduate'
,@SchoolCountryName VARCHAR(30) = 'United States of America'
,@SchoolName VARCHAR(30) = 'Hogwarts'
,@SchoolWebsite VARCHAR(255) = 'Hogwarts.com'
,@SchoolPhone VARCHAR(30) = '+1 848399490'
,@SchoolCity VARCHAR(30) = 'New York'
,@GPAWeightingName VARCHAR(30) = 'Unweighted'
,@CumulativeGPAScore DECIMAL(10,2) = 4.12
,@GPAScale DECIMAL(10,2) = 4.5
,@SchoolTypeName VARCHAR(30) = 'Highschool'
,@SchoolStartDate DATETIME = '2022-09-15'
,@SchoolEndDate DATETIME = '2025-05-15'
,@CampusName VARCHAR(30) = 'New York'
,@CampusRankName VARCHAR(30) = 'Alternate Choice'
,@SchoolofUnivesityName VARCHAR(50) = 'Steinhart'
,@MajorName VARCHAR(30) = 'Music'
,@MajorRankName VARCHAR(30) = 'First Choice'
,@ProgramAdmissionResultsName VARCHAR(30) = 'Pending'
,@ScholarshipName VARCHAR(30) = 'Dumbledore Scholarship'
,@ScholarshipResultsName VARCHAR(30) = 'Pending'

DECLARE @LegalSexID INT = 1
DECLARE @USArmedForcesStatusID INT = 1
DECLARE @EthnicityID INT = 1
DECLARE @CitizenshipStatusID INT = 1
DECLARE @ApplicationsID INT = 1
DECLARE @ApplicantID INT = 1
DECLARE @PhoneTypeID INT = 1
DECLARE @CountryCodeID INT = 1
DECLARE @ApplicantPhoneID INT = 1
DECLARE @EmailAddressTypeID INT = 1
DECLARE @ApplicantEmailID INT = 1
DECLARE @HouseholdIncomeID INT = 1
DECLARE @WrittenProficiencyID INT = 1
DECLARE @SpokenProficiencyID INT = 1
DECLARE @ReadingProficiencyID INT = 1
DECLARE @LanguagesID INT = 1
DECLARE @LanguageListID INT = 1
DECLARE @NumericalTestProgramID INT = 1
DECLARE @NumericalTestTakenID INT = 1
DECLARE @GraduationStatusID INT = 1
DECLARE @SchoolCountryID INT = 1
DECLARE @SchoolID INT = 1
DECLARE @GPAWeightingID INT = 1
DECLARE @SchoolTypeID INT = 1
DECLARE @SchoolListID INT = 1
DECLARE @AdmissionNotificationPlanID INT = 1
DECLARE @AppliedGraduationClassID INT = 1
DECLARE @CampusID INT = 1
DECLARE @CampusRankID INT = 1
DECLARE @CampusInterestListID INT = 1
DECLARE @SchoolofUnivesityID INT = 1
DECLARE @MajorID INT = 1
DECLARE @MajorRankID INT = 1
DECLARE @ProgramAdmissionResultsID INT = 1
DECLARE @MajorInterestListID INT = 1
DECLARE @ScholarshipID INT = 1
DECLARE @ScholarshipResultsID INT = 1
DECLARE @ScholarshipInterestListID INT = 1



				---------------------------------LegalSex
	IF NOT EXISTS(SELECT * FROM LegalSex WHERE LegalSexName = @LegalSexName)
	BEGIN
		PRINT 'LegalSexID LegalSexName NOT EXIST'
		INSERT INTO LegalSex(LegalSexName)
		VALUES(@LegalSexName)
	END
	SET @LegalSexID = (SELECT @LegalSexID FROM LegalSex WHERE LegalSexName = @LegalSexName)
	PRINT '@LegalSexID'
	PRINT @LegalSexID
							---------------------------------USArmedForcesStatus
	IF NOT EXISTS(SELECT * FROM USArmedForcesStatus WHERE USArmedForcesStatusName = @USArmedForcesStatusName)
	BEGIN
		PRINT 'USArmedForcesStatusID USArmedForcesStatusName NOT EXIST'
		INSERT INTO USArmedForcesStatus(USArmedForcesStatusName)
		VALUES(@USArmedForcesStatusName)
	END
	SET @USArmedForcesStatusID = (SELECT @USArmedForcesStatusID FROM USArmedForcesStatus WHERE USArmedForcesStatusName = @USArmedForcesStatusName)
	PRINT '@USArmedForcesStatusID'
	PRINT @USArmedForcesStatusID
	
								---------------------------------Ethnicity
	IF NOT EXISTS(SELECT * FROM Ethnicity WHERE EthnicityName = @EthnicityName)
	BEGIN
		PRINT 'EthnicityID EthnicityName NOT EXIST'
		INSERT INTO Ethnicity(EthnicityName)
		VALUES(@EthnicityName)
	END
	SET @EthnicityID = (SELECT @EthnicityID FROM Ethnicity WHERE EthnicityName = @EthnicityName)
	PRINT '@EthnicityID'
	PRINT @EthnicityID

	
								---------------------------------CitizenshipStatus
	IF NOT EXISTS(SELECT * FROM CitizenshipStatus WHERE CitizenshipStatusName = @CitizenshipStatusName)
	BEGIN
		PRINT 'CitizenshipStatusID CitizenshipStatusName NOT EXIST'
		INSERT INTO CitizenshipStatus(CitizenshipStatusName)
		VALUES(@CitizenshipStatusName)
	END
	SET @CitizenshipStatusID = (SELECT @CitizenshipStatusID FROM CitizenshipStatus WHERE CitizenshipStatusName = @CitizenshipStatusName)
	PRINT '@CitizenshipStatusID'
	PRINT @CitizenshipStatusID
												---------------------------------HouseholdIncome
	IF NOT EXISTS(SELECT * FROM HouseholdIncome WHERE HouseholdIncomeRange = @HouseholdIncomeRange)
	BEGIN
		PRINT 'HouseholdIncomeID HouseholdIncomeRange NOT EXIST'
		INSERT INTO HouseholdIncome(HouseholdIncomeRange)
		VALUES(@HouseholdIncomeRange)
	END
	SET @HouseholdIncomeID = (SELECT @HouseholdIncomeID FROM HouseholdIncome WHERE HouseholdIncomeRange = @HouseholdIncomeRange)
	PRINT '@HouseholdIncomeID'
	PRINT @HouseholdIncomeID

									---------------------------------AdmissionNotificationPlan
	IF NOT EXISTS(SELECT * FROM AdmissionNotificationPlan WHERE AdmissionNotificationPlanType = @AdmissionNotificationPlanType)
	BEGIN
		PRINT 'AdmissionNotificationPlanID AdmissionNotificationPlanType NOT EXIST'
		INSERT INTO AdmissionNotificationPlan(AdmissionNotificationPlanType)
		VALUES(@AdmissionNotificationPlanType)
	END
	SET @AdmissionNotificationPlanID = (SELECT @AdmissionNotificationPlanID FROM AdmissionNotificationPlan WHERE AdmissionNotificationPlanType = @AdmissionNotificationPlanType)
	PRINT '@AdmissionNotificationPlanID'
	PRINT @AdmissionNotificationPlanID

									---------------------------------AppliedGraduationClass
	IF NOT EXISTS(SELECT * FROM AppliedGraduationClass WHERE GraduationClassYear = @GraduationClassYear)
	BEGIN
		PRINT 'AppliedGraduationClassID GraduationClassYear NOT EXIST'
		INSERT INTO AppliedGraduationClass(GraduationClassYear)
		VALUES(@GraduationClassYear)
	END
	SET @AppliedGraduationClassID = (SELECT @AppliedGraduationClassID FROM AppliedGraduationClass WHERE GraduationClassYear = @GraduationClassYear)
	PRINT '@AppliedGraduationClassID'
	PRINT @AppliedGraduationClassID
					---------------------------------Applicant
	IF NOT EXISTS(SELECT * FROM Applicant WHERE LegalSexID = @LegalSexID AND USArmedForcesStatusID = @USArmedForcesStatusID AND EthnicityID = @EthnicityID AND CitizenshipStatusID = @CitizenshipStatusID AND HouseholdIncomeID = @HouseholdIncomeID AND LegalFirstName = @LegalFirstName AND LegalMiddleName = @LegalMiddleName AND LegalLastName = @LegalLastName AND Birthdate = @Birthdate)
	BEGIN
	    PRINT ' ApplicantID LegalSexID USArmedForcesStatusID EthnicityTypeID CitizenshipStatusID HouseholdIncomeID LegalFirstName LegalMiddleName LegalLastName Birthdate NOT EXIST'
		INSERT INTO Applicant(LegalSexID, USArmedForcesStatusID, EthnicityID, CitizenshipStatusID, HouseholdIncomeID, LegalFirstName, LegalMiddleName, LegalLastName, Birthdate)
		VALUES(@LegalSexID, @USArmedForcesStatusID, @EthnicityID, @CitizenshipStatusID, @HouseholdIncomeID, @LegalFirstName, @LegalMiddleName, @LegalLastName, @Birthdate)
	END
	SET @ApplicantID = (SELECT ApplicantID FROM Applicant WHERE LegalFirstName = @LegalFirstName AND LegalMiddleName = @LegalMiddleName AND LegalLastName = @LegalLastName AND Birthdate = @Birthdate AND LegalSexID = @LegalSexID AND USArmedForcesStatusID = @USArmedForcesStatusID AND EthnicityID = @EthnicityID AND CitizenshipStatusID = @CitizenshipStatusID AND HouseholdIncomeID = @HouseholdIncomeID)
	PRINT '@ApplicantID'
	PRINT @ApplicantID

						---------------------------------Applications
	IF NOT EXISTS(SELECT * FROM Applications WHERE AppliedGraduationClassID = @AppliedGraduationClassID AND AdmissionNotificationPlanID = @AdmissionNotificationPlanID AND ApplicantID = @ApplicantID AND DateApplied = @DateApplied)
	BEGIN   
	   PRINT 'ApplicationsID AppliedGraduationClassID AdmissionNotificationPlanID ApplicantID DateApplied NOT EXIST'
		INSERT INTO Applications(AppliedGraduationClassID, AdmissionNotificationPlanID, ApplicantID, DateApplied)
		VALUES(@AppliedGraduationClassID, @AdmissionNotificationPlanID, @ApplicantID, @DateApplied)
	END
	SET @ApplicationsID = (SELECT ApplicationsID FROM Applications WHERE AppliedGraduationClassID = @AppliedGraduationClassID AND AdmissionNotificationPlanID = @AdmissionNotificationPlanID AND ApplicantID = @ApplicantID AND DateApplied = @DateApplied)
	PRINT '@ApplicationsID'
	PRINT @ApplicationsID


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

