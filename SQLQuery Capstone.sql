--Checking for duplicates for patients
SELECT
    patient_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    contact_number,
    address,
    registration_date,
    insurance_provider,
    insurance_number,
    email,
    COUNT(*) AS count_of_duplicates -- Counts the occurrences of each distinct combination of the grouped columns
FROM patients
GROUP BY
    patient_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    contact_number,
    address,
    registration_date,
    insurance_provider,
    insurance_number,
    email
HAVING COUNT(*) > 1 -- Filters the grouped results to show only those combinations that appear more than once

--Checking for duplicates for treatments
	SELECT
    treatment_id,
    appointment_id,
    treatment_type,
    description,
    cost,
    treatment_date,
    COUNT(*) AS count_of_duplicates -- Counts the occurrences of each distinct combination of the grouped columns
FROM treatments
GROUP BY
    treatment_id,
    appointment_id,
    treatment_type,
    description,
    cost,
    treatment_date
HAVING COUNT(*) > 1 -- Filters the grouped results to show only those combinations that appear more than once

--Checking for duplicates for appointments
SELECT
    appointment_id,
    patient_id,
    doctor_id,
    appointment_date,
    appointment_time,
    reason_for_visit,
    status,
    COUNT(*) AS count_of_duplicates -- Counts the occurrences of each distinct combination of the grouped columns
FROM appointments
GROUP BY
    appointment_id,
    patient_id,
    doctor_id,
    appointment_date,
    appointment_time,
    reason_for_visit,
    status
HAVING COUNT(*) > 1 -- Filters the grouped results to show only those combinations that appear more than once

--Checking for duplicates for billings
SELECT
    bill_id,
    patient_id,
    treatment_id,
    bill_date,
    amount,
    payment_method,
    payment_status,
    COUNT(*) AS count_of_duplicates -- Counts the occurrences of each distinct combination of the grouped columns
FROM billing
GROUP BY
    bill_id,
    patient_id,
    treatment_id,
    bill_date,
    amount,
    payment_method,
    payment_status
HAVING COUNT(*) > 1 -- Filters the grouped results to show only those combinations that appear more than once

--Checking for duplicates for doctors
SELECT
    doctor_id,
    first_name,
    last_name,
    specialization,
    phone_number,
    years_experience,
    hospital_branch,
    email,
    COUNT(*) AS count_of_duplicates -- Counts the occurrences of each distinct combination of the grouped columns
FROM doctors
GROUP BY
    doctor_id,
    first_name,
    last_name,
    specialization,
    phone_number,
    years_experience,
    hospital_branch,
    email
HAVING COUNT(*) > 1 -- Filters the grouped results to show only those combinations that appear more than once

-- Check for blank values in Patients table
SELECT
    COUNT(*) AS total_rows, -- Counts the total number of rows in the table
-- Counts blank or NULL values in each column in the patient table
    SUM(CASE WHEN patient_id IS NULL OR patient_id = '' THEN 1 ELSE 0 END) AS patient_id_blanks,
    SUM(CASE WHEN first_name IS NULL OR first_name = '' THEN 1 ELSE 0 END) AS first_name_blanks,
    SUM(CASE WHEN last_name IS NULL OR last_name = '' THEN 1 ELSE 0 END) AS last_name_blanks,
    SUM(CASE WHEN gender IS NULL OR gender = '' THEN 1 ELSE 0 END) AS gender_blanks,
    SUM(CASE WHEN date_of_birth IS NULL OR date_of_birth = '' THEN 1 ELSE 0 END) AS date_of_birth_blanks,
    SUM(CASE WHEN contact_number IS NULL THEN 1 ELSE 0 END) AS contact_number_blanks,
    SUM(CASE WHEN address IS NULL OR address = '' THEN 1 ELSE 0 END) AS address_blanks,
    SUM(CASE WHEN registration_date IS NULL OR registration_date = '' THEN 1 ELSE 0 END) AS registration_date_blanks,
    SUM(CASE WHEN insurance_provider IS NULL OR insurance_provider = '' THEN 1 ELSE 0 END) AS insurance_provider_blanks,
    SUM(CASE WHEN insurance_number IS NULL OR insurance_number = '' THEN 1 ELSE 0 END) AS insurance_number_blanks,
    SUM(CASE WHEN email IS NULL OR email = '' THEN 1 ELSE 0 END) AS email_blanks
