## Activity 1: New Developer on the Project 

### Draft 3 - 14Oct23
#### Running the Project
1. **DotComChat** (REFERENCE: WORKSHOP.md)
    1. Summarise the WORKSHOP.md in bullet points?
    2. Explain the project in bullet points? 
    3. Summarise the Technical Details in bullet points? 
    4. What all is needed for running the project in bullet points?
    5. What is MongoDB database and collection name, in bullet points? **Copy** -> notes.txt
    6. Which frontend file has the backend uri endpoint? **Copy** -> notes.txt
2. **CLI** - Check if Copilot CLI is installed running `github-copilot-cli -V` 
    1. NO - Install Copilot CLI by running - `./scripts/install-copilot-cli.sh`
    2. Run **??**    
    3. NO - Start Copilot CLI by running - `./scripts/start-copilot-cli.sh`
3. **Open** - `code ./scripts/copilot_cli_1.sh` -> **Explain** -> **Run** - `./scripts/copilot_cli_1.sh`
    1. **??** Check if node and npm is installed?
    2. **??** Check if Mongodb service running use service command?
4. **Open** - `code ./scripts/copilot_cli_2.sh` -> **Explain** -> **Run** - `./scripts/copilot_cli_2.sh` 
    - **??** Print first 10 Mongodb database sample_airbnb and collection listingsAndReviews
5. **CLI**
    1. Split Terminal
    2. In Folders `backend` and `frontend` - `npm start` first on backend and then on frontend. 

#### Fixing the Activity 1
6.  **DotComChat** (REFERENCE: WORKSHOP.md) -
    1. In Section Workshop's Different Developer Activities, summarise Activity 1 in bullet points?
    2. In Section Workshop's Different Developer Activities, Activity 1, summarise the fix / requirement for Activity 1 in bullet points?
    3. What are different Frontend React Paths available? **Copy** -> notes.txt
    4. What are different backend endpoints exposed and unexposed? **Copy** -> notes.txt
8. **Open** - `code ./scripts/copilot_cli_3.sh` -> **Explain** -> **Run** - `./scripts/copilot_cli_3.sh`
    1.  **??** Get request to http://localhost:8080/api/model with query string search = url encoded UWS Brownstone Near Central Park and store the beautified response in file response.json
    2. **??** In response.json print the key id inside listingsAndReviews array
        - **CallOut** - Database Model's id identified as "102995"
9. **Step** - Open a new tab and copy the React App's URL. Then change the path to `/listings/102995`
10. **Open** - `code ./scripts/copilot_cli_4.sh` -> **Explain** -> **Run** - `./scripts/copilot_cli_4.sh`
    - **??** Get request to http://localhost:8080/api/model/102995 and store the beautified response in file listing.json
12. **Open** - `code ./scripts/copilot_cli_5.sh` -> **Explain** -> **Run** - `./scripts/copilot_cli_5.sh`
    - **??** Put request to http://localhost:8080/api/model/102995 with JSON data {"name": "UWS Brownstone Prime"}
14. **Step** - Refresh the tab React App's URL and the path to `/listings/102995` to see the updated name

## Activity 2: New Developer on the Project

### Draft 2 - 12Oct23
#### Building the Activity 2
1.  **DotComChat** (REFERENCE: WORKSHOP.md) - Can you list all the bullet points from Activity 2?
    1. **CallOut** - IP2Location to be used
    2. **CallOut** - Local Geo Location Database is available for this workshop
2. **CallOut** - We already have put placeholder for you, under the `/backend/geolocation` to build the code and local geolocation database being available
3. **IdeChat** - Share example nodejs geo location packages?
4. **IdeChat** - Does npm have packages using IP2LOCATION?
5. **IdeChat** - From ip2location NodeJs - Query geolocation information from Local BIN database
    1. **Step** - Add the suggested code to test.js
    2. **IdeChat** - Share the link to npm ip2location-nodejs documentation - [https://www.npmjs.com/package/ip2location-nodejs](https://www.npmjs.com/package/ip2location-nodejs)
    3. **Step** - IP2Location Developer Documentation - Query geolocation information from BIN database - [https://ip2location-nodejs.readthedocs.io/en/latest/quickstart.html#query-geolocation-information-from-bin-database](https://ip2location-nodejs.readthedocs.io/en/latest/quickstart.html#query-geolocation-information-from-bin-database) -> **SAVE FILE** -> `/backend/geolocation/test.js`
    4. **CallOut** - Geo Location File Path - `./geolocation/IP2LOCATION-LITE-DB3.BIN`
    5. **Step** - Run the test, and save the Result into a test_result.json
6. **Step** - Open the `\backend\geolocation\IP2Location.js` Search in the file `START:TODO`, and select the code block below it
    1. **CallOut** - Keep the file `test.js` open in a Tab, for appropriate context to built 
    2. **DevPrompt** - //Find the geolocation using the IP input from the local file, and return ip, country and city
    3. **Dev** `Window+I` `Cmd+I` -> `/doc`
7. **Step** - Open the `/backend/app/controllers\model.controller.js` Search in the file `START:TODO`, and select the code block below it
    1. **Dev** `Window+I` `Cmd+I` -> `/explain`
8. **IdeChat** (REFERENCE: WORKSHOP.md) - Which frontend file has the backend uri endpoint?
9. **Step** - Open `/frontend/src/http-common.js`
    1. **Step** - Uncomment and pass the different location's "x-forwarded-for-ip" headers to the backend
10. **Step** - Refresh the React App's URL to see if you seeing Geo Location based listing
11. **Open** - `code ./scripts/git_branch_push.sh` -> **Explain** -> **Run** - `./scripts/git_branch_push.sh` - Create a new branch and push to Origin
12. **DotComPR** - Let us run `/summary` to the GitHub Copilot generate the summary for us out of the box

## Activity 3: Writing a Test cases for 2 activities
1. **CallOut** - Open the `\backend\app\routes\model.routes.js` Search and highlight `// Retrieve a single Listing with id` and explain we need to test id `102995`
2. **CallOut** - Open the `\backend\app\routes\model.routes.js` Search and highlight `// Retrieve all Listings` and explain Geo Location Endpoint
3. **Step** - Open the `\backend\test\endpoint.test.js` file 
4. **Step - Test Case 1:** Check if id=102995, has been correctly updated
    1. **Step** -  Search - `//Test Case 1 - TODO:`
    2. **Dev** - `/tests unit test - GET /api/model/{id} where id=102995, parse JSON response.text, and check name="UWS Brownstone Prime"`
6. **Step - Test Case 2:** Geo Location Check
    1. **Step** - Search - `//Test Case 2 - TODO:`
    2. **Dev** - `Window+I` `Cmd+I` -> `/tests unit test - GET /api/model/ set x-forwarded-for-ip header 8.210.96.219, parse JSON response.text, and loop through array listingsAndReviews`
    3. **Dev** - `//expect to check listing.address for market=Hong Kong`

