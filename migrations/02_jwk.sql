-- +goose Up
-- +goose StatementBegin
CREATE TABLE hyd_jwk (
	SID     NVARCHAR2(255) NOT NULL,
	KID 	NVARCHAR2(255) NOT NULL,
	VERSION INTEGER NOT NULL,
	KEYDATA VARCHAR2 (4000) NOT NULL,
	CONSTRAINT hydjwk_pk_idx PRIMARY KEY (SID, KID)
)
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE hyd_jwk
-- +goose StatementEnd
