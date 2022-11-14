
# Explore
Explore is an app that gives user the ability to get the liost of all the countrie in the work, and the details about them.



## Appetize link
- [Click to view app on appetize](https://appetize.io/app/wgsnbdkx54nzest5scjvvgcjem?device=pixel4&osVersion=11.0&scale=75)


## Features

- Automatically get the system mode(dark or light them)
- Change theme from dark to light and vice-versa
- Get list of grouped countries in their alphabetically order
- scroll to the top or the bottom of the list easily
- view details, flag and coat of arm of a country
- Filter by region/continent
- Designed according to the UI (progress not perfeection).


## Tech Stack

**Technology** Flutter, Dart

**Libraries** 

Provider: for state management,and passing of data back and forth the widget tree 

Smooth page indicator: for showing indicator dot on page view while viewing images

http: used for working with internet/API request

cached_network_image: to cache images and avoid repeated downloads and unnecessary loading of images


## Design Description

The user can view th list of countries on the home page, change to light and dark them, and school through the list of alphabetically arranged list of countries. Also, on the details page, the user get a carousel kind of effect to automatically show the flag and coat of arm while the list contains useful details about the country.
## Feature would like to add ...

- I was busy so I couldn't add filter for timezone which I already started to implement.

- Add localization to practice what I did in the last project.

- Store the data in a local DB such a Hive to avoid some busy and stress (best for simple apps like this).

## Link to APK file

- [Click to download from drive](https://drive.google.com/file/d/1ylS7RdfIlutgw_08PBDFd1jIFmmF7LWG/view?usp=sharing)
## Challenges

There are three main challenges I faced while working on the task: 


- Filter without storing in a local DB or API
- Writing a funny algorithm to group data alphabetically and also show that on the UI.
- Trying to build a clean and smooth UI.

The other boss challenge is juggling the tasks with other commitments (❁´◡`❁).
## Run Locally

Clone the project





```bash
  git clone https://github.com/davidaodejobi/countries-explore
```

Go to the project directory

```bash
  cd countries-explore
```

Install dependencies
```bash
  flutter pub get
```

Run project
```bash
  cd run
```


## Demo



