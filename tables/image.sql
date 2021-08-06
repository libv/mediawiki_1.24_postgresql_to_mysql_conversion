CREATE VIEW tmp_view AS
 select img_name, img_size, img_width, img_height, img_metadata, img_bits, img_media_type, img_major_mime, img_minor_mime, img_description, img_user, img_user_text, img_timestamp, img_sha1 FROM image;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
update tmp_table set img_bits = 0 where img_bits is NULL;
update tmp_table set img_major_mime = 'unknown' where img_major_mime is NULL;
update tmp_table set img_minor_mime = 'unknown' where img_minor_mime is NULL;
ALTER TABLE image RENAME TO orig_image;
ALTER TABLE tmp_table RENAME TO image;
