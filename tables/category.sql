CREATE VIEW tmp_view AS
 select cat_id, cat_title, cat_pages, cat_subcats, cat_files FROM category;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE category RENAME TO orig_category;
ALTER TABLE tmp_table RENAME TO category;
