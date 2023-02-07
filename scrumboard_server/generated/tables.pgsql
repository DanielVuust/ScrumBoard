--
-- Class ScrumBoard as table scrum_board
--

CREATE TABLE "scrum_board" (
  "id" serial,
  "boardNickname" text
);

ALTER TABLE ONLY "scrum_board"
  ADD CONSTRAINT scrum_board_pkey PRIMARY KEY (id);


--
-- Class ScrumBoardColumn as table scrum_board_column
--

CREATE TABLE "scrum_board_column" (
  "id" serial,
  "heading" text NOT NULL,
  "boardIndex" integer,
  "scrumBoardId" integer
);

ALTER TABLE ONLY "scrum_board_column"
  ADD CONSTRAINT scrum_board_column_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "scrum_board_column"
  ADD CONSTRAINT scrum_board_column_fk_0
    FOREIGN KEY("scrumBoardId")
      REFERENCES scrum_board(id)
        ON DELETE CASCADE;

--
-- Class User as table users
--

CREATE TABLE "users" (
  "id" serial,
  "firstName" text,
  "lastName" text
);

ALTER TABLE ONLY "users"
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Class ScrumBoardWorkItem as table scrum_board_work_items
--

CREATE TABLE "scrum_board_work_items" (
  "id" serial,
  "name" text NOT NULL,
  "scurmBoardColumnId" integer NOT NULL,
  "description" text NOT NULL,
  "responsibleUserId" integer,
  "columnIndex" integer NOT NULL
);

ALTER TABLE ONLY "scrum_board_work_items"
  ADD CONSTRAINT scrum_board_work_items_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "scrum_board_work_items"
  ADD CONSTRAINT scrum_board_work_items_fk_0
    FOREIGN KEY("scurmBoardColumnId")
      REFERENCES scrum_board_column(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "scrum_board_work_items"
  ADD CONSTRAINT scrum_board_work_items_fk_1
    FOREIGN KEY("responsibleUserId")
      REFERENCES users(id)
        ON DELETE CASCADE;

