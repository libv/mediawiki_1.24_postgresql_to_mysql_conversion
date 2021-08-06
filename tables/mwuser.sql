CREATE VIEW tmp_view AS
 select user_id, user_name, user_real_name, user_password, user_newpassword, to_char(user_newpass_time at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') user_newpass_time, user_email, to_char(user_touched at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') user_touched, user_token, to_char(user_email_authenticated at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') user_email_authenticated, user_email_token, to_char(user_email_token_expires at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') user_email_token_expires, to_char(user_registration at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') user_registration, user_editcount, to_char(user_password_expires at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') user_password_expires FROM mwuser;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set user_name = '' where user_name is NULL;
update tmp_table set user_real_name = '' where user_real_name is NULL;
--update tmp_table set user_touched = '' where user_touched is NULL;
update tmp_table set user_token = '' where user_token is NULL;
/* removes anonymous user as 0. */
delete from tmp_table where user_id = 0;
ALTER TABLE mwuser RENAME TO orig_mwuser;
ALTER TABLE tmp_table RENAME TO mwuser;
