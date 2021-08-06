CREATE VIEW tmp_view AS
 select oi_name, oi_archive_name, oi_size, oi_width, oi_height, oi_bits, oi_description, oi_user, oi_user_text, to_char(oi_timestamp at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') oi_timestamp, oi_metadata, oi_media_type, oi_major_mime, oi_minor_mime, oi_deleted, oi_sha1 FROM oldimage;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set oi_bits = 0 where oi_bits is NULL;
update tmp_table set oi_description = '' where oi_description is NULL;
update tmp_table set oi_user = 0 where oi_user is NULL;
update tmp_table set oi_major_mime = 'unknown' where oi_major_mime is NULL;
update tmp_table set oi_minor_mime = 'unknown' where oi_minor_mime is NULL;
ALTER TABLE oldimage RENAME TO orig_oldimage;
ALTER TABLE tmp_table RENAME TO oldimage;
