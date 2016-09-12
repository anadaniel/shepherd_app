The ShepherD App
================

This is the repository for the ShepherD App, a Ruby on Rails web application that is used to provide communication between the [ShepherD Ground Station](https://github.com/tooga/ict-drone-groundstation) and the [ShepherD Client](https://github.com/tooga/ict-drone-client).

## How does the ShepherD work?

The final **ShepherD** product is an integration of the App, the Ground Station and the Client. Through the App, Ground Stations are registered along with the coordinates where they will be placed in the area they will help monitor. Once in place, the Ground Stations will be constantly looking for drones that enter the range of their antennas and when they detect a drone they will log this information with the App. The Client is a real-time App that is constantly listening for notifications that the Ground Stations log into the App. When the Client is notified that a new drone has been detected, the user gets an alert and then it can choose to take control of the drone that has been detected, this drone has been already hacked by the Ground Station. If the user decides to take control of the dron, a socket connection is opened between the Client and the Ground Station, the Client will receive the feed of the camera feed on the drone and it will also send commands to drive the drone to an area where is no longer a threat.

## How to install and run the ShepherD App
```sh
  git clone git@github.com:anadaniel/shepherd_app.git # download the repository
  cd shepherd_app
  bundle install # install gems
  rails s # run server
```
The previous code will have the App running and the Ground Station will be able to communicate with it. We assume that your computer has the configuration needed to run Ruby on Rails projects. You will also need [postgresql](https://www.postgresql.org/) installed. In order for the Client to receive the logs in real-time, you need to run a redis server as well. More info [here](http://redis.io/topics/quickstart).

## Endpoints and JSON structures

### Logs

#### GET   /api/logs
returns
```
  {
    "logs": [
      {
        "id": 1,
        "event": "ground_station_started"
      },
      {
        "id": 2,
        "event": "detected",
        "drone_id": 1
        "drone_mac_address": '34:13:E8:35:30:2D'
      }
    ]
  }
```

#### POST  /api/ground_stations/:ground_station_id/logs
receives
```
  {
    "log": {
      "event": "detected",
      "drone_mac_address": "34:13:E8:35:30:2D"
    }
  }
```

returns
```
  {
    "log": {
      "id": 1,
      "event": "detected",
      "drone_id": 1
      "drone_mac_address": "34:13:E8:35:30:2D",
      "ground_station_area_id": 1
    }
  }
```

### Ground Stations
#### GET   /api/ground_stations
returns
```
  {
    "ground_stations": [
      {
        "id": 1,
        "area_id": 1,
        "lat": "25.685243",
        "long": "-100.323019",
        "mac_address": "34:13:E8:35:30:2D"
      }
    ]
  }
```

#### GET   /api/ground_stations/:id
returns
```
  {
    "ground_station": {
      "id": 1,
      "area_id": 1,
      "lat": "25.685243",
      "long": "-100.323019",
      "mac_address": "34:13:E8:35:30:2D"
    }
  }
```

#### POST  /api/ground_stations
receives
```
 { 
    "ground_station": {
      "area_id": 1,
      "lat": 25.678653, 
      "long": -100.284270,
      "mac_address": "34:13:E8:35:30:2D"
    }
  }
```

returns
```
  { 
    "ground_station": {
      "id": 1,
      "area_id": 1,
      "lat": "25.678653", 
      "long": "-100.284270",
      "mac_address": "34:13:E8:35:30:2D"
    }
  }
```

#### PATCH/PUT /api/ground_stations/:id
receives
```
  { 
    "ground_station": {
      "long": -100.284270
    }
  }
```

returns
```
  { 
    "ground_station": {
      "id": 1,
      "area_id": 1,
      "lat": 25.678653, 
      "long": -100.284270,
      "mac_address": "34:13:E8:35:30:2D"
    }
  }
```

#### DELETE /api/ground_stations/:id
