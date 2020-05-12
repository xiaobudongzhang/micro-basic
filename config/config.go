package config

import (
	"fmt"
	"sync"

	"github.com/micro/go-micro/util/log"
	"github.com/micro/go-micro/v2/config"
)

var (
	m      sync.RWMutex
	inited bool

	c = &configurator{}
)

type Configurator interface {
	App(name string, config interface{}) (err error)
}

type configurator struct {
	conf config.Config
}

func (c *configurator) App(name string, config interface{}) (err error) {
	v := c.conf.Get(name)
	if v != nil {
		err = v.Scan(config)
	} else {
		err = fmt.Errorf("配置不存在 %s")
	}

	return
}

func C() Configurator {
	return c
}

func (c *configurator) init(ops Options) (err error) {
	m.Lock()
	defer m.Unlock()

	if inited {
		log.Logf("配置已经初始化")
		return
	}

	c.conf, _ = config.NewConfig()

	err = c.conf.Load(ops.Sources...)
	if err != nil {
		log.Fatal(err)
	}

	go func() {
		log.Logf("侦听配置变动")

		watcher, err := c.conf.Watch()
		if err != nil {
			log.Fatal(err)
		}

		for {
			v, err := watcher.Next()
			if err != nil {
				log.Fatal(err)
			}

			log.Logf("侦听配置变动 %v", string(v.Bytes()))
		}
	}()

	inited = true
	return
}

func Init(opts ...Option) {

	ops := Options{}
	for _, o := range opts {
		o(&ops)
	}

	c = &configurator{}

	c.init(ops)
}
