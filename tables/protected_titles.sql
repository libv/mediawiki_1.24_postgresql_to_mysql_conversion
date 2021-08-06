CREATE VIEW tmp_view AS
 select pt_namespace, pt_title, pt_user, pt_reason, to_char(pt_timestamp at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') pt_timestamp, to_char(pt_expiry at time zone 'UTC', 'YYYY:MM:DD:HH24:MI:SS') pt_expiry, pt_create_perm FROM protected_titles;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set pt_user = 0 where pt_user is NULL;
/*update tmp_table set pt_expiry = '' where pt_expiry is NULL;*/
ALTER TABLE protected_titles RENAME TO orig_protected_titles;
ALTER TABLE tmp_table RENAME TO protected_titles;
