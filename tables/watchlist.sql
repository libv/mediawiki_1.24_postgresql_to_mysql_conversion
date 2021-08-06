
CREATE VIEW tmp_view AS
 select wl_user, wl_namespace, wl_title, to_char(wl_notificationtimestamp at time zone 'UTC', 'YYYYMMDDHH24MISS') wl_notificationtimestamp FROM watchlist;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE watchlist RENAME TO orig_watchlist;
ALTER TABLE tmp_table RENAME TO watchlist;
