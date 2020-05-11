package config

import (
	"fmt"
	"sync"

	"honnef.co/go/tools/config"
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
