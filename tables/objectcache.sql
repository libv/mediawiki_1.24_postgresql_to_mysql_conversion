CREATE VIEW tmp_view AS
 select keyname, value, to_char(exptime at time zone 'UTC', 'YYYYMMDDHH24MISS') exptime FROM objectcache;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set keyname = '' where keyname is NULL;
ALTER TABLE objectcache RENAME TO orig_objectcache;
ALTER TABLE tmp_table RENAME TO objectcache;
