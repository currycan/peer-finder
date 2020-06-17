# peer-finder

> kubernetes peer-finder


## build
```bash
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o peer-finder; \
upx --best peer-finder -o _upx_peer-finder; \
mv -f _upx_peer-finder peer-finder
```


## usage


`kubectl logs sfs-1`

```
2017/04/17 14:03:14 Peer list updated
iam sfs-1.sfs.default.svc.cluster.local,172.1.56.2
was []
now [sfs-0.sfs.default.svc.cluster.local,172.1.65.7 sfs-1.sfs.default.svc.cluster.local,172.1.56.2]
2017/04/17 14:03:14 execing: /on-change.sh with stdin: sfs-0.sfs.default.svc.cluster.local,172.1.65.7
sfs-1.sfs.default.svc.cluster.local,172.1.56.2
2017/04/17 14:03:14 sfs-0.sfs.default.svc.cluster.local
[dev_dean@VM_61_2_centos statefulset]$ kubectl logs sfs-0
2017/04/17 14:03:08 lookup sfs on 182.1.0.100:53: server misbehaving
2017/04/17 14:03:09 Peer list updated
iam sfs-0.sfs.default.svc.cluster.local,172.1.65.7
was []
now [sfs-0.sfs.default.svc.cluster.local,172.1.65.7]
2017/04/17 14:03:09 execing: /on-change.sh with stdin: sfs-0.sfs.default.svc.cluster.local,172.1.65.7
2017/04/17 14:03:09 sfs-0.sfs.default.svc.cluster.local
2017/04/17 14:03:15 Peer list updated
iam sfs-0.sfs.default.svc.cluster.local,172.1.65.7
was [sfs-0.sfs.default.svc.cluster.local,172.1.65.7]
now [sfs-0.sfs.default.svc.cluster.local,172.1.65.7 sfs-1.sfs.default.svc.cluster.local,172.1.56.2]
2017/04/17 14:03:15 execing: /on-change.sh with stdin: sfs-0.sfs.default.svc.cluster.local,172.1.65.7
sfs-1.sfs.default.svc.cluster.local,172.1.56.2
2017/04/17 14:03:15 sfs-0.sfs.default.svc.cluster.local
```

`kubectl exec sfs-1 -- cat /etc/peer_config`

```
sfs-0.sfs.default.svc.cluster.local
sfs-1.sfs.default.svc.cluster.local
```
