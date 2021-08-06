CREATE VIEW tmp_view AS
 select qci_type, qci_timestamp FROM querycache_info;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set qci_type = '' where qci_type is NULL;
--update tmp_table set qci_timestamp = '19700101000000' where qci_timestamp is NULL;
ALTER TABLE querycache_info RENAME TO orig_querycache_info;
ALTER TABLE tmp_table RENAME TO querycache_info;
