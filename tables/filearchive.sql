CREATE VIEW tmp_view AS
 select fa_id, fa_name, fa_archive_name, fa_storage_group, fa_storage_key, fa_deleted_user, to_char(fa_deleted_timestamp at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') fa_deleted_timestamp, fa_deleted_reason, fa_size, fa_width, fa_height, fa_metadata, fa_bits, fa_media_type, fa_major_mime, fa_minor_mime, fa_description, fa_user, fa_user_text, to_char(fa_timestamp at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') fa_timestamp, fa_deleted, fa_sha1 FROM filearchive;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE filearchive RENAME TO orig_filearchive;
ALTER TABLE tmp_table RENAME TO filearchive;
