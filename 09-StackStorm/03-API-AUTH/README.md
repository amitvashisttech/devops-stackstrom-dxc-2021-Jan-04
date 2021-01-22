# ST2 API Actions  


```
st2 apikey create -k -m '{"used_by": "my integration"}'
```


## Action Via API
```
curl -k -X POST https://172.31.0.100:443/api/v1/executions -H  "St2-Api-Key: <API-KEY-VALUE>" -H  'content-type: application/json'  --data-binary '{"action": "core.local", "parameters": {"cmd": "ip addr"}, "user": null}'
```

## Retrive the Excutions
```
curl -k -X GET https://172.31.0.100:443/api/v1/executions/600abfeeffaeda5d898ffd45   -H   "St2-Api-Key:  <API-KEY-VALUE>"
```