FROM patients

-- Check for blank values in Treatments table
SELECT
    COUNT(*) AS total_rows, -- Counts the total number of rows in the table
-- Counts blank or NULL values in each column in the treatment table
    SUM(CASE WHEN treatment_id IS NULL OR treatment_id = '' THEN 1 ELSE 0 END) AS treatment_id_blanks,
    SUM(CASE WHEN appointment_id IS NULL OR appointment_id = '' THEN 1 ELSE 0 END) AS appointment_id_blanks,
    SUM(CASE WHEN treatment_type IS NULL OR treatment_type = '' THEN 1 ELSE 0 END) AS treatment_type_blanks,
    SUM(CASE WHEN description IS NULL OR description = '' THEN 1 ELSE 0 END) AS description_blanks,
    SUM(CASE WHEN cost IS NULL THEN 1 ELSE 0 END) AS cost_blanks,
    SUM(CASE WHEN treatment_date IS NULL OR treatment_date = '' THEN 1 ELSE 0 END) AS treatment_date_blanks
FROM treatments

-- Check for blank values in Appointments table
SELECT
    COUNT(*) AS total_rows, -- Counts the total number of rows in the table
-- Counts blank or NULL values in each column in the appointment table
    SUM(CASE WHEN appointment_id IS NULL OR appointment_id = '' THEN 1 ELSE 0 END) AS appointment_id_blanks,
    SUM(CASE WHEN patient_id IS NULL OR patient_id = '' THEN 1 ELSE 0 END) AS patient_id_blanks,
    SUM(CASE WHEN doctor_id IS NULL OR doctor_id = '' THEN 1 ELSE 0 END) AS doctor_id_blanks,
    SUM(CASE WHEN appointment_date IS NULL OR appointment_date = '' THEN 1 ELSE 0 END) AS appointment_date_blanks,
    SUM(CASE WHEN appointment_time IS NULL OR appointment_time = '' THEN 1 ELSE 0 END) AS appointment_time_blanks,
    SUM(CASE WHEN reason_for_visit IS NULL OR reason_for_visit = '' THEN 1 ELSE 0 END) AS reason_for_visit_blanks,
    SUM(CASE WHEN status IS NULL OR status = '' THEN 1 ELSE 0 END) AS status_blanks
FROM appointments

-- Check for blank values in Billing table
SELECT
    COUNT(*) AS total_rows, -- Counts the total number of rows in the table
-- Counts blank or NULL values in each column in the billing table
    SUM(CASE WHEN bill_id IS NULL OR bill_id = '' THEN 1 ELSE 0 END) AS bill_id_blanks,
    SUM(CASE WHEN patient_id IS NULL OR patient_id = '' THEN 1 ELSE 0 END) AS patient_id_blanks,
    SUM(CASE WHEN treatment_id IS NULL OR treatment_id = '' THEN 1 ELSE 0 END) AS treatment_id_blanks,
    SUM(CASE WHEN bill_date IS NULL OR bill_date = '' THEN 1 ELSE 0 END) AS bill_date_blanks,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS amount_blanks,
    SUM(CASE WHEN payment_method IS NULL OR payment_method = '' THEN 1 ELSE 0 END) AS payment_method_blanks,
    SUM(CASE WHEN payment_status IS NULL OR payment_status = '' THEN 1 ELSE 0 END) AS payment_status_blanks
FROM billing

-- Check for blank values in Doctors table
SELECT
    COUNT(*) AS total_rows, -- Counts the total number of rows in the table
