CREATE VIEW tmp_view AS
 select job_id, job_cmd, job_namespace, job_title, to_char(job_timestamp at time zone 'UTC', 'YYYYMMDDHH24MISS') job_timestamp, job_params, job_random, job_attempts, job_token, to_char(job_token_timestamp at time zone 'UTC', 'YYYYMMDDHH24MISS') job_token_timestamp, job_sha1 FROM job;
SELECT * INTO tmp_table FROM tmp_view;
DROP VIEW tmp_view;
ALTER TABLE job RENAME TO orig_job;
ALTER TABLE tmp_table RENAME TO job;
