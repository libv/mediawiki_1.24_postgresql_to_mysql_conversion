CREATE VIEW tmp_view AS
 select log_id, log_type, log_action, to_char(log_timestamp at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') log_timestamp, log_user, log_user_text, log_namespace, log_title, log_page, log_comment, log_params, log_deleted FROM logging;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set log_user = 0 where log_user is NULL;
update tmp_table set log_comment = '' where log_comment is NULL;
update tmp_table set log_params = '' where log_params is NULL;
ALTER TABLE logging RENAME TO orig_logging;
ALTER TABLE tmp_table RENAME TO logging;
