CREATE VIEW tmp_view AS
 select us_id, us_user, us_key, us_orig_path, us_path, us_source_type, to_char(us_timestamp at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') us_timestamp, us_status, us_chunk_inx, us_props, us_size, us_sha1, us_mime, us_media_type, us_image_width, us_image_height, us_image_bits FROM uploadstash;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set us_user = 0 where us_user is NULL;
update tmp_table set us_key = '' where us_key is NULL;
update tmp_table set us_orig_path = '' where us_orig_path is NULL;
update tmp_table set us_path = '' where us_path is NULL;
/* update tmp_table set us_timestamp = '' where us_timestamp is NULL; */
update tmp_table set us_status = '' where us_status is NULL;
update tmp_table set us_size = 0 where us_size is NULL;
update tmp_table set us_sha1 = '' where us_sha1 is NULL;
ALTER TABLE uploadstash RENAME TO orig_uploadstash;
ALTER TABLE tmp_table RENAME TO uploadstash;
