CREATE VIEW tmp_view AS
 select rc_id, rc_timestamp, rc_user, rc_user_text, rc_namespace, rc_title, rc_comment, rc_minor, rc_bot, rc_new, rc_cur_id, rc_this_oldid, rc_last_oldid, rc_type, rc_source, rc_patrolled, rc_ip, rc_old_len, rc_new_len, rc_deleted, rc_logid, rc_log_type, rc_log_action, rc_params FROM recentchanges;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set rc_user = 0 where rc_user is NULL;
update tmp_table set rc_comment = '' where rc_comment is NULL;
update tmp_table set rc_cur_id = 0 where rc_cur_id is NULL;
/* update tmp_table set rc_ip = '' where rc_ip is NULL; */
ALTER TABLE recentchanges RENAME TO orig_recentchanges;
ALTER TABLE tmp_table RENAME TO recentchanges;
