DECLARE @AdmissionPlanType VARCHAR(30)
DECLARE @GraduationClassYear VARCHAR(30)

SET @AdmissionPlanType = 'Early Decision'
SET @GraduationClassYear = 'Class of 2029'

SELECT DISTINCT
    a.ApplicantID,
    p.PhoneNumber AS Phone,
    c.CountryCodeNumber AS CountryCode,
    a.LegalFirstName AS FirstName,
    a.LegalLastName AS LastName,
    e.ApplicantEmailAddress AS Email,
    s.SchoolName AS School

FROM Applications ap
INNER JOIN Applicant a ON ap.ApplicantID = a.ApplicantID
INNER JOIN AdmissionNotificationPlan anp ON ap.AdmissionNotificationPlanID = anp.AdmissionNotificationPlanID
INNER JOIN AppliedGraduationClass agc ON ap.AppliedGraduationClassID = agc.AppliedGraduationClassID
LEFT JOIN ApplicantPhone p ON a.ApplicantID = p.ApplicantID
LEFT JOIN CountryCode c ON p.CountryCodeID = c.CountryCodeID
LEFT JOIN ApplicantEmail e ON a.ApplicantID = e.ApplicantID
LEFT JOIN SchoolList sl ON a.ApplicantID = sl.ApplicantID
LEFT JOIN School s ON sl.SchoolID = s.SchoolID

---Comparing Applicants' attributes to each others to detect repeat applicants to the same admissions period which is not permitted
INNER JOIN Applications app ON ap.ApplicantID != app.ApplicantID
INNER JOIN Applicant aa ON app.ApplicantID = aa.ApplicantID
INNER JOIN AdmissionNotificationPlan anpp ON app.AdmissionNotificationPlanID = anpp.AdmissionNotificationPlanID
INNER JOIN AppliedGraduationClass agcc ON app.AppliedGraduationClassID = agcc.AppliedGraduationClassID
LEFT JOIN ApplicantPhone pp ON aa.ApplicantID = pp.ApplicantID
LEFT JOIN CountryCode cc ON pp.CountryCodeID = cc.CountryCodeID
LEFT JOIN ApplicantEmail ee ON aa.ApplicantID = ee.ApplicantID
LEFT JOIN SchoolList sll ON aa.ApplicantID = sll.ApplicantID
LEFT JOIN School ss ON sll.SchoolID = ss.SchoolID

WHERE 
    anp.AdmissionNotificationPlanType = @AdmissionPlanType
    AND agc.GraduationClassYear = @GraduationClassYear
    AND anpp.AdmissionNotificationPlanType = @AdmissionPlanType
    AND agcc.GraduationClassYear = @GraduationClassYear

---Same phone number and same country code ID
  AND (p.PhoneNumber = pp.PhoneNumber AND p.CountryCodeID = pp.CountryCodeID )

---Same email address
   OR (e.ApplicantEmailAddress = ee.ApplicantEmailAddress)

---Same legal name + same school name
   OR (a.LegalFirstName = aa.LegalFirstName 
            AND a.LegalLastName = aa.LegalLastName 
            AND s.SchoolName = ss.SchoolName)
ORDER BY 
    c.CountryCodeNumber,
    p.PhoneNumber
