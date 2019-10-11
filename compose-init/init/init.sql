--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.5.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

\connect %AIIDADB_NAME%

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO %AIIDADB_USER%;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: db_dbauthinfo; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dbauthinfo (
    id integer NOT NULL,
    auth_params jsonb NOT NULL,
    metadata jsonb NOT NULL,
    enabled boolean NOT NULL,
    aiidauser_id integer NOT NULL,
    dbcomputer_id integer NOT NULL
);


ALTER TABLE db_dbauthinfo OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbauthinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dbauthinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dbauthinfo_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbauthinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dbauthinfo_id_seq OWNED BY db_dbauthinfo.id;


--
-- Name: db_dbcomment; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dbcomment (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    ctime timestamp with time zone NOT NULL,
    mtime timestamp with time zone NOT NULL,
    content text NOT NULL,
    dbnode_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE db_dbcomment OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dbcomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dbcomment_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dbcomment_id_seq OWNED BY db_dbcomment.id;


--
-- Name: db_dbcomputer; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dbcomputer (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    name character varying(255) NOT NULL,
    hostname character varying(255) NOT NULL,
    description text NOT NULL,
    transport_type character varying(255) NOT NULL,
    scheduler_type character varying(255) NOT NULL,
    metadata jsonb NOT NULL
);


ALTER TABLE db_dbcomputer OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomputer_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dbcomputer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dbcomputer_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomputer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dbcomputer_id_seq OWNED BY db_dbcomputer.id;


--
-- Name: db_dbgroup; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dbgroup (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    label character varying(255) NOT NULL,
    type_string character varying(255) NOT NULL,
    "time" timestamp with time zone NOT NULL,
    description text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE db_dbgroup OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_dbnodes; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dbgroup_dbnodes (
    id integer NOT NULL,
    dbgroup_id integer NOT NULL,
    dbnode_id integer NOT NULL
);


ALTER TABLE db_dbgroup_dbnodes OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_dbnodes_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dbgroup_dbnodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dbgroup_dbnodes_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_dbnodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dbgroup_dbnodes_id_seq OWNED BY db_dbgroup_dbnodes.id;


--
-- Name: db_dbgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dbgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dbgroup_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dbgroup_id_seq OWNED BY db_dbgroup.id;


--
-- Name: db_dblink; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dblink (
    id integer NOT NULL,
    label character varying(255) NOT NULL,
    input_id integer NOT NULL,
    output_id integer NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE db_dblink OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblink_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dblink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dblink_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dblink_id_seq OWNED BY db_dblink.id;


--
-- Name: db_dblog; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dblog (
    id integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    loggername character varying(255) NOT NULL,
    levelname character varying(50) NOT NULL,
    message text NOT NULL,
    metadata jsonb NOT NULL,
    dbnode_id integer NOT NULL,
    uuid uuid NOT NULL
);


ALTER TABLE db_dblog OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblog_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dblog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dblog_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dblog_id_seq OWNED BY db_dblog.id;


--
-- Name: db_dbnode; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dbnode (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    node_type character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description text NOT NULL,
    ctime timestamp with time zone NOT NULL,
    mtime timestamp with time zone NOT NULL,
    dbcomputer_id integer,
    user_id integer NOT NULL,
    process_type character varying(255),
    attributes jsonb,
    extras jsonb
);


ALTER TABLE db_dbnode OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbnode_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dbnode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dbnode_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dbnode_id_seq OWNED BY db_dbnode.id;


--
-- Name: db_dbsetting; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dbsetting (
    id integer NOT NULL,
    key character varying(1024) NOT NULL,
    description text NOT NULL,
    "time" timestamp with time zone NOT NULL,
    val jsonb
);


ALTER TABLE db_dbsetting OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbsetting_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dbsetting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dbsetting_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbsetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dbsetting_id_seq OWNED BY db_dbsetting.id;


--
-- Name: db_dbuser; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE db_dbuser (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(254) NOT NULL,
    last_name character varying(254) NOT NULL,
    institution character varying(254) NOT NULL
);


ALTER TABLE db_dbuser OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE db_dbuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_dbuser_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE db_dbuser_id_seq OWNED BY db_dbuser.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO %AIIDADB_USER%;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO %AIIDADB_USER%;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO %AIIDADB_USER%;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO %AIIDADB_USER%;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbauthinfo ALTER COLUMN id SET DEFAULT nextval('db_dbauthinfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbcomment ALTER COLUMN id SET DEFAULT nextval('db_dbcomment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbcomputer ALTER COLUMN id SET DEFAULT nextval('db_dbcomputer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup ALTER COLUMN id SET DEFAULT nextval('db_dbgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup_dbnodes ALTER COLUMN id SET DEFAULT nextval('db_dbgroup_dbnodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dblink ALTER COLUMN id SET DEFAULT nextval('db_dblink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dblog ALTER COLUMN id SET DEFAULT nextval('db_dblog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbnode ALTER COLUMN id SET DEFAULT nextval('db_dbnode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbsetting ALTER COLUMN id SET DEFAULT nextval('db_dbsetting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbuser ALTER COLUMN id SET DEFAULT nextval('db_dbuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add content type', 3, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change content type', 3, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add session', 4, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change session', 4, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete session', 4, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add site', 5, 'add_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change site', 5, 'change_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete site', 5, 'delete_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add db user', 6, 'add_dbuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change db user', 6, 'change_dbuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete db user', 6, 'delete_dbuser');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add db node', 7, 'add_dbnode');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change db node', 7, 'change_dbnode');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete db node', 7, 'delete_dbnode');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add db link', 8, 'add_dblink');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change db link', 8, 'change_dblink');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete db link', 8, 'delete_dblink');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add db setting', 9, 'add_dbsetting');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change db setting', 9, 'change_dbsetting');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete db setting', 9, 'delete_dbsetting');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add db attribute', 10, 'add_dbattribute');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change db attribute', 10, 'change_dbattribute');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete db attribute', 10, 'delete_dbattribute');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add db extra', 11, 'add_dbextra');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change db extra', 11, 'change_dbextra');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete db extra', 11, 'delete_dbextra');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add db calc state', 12, 'add_dbcalcstate');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change db calc state', 12, 'change_dbcalcstate');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete db calc state', 12, 'delete_dbcalcstate');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add db group', 13, 'add_dbgroup');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change db group', 13, 'change_dbgroup');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete db group', 13, 'delete_dbgroup');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add db computer', 14, 'add_dbcomputer');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change db computer', 14, 'change_dbcomputer');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete db computer', 14, 'delete_dbcomputer');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can add db auth info', 15, 'add_dbauthinfo');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can change db auth info', 15, 'change_dbauthinfo');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can delete db auth info', 15, 'delete_dbauthinfo');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add db comment', 16, 'add_dbcomment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change db comment', 16, 'change_dbcomment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete db comment', 16, 'delete_dbcomment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add db log', 17, 'add_dblog');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change db log', 17, 'change_dblog');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete db log', 17, 'delete_dblog');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can add db workflow', 18, 'add_dbworkflow');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can change db workflow', 18, 'change_dbworkflow');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can delete db workflow', 18, 'delete_dbworkflow');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can add db workflow data', 19, 'add_dbworkflowdata');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can change db workflow data', 19, 'change_dbworkflowdata');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can delete db workflow data', 19, 'delete_dbworkflowdata');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can add db workflow step', 20, 'add_dbworkflowstep');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can change db workflow step', 20, 'change_dbworkflowstep');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can delete db workflow step', 20, 'delete_dbworkflowstep');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('auth_permission_id_seq', 60, true);


