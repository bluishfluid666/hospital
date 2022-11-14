# Hospital Information Management System
## Description
A hospital X needs to build a management information system to manage the
information of their patients, doctors, and nurses.
The database of hospital X needs to store the information of employees (doctors and
nurses) including: a unique code, full name consisting of first name and last name,
date of birth, gender, address, start date (first day of work), phone number(s), and
speciality with its related name and degree’s year. The hospital has many
departments. Each department has a unique code, a title, and a dean who is a doctor.
The employees have to belong to a specific department. A department has at least
one or many employees. The dean must hold a specific speciality and has had more
than 5 years of experience since the date he or she was awarded the speciality
degree.
The patients have to provide with the hospital their information such as: full name
(first name and last name), date of birth, gender, address, and phone number. After
receiving their information, the system will store them into the database, and
generate a unique code to identify each patient simultaneously. Patients are divided
into two types: outpatients and inpatients. The hospital also wishes to use the first
two characters to determine the patient type by the unique code. If one is an
outpatient, the unique code for him or her starts with “OP,” which is then followed
by 9 digits such as “OP000000001.” If one is an inpatient, the unique code for him
or her starts with “IP,” which is then followed by 9 digits such as “IP000000001.”

2

- For outpatients, the information of the examining doctor needs to be stored. The
outpatients can have many examinations with their examining doctor. The
hospital needs to store the details of each examination such as: examination date,
diagnosis, the next examination date if any, medications, and fee.
- For inpatients, some information is added such as: date of admission, treating
doctors, caring nurse, diagnosis, sickroom, date of discharge, and fee. After
admitting to the hospital, a patient can receive treatment from at least one doctor.
A doctor can treat many patients at the same time, or sometimes, he has no
patients to treat. The hospital needs the details of each treatment such as:
treatment period (start date and end date), result, and medications. Each inpatient
is taken care of by a nurse; a nurse can take care of many inpatients at the same
time. Furthermore, when a patient is recovered and his or her last treatment has
been confirmed as “recovered” by the doctor, he or she will be discharged from
the hospital. As a result, the discharge date must be recorded by the system.
The information of a medication is also stored in the database. This information
consists of a unique code, name of the medication, effects, price, and expiration
date. A medication is provided by one or more providers, and one provider may
provide many types of medication. A provider is tracked by its unique number,
name, address, and phone. Moreover, the hospital also want to keep the imported
medication information including imported date, price, and quantity. In case one
medication is out-of-date, it will be automatically marked so in the database.