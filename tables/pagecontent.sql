CREATE VIEW tmp_view AS
 select old_id, old_text, old_flags FROM pagecontent;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set old_text = '' where old_text is NULL;
update tmp_table set old_flags = '' where old_flags is NULL;
ALTER TABLE pagecontent RENAME TO orig_pagecontent;
ALTER TABLE tmp_table RENAME TO pagecontent;
