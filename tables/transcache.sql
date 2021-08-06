CREATE VIEW tmp_view AS
 select tc_url, tc_contents, to_char(tc_time at time zone 'UTC', 'YYYYMMDDHH24MISS') tc_time FROM transcache;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE transcache RENAME TO orig_transcache;
ALTER TABLE tmp_table RENAME TO transcache;
