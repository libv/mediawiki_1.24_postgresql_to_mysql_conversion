CREATE VIEW tmp_view AS
 select rev_id, rev_page, rev_text_id, rev_comment, rev_user, rev_user_text, to_char(rev_timestamp at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') rev_timestamp, rev_minor_edit, rev_deleted, rev_len, rev_parent_id, rev_sha1, rev_content_model, rev_content_format FROM revision;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set rev_page = 0 where rev_page is NULL;
update tmp_table set rev_text_id = 0 where rev_text_id is NULL;
update tmp_table set rev_comment = '' where rev_comment is NULL;
ALTER TABLE revision RENAME TO orig_revision;
ALTER TABLE tmp_table RENAME TO revision;
