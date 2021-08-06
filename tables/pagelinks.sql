CREATE VIEW tmp_view AS
 select pl_from, pl_from_namespace, pl_namespace, pl_title FROM pagelinks;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE pagelinks RENAME TO orig_pagelinks;
ALTER TABLE tmp_table RENAME TO pagelinks;
