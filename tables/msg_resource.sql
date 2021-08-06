CREATE VIEW tmp_view AS
 select mr_resource, mr_lang, mr_blob, to_char(mr_timestamp at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') mr_timestamp FROM msg_resource;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE msg_resource RENAME TO orig_msg_resource;
ALTER TABLE tmp_table RENAME TO msg_resource;
