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
    "event": "detected"
    "drone_mac_address": '34:13:E8:35:30:2D'
  }
```

returns
```
  {
    "log": {
      "id": 1,
      "event": "detected",
      "drone_id": 1
      "drone_mac_address": '34:13:E8:35:30:2D',
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
