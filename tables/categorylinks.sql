CREATE VIEW tmp_view AS
 select cl_from, cl_to, cl_sortkey, cl_sortkey_prefix, to_char(cl_timestamp at time zone 'UTC', 'YYYYMMDDHH24MISS') cl_timestamp, cl_collation, cl_type FROM categorylinks;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set cl_sortkey = '' where cl_sortkey is NULL;
ALTER TABLE categorylinks RENAME TO orig_categorylinks;
ALTER TABLE tmp_table RENAME TO categorylinks;
