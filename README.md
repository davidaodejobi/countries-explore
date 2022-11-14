
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


The portrait mode, uses a Silver app bar, and I used the values gotten while scrolling to move some of the object(something I saw in a tutorial months ago). Other things are pretty much widgets with either a normal container or glasmorphic design.

For the landscape, it something I just thought of from the air, sketched it out and build. Although, there were lots of modification along the way cause there wasn't a design to follow.
## Feature would like to add ...

- I would have love to fix 2 UI bugs(minor) on the app (1. Text not responding to dark theme text in drop down when selecting localization, 2. In the landscape mode, I wrote a loop to get the project cards and I did something there that wasn't dynamic with kinda wll introduct a divider bug)

- Make animation better by reading more about how stacks and animations work.

- Add languages such as Hausa, Igbo, and Yoruba in L10n.

- Try to come up with a page for work experience
## Link to APK file

- [Click to download from drive](https://drive.google.com/file/d/1ylS7RdfIlutgw_08PBDFd1jIFmmF7LWG/view?usp=sharing)
## Challenges

There are two main challenges I faced while working on the task: 


- Filter without storing in a local DB or API
- Trying to build a google UI, less distracting and classic kind of animation. Combining all of those, even makes it more difficult to build and implement but thanks to Google. and Mr. Sleepless nights 🖤).

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



