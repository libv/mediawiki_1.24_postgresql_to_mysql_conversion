CREATE VIEW tmp_view AS
 select ipb_id, ipb_address, ipb_user, ipb_by, ipb_by_text, ipb_reason, ipb_timestamp, ipb_auto, ipb_anon_only, ipb_create_account, ipb_enable_autoblock, ipb_expiry, ipb_range_start, ipb_range_end, ipb_deleted, ipb_block_email, ipb_allow_usertalk, ipb_parent_block_id FROM ipblocks;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set ipb_address = '' where ipb_address is NULL;
update tmp_table set ipb_user = 0 where ipb_user is NULL;
update tmp_table set ipb_range_start = '' where ipb_range_start is NULL;
update tmp_table set ipb_range_end = '' where ipb_range_end is NULL;
ALTER TABLE ipblocks RENAME TO orig_ipblocks;
ALTER TABLE tmp_table RENAME TO ipblocks;