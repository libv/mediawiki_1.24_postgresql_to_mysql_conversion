CREATE VIEW tmp_view AS
 select ll_from, ll_lang, ll_title FROM langlinks;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set ll_lang = '' where ll_lang is NULL;
update tmp_table set ll_title = '' where ll_title is NULL;
ALTER TABLE langlinks RENAME TO orig_langlinks;
ALTER TABLE tmp_table RENAME TO langlinks;
