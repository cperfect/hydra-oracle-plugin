-- +goose Up
-- +goose StatementBegin
CREATE TABLE hyd_grp (
    id varchar(255) NOT NULL PRIMARY KEY
)
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE hyd_grp_m (
	member		varchar(255) NOT NULL,
	group_id	varchar(255) NOT NULL,
	FOREIGN KEY (group_id) REFERENCES hyd_grp(id) ON DELETE CASCADE,
	PRIMARY KEY (member, group_id)
)
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE hyd_grp_m
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE hyd_grp
-- +goose StatementEnd