CREATE VIEW tmp_view AS
 select user_id, user_ip, to_char(user_last_timestamp at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') user_last_timestamp FROM user_newtalk;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set user_ip = '' where user_ip is NULL;
ALTER TABLE user_newtalk RENAME TO orig_user_newtalk;
ALTER TABLE tmp_table RENAME TO user_newtalk;
