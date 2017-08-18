-- +goose Up
-- +goose StatementBegin
CREATE TABLE hyd_pol_p (
	ID           varchar(255) NOT NULL,
	DESCRIPTION  VARCHAR2 (4000) NULL,
	EFFECT       VARCHAR2 (4000) NOT NULL,
	CONDITIONS 	 long raw NULL,
	CONSTRAINT hyd_pol_p_pk_idx PRIMARY KEY (ID)
)
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE hyd_pol_s (
	ID          varchar(64) NOT NULL,
	HAS_REGEX   CHAR(1 BYTE) NOT NULL,
	COMPILED 	varchar(511) NOT NULL UNIQUE,
	TEMPLATE 	varchar(511) NOT NULL UNIQUE,
	CONSTRAINT hyd_pol_s_pk_idx PRIMARY KEY (ID)
)
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE hyd_pol_a (
	ID       	varchar(64) NOT NULL,
	HAS_REGEX   CHAR(1 BYTE) NOT NULL,
	COMPILED 	varchar(511) NOT NULL UNIQUE,
	TEMPLATE 	varchar(511) NOT NULL UNIQUE,
	CONSTRAINT hyd_pol_a_pk_idx PRIMARY KEY (ID)
)
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE hyd_pol_r (
	ID       	varchar(64) NOT NULL,
	HAS_REGEX   CHAR(1 BYTE) NOT NULL,
	COMPILED 	varchar(511) NOT NULL UNIQUE,
	TEMPLATE 	varchar(511) NOT NULL UNIQUE,
	CONSTRAINT hyd_pol_r_pk_idx PRIMARY KEY (ID)
)
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE hyd_pol_sr (
	POLICY 		varchar(255) NOT NULL,
	SUBJECT 	varchar(64) NOT NULL,
	CONSTRAINT hyd_pol_sr_pk_idx PRIMARY KEY (POLICY, SUBJECT),
	CONSTRAINT hyd_pol_srp_fk FOREIGN KEY (POLICY) REFERENCES hyd_pol_p (ID) ON DELETE CASCADE,
	CONSTRAINT hyd_pol_srs_fk FOREIGN KEY (SUBJECT) REFERENCES hyd_pol_s (ID) ON DELETE CASCADE
)
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE hyd_pol_ar (
	POLICY 		varchar(255) NOT NULL,
	ACTION_ID 		varchar(64) NOT NULL,

	CONSTRAINT hyd_pol_ar_pk_idx PRIMARY KEY (POLICY, ACTION_ID),
	CONSTRAINT hyd_pol_arp_fk FOREIGN KEY (POLICY) REFERENCES hyd_pol_p (ID) ON DELETE CASCADE,
	CONSTRAINT hyd_pol_ara_fk FOREIGN KEY (ACTION_ID) REFERENCES hyd_pol_a (ID) ON DELETE CASCADE
)
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE hyd_pol_rr (
	POLICY 		varchar(255) NOT NULL,
	RESOURCE_ID	varchar(64) NOT NULL,
	CONSTRAINT hyd_pol_rr_pk_idx PRIMARY KEY (POLICY, RESOURCE_ID),
	CONSTRAINT hyd_pol_rrp_fk FOREIGN KEY (POLICY) REFERENCES hyd_pol_p (ID) ON DELETE CASCADE,
	CONSTRAINT hyd_pol_rrr_fk FOREIGN KEY (RESOURCE_ID) REFERENCES hyd_pol_r (ID) ON DELETE CASCADE
)
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE hyd_pol_rr
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE hyd_pol_ar
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE hyd_pol_sr
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE hyd_pol_r
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE hyd_pol_a
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE hyd_pol_s
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE hyd_pol_p
-- +goose StatementEnd








