Authentication module for Kibana 4
==================================

Simplistic authentication for Kibana 4.

Usage:
```
bin/kibana plugin --install kibana-auth-plugin -u https://github.com/puluto/kibana-auth-plugin/archive/master.tar.gz
npm i hapi-auth-cookie@3.1.0
LOCAL_AUTH_LOGINS=admin:password bin/kibana
```

Docker container
```
docker run --detach --name kibana -e LOCAL_AUTH_LOGINS=admin:password -e ELASTICSEARCH_URL=http://es.test.es:9200/ --net=host index.alauda.cn/puluto/kibana
```

License: MIT.
