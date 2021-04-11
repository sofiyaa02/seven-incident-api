# Incident API - Codeigniter

An incident is an event that could lead to loss of, or disruption to, an organization's operations, services or functions

## Setup

Download the setup and then config & import MySQL database

You can use POSTMAN or anything else to simulate frontend


## Test the API

You can test the API by including header Content-Type, Client-Service & Auth-Key with value application/JSON,frontend-client & simplerestapi in every request



List of the API :

[POST] /index.php/api/incident 

json {
  "data": [
    {
      "id": 0,
      "location": {
        "latitude": 12.9231501,
        "longitude": 74.7818517
      },
      "title": "incident title",
      "category": 1,
      "people": [
        {
          "name": "Name of person",
          "type": "staff"
        },
        {
          "name": "Name of person",
          "type": "witness"
        },
        {
          "name": "Name of person",
          "type": "staff"
        }
      ],
      "comments": "This is a string of comments",
      "incidentDate": "2020-09-01T13:26:00+00:00",
      "createDate": "2020-09-01T13:32:59+01:00",
      "modifyDate": "2020-09-01T13:32:59+01:00"
    }
  ]
}

[GET] /index.php/api/incident


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
