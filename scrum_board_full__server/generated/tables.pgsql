--
-- Class ScrumBoardColumn as table scrum_board_column
--

CREATE TABLE "scrum_board_column" (
  "id" serial,
  "workItems" json NOT NULL,
  "heading" text NOT NULL,
  "boardIndex" integer NOT NULL
);

ALTER TABLE ONLY "scrum_board_column"
  ADD CONSTRAINT scrum_board_column_pkey PRIMARY KEY (id);


--
-- Class ScrumBoardWorkItem as table scrum_board_work_items
--

CREATE TABLE "scrum_board_work_items" (
  "id" serial,
  "name" text NOT NULL,
  "description" text NOT NULL,
  "responsibleUser" json NOT NULL,
  "columnIndex" integer NOT NULL
);

ALTER TABLE ONLY "scrum_board_work_items"
  ADD CONSTRAINT scrum_board_work_items_pkey PRIMARY KEY (id);


--
-- Class User as table users
--

CREATE TABLE "users" (
  "id" serial,
  "firstName" text NOT NULL,
  "lastName" text NOT NULL
);

ALTER TABLE ONLY "users"
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


