CREATE VIEW tmp_view AS
 select pr_id, pr_page, pr_type, pr_level, pr_cascade, pr_user, to_char(pr_expiry at time zone 'UTC', 'YYYYMMDDHH24MISS') pr_expiry FROM page_restrictions;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE page_restrictions RENAME TO orig_page_restrictions;
ALTER TABLE tmp_table RENAME TO page_restrictions;
