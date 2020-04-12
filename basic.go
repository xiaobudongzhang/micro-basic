package basic

import (
	"github.com/xiaobudongzhang/micro-basic/config"
	"github.com/xiaobudongzhang/micro-basic/db"

	"github.com/xiaobudongzhang/micro-basic/redis"
)

func Init() {
	config.Init()
	db.Init()
	redis.Init()
}
