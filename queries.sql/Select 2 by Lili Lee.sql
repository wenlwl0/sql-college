DECLARE @ProgramName VARCHAR(50)
SET @ProgramName = 'SAT'

DECLARE @MajorName VARCHAR(50)
SET @MajorName = 'English'

DECLARE @AdmissionPlanType VARCHAR(30)
SET @AdmissionPlanType = 'Early Decision'

DECLARE @GraduationClassYear VARCHAR(30)
SET @GraduationClassYear = 'Class of 2029'

DECLARE @EthnicityName VARCHAR(30)
SET @EthnicityName = 'Asian'

SELECT 
    a.ApplicantID,
    tt.TotalScoreAchieved AS SATScore,

--- Counts total number of applicants already accepted to the English major
    (SELECT COUNT(DISTINCT appp.ApplicantID)
     FROM Applications appp
     INNER JOIN MajorInterestList mill ON appp.ApplicationsID = mill.ApplicationsID
     INNER JOIN Major mjj ON mill.MajorID = mjj.MajorID
     INNER JOIN ProgramAdmissionResults parr ON mill.ProgramAdmissionResultsID = parr.ProgramAdmissionResultsID
     WHERE mjj.MajorName = @MajorName AND parr.ProgramAdmissionResultsName = 'Accepted')                         AS AcceptedCount,

--- Counts total number of applicants who have yet to be given admission results for the English major
    (SELECT COUNT(DISTINCT apppp.ApplicantID)
     FROM Applications apppp
     INNER JOIN MajorInterestList milll ON apppp.ApplicationsID = milll.ApplicationsID
     INNER JOIN Major mjjj ON milll.MajorID = mjjj.MajorID
     INNER JOIN ProgramAdmissionResults parrr ON milll.ProgramAdmissionResultsID = parrr.ProgramAdmissionResultsID
     WHERE mjjj.MajorName = @MajorName AND parrr.ProgramAdmissionResultsName = 'Pending')                        AS PendingCount

FROM Applicant a
INNER JOIN Ethnicity e ON a.EthnicityID = e.EthnicityID
INNER JOIN Applications app ON a.ApplicantID = app.ApplicantID
INNER JOIN AdmissionNotificationPlan anp ON app.AdmissionNotificationPlanID = anp.AdmissionNotificationPlanID
INNER JOIN AppliedGraduationClass agc ON app.AppliedGraduationClassID = agc.AppliedGraduationClassID
INNER JOIN MajorInterestList mil ON app.ApplicationsID = mil.ApplicationsID
INNER JOIN Major mj ON mil.MajorID = mj.MajorID

-- Assesses applicants' English Language Proficiency, they might declare their English language like 'British English','English American', etc.
INNER JOIN LanguageList ll ON a.ApplicantID = ll.ApplicantID
INNER JOIN Languages lang ON ll.LanguagesID = lang.LanguagesID AND lang.LanguageName LIKE '%English%'
INNER JOIN SpokenProficiency sp ON ll.SpokenProficiencyID = sp.SpokenProficiencyID
INNER JOIN WrittenProficiency wp ON ll.WrittenProficiencyID = wp.WrittenProficiencyID
INNER JOIN ReadingProficiency rp ON ll.ReadingProficiencyID = rp.ReadingProficiencyID

-- Assesses applicants' SAT scores
INNER JOIN NumericalTestTaken tt ON a.ApplicantID = tt.ApplicantID
INNER JOIN NumericalTestProgram tp ON tt.NumericalTestProgramID = tp.NumericalTestProgramID AND tp.ProgramName = @ProgramName

WHERE 
    anp.AdmissionNotificationPlanType = @AdmissionPlanType
    AND agc.GraduationClassYear = @GraduationClassYear
    AND e.EthnicityName = @EthnicityName

    AND (sp.SpokenProficiencyLevel IN ('Elementary', 'Intermediate')
        OR rp.ReadingProficiencyLevel IN ('Elementary', 'Intermediate')
        OR wp.WrittenProficiencyLevel IN ('Elementary', 'Intermediate'))

    AND a.ApplicantID 
	IN (SELECT appppp.ApplicantID
        FROM Applications appppp
        INNER JOIN MajorInterestList millll ON appppp.ApplicationsID = millll.ApplicationsID
        INNER JOIN Major miiii ON millll.MajorID = miiii.MajorID
        INNER JOIN ProgramAdmissionResults parrrr ON millll.ProgramAdmissionResultsID = parrrr.ProgramAdmissionResultsID
        WHERE 
            miiii.MajorName = @MajorName
            AND parrrr.ProgramAdmissionResultsName = 'Pending')

GROUP BY 
    a.ApplicantID,
    tt.TotalScoreAchieved

HAVING 
    MAX(tt.TotalScoreAchieved) < 1300

ORDER BY 
    SATScore ASC
