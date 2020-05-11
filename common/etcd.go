package common

type Etcd struct {
	Enabled bool   `json:"enabled"`
	Host    string `json:"host"`
	Port    string `json:"port"`
}
