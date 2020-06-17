server: peer-finder.go
	CGO_ENABLED=0 go build -a -installsuffix cgo --ldflags '-w' ./peer-finder.go

clean:
	rm -f peer-finder