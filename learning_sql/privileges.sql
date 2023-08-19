-- When an object is created, it is assigned an owner. The owner is normally the role that executed the
-- creation statement. For most kinds of objects, the initial state is that only the owner (or a superuser)
-- can do anything with the object. To allow other roles to use it, privileges must be granted.
-- There are different kinds of privileges: SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER, CREATE, CONNECT, TEMPORARY, EXECUTE, USAGE, SET and ALTER SYSTEM.
-- assigning new owner with Alter
alter table table_name owner to new_owner;
-- using Grant to grant privileges to user or role.
grant update on accounts to new_role;
grant all on accounts to new_role;
-- would grant all privileges to new_role
-- revoking privileges
revoke all on accounts
from new_role;
-- -- ROW SECURITY POLICIES
-- Row security policies can be specific to commands, or to roles, or to both. A policy can be specified to apply to ALL commands, or to SELECT, INSERT, UPDATE, or DELETE. 
-- Multiple roles can be assigned to a given policy, and normal role membership and inheritance rules apply.
-- As a simple example, here is how to create a policy on the account relation to allow only members of the managers role to access rows, and only rows of their accounts:
create table accounts (manager text, company text, contact_email text);
alter table accounts enable row level security;
create policy account_managers on accounts to managers using (manager == current_user);


-- Below is a larger example of how this feature can be used in production environments. The table passwd emulates a Unix password file:
-- Simple passwd-file based example
CREATE TABLE passwd (
    user_name text UNIQUE NOT NULL,
    pwhash text,
    uid int PRIMARY KEY,
    gid int NOT NULL,
    real_name text NOT NULL,
    home_phone text,
    extra_info text,
    home_dir text NOT NULL,
    shell text NOT NULL
);
CREATE ROLE admin;
-- admin
CREATE ROLE bob;
-- normal user
CREATE ROLE alice;
-- normal user
-- Populate the table
INSERT INTO passwd
VALUES (
        'admin',
        'xxx',
        0,
        0,
        'Admin',
        '111-222-3333',
        null,
        '/root',
        '/bin/
dash'
    );
INSERT INTO passwd
VALUES (
        'bob',
        'xxx',
        1,
        1,
        'Bob',
        '123-456-7890',
        null,
        '/home/bob',
        '/bin/
zsh'
    );
INSERT INTO passwd
VALUES (
        'alice',
        'xxx',
        2,
        1,
        'Alice',
        '098-765-4321',
        null,
        '/home/alice',
        '/
bin/zsh'
    );
-- Be sure to enable row-level security on the table
ALTER TABLE passwd ENABLE ROW LEVEL SECURITY;
-- Create policies
-- Administrator can see all rows and add any rows
CREATE POLICY admin_all ON passwd TO admin USING (true) WITH CHECK (true);
-- Normal users can view all rows
CREATE POLICY all_view ON passwd FOR
SELECT USING (true);
-- Normal users can update their own records, but
-- limit which shells a normal user is allowed to set
CREATE POLICY user_mod ON passwd FOR
UPDATE USING (current_user = user_name) WITH CHECK (
        current_user = user_name
        AND shell IN (
            '/bin/bash',
            '/bin/sh',
            '/bin/dash',
            '/bin/zsh',
            '/bin/
tcsh'
        )
    );
-- Allow admin all normal rights
GRANT SELECT,
    INSERT,
    UPDATE,
    DELETE ON passwd TO admin;
-- Users only get select access on public columns
GRANT SELECT (
        user_name,
        uid,
        gid,
        real_name,
        home_phone,
        extra_info,
        home_dir,
        shell
    ) ON passwd TO public;
-- Allow users to update certain columns
GRANT UPDATE (pwhash, real_name, home_phone, extra_info, shell) ON passwd TO public