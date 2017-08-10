package main

import "C"

import (
	"github.com/jmoiron/sqlx"
	"github.com/ory/fosite"
	"github.com/ory/hydra-oracle-plugin/plugin"
	"github.com/ory/hydra/client"
	"github.com/ory/hydra/jwk"
	"github.com/ory/hydra/pkg"
	"github.com/ory/hydra/warden/group"
	"github.com/ory/ladon"
	"github.com/sirupsen/logrus"
	_ "gopkg.in/rana/ora.v4"
)

func main() {
	plugin.Execute()
}

func Connect(u string) (*sqlx.DB, error) {
	return plugin.Connect(u)
}

func NewClientManager(db *sqlx.DB, hasher fosite.Hasher) client.Manager {
	return plugin.NewClientManager(db, hasher)
}

func NewGroupManager(db *sqlx.DB) group.Manager {
	return plugin.NewGroupManager(db)
}

func NewJWKManager(db *sqlx.DB, cipher *jwk.AEAD) jwk.Manager {
	return plugin.NewJWKManager(db, cipher)
}

func NewOAuth2Manager(db *sqlx.DB, cm client.Manager, logger logrus.FieldLogger) pkg.FositeStorer {
	return plugin.NewOAuth2Manager(db, cm, logger)
}

func NewPolicyManager(db *sqlx.DB) ladon.Manager {
	return plugin.NewPolicyManager(db)
}

func CreateSchemas(db *sqlx.DB) error {
	return plugin.CreateSchemas(db)
}
