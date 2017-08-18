-- +goose Up
-- +goose StatementBegin
CREATE TABLE hyd_clt (
	ID      		varchar(255) NOT NULL PRIMARY KEY,
	CLIENT_NAME		VARCHAR2 (4000) NULL,
	CLIENT_SECRET  	VARCHAR2 (4000) NULL,
	REDIRECT_URIS  	VARCHAR2 (4000) NULL,
	GRANT_TYPES  	VARCHAR2 (4000) NULL,
	RESPONSE_TYPES  VARCHAR2 (4000) NULL,
	SCOPE  			VARCHAR2 (4000) NULL,
	OWNER  			VARCHAR2 (4000) NULL,
	POLICY_URI  	VARCHAR2 (4000) NULL,
	TOS_URI  		VARCHAR2 (4000) NULL,
	CLIENT_URI  	VARCHAR2 (4000) NULL,
	LOGO_URI  		VARCHAR2 (4000) NULL,
	CONTACTS  		VARCHAR2 (4000) NULL,
	IS_PUBLIC  		CHAR(1 BYTE) NOT NULL
)
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE hyd_clt
-- +goose StatementEnd

