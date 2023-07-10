CREATE TABLE "track_table" (
  "track_id" varchar,
  "track_title" varchar
);

CREATE TABLE "course_table" (
  "course_id" varchar,
  "track_id" varchar,
  "course_title" varchar
);

CREATE TABLE "topic_table" (
  "topic_id" varchar,
  "course_id" varchar,
  "topic_title" varchar
);

CREATE TABLE "lesson_table" (
  "lesson_id" varchar,
  "topic_id" varchar,
  "lesson_title" varchar,
  "lesson_type" varchar,
  "duration_in_sec" integer
);

CREATE TABLE "user_lesson_progress_log" (
  "id" varchar,
  "user_id" varchar,
  "lesson_id" varchar,
  "completion_percentage_difference" float,
  "overall_completion_percentage" float,
  "activity_recorded_datetime_in_utc" TIMESTAMP
);

CREATE TABLE "user_registrations" (
  "user_id" varchar,
  "registration_date" date,
  "user_info" varchar
);

CREATE TABLE "user_feedback" (
  "id" varchar,
  "feedback_id" varchar,
  "creation_datetime" TIMESTAMP,
  "user_id" varchar,
  "lesson_id" varchar,
  "language" varchar,
  "question" varchar,
  "answer" varchar
);

ALTER TABLE "topic_table" ADD FOREIGN KEY ("course_id") REFERENCES "course_table" ("course_id");

ALTER TABLE "lesson_table" ADD FOREIGN KEY ("topic_id") REFERENCES "topic_table" ("topic_id");

ALTER TABLE "user_feedback" ADD FOREIGN KEY ("user_id") REFERENCES "user_registrations" ("user_id");

ALTER TABLE "user_lesson_progress_log" ADD FOREIGN KEY ("lesson_id") REFERENCES "lesson_table" ("lesson_id");

ALTER TABLE "user_lesson_progress_log" ADD FOREIGN KEY ("user_id") REFERENCES "user_registrations" ("user_id");

ALTER TABLE "user_feedback" ADD FOREIGN KEY ("lesson_id") REFERENCES "lesson_table" ("lesson_id");

