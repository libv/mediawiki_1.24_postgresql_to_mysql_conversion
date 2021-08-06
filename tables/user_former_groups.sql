CREATE VIEW tmp_view AS
 select ufg_user, ufg_group FROM user_former_groups;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set ufg_user = 0 where ufg_user is NULL;
ALTER TABLE user_former_groups RENAME TO orig_user_former_groups;
ALTER TABLE tmp_table RENAME TO user_former_groups;