-- Counts blank or NULL values in each column in the doctors table
    SUM(CASE WHEN doctor_id IS NULL OR doctor_id = '' THEN 1 ELSE 0 END) AS doctor_id_blanks,
    SUM(CASE WHEN first_name IS NULL OR first_name = '' THEN 1 ELSE 0 END) AS first_name_blanks,
    SUM(CASE WHEN last_name IS NULL OR last_name = '' THEN 1 ELSE 0 END) AS last_name_blanks,
    SUM(CASE WHEN specialization IS NULL OR specialization = '' THEN 1 ELSE 0 END) AS specialization_blanks,
    SUM(CASE WHEN phone_number IS NULL THEN 1 ELSE 0 END) AS phone_number_blanks,
    SUM(CASE WHEN years_experience IS NULL THEN 1 ELSE 0 END) AS years_experience_blanks,
    SUM(CASE WHEN hospital_branch IS NULL OR hospital_branch = '' THEN 1 ELSE 0 END) AS hospital_branch_blanks,
    SUM(CASE WHEN email IS NULL OR email = '' THEN 1 ELSE 0 END) AS email_blanks
FROM doctors

--combining all the tables together
SELECT
    A.appointment_id,
    A.appointment_date,
    A.appointment_time,
    A.reason_for_visit,
    A.status AS appointment_status, -- Alias 'status' from 'appointments' table to 'appointment_status' for clarity
    P.patient_id,
    P.first_name AS patient_first_name, -- Alias 'first_name' from 'patients' table to 'patient_first_name'
    P.last_name AS patient_last_name,   -- Alias 'last_name' from 'patients' table to 'patient_last_name'
    P.gender,
    P.date_of_birth,
    P.registration_date,
    P.insurance_provider,
    D.doctor_id,
    D.first_name AS doctor_first_name, -- Alias 'first_name' from 'doctors' table to 'doctor_first_name'
    D.last_name AS doctor_last_name,   -- Alias 'last_name' from 'doctors' table to 'doctor_last_name'
    D.specialization,
    D.years_experience,
    D.hospital_branch,
    T.treatment_id,
    T.treatment_type,
    T.description AS treatment_description, -- Alias 'description' from 'treatments' table to 'treatment_description'
    T.cost AS treatment_cost,  -- Alias 'cost' from 'treatments' table to 'treatment_cost'
    T.treatment_date,
    B.bill_id,
    B.bill_date,
    B.amount AS bill_amount,  -- Alias 'amount' from 'billing' table to 'bill_amount'
    B.payment_method,
    B.payment_status
FROM appointments AS A -- Selects data from the 'appointments' table and assigns it the alias 'A'
JOIN patients AS P     -- Joins 'appointments' with the 'patients' table, aliased as 'P'
    ON A.patient_id = P.patient_id -- Specifies the join condition: matching patient_id in both tables
JOIN doctors AS D      -- Joins the result with the 'doctors' table, aliased as 'D'
    ON A.doctor_id = D.doctor_id   -- Specifies the join condition: matching doctor_id in both tables
JOIN treatments AS T   -- Joins the result with the 'treatments' table, aliased as 'T'
    ON A.appointment_id = T.appointment_id -- Specifies the join condition: matching appointment_id in both tables
JOIN billing AS B      -- Joins the result with the 'billing' table, aliased as 'B'
    ON T.treatment_id = B.treatment_id; -- Specifies the join condition: matching treatment_id in both tables

--Answering business questions
--1.What are the trends in bill payments across months?
SELECT
    DATENAME(MONTH, bill_date) AS month_name,
    ROUND(SUM(amount), 2) AS total_bill_amount
FROM billing
GROUP BY
    DATENAME(MONTH, bill_date),  -- Group by the month name
    DATEPART(YEAR, bill_date),   -- Include year in grouping to distinguish months across different years
    DATEPART(MONTH, bill_date)   -- Include month number in grouping for accurate grouping and sorting
