--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.22
-- Dumped by pg_dump version 9.5.22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: %AIIDADB_NAME%; Type: DATABASE; Schema: -; Owner: aiida
--

\connect %AIIDADB_NAME%

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO %AIIDADB_USER%;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: db_dbauthinfo; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dbauthinfo (
    id integer NOT NULL,
    auth_params jsonb NOT NULL,
    metadata jsonb NOT NULL,
    enabled boolean NOT NULL,
    aiidauser_id integer NOT NULL,
    dbcomputer_id integer NOT NULL
);


ALTER TABLE public.db_dbauthinfo OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbauthinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dbauthinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbauthinfo_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbauthinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dbauthinfo_id_seq OWNED BY public.db_dbauthinfo.id;


--
-- Name: db_dbcomment; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dbcomment (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    ctime timestamp with time zone NOT NULL,
    mtime timestamp with time zone NOT NULL,
    content text NOT NULL,
    dbnode_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.db_dbcomment OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dbcomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbcomment_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dbcomment_id_seq OWNED BY public.db_dbcomment.id;


--
-- Name: db_dbcomputer; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dbcomputer (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    name character varying(255) NOT NULL,
    hostname character varying(255) NOT NULL,
    description text NOT NULL,
    transport_type character varying(255) NOT NULL,
    scheduler_type character varying(255) NOT NULL,
    metadata jsonb NOT NULL
);


ALTER TABLE public.db_dbcomputer OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomputer_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dbcomputer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbcomputer_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomputer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dbcomputer_id_seq OWNED BY public.db_dbcomputer.id;


--
-- Name: db_dbgroup; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dbgroup (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    label character varying(255) NOT NULL,
    type_string character varying(255) NOT NULL,
    "time" timestamp with time zone NOT NULL,
    description text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.db_dbgroup OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_dbnodes; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dbgroup_dbnodes (
    id integer NOT NULL,
    dbgroup_id integer NOT NULL,
    dbnode_id integer NOT NULL
);


ALTER TABLE public.db_dbgroup_dbnodes OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_dbnodes_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dbgroup_dbnodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbgroup_dbnodes_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_dbnodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dbgroup_dbnodes_id_seq OWNED BY public.db_dbgroup_dbnodes.id;


--
-- Name: db_dbgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dbgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbgroup_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dbgroup_id_seq OWNED BY public.db_dbgroup.id;


--
-- Name: db_dblink; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dblink (
    id integer NOT NULL,
    label character varying(255) NOT NULL,
    input_id integer NOT NULL,
    output_id integer NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE public.db_dblink OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblink_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dblink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dblink_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dblink_id_seq OWNED BY public.db_dblink.id;


--
-- Name: db_dblog; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dblog (
    id integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    loggername character varying(255) NOT NULL,
    levelname character varying(50) NOT NULL,
    message text NOT NULL,
    metadata jsonb NOT NULL,
    dbnode_id integer NOT NULL,
    uuid uuid NOT NULL
);


ALTER TABLE public.db_dblog OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblog_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dblog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dblog_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dblog_id_seq OWNED BY public.db_dblog.id;


--
-- Name: db_dbnode; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dbnode (
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


ALTER TABLE public.db_dbnode OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbnode_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dbnode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbnode_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dbnode_id_seq OWNED BY public.db_dbnode.id;


--
-- Name: db_dbsetting; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dbsetting (
    id integer NOT NULL,
    key character varying(1024) NOT NULL,
    description text NOT NULL,
    "time" timestamp with time zone NOT NULL,
    val jsonb
);


ALTER TABLE public.db_dbsetting OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbsetting_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dbsetting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbsetting_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbsetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dbsetting_id_seq OWNED BY public.db_dbsetting.id;


--
-- Name: db_dbuser; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.db_dbuser (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(254) NOT NULL,
    last_name character varying(254) NOT NULL,
    institution character varying(254) NOT NULL
);


ALTER TABLE public.db_dbuser OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.db_dbuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbuser_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.db_dbuser_id_seq OWNED BY public.db_dbuser.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO %AIIDADB_USER%;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO %AIIDADB_USER%;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO %AIIDADB_USER%;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: aiida
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO %AIIDADB_USER%;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: aiida
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aiida
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbauthinfo ALTER COLUMN id SET DEFAULT nextval('public.db_dbauthinfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbcomment ALTER COLUMN id SET DEFAULT nextval('public.db_dbcomment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbcomputer ALTER COLUMN id SET DEFAULT nextval('public.db_dbcomputer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup ALTER COLUMN id SET DEFAULT nextval('public.db_dbgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes ALTER COLUMN id SET DEFAULT nextval('public.db_dbgroup_dbnodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dblink ALTER COLUMN id SET DEFAULT nextval('public.db_dblink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dblog ALTER COLUMN id SET DEFAULT nextval('public.db_dblog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbnode ALTER COLUMN id SET DEFAULT nextval('public.db_dbnode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbsetting ALTER COLUMN id SET DEFAULT nextval('public.db_dbsetting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbuser ALTER COLUMN id SET DEFAULT nextval('public.db_dbuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: aiida
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: aiida
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: aiida
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add content type', 3, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change content type', 3, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add session', 4, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change session', 4, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete session', 4, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add site', 5, 'add_site');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change site', 5, 'change_site');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete site', 5, 'delete_site');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add db user', 6, 'add_dbuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change db user', 6, 'change_dbuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete db user', 6, 'delete_dbuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add db node', 7, 'add_dbnode');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change db node', 7, 'change_dbnode');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete db node', 7, 'delete_dbnode');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add db link', 8, 'add_dblink');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change db link', 8, 'change_dblink');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete db link', 8, 'delete_dblink');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add db setting', 9, 'add_dbsetting');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change db setting', 9, 'change_dbsetting');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete db setting', 9, 'delete_dbsetting');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add db attribute', 10, 'add_dbattribute');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change db attribute', 10, 'change_dbattribute');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete db attribute', 10, 'delete_dbattribute');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add db extra', 11, 'add_dbextra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change db extra', 11, 'change_dbextra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete db extra', 11, 'delete_dbextra');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add db calc state', 12, 'add_dbcalcstate');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change db calc state', 12, 'change_dbcalcstate');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete db calc state', 12, 'delete_dbcalcstate');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add db group', 13, 'add_dbgroup');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change db group', 13, 'change_dbgroup');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete db group', 13, 'delete_dbgroup');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add db computer', 14, 'add_dbcomputer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change db computer', 14, 'change_dbcomputer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete db computer', 14, 'delete_dbcomputer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can add db auth info', 15, 'add_dbauthinfo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can change db auth info', 15, 'change_dbauthinfo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can delete db auth info', 15, 'delete_dbauthinfo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add db comment', 16, 'add_dbcomment');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change db comment', 16, 'change_dbcomment');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete db comment', 16, 'delete_dbcomment');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add db log', 17, 'add_dblog');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change db log', 17, 'change_dblog');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete db log', 17, 'delete_dblog');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can add db workflow', 18, 'add_dbworkflow');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can change db workflow', 18, 'change_dbworkflow');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can delete db workflow', 18, 'delete_dbworkflow');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can add db workflow data', 19, 'add_dbworkflowdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can change db workflow data', 19, 'change_dbworkflowdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can delete db workflow data', 19, 'delete_dbworkflowdata');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can add db workflow step', 20, 'add_dbworkflowstep');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can change db workflow step', 20, 'change_dbworkflowstep');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can delete db workflow step', 20, 'delete_dbworkflowstep');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can view permission', 1, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can view group', 2, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can view content type', 3, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can view db user', 6, 'view_dbuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can view db auth info', 15, 'view_dbauthinfo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can view db comment', 16, 'view_dbcomment');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (67, 'Can view db computer', 14, 'view_dbcomputer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (68, 'Can view db group', 13, 'view_dbgroup');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (69, 'Can view db link', 8, 'view_dblink');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (70, 'Can view db log', 17, 'view_dblog');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (71, 'Can view db node', 7, 'view_dbnode');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (72, 'Can view db setting', 9, 'view_dbsetting');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Data for Name: db_dbauthinfo; Type: TABLE DATA; Schema: public; Owner: aiida
--

INSERT INTO public.db_dbauthinfo (id, auth_params, metadata, enabled, aiidauser_id, dbcomputer_id) VALUES (1, '{"port": 22, "gss_kex": null, "timeout": 60, "compress": true, "gss_auth": null, "gss_host": "torquessh", "username": "app", "key_policy": "AutoAddPolicy", "allow_agent": false, "key_filename": "/home/aiida/.ssh/id_rsa", "look_for_keys": false, "proxy_command": null, "safe_interval": 5, "gss_deleg_creds": null, "load_system_host_keys": true}', '{}', true, 1, 1);


--
-- Name: db_dbauthinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dbauthinfo_id_seq', 1, true);


--
-- Data for Name: db_dbcomment; Type: TABLE DATA; Schema: public; Owner: aiida
--



--
-- Name: db_dbcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dbcomment_id_seq', 1, false);


--
-- Data for Name: db_dbcomputer; Type: TABLE DATA; Schema: public; Owner: aiida
--

INSERT INTO public.db_dbcomputer (id, uuid, name, hostname, description, transport_type, scheduler_type, metadata) VALUES (1, '0daf0d94-ac58-436a-a034-2fd1f1be14e9', 'torquessh', 'torquessh', '', 'ssh', 'torque', '{"shebang": "#!/bin/bash", "workdir": "/scratch/{username}/aiida/", "append_text": "", "prepend_text": "", "mpirun_command": ["mpirun", "-np", "{tot_num_mpiprocs}"]}');


--
-- Name: db_dbcomputer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dbcomputer_id_seq', 1, true);


--
-- Data for Name: db_dbgroup; Type: TABLE DATA; Schema: public; Owner: aiida
--



--
-- Data for Name: db_dbgroup_dbnodes; Type: TABLE DATA; Schema: public; Owner: aiida
--



--
-- Name: db_dbgroup_dbnodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dbgroup_dbnodes_id_seq', 1, false);


--
-- Name: db_dbgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dbgroup_id_seq', 1, false);


--
-- Data for Name: db_dblink; Type: TABLE DATA; Schema: public; Owner: aiida
--



--
-- Name: db_dblink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dblink_id_seq', 1, false);


--
-- Data for Name: db_dblog; Type: TABLE DATA; Schema: public; Owner: aiida
--



--
-- Name: db_dblog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dblog_id_seq', 1, false);


--
-- Data for Name: db_dbnode; Type: TABLE DATA; Schema: public; Owner: aiida
--

INSERT INTO public.db_dbnode (id, uuid, node_type, label, description, ctime, mtime, dbcomputer_id, user_id, process_type, attributes, extras) VALUES (1, '8e729966-b5aa-4425-a831-cc0e3a6163ad', 'data.code.Code.', 'crystal', '', '2018-12-19 19:12:53.559278+00', '2019-07-30 20:31:52.125349+00', 1, 1, NULL, '{"is_local": false, "append_text": "", "input_plugin": "crystal.serial", "prepend_text": "", "remote_exec_path": "/usr/bin/crystal"}', '{"hidden": false, "_aiida_hash": "240f263caa2d4a61ce30b84bccfc6fa353a7ec7030ca4136c8393e3df27d8a87"}');
INSERT INTO public.db_dbnode (id, uuid, node_type, label, description, ctime, mtime, dbcomputer_id, user_id, process_type, attributes, extras) VALUES (2, '200873cd-6200-4f06-b9ac-c0645e2b50d4', 'data.code.Code.', 'Pcrystal', '', '2019-02-11 17:58:51.676932+00', '2019-07-30 20:31:52.135025+00', 1, 1, NULL, '{"is_local": false, "append_text": "", "input_plugin": "crystal.parallel", "prepend_text": "", "remote_exec_path": "/usr/bin/Pcrystal"}', '{"hidden": false, "_aiida_hash": "f9a9c5639314137772aa398d0a8a5050625819131c2d5589a06ea6de9302c834"}');
INSERT INTO public.db_dbnode (id, uuid, node_type, label, description, ctime, mtime, dbcomputer_id, user_id, process_type, attributes, extras) VALUES (3, '1dd8156d-a893-4b83-b7ac-7368d92d3640', 'data.code.Code.', 'properties', '', '2019-03-05 18:46:14.813103+00', '2019-07-30 20:31:52.144793+00', 1, 1, NULL, '{"is_local": false, "append_text": "", "input_plugin": "crystal.properties", "prepend_text": "", "remote_exec_path": "/usr/bin/properties"}', '{"hidden": false, "_aiida_hash": "295510991c529f2a625db099259010e96fc0c479c4d11d8cc559a97d587c996b"}');


--
-- Name: db_dbnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dbnode_id_seq', 3, true);


--
-- Data for Name: db_dbsetting; Type: TABLE DATA; Schema: public; Owner: aiida
--

INSERT INTO public.db_dbsetting (id, key, description, "time", val) VALUES (16, 'db|backend', 'The backend used to communicate with the database.', '2019-07-30 20:31:41.927069+00', '"django"');
INSERT INTO public.db_dbsetting (id, key, description, "time", val) VALUES (37, 'daemon|task_start|workflow_stepper', 'The last time the daemon started to run the task ''workflow_stepper''', '2019-07-30 20:31:41.927934+00', '"2019-03-05T18:46:20.386132+00:00"');
INSERT INTO public.db_dbsetting (id, key, description, "time", val) VALUES (38, 'daemon|task_stop|workflow_stepper', 'The last time the daemon finished to run the task ''workflow_stepper''', '2019-07-30 20:31:41.928773+00', '"2019-03-05T18:46:20.400081+00:00"');
INSERT INTO public.db_dbsetting (id, key, description, "time", val) VALUES (39, 'schema_generation', 'Database schema generation', '2020-05-22 08:51:08.517994+00', '"1"');
INSERT INTO public.db_dbsetting (id, key, description, "time", val) VALUES (15, 'db|schemaversion', 'The version of the schema used in this database.', '2020-05-22 08:51:08.553963+00', '"1.0.43"');


--
-- Name: db_dbsetting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dbsetting_id_seq', 39, true);


--
-- Data for Name: db_dbuser; Type: TABLE DATA; Schema: public; Owner: aiida
--

INSERT INTO public.db_dbuser (id, email, first_name, last_name, institution) VALUES (1, 'aiida@localhost', 'AiiDA', 'Daemon', '');


--
-- Name: db_dbuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.db_dbuser_id_seq', 1, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: aiida
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'sites', 'site');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'db', 'dbuser');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'db', 'dbnode');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'db', 'dblink');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'db', 'dbsetting');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'db', 'dbattribute');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'db', 'dbextra');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'db', 'dbcalcstate');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'db', 'dbgroup');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (14, 'db', 'dbcomputer');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (15, 'db', 'dbauthinfo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (16, 'db', 'dbcomment');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (17, 'db', 'dblog');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (18, 'db', 'dbworkflow');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (19, 'db', 'dbworkflowdata');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (20, 'db', 'dbworkflowstep');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: aiida
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2018-12-19 19:11:31.933837+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-12-19 19:11:31.997553+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2018-12-19 19:11:32.222461+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-12-19 19:11:32.289836+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-12-19 19:11:32.355133+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-12-19 19:11:32.429146+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-12-19 19:11:32.510864+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-12-19 19:11:32.527113+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'db', '0001_initial', '2018-12-19 19:11:39.211611+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'db', '0002_db_state_change', '2018-12-19 19:11:40.187334+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'db', '0003_add_link_type', '2018-12-19 19:11:42.957642+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'db', '0004_add_daemon_and_uuid_indices', '2018-12-19 19:11:43.301034+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'db', '0005_add_cmtime_indices', '2018-12-19 19:11:44.152575+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'db', '0006_delete_dbpath', '2018-12-19 19:11:45.033248+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'db', '0007_update_linktypes', '2018-12-19 19:11:45.233787+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'db', '0008_code_hidden_to_extra', '2018-12-19 19:11:45.345566+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'db', '0009_base_data_plugin_type_string', '2018-12-19 19:11:45.444741+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'db', '0010_process_type', '2018-12-19 19:11:45.735077+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'db', '0011_delete_kombu_tables', '2018-12-19 19:11:45.823274+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'db', '0012_drop_dblock', '2018-12-19 19:11:45.921759+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'db', '0013_django_1_8', '2018-12-19 19:11:46.541536+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'db', '0014_add_node_uuid_unique_constraint', '2018-12-19 19:11:46.93026+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'db', '0015_invalidating_node_hash', '2018-12-19 19:11:47.051878+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'sessions', '0001_initial', '2018-12-19 19:11:47.141055+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'sites', '0001_initial', '2018-12-19 19:11:47.222329+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'auth', '0007_alter_validators_add_error_messages', '2019-07-30 20:31:39.530279+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (27, 'auth', '0008_alter_user_username_max_length', '2019-07-30 20:31:39.547393+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (28, 'db', '0016_code_sub_class_of_data', '2019-07-30 20:31:39.594077+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (29, 'db', '0017_drop_dbcalcstate', '2019-07-30 20:31:39.64378+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (30, 'db', '0018_django_1_11', '2019-07-30 20:31:39.989448+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (31, 'db', '0019_migrate_builtin_calculations', '2019-07-30 20:31:40.030425+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (32, 'db', '0020_provenance_redesign', '2019-07-30 20:31:40.131486+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (33, 'db', '0021_dbgroup_name_to_label_type_to_type_string', '2019-07-30 20:31:40.292949+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (34, 'db', '0022_dbgroup_type_string_change_content', '2019-07-30 20:31:40.339387+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (35, 'db', '0023_calc_job_option_attribute_keys', '2019-07-30 20:31:40.380046+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (36, 'db', '0024_dblog_update', '2019-07-30 20:31:40.641696+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (37, 'db', '0025_move_data_within_node_module', '2019-07-30 20:31:40.68091+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (38, 'db', '0026_trajectory_symbols_to_attribute', '2019-07-30 20:31:40.749673+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (39, 'db', '0027_delete_trajectory_symbols_array', '2019-07-30 20:31:40.814059+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (40, 'db', '0028_remove_node_prefix', '2019-07-30 20:31:40.849151+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (41, 'db', '0029_rename_parameter_data_to_dict', '2019-07-30 20:31:40.886211+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (42, 'db', '0030_dbnode_type_to_dbnode_node_type', '2019-07-30 20:31:40.940048+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (43, 'db', '0031_remove_dbcomputer_enabled', '2019-07-30 20:31:40.979434+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (44, 'db', '0032_remove_legacy_workflows', '2019-07-30 20:31:41.322364+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (45, 'db', '0033_replace_text_field_with_json_field', '2019-07-30 20:31:41.533926+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (46, 'db', '0034_drop_node_columns_nodeversion_public', '2019-07-30 20:31:41.59763+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (47, 'db', '0035_simplify_user_model', '2019-07-30 20:31:41.731815+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (48, 'db', '0036_drop_computer_transport_params', '2019-07-30 20:31:41.766828+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (49, 'db', '0037_attributes_extras_settings_json', '2019-07-30 20:31:42.012979+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (50, 'db', '0038_data_migration_legacy_job_calculations', '2019-07-30 20:31:42.041617+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (51, 'db', '0039_reset_hash', '2019-07-30 20:31:42.081571+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (52, 'db', '0040_data_migration_legacy_process_attributes', '2019-07-30 20:31:42.111211+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (53, 'auth', '0009_alter_user_last_name_max_length', '2020-05-22 08:51:08.456112+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (54, 'auth', '0010_alter_group_name_max_length', '2020-05-22 08:51:08.475288+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (55, 'auth', '0011_update_proxy_permissions', '2020-05-22 08:51:08.4931+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (56, 'db', '0041_seal_unsealed_processes', '2020-05-22 08:51:08.515454+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (57, 'db', '0042_prepare_schema_reset', '2020-05-22 08:51:08.536452+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (58, 'db', '0043_default_link_label', '2020-05-22 08:51:08.555726+00');


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 58, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: aiida
--



--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: aiida
--

INSERT INTO public.django_site (id, domain, name) VALUES (1, 'example.com', 'example.com');


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aiida
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: db_dbauthinfo_aiidauser_id_5b91ddd9ac6ddd83_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_aiidauser_id_5b91ddd9ac6ddd83_uniq UNIQUE (aiidauser_id, dbcomputer_id);


--
-- Name: db_dbauthinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_pkey PRIMARY KEY (id);


--
-- Name: db_dbcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbcomment
    ADD CONSTRAINT db_dbcomment_pkey PRIMARY KEY (id);


--
-- Name: db_dbcomment_uuid_49bac08c_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbcomment
    ADD CONSTRAINT db_dbcomment_uuid_49bac08c_uniq UNIQUE (uuid);


--
-- Name: db_dbcomputer_name_key; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbcomputer
    ADD CONSTRAINT db_dbcomputer_name_key UNIQUE (name);


--
-- Name: db_dbcomputer_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbcomputer
    ADD CONSTRAINT db_dbcomputer_pkey PRIMARY KEY (id);


--
-- Name: db_dbcomputer_uuid_f35defa6_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbcomputer
    ADD CONSTRAINT db_dbcomputer_uuid_f35defa6_uniq UNIQUE (uuid);


--
-- Name: db_dbgroup_dbnodes_dbgroup_id_dbnode_id_key; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_dbgroup_id_dbnode_id_key UNIQUE (dbgroup_id, dbnode_id);


--
-- Name: db_dbgroup_dbnodes_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_pkey PRIMARY KEY (id);


--
-- Name: db_dbgroup_name_680159c7377fefd_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup
    ADD CONSTRAINT db_dbgroup_name_680159c7377fefd_uniq UNIQUE (label, type_string);


--
-- Name: db_dbgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup
    ADD CONSTRAINT db_dbgroup_pkey PRIMARY KEY (id);


--
-- Name: db_dbgroup_uuid_af896177_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup
    ADD CONSTRAINT db_dbgroup_uuid_af896177_uniq UNIQUE (uuid);


--
-- Name: db_dblink_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dblink
    ADD CONSTRAINT db_dblink_pkey PRIMARY KEY (id);


--
-- Name: db_dblog_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dblog
    ADD CONSTRAINT db_dblog_pkey PRIMARY KEY (id);


--
-- Name: db_dblog_uuid_9cf77df3_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dblog
    ADD CONSTRAINT db_dblog_uuid_9cf77df3_uniq UNIQUE (uuid);


--
-- Name: db_dbnode_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbnode
    ADD CONSTRAINT db_dbnode_pkey PRIMARY KEY (id);


--
-- Name: db_dbnode_uuid_62e0bf98_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbnode
    ADD CONSTRAINT db_dbnode_uuid_62e0bf98_uniq UNIQUE (uuid);


--
-- Name: db_dbsetting_key_1b84beb4_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbsetting
    ADD CONSTRAINT db_dbsetting_key_1b84beb4_uniq UNIQUE (key);


--
-- Name: db_dbsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbsetting
    ADD CONSTRAINT db_dbsetting_pkey PRIMARY KEY (id);


--
-- Name: db_dbuser_email_30150b7e_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbuser
    ADD CONSTRAINT db_dbuser_email_30150b7e_uniq UNIQUE (email);


--
-- Name: db_dbuser_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbuser
    ADD CONSTRAINT db_dbuser_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: db_dbauthinfo_669c815a; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbauthinfo_669c815a ON public.db_dbauthinfo USING btree (aiidauser_id);


--
-- Name: db_dbauthinfo_9ed6a91c; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbauthinfo_9ed6a91c ON public.db_dbauthinfo USING btree (dbcomputer_id);


--
-- Name: db_dbcomment_7a672316; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbcomment_7a672316 ON public.db_dbcomment USING btree (dbnode_id);


--
-- Name: db_dbcomment_e8701ad4; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbcomment_e8701ad4 ON public.db_dbcomment USING btree (user_id);


--
-- Name: db_dbcomputer_name_538c8da7bbe500af_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbcomputer_name_538c8da7bbe500af_like ON public.db_dbcomputer USING btree (name varchar_pattern_ops);


--
-- Name: db_dbgroup_599dcce2; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbgroup_599dcce2 ON public.db_dbgroup USING btree (type_string);


--
-- Name: db_dbgroup_b068931c; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbgroup_b068931c ON public.db_dbgroup USING btree (label);


--
-- Name: db_dbgroup_dbnodes_7a672316; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbgroup_dbnodes_7a672316 ON public.db_dbgroup_dbnodes USING btree (dbnode_id);


--
-- Name: db_dbgroup_dbnodes_a0b4eda0; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbgroup_dbnodes_a0b4eda0 ON public.db_dbgroup_dbnodes USING btree (dbgroup_id);


--
-- Name: db_dbgroup_e8701ad4; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbgroup_e8701ad4 ON public.db_dbgroup USING btree (user_id);


--
-- Name: db_dbgroup_name_30351f1c64285f22_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbgroup_name_30351f1c64285f22_like ON public.db_dbgroup USING btree (label varchar_pattern_ops);


--
-- Name: db_dbgroup_type_49745d6ede76abdd_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbgroup_type_49745d6ede76abdd_like ON public.db_dbgroup USING btree (type_string varchar_pattern_ops);


--
-- Name: db_dblink_599dcce2; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblink_599dcce2 ON public.db_dblink USING btree (type);


--
-- Name: db_dblink_b082bddd; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblink_b082bddd ON public.db_dblink USING btree (input_id);


--
-- Name: db_dblink_d304ba20; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblink_d304ba20 ON public.db_dblink USING btree (label);


--
-- Name: db_dblink_f7f1d83a; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblink_f7f1d83a ON public.db_dblink USING btree (output_id);


--
-- Name: db_dblink_label_8f8811d475657bc_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblink_label_8f8811d475657bc_like ON public.db_dblink USING btree (label varchar_pattern_ops);


--
-- Name: db_dblink_type_7365c319e9395009_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblink_type_7365c319e9395009_like ON public.db_dblink USING btree (type varchar_pattern_ops);


--
-- Name: db_dblog_269f51f9; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblog_269f51f9 ON public.db_dblog USING btree (levelname);


--
-- Name: db_dblog_358be7bf; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblog_358be7bf ON public.db_dblog USING btree (loggername);


--
-- Name: db_dblog_dbnode_id_da34b732; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblog_dbnode_id_da34b732 ON public.db_dblog USING btree (dbnode_id);


--
-- Name: db_dblog_levelname_14b334f2645c4b06_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblog_levelname_14b334f2645c4b06_like ON public.db_dblog USING btree (levelname varchar_pattern_ops);


--
-- Name: db_dblog_loggername_4f4ecb812e82233_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dblog_loggername_4f4ecb812e82233_like ON public.db_dblog USING btree (loggername varchar_pattern_ops);


--
-- Name: db_dbnode_599dcce2; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_599dcce2 ON public.db_dbnode USING btree (node_type);


--
-- Name: db_dbnode_66145cb4; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_66145cb4 ON public.db_dbnode USING btree (process_type);


--
-- Name: db_dbnode_9ed6a91c; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_9ed6a91c ON public.db_dbnode USING btree (dbcomputer_id);


--
-- Name: db_dbnode_ctime_40323cf9b4b3beda_uniq; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_ctime_40323cf9b4b3beda_uniq ON public.db_dbnode USING btree (ctime);


--
-- Name: db_dbnode_d304ba20; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_d304ba20 ON public.db_dbnode USING btree (label);


--
-- Name: db_dbnode_e8701ad4; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_e8701ad4 ON public.db_dbnode USING btree (user_id);


--
-- Name: db_dbnode_label_6242931c5b984b78_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_label_6242931c5b984b78_like ON public.db_dbnode USING btree (label varchar_pattern_ops);


--
-- Name: db_dbnode_mtime_27edb0e547b18070_uniq; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_mtime_27edb0e547b18070_uniq ON public.db_dbnode USING btree (mtime);


--
-- Name: db_dbnode_process_type_4aee8b4a0e613c25_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_process_type_4aee8b4a0e613c25_like ON public.db_dbnode USING btree (process_type varchar_pattern_ops);


--
-- Name: db_dbnode_type_4cda33f938ccd765_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbnode_type_4cda33f938ccd765_like ON public.db_dbnode USING btree (node_type varchar_pattern_ops);


--
-- Name: db_dbsetting_key_1b84beb4_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbsetting_key_1b84beb4_like ON public.db_dbsetting USING btree (key varchar_pattern_ops);


--
-- Name: db_dbuser_email_30150b7e_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX db_dbuser_email_30150b7e_like ON public.db_dbuser USING btree (email varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: aiida
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbauthinfo_aiidauser_id_b4dbd2ecdabaa58_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_aiidauser_id_b4dbd2ecdabaa58_fk_db_dbuser_id FOREIGN KEY (aiidauser_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbauthinfo_dbcomputer_id_be3c9b99107479b_fk_db_dbcomputer_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_dbcomputer_id_be3c9b99107479b_fk_db_dbcomputer_id FOREIGN KEY (dbcomputer_id) REFERENCES public.db_dbcomputer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbcomment_dbnode_id_e225ac462eb8f6c_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbcomment
    ADD CONSTRAINT db_dbcomment_dbnode_id_e225ac462eb8f6c_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbcomment_user_id_2e215134d026c3a3_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbcomment
    ADD CONSTRAINT db_dbcomment_user_id_2e215134d026c3a3_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbgroup_dbnodes_dbgroup_id_32d69f1acbc4c03c_fk_db_dbgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_dbgroup_id_32d69f1acbc4c03c_fk_db_dbgroup_id FOREIGN KEY (dbgroup_id) REFERENCES public.db_dbgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbgroup_dbnodes_dbnode_id_53a1829a1973b99c_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_dbnode_id_53a1829a1973b99c_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbgroup_user_id_698e239e754dccc5_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbgroup
    ADD CONSTRAINT db_dbgroup_user_id_698e239e754dccc5_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dblink_input_id_6feafb02380ed56f_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dblink
    ADD CONSTRAINT db_dblink_input_id_6feafb02380ed56f_fk_db_dbnode_id FOREIGN KEY (input_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dblink_output_id_6345a663e713ed93_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dblink
    ADD CONSTRAINT db_dblink_output_id_6345a663e713ed93_fk_db_dbnode_id FOREIGN KEY (output_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dblog_dbnode_id_da34b732_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dblog
    ADD CONSTRAINT db_dblog_dbnode_id_da34b732_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbnode_dbcomputer_id_2195c2d4d9b222ff_fk_db_dbcomputer_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbnode
    ADD CONSTRAINT db_dbnode_dbcomputer_id_2195c2d4d9b222ff_fk_db_dbcomputer_id FOREIGN KEY (dbcomputer_id) REFERENCES public.db_dbcomputer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbnode_user_id_43fd81cadf67f183_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: aiida
--

ALTER TABLE ONLY public.db_dbnode
    ADD CONSTRAINT db_dbnode_user_id_43fd81cadf67f183_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: aiida
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM %AIIDADB_USER%;
GRANT ALL ON SCHEMA public TO %AIIDADB_USER%;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

