DECLARE @ScholarshipName VARCHAR(30)
SET @ScholarshipName = 'Dumbledore Scholarship'
DECLARE @AdmissionPlanType VARCHAR(30) = 'Early Decision'
DECLARE @GraduationClassYear VARCHAR(30) = 'Class of 2029'
DECLARE @CampusName VARCHAR(30) = 'New York'
DECLARE @Citizenship VARCHAR(30) = 'Citizen of Non-US Country'

SELECT 
    a.ApplicantID,
    hi.HouseholdIncomeRange,
    hs.GPARatio,
	ISNULL(os.OtherAcceptedScholarships, 'None') AS OtherAcceptedScholarships,

---Counts the number of applicants who have already been accepted to the Dumbledore Scholarship, Compare to maximum accepted allowed.
    (SELECT COUNT(DISTINCT aa.ApplicantID)
     FROM Applicant aa
     INNER JOIN Applications app ON aa.ApplicantID = app.ApplicantID
     INNER JOIN ScholarshipInterestList sill ON app.ApplicationsID = sill.ApplicationsID
     INNER JOIN Scholarship ss ON sill.ScholarshipID = ss.ScholarshipID
     INNER JOIN ScholarshipResults srr ON sill.ScholarshipResultsID = srr.ScholarshipResultsID
     WHERE ss.ScholarshipName = @ScholarshipName AND srr.ScholarshipResultsName = 'Accepted')         AS AcceptedCount,

---Counts the number of applicants who have yet to be given a result for the Dumbledore Scholarship, Keep in mind other applicants to review.
    (SELECT COUNT(DISTINCT aa.ApplicantID)
     FROM Applicant aa
     INNER JOIN Applications app ON aa.ApplicantID = app.ApplicantID
     INNER JOIN ScholarshipInterestList sill ON app.ApplicationsID = sill.ApplicationsID
     INNER JOIN Scholarship ss ON sill.ScholarshipID = ss.ScholarshipID
     INNER JOIN ScholarshipResults srr ON sill.ScholarshipResultsID = srr.ScholarshipResultsID
     WHERE ss.ScholarshipName = @ScholarshipName AND srr.ScholarshipResultsName = 'Pending')           AS PendingCount

FROM Applicant a
INNER JOIN Applications ap ON a.ApplicantID = ap.ApplicantID
INNER JOIN ScholarshipInterestList sil ON ap.ApplicationsID = sil.ApplicationsID
INNER JOIN Scholarship s ON sil.ScholarshipID = s.ScholarshipID
INNER JOIN MajorInterestList mil ON ap.ApplicationsID = mil.ApplicationsID
INNER JOIN ProgramAdmissionResults par ON mil.ProgramAdmissionResultsID = par.ProgramAdmissionResultsID
INNER JOIN AdmissionNotificationPlan anp ON ap.AdmissionNotificationPlanID = anp.AdmissionNotificationPlanID
INNER JOIN AppliedGraduationClass agc ON ap.AppliedGraduationClassID = agc.AppliedGraduationClassID
INNER JOIN CampusInterestList cil ON ap.ApplicationsID = cil.ApplicationsID
INNER JOIN Campus c ON cil.CampusID = c.CampusID
INNER JOIN CitizenshipStatus cs ON a.CitizenshipStatusID = cs.CitizenshipStatusID
INNER JOIN HouseholdIncome hi ON a.HouseholdIncomeID = hi.HouseholdIncomeID
INNER JOIN SchoolList sl ON a.ApplicantID = sl.ApplicantID 
INNER JOIN ScholarshipResults sr ON sil.ScholarshipResultsID = sr.ScholarshipResultsID

---Shows whether students have been accepted to other scholarships, If yes then reject them for the Dumbledore Scholarship.
LEFT JOIN 
   (SELECT DISTINCT aa.ApplicantID, ss.ScholarshipName                                                  AS OtherAcceptedScholarships
    FROM Applicant aa
    INNER JOIN Applications app ON aa.ApplicantID = app.ApplicantID
    INNER JOIN ScholarshipInterestList sill ON app.ApplicationsID = sill.ApplicationsID
    INNER JOIN Scholarship ss ON sill.ScholarshipID = ss.ScholarshipID
    INNER JOIN ScholarshipResults srr ON sill.ScholarshipResultsID = srr.ScholarshipResultsID
    WHERE srr.ScholarshipResultsName = 'Accepted'
      AND ss.ScholarshipName IN ('Slytherin Scholarship','Gryffindor Scholarship',
	  'Hufflepuff Scholarship','Hagrid Scholarship','Ravenclaw Scholarship') )
os ON os.ApplicantID = a.ApplicantID

---Shows the applicant's GPA of the highschool they graduated from. This is used to evaluate them relative to other applicants.
LEFT JOIN 
    (SELECT sll.ApplicantID, AVG(sll.CumulativeGPAScore/sll.GPAScale)                                   AS GPARatio
    FROM SchoolList sll
    INNER JOIN School scc ON sll.SchoolID = scc.SchoolID
    INNER JOIN SchoolType st ON sll.SchoolTypeID = st.SchoolTypeID
    INNER JOIN GraduationStatus gs ON sll.GraduationStatusID = gs.GraduationStatusID
    WHERE st.SchoolTypeName = 'Highschool'
      AND gs.GraduationStatusName = 'Did or Will Graduate'
    GROUP BY sll.ApplicantID)                                                                       
hs ON hs.ApplicantID = a.ApplicantID


---Filters to only show applicants who have been accepted to any major, applied to the same admissions period, applied to the relevant campus.
---Filters for applicants who currently do not have results for the Dumbledore Scholarship.
---Filters for applicants the scholarship is least interested in which is high-income household applicants who are international students.
WHERE 
    s.ScholarshipName = @ScholarshipName
	AND anp.AdmissionNotificationPlanType = @AdmissionPlanType
    AND agc.GraduationClassYear = @GraduationClassYear
    AND c.CampusName = @CampusName
    AND cs.CitizenshipStatusName = @Citizenship
    AND par.ProgramAdmissionResultsName = 'Accepted'
    AND hi.HouseholdIncomeRange IN ('USD$500,000+','USD$300,000-USD$500,000','USD$200,000-USD$300,000')
    AND sr.ScholarshipResultsName = 'Pending'

GROUP BY 
    a.ApplicantID, 
	hi.HouseholdIncomeRange, 
    os.OtherAcceptedScholarships,
	hs.GPARatio

---Ordered by least attractive applicant, from lowest GPA to highest GPA 
ORDER BY 
hs.GPARatio ASC
