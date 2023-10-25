# Table of Sections
1. [Project Details](#project-details)
2. [Workshop Setup](#workshop-setup)
3. [Workshop's Different Developer Activities](#workshops-different-developer-activities)
4. [Activity 1: New Developer on the Project](#activity-1-new-developer-on-the-project)
    1. [Start Copilot Chat in UI](#start-copilot-chat-in-ui)
    2. [Get Familiar with the Project](#get-familiar-with-the-project)
    3. [Explore Copilot for CLI in Codespaces](#explore-copilot-for-cli-in-codespaces)
    4. [Loading data file into MongoDB](#loading-data-file-into-mongodb)
    5. [Update frontend and backend port config](#update-frontend-and-backend-port-config)
    6. [Start backend and front end services](start-backend-and-front-end-services)
    7. [Investigate backend URL 404 error](investigate-backend-url-404-error)
    8. [Fixing backend URL in code](fixing-backend-url-in-code)
    9. [Learn activity objectives and approach](#learn-activity-objectives-and-approach)
5. [Activity 2: New Feature/Requirement](#activity-2-new-featurerequirement)
    1. [Getting activity summary](#getting-activity-summary)
    2. [Identify library and generate initial code](#identify-library-and-generate-initial-code)
    3. [Update code in IPLocation.js](#update-code-in-iplocationjs)
    4. [Adding doc in IPLocation.js](#adding-doc-in-iplocationjs)
    5. [Explain code in model.controller.js](#explain-code-in-modelcontrollerjs)
    6. [Update http-common.js to pass IP](#update-http-commonjs-to-pass-ip)
    7. [Refresh site](#refresh-site)
    8. [Run script to create PR](#run-script-to-create-pr)
    9. [Generate PR description summary](#generate-pr-description-summary)
7. [Workshop's Copilot Prompts](#workshops-copilot-prompts)


<hr/>
<hr/>

## Project Details

## Project Name

Accommodation Listings

## Project Description

The Project lists all the accommodations we our contracted with Airbnb. As our teams need to travel regularly to global locations and reserve accommodations on these available listings. 

<div align="center"><img width="600" alt="image" src="https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/20143038/5ae9f844-51e2-41bb-b28c-2c4d2452692d"></div>


The Project is build on MERN stack is a JavaScript-based software stack used to build web applications. MERN stands for [MongoDB](https://docs.mongodb.com/), [Express](https://expressjs.com/), [React](https://reactjs.org/), and [Node.js](https://nodejs.org/en/docs/), which are the four technologies that make up the stack.

When used together, these technologies provide a complete framework for building scalable and responsive web applications. Node.js and Express are used for the server-side and back-end programming, while React is used for the client-side and front-end programming. MongoDB is used to store and manage data.

This stack is widely used because it is relatively simple to learn, uses a common programming language (JavaScript), and can be used to build complex and robust web applications.

## Table of Contents

1. [Technical Details](#technical-details)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Contributing](#contributing)

## Technical Details

The Project is broken down into two main parts:
1. **Backend**: Which has been build on NodeJS, ExpressJS and MongoDB, and the source code is available in the [backend](./backend) folder. Following are the important part of backend:
   1. The Project follows the standard ExpressJS [folder structure](https://expressjs.com/en/starter/generator.html)
   2. [Mongodb's Airbnb sample dataset](https://www.mongodb.com/docs/atlas/sample-data/sample-airbnb/) json is located at [/mongodb-dataset/sample_airbnb.json](./mongodb-dataset/sample_airbnb.json) & Schema is located at [airbnb-schema.json](./backend/app/models/schemas/airbnb-schema.json)
   3. [Config](./backend/app/config) - Contains all the ExpressJS global variables and mongodb db connection details
   4. [Models](./backend/app/models) - Sets up the connectivity to MongoDB with Pagination and also contains the Schemas
   5. [Routes](./backend/app/routes) - Exposes the routes and paths with different HTTP verbs 
   6. [Controllers](./backend/app/controllers) - Implementation for the different routes and logic for each Endpoints / APIs
   7. Backend endpoints which are exposed are:
      1. Endpoints / APIs exposed to Frontend:
         - GET `/api/model` - Returns all the listings
         - GET `/api/model/${id}` - Returns the specific listing
      2. Endpoints / APIs hidden and unexposed to Frontend:
         - GET `/api/model/${id}?search=${search}` - Search a listing using the query string.
         - PUT `/api/model/${id}` - Returns the specific listing & specify only the specific fields to be updated
         - DELETE `/api/model/${id}` - Returns the specific listing

3. **Frontend**: Which has been build on ReactJS basic setup, to display the listings, and the source code is available in the [frontend](./frontend) folder. Following are the important part of frontend:
   1. The Project follows the standard React Web App [folder structure](https://create-react-app.dev/docs/folder-structure)
   2. [http-common.js](./frontend/src/http-common.js) - Uses Axios to hit the backend endpoint
   3. [listing.component.js](./frontend/src/components/listing.component.js) - Uses React and Mui tables to display the listing
   4. [listing.service.js](./frontend/src/services/listing.service.js) - Makes the API call to the appropriate backend paths and with query strings & headers
   5. React paths available in the frontend:
      1. `/` or `/listings/`- Displays all the listings
      2. `/listings/${id}` - Displays the specific listing

```mermaid
flowchart LR
    subgraph Frontend
    http-common---components
    components---services
    end

    subgraph Backend
        subgraph MongoDB
            data
        end
        models
        routes
        controllers
        config
    end

    Frontend -- "GET /api/model" --> Backend
    Frontend -- "GET /api/model/${id}" --> Backend

    Unexposed[Unexposed/Hidden Endpoints] -- "PUT /api/model/${id}" --> Backend
    Unexposed[Unexposed/Hidden Endpoints] -- "DELETE /api/model/${id}" --> Backend
    Unexposed[Unexposed/Hidden Endpoints] -- "GET /api/model/${id}?search=${search}" --> Backend
```

## Installation

Following are the steps to install the project:
1. Install [Node.js](https://nodejs.org/en/download) verion >= 18, and [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) >= 9
2. Install [MongoDB](https://www.mongodb.com/docs/manual/installation/) >= 3.6
3. [MongoDB Command Line Database Tools](https://www.mongodb.com/try/download/database-tools)
4. [mongoimport](https://www.mongodb.com/docs/database-tools/mongoimport/#mongodb-binary-bin.mongoimport) the [Mongodb's Airbnb sample dataset](https://www.mongodb.com/docs/atlas/sample-data/sample-airbnb/) and collection `listingsAndReviews` to the local mongodb
5. Install the Frontend by running `npm install` inside `./frontend`
6. Install the Backend by running `npm install` inside `./backend`

## Usage

Run the following steps to run each part:
1. Backend
   - run `npm start` inside the `./backend` folder
2. Frontend
   - run `npm start` inside the `./frontend` folder

## Contributing

Thank you for considering contributing to our project! Please follow these guidelines before submitting a pull request:
1. Fork the repository and make your changes on the development branch.
2. Make sure your code is properly formatted and adheres to our coding standards.
3. Write clear and concise commit messages and include documentation with your changes.
4. Push your changes to your fork and submit a pull request to the development branch of the original repository.
5. Please allow time for our team to review your changes and provide feedback.
6. Once your pull request is approved, we will merge your changes into the master branch.

By contributing to this project, you agree to follow the [code of conduct](/CODE_OF_CONDUCT.md) outlined in the project's repository. Please report any inappropriate behavior to [project maintainers](dhruvg20@github.com).

We appreciate your time and effort in contributing to this project!


## License

[MIT licensed](./LICENSE).

## Credits

We like to thank the following projects and sources which have helped us build this project:
1. [Sample AirBnB Listings Dataset](https://www.mongodb.com/docs/atlas/sample-data/sample-airbnb/)

<hr/>
<hr/>

<br/>

# Workshop Setup

To ensure the best experience during this workshop, please follow the steps in this instruction to get your environment up

## Configure Codespaces

[GitHub Codepsaces](https://github.com/features/codespaces) is a development environment that's hosted in the cloud. It supports customisation by configuring dev container for your repository, to define a choice of different development environments that are appropriate for the work people will do in your repo.

### :wrench: Create your own Codespace instance

Inside your personal workshop repo(NOT the repo template your create this repo from), find `Code`, Select `Codespaces Tab`, then click the `+` to create a new Codespace instance. A new Tab will prompt and you should start seeing progress in Codespace preparation.

![Screenshot 2023-09-29 at 11 46 17 am](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/175e5d4c-3a55-426e-90d3-c7b253fb9273)

ℹ️ It generally takes a few minutes to get your Codespace ready for use <br />
ℹ️ Although GitHub Codespaces supports a variety of IDE enginee, we will be using Visual Studio Code in this workshop(which is also the default choice)<br />
ℹ️ Every Codespaces instance comes with a name randomly selected by GitHub during creation<br />

### :question: What if I accidentally closed Codespace tab?

If you closed the Codespace tab in your browser, you can always resume it. On your repo main page, locate recent Codespace instance via `Code` -> `Codespace Tab`, click the instance name will pop up the Codespace environment.

![Screenshot 2023-09-29 at 11 58 16 am](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/364c7592-a2cb-49d3-85b3-ea3958630d0f)

## Check GitHub Copilot Features

Your Codespace instance should look like below once it is ready

![Screenshot 2023-09-29 at 12 16 10 pm](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/a0e0aec1-bae2-4d3b-b0c1-92d372823019)

### :speech_balloon: Check out Copilot Chat

Notice the side bar from left-hand, there is a ![Screenshot 2023-09-29 at 12 16 59 pm](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/0f3ffda9-bb36-4ff5-8f7a-c5e7d24dceb0) icon, click you will enter Copilot Chat in IDE. We will learn how Copilot Chat helps us during the workshop.

![Screenshot 2023-09-29 at 12 20 00 pm](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/3303209a-9805-4e07-945d-e81359c3507f)


### :mag: Check out Copilot CLI

Just like local VS Code, Codespaces also comes with terminal for command inputs. In this repository we already installed Copilot CLI. Try type something starting with `??`, for example, `?? list file`. Copilot CLI will return command suggestion. Feel free to accept or cancel using your keyboard arrows.

![Screenshot 2023-09-29 at 12 04 21 pm](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/e6412096-a4fb-43ee-94d2-f60d2a73007e)

<hr/>
<hr/>

# <h1 align="center">Workshop's Different Developer Activities</h1>

<h3 align="left">Activity 1: New Developer on the Project</h3>

Welcome to the team. You are the new team member to this business project. You have been in the Company for few years, but have just shifted to this project. You understand the MERN stack, and have worked few production projects in the past.

We have a low / non-critical severity fix come in from one of the Business Owners of the project, and it is being tracked on our Project Board. As you know we are low on staff due to vacations in the team, and we need you to pick up this requirement and start working on it. This being a non-critical fix, and it will help you get familiar with the project and the code base. 

<h4 align="left">Fix / Requirement:</h4>
One of our listers in New York city, has rebranded his Listing, and has requested us to update the Listing Name on our website. This Old Name is `UWS Brownstone Near Central Park` and the new name needs to updated to `UWS Brownstone Prime`.

<p align="center">
  <br/>
<img width="800" alt="image" src="https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/20143038/96c9a61a-696b-4b9a-b512-719182988dee">
</p>

<hr/>
<h3 align="left">Activity 2: Developer experienced on the Project - New Feature / Requirement</h3>

Hi, It is exciting to be working again with you on this new requirements. This is High Severity requirement, and we need to get this done in this Quarter. This requirement can improve the client experience and help them to see their listings in their geographical location.

<h4 align="left">New Feature / Requirement: Geo Location based displaying listings</h4>
Our Sales employees log in from different locations across the globe. They have clients, partners, vendors and franchise owners visiting their locations quite often. Today they access the Accomodation page and need to manually find different listings specific to their location. We would like you and your team to build a solution which displays only their listings based on their Geo Location. We have partnered with a Geo Location service in the past, and would request you to use the same location to build a working prototype. Our website is protected by the leading Content Delivery Network(CDN) and you could use their features for building your solution.  

Our Sister Company is using [IP2LOCATION](https://www.ip2location.com/) and for this prototype we would like you to use the same service. 

<p align="center">
  <br/>
<img width="500" alt="image" src="https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/20143038/30257ec3-c1e5-49c8-8fbb-f2ec8a0c1c67">
</p>


<hr/>
<h3 align="left">Case 3: Writing a Test case for Use case 2</h3>

<hr/>
<hr/>

# <h1 align="center">Activity 1: New Developer on the Project</h1>

## Start Copilot Chat in UI

`When you are on this project in browser, you'd have noticed a little Copilot icon next to your GitHub Avatar, on top right corner. 

Click to start a conversation with Copilot Chat
![find_copilot_chat_ui](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/79ecb76e-0e3d-4906-938d-21fb72561782)

![Screenshot 2023-10-06 at 2 23 40 pm](https://github.com/dhruvg20-copilot/Universe23-Proj1-MERN/assets/61316020/8f398d34-1443-46f7-a596-4273507475d6)

:warning: You must on this repository page under `githubuniverseworkshops` in order to see this icon

A new converseation pops up on the right hand side

![Screenshot 2023-10-12 at 12 33 57 pm](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/927edcbc-389d-4cba-8fcc-8ce24d0b5a7b)


Click ![Screenshot 2023-10-06 at 2 35 13 pm](https://github.com/dhruvg20-copilot/Universe23-Proj1-MERN/assets/61316020/bd11066a-1332-4c0a-8678-4bf96c9316fe) to add reference <br >

![Screenshot 2023-10-06 at 2 28 59 pm](https://github.com/dhruvg20-copilot/Universe23-Proj1-MERN/assets/61316020/effcbec7-4bdc-4b0e-b65f-755e069c3cf2)

:warning: You may not see the option `Docs` as this is under internal preview. We will cover them in a demo towards th end of this workshop

Click ![Screenshot 2023-10-06 at 2 35 19 pm](https://github.com/dhruvg20-copilot/Universe23-Proj1-MERN/assets/61316020/6423c5db-de86-4dd4-942a-5ae80aaaa64f) will let you manage threads. You can create and manage multiple threads if you like

Let's start using Copilot Chat in UI 🚙

## Get Familiar with the Project
Firstly as a new developer, I'd like to understand more about this project. 

It's great we have a few markdowns here. Add `PROJECT.md` as a reference
1. Add a reference -> File
2. In the prompt, scroll until you see `PROJECT.md`, select
3. This reference will be used in the chat moving forwards

![copilot_chat_select_file](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/8e65a4a1-ebb8-4d7b-b908-af003a368071)


Once done, asking Copilot Chat to explain the project.

```
Explain the project?
```

Keep asking additional questions, your reference stays unless you click to remove it.
```
Summarise the technical details?
```
```
What all is needed for running the project?
```

Based on output from Copilot for Chat, we learnt that this is a MERN stack, let's get hands-on. We will leverage next tool: Copilot for CLI

## Explore Copilot for CLI in Codespaces

Let's find how the setup of MERN going in Codespaces. In terminal, start typing
```
?? Check if node and npm is installed?
```
The starting `??` is one of 3 syntaxes of Copilot for CLI, we are asking for a shell command that can confirm installation of both Node and NPM.

We can see Copilot for CLI provided a suggestion, which we can choose to `Run`, `Revise` or `Cancel`. Go ahead with suggestion you will see the command output

![copilot_cli_1](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/dd033e7f-8d86-4a85-ae21-3ff1c2590527)

Continue checking if MongoDB is running. This time, you were given a suggestion that looked working, but it is broken because `systemctl` is not supported in Codespaces and you were told to use `service` instead

```
?? Check if Mongodb service is running
```

Refine our question and try asking again 

```
?? Check if Mongodb service is running using service command
```

You should see MongoDB is running in our environment. And additional question

```
?? Check if mongoimport tool is available?
```

Copilot for CLI will give us another command to check if Mongo import tool is installed, possitive.

## Loading data file into MongoDB

MongoDB requires a JSON formatted dataset to serve as content in our site. As a new Developer, what if I don't know where the datafile is and how to load it?

Let's get back to Copilot Chat in UI 🏃

Resume our conversation, keeping the `PROJECT.md` reference there and try the following
```
What is the path of the MongoDB database json file?
```
```
Please tell me the Mongodb collection name?
```
Ok, we are able to identify file path of JSON as well as collection name. This time we will use Copilot for CLI to help us getting the right command

In Codespaces terminal, type:
```
?? mongodb import file=./mongodb-dataset/sample_airbnb.json, collection=listingsAndReviews
```

With that done, you may also noticed Copilot Chat do exist in Codespaces. Similar to Copilot Chat in UI, click to start a conversation. Because this time we want to do a bit of work in IDE. 

## Update frontend and backend port config
Asking Copilot Chat in Codespaces:
```
What is the local uri and port for mongodb?
```

## Start backend and front end services

As there are mutiple services involved, let's split terminal to manage them seperately. Please rename each terminal as `bash`, `backend` and `frontend` so to differentiate each other

![codespaces_split_terminal](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/cea8cadb-a536-4bb3-89ef-24fff5e8049e)

![Screenshot 2023-10-12 at 1 49 36 pm](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/ae6ce526-1468-4420-a40d-c93e51e926e4)

Next we will start backend and frontend services one after another

👉 Select the `backend` terminal, then run:
```
cd backend && npm start
```
👉 Select the `frontend` terminal, then run:
```
cd frontend && npm start
```

Upon completion of frontend starting, you will be prompt by Codespaces to open web URL in a new window, click to proceed on the one with port `3000`. Alternatively, find `PORTS` and click the little globe icon for port `3000`

![Screenshot 2023-10-12 at 1 59 09 pm](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/adf69450-90c2-41d1-beba-5b657eca12d3)

You will see `Backend URL: NOT FOUND: 404` error. Don't worry, we will fix it together next 👀

![Screenshot 2023-10-12 at 1 55 42 pm](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/871da95c-7070-4b82-bae8-4e0a0506f11e)


## Investigate backend URL 404 error

Now we got a 404 error, let's take a look at the message and copy the 404 URL in the message. 

`https://shiny-acorn-v64jvpv96xwhp9g4-8080.app.github.dev`

As part of Codespace initiation, every instance starts with a random name. This `shiny-acorn` does not match the one in our browser. 

Any chance this could be hardcoded in our project? Possibly. Let's find it out. Head to your terminal `bash` (not `backend` or `frontend` as they have processes running in foreground) and run the following:

```
?? find string "shiny-acorn-v64jvpv96xwhp9g4-8080.app.github.dev" inside current folder except node_modules
```

This might take up to 30 seconds. You should be see result `/.frontend/src/http-common.js`. Now open that file in Codespaces.

![Screenshot 2023-10-12 at 3 44 18 pm](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/75f0288d-c0ca-444a-9d42-97748d3bb964)

This time let's try Copilot Chat in IDE. Similar to Copilot Chat in UI, we can add context alongside our questions. In IDE, we need to select exact line of code instead of an open file, then ask questions:

![copilot_chat_ide_explain_code](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/ef91cbe2-d5e9-4b83-a19a-6c863c5a7746)

This `baseURL` catches our attention here. Checking the code we found it is hardcoded also. 

Double checking using Copilot Chat in UI. Adding file `WORKSHOP.md`, then ask

```
Which frontend file has the backend uri endpoint?
```

Copilot Chat tells you that `./frontend/src/http-common.js` contains the backend uri endpoint definition. So we can safely update `baseURL`. 

## Fixing backend URL in code

Back to Codespaces and execute the following:
- [ ] Head to `PORTS` next to `TERMINAL`
- [ ] Copy the Forwarded Address indicating Port `8080`
- [ ] Replace `baseURL` with this new URL
- [ ] Don't forget to check the tailing `/api` is there

![codespaces_update_baseurl](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/8d0cb6cd-5ea9-47fe-ae08-69dbac73f0b2)

We also need to change visibility of port `8080` to `public` in order to allow frontend to query:
- [ ] Stay on `PORTS` section, right click port `8080`
- [ ] Port Visibility -> Public

<img width="625" alt="Screenshot 2023-10-12 at 4 08 58 pm" src="https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/5163dc7a-0ce9-415d-987f-6073ecd927be">

Switch to the web url tab, refresh the page, You should start seeing content loading up 🥳

<img width="1536" alt="Screenshot 2023-10-12 at 4 11 54 pm" src="https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/6143fd9e-faa3-4ef7-ade3-4e18d738f764">

## Learn activity objectives and approach

With the project up and running 🎉. We are ready to make some changes to the project. How long did you take to get familiar with a new project last time?

Continue Copilot Chat in UI, with `WORKSHOP.md` selected, ask a few questions about Activity 1:

```
In Section Workshop's Different Developer Activities, summarise Activity 1 in bullet points?
```
```
In Section Workshop's Different Developer Activities, Activity 1, summarise the fix / requirement for Activity 1 in bullet points?
```

Continue with the following two questions. Keep 

```
What are different Frontend React Paths available?
```
```
What are different backend endpoints exposed and unexposed?
```

# <h1 align="center">Activity 2: New Feature/Requirement</h1>

## Getting activity summary

In Copilot Chat Browser, select `WORKSHOP.md` then ask 
```
Can you list all the bullet points from Activity 2?
```
You will find that `IP2Location` is to be used, also `Local Geo Location Database` is available for this workshop. We already have put placeholder for you, under the `/backend/geolocation` to build the code and local geolocation database being available.

Let's build with Copilot in Codespaces

## Identify library and generate initial code

In Codespaces, use Copilot Chat(IDE) to start exploring code. We'd like to get some solid ground first:
```
Share example nodejs geo location packages?
```
Chances are that Copilot Chat does not tell anything about IP2Location, let's try another one specific:
```
Does npm have packages using IP2LOCATION?
```
This time, Copilot Chat tells us that `ip2location-nodejs` is available, and it is able to query IP geolocation information from a local BIN database. Let's see if we can get more details from Copilot Chat:
```
From ip2location NodeJs - Query geolocation information from Local BIN database
```
Copilot Chat would return sample code along with explanation. Let's take the sample code and update `./backend/geolocation/test.js` to begin with
```Javascript
const IP2Location = require("ip2location-nodejs");

// Load the BIN database file
const ip2location = new IP2Location("path/to/database.bin");

// Query the geolocation information for an IP address
const ip = "8.8.8.8";
const result = ip2location.lookup(ip);

// Print the results
console.log(result);
```

## Improve Code to function

We'd like to get more how-tos in the next step, and it's time find some documentation about `IP2Location`. Ask Copilot Chat:
```
Share the link to npm ip2location-nodejs documentation
```
You should get the link https://www.npmjs.com/package/ip2location-nodejs, now click and open in a new tab.

In the section `Developer Documentation`, click on https://ip2location-nodejs.readthedocs.io/en/latest/index.html

Here we found a very good example to [Query gelocation information from BIN database](https://ip2location-nodejs.readthedocs.io/en/latest/quickstart.html#query-geolocation-information-from-bin-database), copy this code an update `./geolocation/test.js`

You may notice that `ip2location.open` is hitting a file path, we need to replace `./DB26.BIN` with an actual file in our project, which is `.backend/geolocation/IP2LOCATION-LITE-DB3.BIN` inside the repo. Update accordingly. 

You final code should look like below:
```javascript
const {IP2Location} = require("ip2location-nodejs");

let ip2location = new IP2Location();

ip2location.open("./geolocation/IP2LOCATION-LITE-DB3.BIN");

testip = ['8.8.8.8', '2404:6800:4001:c01::67'];

for (var x = 0; x < testip.length; x++) {
	result = ip2location.getAll(testip[x]);
	for (var key in result) {
		console.log(key + ": " + result[key]);
	}
	console.log("--------------------------------------------------------------");
}

ip2location.close();
```

## Run the test and save result

## Update code in IPLocation.js

While leaving the file `.backend/geolocation/test.js` open, find `.backend/geolocation/IP2Location.js` and open in Codespaces

The file should have code look like below
```javascript
// Import the IP2Location module
const { IP2Location } = require("ip2location-nodejs");

// Create a new IP2Location object
const ip2location = new IP2Location();
ip2location.open("./geolocation/IP2LOCATION-LITE-DB3.BIN");

// Export a function for IP geolocation
module.exports.ipLoc = function (IP) {
    // Define function-specific variables
    const _func = "ipLoc";
    const debug = true;
    let result, returnObj;

    // Log debug information
    if (debug) {
        console.log(`${_func}: entry`);
    }

    try {        
        {
            //START:TODO - GeoLocation Logic to Implement

            
            //END:TODO
        }        

    } catch (err) {
        // Log any errors that occur
        console.log(`${_func}: error -> ${err}`);
    }
};
```

You will see a code block `START:TODO` and `END:TODO`, let's start coding with Copilot prompts. Remove these comment, then start typing below
```
//Find the geolocation using the IP input from the local file, and return ip, country and city
```

Press `ENTER`, Use Copilot will start generating code, press `TAB` to accept, then `ENTER` to next line. You should end up this part like below
```javascript
    try {        
        {
            //Find the geolocation using the IP input from the local file, and return ip, country and city
            result = ip2location.getAll(IP);
            returnObj = {
                ip: result.ip,
                country: result.country_short,
                city: result.city
            };
        }        

    } catch (err) {
        // Log any errors that occur
        console.log(`${_func}: error -> ${err}`);
    }
```

## Adding doc in IPLocation.js

Brilliant! We got some code, but before we move to next, let's make `IPLocation.js` better by adding some docs.

It's a boring task right? Let's see what Copilot can do for you

Stay on `IPLocation.js`, click line 1. Then type the following key combinations:
- On `Mac`: Key in `Cmd+I`
- On `Windows`: TODO

This is the shortcut to command Copilot 💻! Now type `/doc` and `ENTER`

![Screenshot 2023-10-25 at 1 17 58 am](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/ae99b1b5-c899-4b78-a3b1-e074a0117ae1)

Wooa! Copilot generates some docs for you based on the new code we just added. It also asks for your review. Click `Accept` button. 

![Screenshot 2023-10-25 at 1 23 26 am](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/68a411e4-fe22-45be-942b-aabee0f7492a)

You final version of `IPLocation.js`

```javascript
// Import the IP2Location module
const { IP2Location } = require("ip2location-nodejs");

/**
 * Creates a new IP2Location object and exports a function for IP geolocation.
 * @module IP2Location
 */

// Create a new IP2Location object
const ip2location = new IP2Location();
ip2location.open("./geolocation/IP2LOCATION-LITE-DB3.BIN");

/**
 * Returns the geolocation information for a given IP address.
 * @function
 * @param {string} IP - The IP address to geolocate.
 * @returns {Object} An object containing the IP address, country, and city.
 */
module.exports.ipLoc = function (IP) {
    // Define function-specific variables
    const _func = "ipLoc";
    const debug = true;
    let result, returnObj;

    // Log debug information
    if (debug) {
        console.log(`${_func}: entry`);
    }

    try {        
        {
            //Find the geolocation using the IP input from the local file, and return ip, country and city
            result = ip2location.getAll(IP);
            returnObj = {
                ip: result.ip,
                country: result.country_short,
                city: result.city
            };
        }        

    } catch (err) {
        // Log any errors that occur
        console.log(`${_func}: error -> ${err}`);
    }
};
```
## Explain code in model.controller.js

We learnt previously that you can command Copilot to geenrate doc. Let's try another command this time. 

Open `/backend/app/controllers\model.controller.js`, search in the file START:TODO

Select the code block below it, then key in `Cmd+I`, type `/explain` then enter.

![Screenshot 2023-10-25 at 2 10 11 am](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/694c2a35-4958-496e-a30e-dfdbea012fa2)

The command `/explain` is passed to Copilot Chat for an answer. Very handy isn't it?

![Screenshot 2023-10-25 at 2 10 44 am](https://github.com/dhruvg20-copilot/Copilot-Dev-Practices/assets/61316020/9a42d832-13c9-46a8-af02-40e70262672b)

## Update http-common.js to pass IP

Now we are getting close to completing all changes 🦾. One thing left is to update `/frontend/src/http-common.js` 

You will see a list of commented `x-forwarded-for-ip`, uncomment one of them so we can pass IP in the request header.

## Refresh Site

Refreshing the site. Depending on which `x-forwarded-for-ip`, the listing is now shortlisted

## Run script to create PR

## Generate PR description summary