--
-- Data for Name: db_dbauthinfo; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO db_dbauthinfo (id, auth_params, metadata, enabled, aiidauser_id, dbcomputer_id) VALUES (1, '{"port": 22, "gss_kex": null, "timeout": 60, "compress": true, "gss_auth": null, "gss_host": "torquessh", "username": "app", "key_policy": "AutoAddPolicy", "allow_agent": false, "key_filename": "/home/aiida/.ssh/id_rsa", "look_for_keys": false, "proxy_command": null, "safe_interval": 5, "gss_deleg_creds": null, "load_system_host_keys": true}', '{}', true, 1, 1);


--
-- Name: db_dbauthinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dbauthinfo_id_seq', 1, true);


--
-- Data for Name: db_dbcomment; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dbcomment_id_seq', 1, false);


--
-- Data for Name: db_dbcomputer; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO db_dbcomputer (id, uuid, name, hostname, description, transport_type, scheduler_type, metadata) VALUES (1, '0daf0d94-ac58-436a-a034-2fd1f1be14e9', 'torquessh', 'torquessh', '', 'ssh', 'torque', '{"shebang": "#!/bin/bash", "workdir": "/scratch/{username}/aiida/", "append_text": "", "prepend_text": "", "mpirun_command": ["mpirun", "-np", "{tot_num_mpiprocs}"]}');


