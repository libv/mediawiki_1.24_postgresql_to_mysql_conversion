CREATE VIEW tmp_view AS
 select ug_user, ug_group FROM user_groups;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set ug_user = 0 where ug_user is NULL;
ALTER TABLE user_groups RENAME TO orig_user_groups;
ALTER TABLE tmp_table RENAME TO user_groups;
