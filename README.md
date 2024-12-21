# student attendance app

Technologies used: Flutter, RestAPI, Firebase (Realtime Database)

## introduction

the home screen has two dropdown menus, one for selecting classes from 1 to 10
and another for selecting sections of those classes from A to D.  
selecting both the options will show a list of students with their names, attendance status and entry time
tapping a student shows a pop up box allowing the user to either mark them present or absent.
after marking the desired attendance status the list automatically updates along with updates in the database.



## inner workings

this app uses RestAPI to communicate with the firebase realtime database to fetch all the students while the app is initialising
then provider package is used for state management to provide data throughout the app whenever and wherever needed.

before the app initialises a GET request is done to the firebase database to fetch all the students in json format and map them to the students model and store 
it in the "students" class with changenotifier so that we can get this data from wherever we need

in the home screen the options selected in the dropdown menus are forwarded to a studentList widget which fetches the 
list of students from the selected class and section using provider and displays them in cards with their names, attendance status and entry time.

tapping the card opens a popup menu with two options- present or absent, each runs a fucntion within the student model which changes the 
attendance status of the current status as well as does a PATCH request on the database to update it too.

i decided to use a realtime database to store the students instead of doing it within the code itself as if the app closes the state wouldnt persist and all the
changes done will be reset.


i have also added comments throughout the code to briefly explain what that snippet does

## screenshots
<img src="https://github.com/user-attachments/assets/05f04808-bb57-49eb-80ff-bec550942d2b" alt="Alt Text" width="300">
<img src="https://github.com/user-attachments/assets/3dc418f4-ebbf-4961-a5ac-e3fed9c21e0a" alt="Alt Text" width="300">
<img src="https://github.com/user-attachments/assets/6dc0ece8-5224-4387-8d7d-5b0484592c5f" alt="Alt Text" width="300">
<img src="https://github.com/user-attachments/assets/5d14fb36-1bf4-48b9-9b88-49ace00344bb" alt="Alt Text" width="300">



