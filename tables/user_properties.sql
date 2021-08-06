CREATE VIEW tmp_view AS
 select up_user, up_property, up_value FROM user_properties;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set up_user = 0 where up_user is NULL;
ALTER TABLE user_properties RENAME TO orig_user_properties;
ALTER TABLE tmp_table RENAME TO user_properties;
