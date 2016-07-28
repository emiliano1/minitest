# Spreemo Code Test

We're going to build a tool to schedule doctor's appointments. We already have a
way to keep track of the patients that need to be scheduled and the doctors that
are available along with their addresses in the `doctors` and `patients`
resources.

For the purposes of this example, the only types of doctors we'll work with are
Orthopedists, Opthamologists, and Cardiologists; we will also only treat
patients who have broken bones, eye trouble, or heart disease.

You need to do the following:

1. Add a way to keep track of a patient's ailment and a doctor's specialty.
2. Add a way to book appointments for treatment that match doctors to patients
   ensuring that:
   1. the doctor's specialty is appropriate for the patient's injury
   2. these appointments are scheduled at least 3 days in the future.
   3. an email is sent to both the doctor and the patient when the appointment
      is scheduled with the appointment details including:
      1. doctor's name and address
      2. patient's name
      3. time and date of appointment

Be sure to include adequate tests for all the functionality you add.

Sample doctor and patient records have been provided to ease development. Run
`rake db:setup` to initialize them.
