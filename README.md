The ShepherD App
================

# Endpoints and JSON structures

## Logs

### GET   /api/logs
returns
```
  {
    "logs": [
      {
        "id": 1,
        "event": "ground_station_started",
        "drone_id": 1
        "drone_mac_address": '34:13:E8:35:30:2D'
      }
    ]
  }
```
### POST  /api/ground_stations/:ground_station_id/logs
receives
```
  {
    "id": 1,
    "event": "ground_station_started",
    "drone_id": 1
    "drone_mac_address": '34:13:E8:35:30:2D'
  }
```

returns
```
  {
    "id": 1,
    "event": "ground_station_started",
    "drone_id": 1
    "drone_mac_address": '34:13:E8:35:30:2D'
  }
```