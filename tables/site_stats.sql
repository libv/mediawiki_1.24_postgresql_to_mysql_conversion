CREATE VIEW tmp_view AS
 select ss_row_id, ss_total_views, ss_total_edits, ss_good_articles, ss_total_pages, ss_users, ss_active_users, ss_images FROM site_stats;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE site_stats RENAME TO orig_site_stats;
ALTER TABLE tmp_table RENAME TO site_stats;
