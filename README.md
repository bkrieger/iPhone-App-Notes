This is a Notes app for iOS. Its main features are the ability to create notes with a title, location, date, and text. If location services are on and available, the location is found automatically and is stored with the note. The location is converted to the name of a place using CLGeocoder and is displayed with the note.

The app also has a tab that displays a map with all of the notes and their locations respresented as pins. When you tap on a pin, the title and date of the note are displayed.

The app checks for the user's location when the app is opened, and it updates the location if the user moves 2000 meters or more. This allows the location to be up to date even if the user moves without killing and reopening the app.

If the user has location services disabled, or the app does not have priveleges, the user is asked to turn on location services when opening the app. If location services are left off, notes can still be created, they are just stored without a location. The user can still input a location when creating a note, but the note will not be displayed on the map.