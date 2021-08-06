CREATE VIEW tmp_view AS
 select tl_from, tl_from_namespace, tl_namespace, tl_title FROM templatelinks;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE templatelinks RENAME TO orig_templatelinks;
ALTER TABLE tmp_table RENAME TO templatelinks;
