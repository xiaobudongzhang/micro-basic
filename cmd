 protoc --proto_path=. --go_out=. --micro_out=. proto/user/user.proto
 
 
 
 go run main.go --registry=etcd --api_namespace=mu.micro.book.web  api --handler=web
 
 
 jaeger-all-in-one --collector.zipkin.http-port=9411
 
