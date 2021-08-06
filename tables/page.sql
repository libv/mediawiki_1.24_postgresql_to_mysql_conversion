CREATE VIEW tmp_view AS
 select page_id, page_namespace, page_title, page_restrictions, page_is_redirect, page_is_new, page_random, page_touched, page_links_updated, page_latest, page_len, page_content_model, page_lang FROM page;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set page_restrictions = '' where page_restrictions is NULL;
/*update tmp_table set page_touched = '' where page_touched is NULL;*/
ALTER TABLE page RENAME TO orig_page;
ALTER TABLE tmp_table RENAME TO page;