ORDER BY
    DATEPART(YEAR, bill_date),  -- Sort by year first
    DATEPART(MONTH, bill_date)  -- Then sort by month number to get chronological order (January, February, etc.)

--2. What is the average cost for each type of treatment?
SELECT
    treatment_type, 
    ROUND(AVG(cost), 2) AS average_cost -- Calculates the average cost for each treatment type and rounds it to 2 decimal places
FROM treatments
GROUP BY treatment_type -- Groups the results by treatment type to calculate the average cost for each distinct type
ORDER BY average_cost DESC -- Orders the results in descending order based on the calculated average cost

--3. Does gender influence average bill amount?
SELECT
    P.gender, 
    ROUND(AVG(B.amount), 2) AS average_bill_amount -- Calculates the average bill amount for each gender and rounds it to 2 decimal places
FROM patients AS P -- Selects data from the 'patients' table and assigns it the alias 'P'
JOIN billing AS B  -- Joins the 'patients' table with the 'billing' table, aliased as 'B'
    ON P.patient_id = B.patient_id -- Specifies the join condition: matching patient_id in both tables
GROUP BY P.gender -- Groups the results by patient gender to calculate the average bill amount for each gender

--4. Which Payment Method Generated Most Payment?
SELECT
    payment_method, -- Selects the method of payment (e.g., credit card, cash)
    ROUND(SUM(amount), 2) AS total_amount_generated -- Calculates the sum of all amounts for each payment method and rounds it to 2 decimal places
FROM billing 
GROUP BY payment_method -- Groups the results by payment method to aggregate amounts for each distinct method
ORDER BY total_amount_generated DESC -- Orders the results in descending order based on the total amount generated

--5.Is there a difference in billing between visit reasons (e.g., emergency vs consultation)?
WITH VisitBillingData AS (  -- Defines a Common Table Expression (CTE) named 'VisitBillingData'
    SELECT
        A.reason_for_visit, 
        B.amount AS bill_amount -- Selects the bill amount from the 'billing' table and aliases it as 'bill_amount'
    FROM appointments AS A -- Specifies the starting table 'appointments' with alias 'A'
    JOIN treatments AS T ON A.appointment_id = T.appointment_id -- Joins 'appointments' with 'treatments' (aliased as 'T') on their common 'appointment_id'
    JOIN billing AS B ON T.treatment_id = B.treatment_id -- Joins the result with 'billing' (aliased as 'B') on their common 'treatment_id'
)
SELECT
    reason_for_visit, -- Selects the reason for the visit from the CTE
    ROUND(SUM(bill_amount), 2) AS total_bill_amount -- Calculates the sum of 'bill_amount' for each reason for visit and rounds it to 2 decimal places
FROM VisitBillingData -- Specifies that the query is retrieving data from the 'VisitBillingData' CTE
GROUP BY reason_for_visit -- Groups the results by the reason for visit to sum bill amounts for each distinct reason
ORDER BY total_bill_amount DESC -- Orders the results in descending order based on the total bill amount

--6. How frequently do patients of different genders attend specific treatments?
SELECT
    P.gender, 
    T.treatment_type,
    COUNT(T.treatment_id) AS frequency_of_treatment -- Counts the number of treatments for each gender and treatment type combination
FROM patients AS P -- Selects data from the 'patients' table and assigns it the alias 'P'
JOIN appointments AS A ON P.patient_id = A.patient_id -- Joins 'patients' with 'appointments' (aliased as 'A') on their common 'patient_id'
JOIN treatments AS T ON A.appointment_id = T.appointment_id -- Joins the result with 'treatments' (aliased as 'T') on their common 'appointment_id'
GROUP BY
    P.gender, 
    T.treatment_type
ORDER BY
    P.gender, -- Orders the results first by gender (e.g., all females then all males)
    frequency_of_treatment DESC -- Within each gender, orders by the frequency of treatment in descending order