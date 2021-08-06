CREATE VIEW tmp_view AS
 select il_from, il_from_namespace, il_to FROM imagelinks;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE imagelinks RENAME TO orig_imagelinks;
ALTER TABLE tmp_table RENAME TO imagelinks;
