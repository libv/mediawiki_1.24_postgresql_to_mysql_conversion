CREATE VIEW tmp_view AS
 select el_id, el_from, el_to, el_index FROM externallinks;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE externallinks RENAME TO orig_externallinks;
ALTER TABLE tmp_table RENAME TO externallinks;
