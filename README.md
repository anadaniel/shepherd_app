The ShepherD App
================

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
        "id": 1,
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
    "event": "ground_station_started",
    "drone_mac_address": '34:13:E8:35:30:2D'
  }
```

returns
```
  {
    "id": 1,
    "event": "ground_station_started",
    "drone_id": 1
    "drone_mac_address": '34:13:E8:35:30:2D',
    "ground_station_area_id": 1
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
        "long": "-100.323019"
      }
    ]
  }
```

#### POST  /api/ground_stations
receives
```
  {
    "area_id": 1,
    "lat": "25.685243",
    "long": "-100.323019"
  }
```

returns
```
  {
    "id": 1,
    "area_id": 1,
    "lat": "25.685243",
    "long": "-100.323019"
  }
```

#### PATCH/PUT /api/ground_stations/:id
receives
```
  {
    "long": "-200.000000"
  }
```

returns
```
  {
    "id": 1,
    "area_id": 1,
    "lat": "25.685243",
    "long": "-200.000000"
  }
```
