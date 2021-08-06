/* archive */
CREATE VIEW tmp_view AS
 select ar_id, ar_namespace, ar_title, ar_text, ar_comment, ar_user, ar_user_text, to_char(ar_timestamp at time zone 'UTC', 'YYYYMMDDHH24MISS') ar_timestamp, ar_minor_edit, ar_flags, ar_rev_id, ar_text_id, ar_deleted, ar_len, ar_page_id, ar_parent_id, ar_sha1, ar_content_model, ar_content_format FROM archive;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set ar_text = '' where ar_text is NULL;
update tmp_table set ar_comment = '' where ar_comment is NULL;
update tmp_table set ar_user = 0 where ar_user is NULL;
update tmp_table set ar_flags = '' where ar_flags is NULL;
ALTER TABLE archive RENAME TO orig_archive;
ALTER TABLE tmp_table RENAME TO archive;