--
-- Name: db_dbcomputer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dbcomputer_id_seq', 1, true);


--
-- Data for Name: db_dbgroup; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Data for Name: db_dbgroup_dbnodes; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbgroup_dbnodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dbgroup_dbnodes_id_seq', 1, false);


--
-- Name: db_dbgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dbgroup_id_seq', 1, false);


--
-- Data for Name: db_dblink; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dblink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dblink_id_seq', 1, false);


--
-- Data for Name: db_dblog; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dblog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dblog_id_seq', 1, false);


--
-- Data for Name: db_dbnode; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO db_dbnode (id, uuid, node_type, label, description, ctime, mtime, dbcomputer_id, user_id, process_type, attributes, extras) VALUES (1, '8e729966-b5aa-4425-a831-cc0e3a6163ad', 'data.code.Code.', 'crystal', '', '2018-12-19 19:12:53.559278+00', '2019-10-07 09:15:30.618032+00', 1, 1, NULL, '{"is_local": false, "append_text": "", "input_plugin": "crystal.serial", "prepend_text": "", "remote_exec_path": "/usr/bin/crystal"}', '{"hidden": false, "_aiida_hash": "62041ba662e22e7669aa1b0643d90ef4e1a1d0cf4fe8c9e186ff08862931713f"}');
INSERT INTO db_dbnode (id, uuid, node_type, label, description, ctime, mtime, dbcomputer_id, user_id, process_type, attributes, extras) VALUES (2, '200873cd-6200-4f06-b9ac-c0645e2b50d4', 'data.code.Code.', 'Pcrystal', '', '2019-02-11 17:58:51.676932+00', '2019-10-07 09:15:30.626176+00', 1, 1, NULL, '{"is_local": false, "append_text": "", "input_plugin": "crystal.parallel", "prepend_text": "", "remote_exec_path": "/usr/bin/Pcrystal"}', '{"hidden": false, "_aiida_hash": "2e1e261af0e422a22d347adb4b11e6327f5366f8c6da79104f03c0a47bf33152"}');
INSERT INTO db_dbnode (id, uuid, node_type, label, description, ctime, mtime, dbcomputer_id, user_id, process_type, attributes, extras) VALUES (3, '1dd8156d-a893-4b83-b7ac-7368d92d3640', 'data.code.Code.', 'properties', '', '2019-03-05 18:46:14.813103+00', '2019-10-07 09:15:30.632449+00', 1, 1, NULL, '{"is_local": false, "append_text": "", "input_plugin": "crystal.properties", "prepend_text": "", "remote_exec_path": "/usr/bin/properties"}', '{"hidden": false, "_aiida_hash": "9e5daf040d08ee30e6edb018c67c425e2eeed7a9cf4bd0f0e1c1de8e16c1eabf"}');


--
-- Name: db_dbnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dbnode_id_seq', 3, true);


--
-- Data for Name: db_dbsetting; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO db_dbsetting (id, key, description, "time", val) VALUES (16, 'db|backend', 'The backend used to communicate with the database.', '2019-10-07 09:15:16.550108+00', '"django"');
INSERT INTO db_dbsetting (id, key, description, "time", val) VALUES (37, 'daemon|task_start|workflow_stepper', 'The last time the daemon started to run the task ''workflow_stepper''', '2019-10-07 09:15:16.550629+00', '"2019-03-05T18:46:20.386132+00:00"');
INSERT INTO db_dbsetting (id, key, description, "time", val) VALUES (38, 'daemon|task_stop|workflow_stepper', 'The last time the daemon finished to run the task ''workflow_stepper''', '2019-10-07 09:15:16.55114+00', '"2019-03-05T18:46:20.400081+00:00"');
INSERT INTO db_dbsetting (id, key, description, "time", val) VALUES (15, 'db|schemaversion', 'The version of the schema used in this database.', '2019-10-07 09:15:16.659682+00', '"1.0.40"');


