package main

import (
	"fmt"

	"github.com/xiaobudongzhang/micro-basic/basic"

	"github.com/xiaobudongzhang/micro-basic/redis"
)

func main() {
	basic.Init()
	ca := redis.GetRedis()
	fmt.Println(ca)
}
