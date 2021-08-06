CREATE VIEW tmp_view AS
 select iw_prefix, iw_url, iw_api, iw_wikiid, iw_local, iw_trans FROM interwiki;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE interwiki RENAME TO orig_interwiki;
ALTER TABLE tmp_table RENAME TO interwiki;