--
-- Name: db_dbsetting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dbsetting_id_seq', 38, true);


--
-- Data for Name: db_dbuser; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO db_dbuser (id, email, first_name, last_name, institution) VALUES (1, 'aiida@localhost', 'AiiDA', 'Daemon', '');


--
-- Name: db_dbuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('db_dbuser_id_seq', 1, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'sites', 'site');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'db', 'dbuser');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'db', 'dbnode');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'db', 'dblink');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'db', 'dbsetting');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'db', 'dbattribute');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'db', 'dbextra');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'db', 'dbcalcstate');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'db', 'dbgroup');
INSERT INTO django_content_type (id, app_label, model) VALUES (14, 'db', 'dbcomputer');
INSERT INTO django_content_type (id, app_label, model) VALUES (15, 'db', 'dbauthinfo');
INSERT INTO django_content_type (id, app_label, model) VALUES (16, 'db', 'dbcomment');
INSERT INTO django_content_type (id, app_label, model) VALUES (17, 'db', 'dblog');
INSERT INTO django_content_type (id, app_label, model) VALUES (18, 'db', 'dbworkflow');
INSERT INTO django_content_type (id, app_label, model) VALUES (19, 'db', 'dbworkflowdata');
INSERT INTO django_content_type (id, app_label, model) VALUES (20, 'db', 'dbworkflowstep');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('django_content_type_id_seq', 20, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2018-12-19 19:11:31.933837+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-12-19 19:11:31.997553+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2018-12-19 19:11:32.222461+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-12-19 19:11:32.289836+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-12-19 19:11:32.355133+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-12-19 19:11:32.429146+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-12-19 19:11:32.510864+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-12-19 19:11:32.527113+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'db', '0001_initial', '2018-12-19 19:11:39.211611+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'db', '0002_db_state_change', '2018-12-19 19:11:40.187334+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'db', '0003_add_link_type', '2018-12-19 19:11:42.957642+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'db', '0004_add_daemon_and_uuid_indices', '2018-12-19 19:11:43.301034+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'db', '0005_add_cmtime_indices', '2018-12-19 19:11:44.152575+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'db', '0006_delete_dbpath', '2018-12-19 19:11:45.033248+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'db', '0007_update_linktypes', '2018-12-19 19:11:45.233787+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'db', '0008_code_hidden_to_extra', '2018-12-19 19:11:45.345566+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'db', '0009_base_data_plugin_type_string', '2018-12-19 19:11:45.444741+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'db', '0010_process_type', '2018-12-19 19:11:45.735077+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'db', '0011_delete_kombu_tables', '2018-12-19 19:11:45.823274+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'db', '0012_drop_dblock', '2018-12-19 19:11:45.921759+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'db', '0013_django_1_8', '2018-12-19 19:11:46.541536+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'db', '0014_add_node_uuid_unique_constraint', '2018-12-19 19:11:46.93026+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'db', '0015_invalidating_node_hash', '2018-12-19 19:11:47.051878+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'sessions', '0001_initial', '2018-12-19 19:11:47.141055+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (25, 'sites', '0001_initial', '2018-12-19 19:11:47.222329+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (26, 'auth', '0007_alter_validators_add_error_messages', '2019-10-07 09:15:14.778244+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (27, 'auth', '0008_alter_user_username_max_length', '2019-10-07 09:15:14.788839+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (28, 'db', '0016_code_sub_class_of_data', '2019-10-07 09:15:14.815893+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (29, 'db', '0017_drop_dbcalcstate', '2019-10-07 09:15:14.857381+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (30, 'db', '0018_django_1_11', '2019-10-07 09:15:15.167552+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (31, 'db', '0019_migrate_builtin_calculations', '2019-10-07 09:15:15.193175+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (32, 'db', '0020_provenance_redesign', '2019-10-07 09:15:15.269421+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (33, 'db', '0021_dbgroup_name_to_label_type_to_type_string', '2019-10-07 09:15:15.33429+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (34, 'db', '0022_dbgroup_type_string_change_content', '2019-10-07 09:15:15.360741+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (35, 'db', '0023_calc_job_option_attribute_keys', '2019-10-07 09:15:15.387311+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (36, 'db', '0024_dblog_update', '2019-10-07 09:15:15.580289+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (37, 'db', '0025_move_data_within_node_module', '2019-10-07 09:15:15.605189+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (38, 'db', '0026_trajectory_symbols_to_attribute', '2019-10-07 09:15:15.683924+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (39, 'db', '0027_delete_trajectory_symbols_array', '2019-10-07 09:15:15.727927+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (40, 'db', '0028_remove_node_prefix', '2019-10-07 09:15:15.770363+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (41, 'db', '0029_rename_parameter_data_to_dict', '2019-10-07 09:15:15.794378+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (42, 'db', '0030_dbnode_type_to_dbnode_node_type', '2019-10-07 09:15:15.837694+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (43, 'db', '0031_remove_dbcomputer_enabled', '2019-10-07 09:15:15.866051+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (44, 'db', '0032_remove_legacy_workflows', '2019-10-07 09:15:16.068366+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (45, 'db', '0033_replace_text_field_with_json_field', '2019-10-07 09:15:16.219518+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (46, 'db', '0034_drop_node_columns_nodeversion_public', '2019-10-07 09:15:16.255927+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (47, 'db', '0035_simplify_user_model', '2019-10-07 09:15:16.390068+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (48, 'db', '0036_drop_computer_transport_params', '2019-10-07 09:15:16.411239+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (49, 'db', '0037_attributes_extras_settings_json', '2019-10-07 09:15:16.599671+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (50, 'db', '0038_data_migration_legacy_job_calculations', '2019-10-07 09:15:16.616904+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (51, 'db', '0039_reset_hash', '2019-10-07 09:15:16.644915+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (52, 'db', '0040_data_migration_legacy_process_attributes', '2019-10-07 09:15:16.661664+00');


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('django_migrations_id_seq', 52, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO django_site (id, domain, name) VALUES (1, 'example.com', 'example.com');


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: db_dbauthinfo_aiidauser_id_5b91ddd9ac6ddd83_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_aiidauser_id_5b91ddd9ac6ddd83_uniq UNIQUE (aiidauser_id, dbcomputer_id);


--
-- Name: db_dbauthinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_pkey PRIMARY KEY (id);


--
-- Name: db_dbcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbcomment
    ADD CONSTRAINT db_dbcomment_pkey PRIMARY KEY (id);


--
-- Name: db_dbcomment_uuid_49bac08c_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbcomment
    ADD CONSTRAINT db_dbcomment_uuid_49bac08c_uniq UNIQUE (uuid);


--
-- Name: db_dbcomputer_name_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbcomputer
    ADD CONSTRAINT db_dbcomputer_name_key UNIQUE (name);


--
-- Name: db_dbcomputer_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbcomputer
    ADD CONSTRAINT db_dbcomputer_pkey PRIMARY KEY (id);


--
-- Name: db_dbcomputer_uuid_f35defa6_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbcomputer
    ADD CONSTRAINT db_dbcomputer_uuid_f35defa6_uniq UNIQUE (uuid);


--
-- Name: db_dbgroup_dbnodes_dbgroup_id_dbnode_id_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_dbgroup_id_dbnode_id_key UNIQUE (dbgroup_id, dbnode_id);


--
-- Name: db_dbgroup_dbnodes_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_pkey PRIMARY KEY (id);


--
-- Name: db_dbgroup_name_680159c7377fefd_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup
    ADD CONSTRAINT db_dbgroup_name_680159c7377fefd_uniq UNIQUE (label, type_string);


--
-- Name: db_dbgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup
    ADD CONSTRAINT db_dbgroup_pkey PRIMARY KEY (id);


--
-- Name: db_dbgroup_uuid_af896177_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup
    ADD CONSTRAINT db_dbgroup_uuid_af896177_uniq UNIQUE (uuid);


--
-- Name: db_dblink_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dblink
    ADD CONSTRAINT db_dblink_pkey PRIMARY KEY (id);


--
-- Name: db_dblog_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dblog
    ADD CONSTRAINT db_dblog_pkey PRIMARY KEY (id);


--
-- Name: db_dblog_uuid_9cf77df3_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dblog
    ADD CONSTRAINT db_dblog_uuid_9cf77df3_uniq UNIQUE (uuid);


--
-- Name: db_dbnode_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbnode
    ADD CONSTRAINT db_dbnode_pkey PRIMARY KEY (id);


--
-- Name: db_dbnode_uuid_62e0bf98_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbnode
    ADD CONSTRAINT db_dbnode_uuid_62e0bf98_uniq UNIQUE (uuid);


--
-- Name: db_dbsetting_key_1b84beb4_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbsetting
    ADD CONSTRAINT db_dbsetting_key_1b84beb4_uniq UNIQUE (key);


--
-- Name: db_dbsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbsetting
    ADD CONSTRAINT db_dbsetting_pkey PRIMARY KEY (id);


--
-- Name: db_dbuser_email_30150b7e_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbuser
    ADD CONSTRAINT db_dbuser_email_30150b7e_uniq UNIQUE (email);


--
-- Name: db_dbuser_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbuser
    ADD CONSTRAINT db_dbuser_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: db_dbauthinfo_669c815a; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbauthinfo_669c815a ON db_dbauthinfo USING btree (aiidauser_id);


--
-- Name: db_dbauthinfo_9ed6a91c; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbauthinfo_9ed6a91c ON db_dbauthinfo USING btree (dbcomputer_id);


--
-- Name: db_dbcomment_7a672316; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbcomment_7a672316 ON db_dbcomment USING btree (dbnode_id);


--
-- Name: db_dbcomment_e8701ad4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbcomment_e8701ad4 ON db_dbcomment USING btree (user_id);


--
-- Name: db_dbcomputer_name_538c8da7bbe500af_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbcomputer_name_538c8da7bbe500af_like ON db_dbcomputer USING btree (name varchar_pattern_ops);


--
-- Name: db_dbgroup_599dcce2; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_599dcce2 ON db_dbgroup USING btree (type_string);


--
-- Name: db_dbgroup_b068931c; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_b068931c ON db_dbgroup USING btree (label);


--
-- Name: db_dbgroup_dbnodes_7a672316; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_dbnodes_7a672316 ON db_dbgroup_dbnodes USING btree (dbnode_id);


--
-- Name: db_dbgroup_dbnodes_a0b4eda0; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_dbnodes_a0b4eda0 ON db_dbgroup_dbnodes USING btree (dbgroup_id);


--
-- Name: db_dbgroup_e8701ad4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_e8701ad4 ON db_dbgroup USING btree (user_id);


--
-- Name: db_dbgroup_name_30351f1c64285f22_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_name_30351f1c64285f22_like ON db_dbgroup USING btree (label varchar_pattern_ops);


--
-- Name: db_dbgroup_type_49745d6ede76abdd_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_type_49745d6ede76abdd_like ON db_dbgroup USING btree (type_string varchar_pattern_ops);


--
-- Name: db_dblink_599dcce2; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_599dcce2 ON db_dblink USING btree (type);


--
-- Name: db_dblink_b082bddd; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_b082bddd ON db_dblink USING btree (input_id);


--
-- Name: db_dblink_d304ba20; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_d304ba20 ON db_dblink USING btree (label);


--
-- Name: db_dblink_f7f1d83a; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_f7f1d83a ON db_dblink USING btree (output_id);


--
-- Name: db_dblink_label_8f8811d475657bc_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_label_8f8811d475657bc_like ON db_dblink USING btree (label varchar_pattern_ops);


--
-- Name: db_dblink_type_7365c319e9395009_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_type_7365c319e9395009_like ON db_dblink USING btree (type varchar_pattern_ops);


--
-- Name: db_dblog_269f51f9; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_269f51f9 ON db_dblog USING btree (levelname);


--
-- Name: db_dblog_358be7bf; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_358be7bf ON db_dblog USING btree (loggername);


--
-- Name: db_dblog_dbnode_id_da34b732; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_dbnode_id_da34b732 ON db_dblog USING btree (dbnode_id);


--
-- Name: db_dblog_levelname_14b334f2645c4b06_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_levelname_14b334f2645c4b06_like ON db_dblog USING btree (levelname varchar_pattern_ops);


--
-- Name: db_dblog_loggername_4f4ecb812e82233_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_loggername_4f4ecb812e82233_like ON db_dblog USING btree (loggername varchar_pattern_ops);


--
-- Name: db_dbnode_599dcce2; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_599dcce2 ON db_dbnode USING btree (node_type);


--
-- Name: db_dbnode_66145cb4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_66145cb4 ON db_dbnode USING btree (process_type);


--
-- Name: db_dbnode_9ed6a91c; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_9ed6a91c ON db_dbnode USING btree (dbcomputer_id);


--
-- Name: db_dbnode_ctime_40323cf9b4b3beda_uniq; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_ctime_40323cf9b4b3beda_uniq ON db_dbnode USING btree (ctime);


--
-- Name: db_dbnode_d304ba20; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_d304ba20 ON db_dbnode USING btree (label);


--
-- Name: db_dbnode_e8701ad4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_e8701ad4 ON db_dbnode USING btree (user_id);


--
-- Name: db_dbnode_label_6242931c5b984b78_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_label_6242931c5b984b78_like ON db_dbnode USING btree (label varchar_pattern_ops);


--
-- Name: db_dbnode_mtime_27edb0e547b18070_uniq; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_mtime_27edb0e547b18070_uniq ON db_dbnode USING btree (mtime);


--
-- Name: db_dbnode_process_type_4aee8b4a0e613c25_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_process_type_4aee8b4a0e613c25_like ON db_dbnode USING btree (process_type varchar_pattern_ops);


--
-- Name: db_dbnode_type_4cda33f938ccd765_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_type_4cda33f938ccd765_like ON db_dbnode USING btree (node_type varchar_pattern_ops);


--
-- Name: db_dbsetting_key_1b84beb4_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbsetting_key_1b84beb4_like ON db_dbsetting USING btree (key varchar_pattern_ops);


--
-- Name: db_dbuser_email_30150b7e_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbuser_email_30150b7e_like ON db_dbuser USING btree (email varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbauthinfo_aiidauser_id_b4dbd2ecdabaa58_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_aiidauser_id_b4dbd2ecdabaa58_fk_db_dbuser_id FOREIGN KEY (aiidauser_id) REFERENCES db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbauthinfo_dbcomputer_id_be3c9b99107479b_fk_db_dbcomputer_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_dbcomputer_id_be3c9b99107479b_fk_db_dbcomputer_id FOREIGN KEY (dbcomputer_id) REFERENCES db_dbcomputer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbcomment_dbnode_id_e225ac462eb8f6c_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbcomment
    ADD CONSTRAINT db_dbcomment_dbnode_id_e225ac462eb8f6c_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbcomment_user_id_2e215134d026c3a3_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbcomment
    ADD CONSTRAINT db_dbcomment_user_id_2e215134d026c3a3_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbgroup_dbnodes_dbgroup_id_32d69f1acbc4c03c_fk_db_dbgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_dbgroup_id_32d69f1acbc4c03c_fk_db_dbgroup_id FOREIGN KEY (dbgroup_id) REFERENCES db_dbgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbgroup_dbnodes_dbnode_id_53a1829a1973b99c_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_dbnode_id_53a1829a1973b99c_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbgroup_user_id_698e239e754dccc5_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbgroup
    ADD CONSTRAINT db_dbgroup_user_id_698e239e754dccc5_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dblink_input_id_6feafb02380ed56f_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dblink
    ADD CONSTRAINT db_dblink_input_id_6feafb02380ed56f_fk_db_dbnode_id FOREIGN KEY (input_id) REFERENCES db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dblink_output_id_6345a663e713ed93_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dblink
    ADD CONSTRAINT db_dblink_output_id_6345a663e713ed93_fk_db_dbnode_id FOREIGN KEY (output_id) REFERENCES db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dblog_dbnode_id_da34b732_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dblog
    ADD CONSTRAINT db_dblog_dbnode_id_da34b732_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbnode_dbcomputer_id_2195c2d4d9b222ff_fk_db_dbcomputer_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbnode
    ADD CONSTRAINT db_dbnode_dbcomputer_id_2195c2d4d9b222ff_fk_db_dbcomputer_id FOREIGN KEY (dbcomputer_id) REFERENCES db_dbcomputer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbnode_user_id_43fd81cadf67f183_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY db_dbnode
    ADD CONSTRAINT db_dbnode_user_id_43fd81cadf67f183_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO %AIIDADB_USER%;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

