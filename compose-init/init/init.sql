--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.15
-- Dumped by pg_dump version 9.5.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: %AIIDADB_NAME%; Type: DATABASE; Schema: -; Owner: %AIIDADB_USER%
--

\connect %AIIDADB_NAME%

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO %AIIDADB_USER%;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: db_dbattribute; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbattribute (
    id integer NOT NULL,
    key character varying(1024) NOT NULL,
    datatype character varying(10) NOT NULL,
    tval text NOT NULL,
    fval double precision,
    ival integer,
    bval boolean,
    dval timestamp with time zone,
    dbnode_id integer NOT NULL
);


ALTER TABLE public.db_dbattribute OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbattribute_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbattribute_id_seq OWNED BY public.db_dbattribute.id;


--
-- Name: db_dbauthinfo; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbauthinfo (
    id integer NOT NULL,
    auth_params text NOT NULL,
    metadata text NOT NULL,
    enabled boolean NOT NULL,
    aiidauser_id integer NOT NULL,
    dbcomputer_id integer NOT NULL
);


ALTER TABLE public.db_dbauthinfo OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbauthinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbauthinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbauthinfo_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbauthinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbauthinfo_id_seq OWNED BY public.db_dbauthinfo.id;


--
-- Name: db_dbcalcstate; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbcalcstate (
    id integer NOT NULL,
    state character varying(25) NOT NULL,
    "time" timestamp with time zone NOT NULL,
    dbnode_id integer NOT NULL
);


ALTER TABLE public.db_dbcalcstate OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcalcstate_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbcalcstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbcalcstate_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcalcstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbcalcstate_id_seq OWNED BY public.db_dbcalcstate.id;


--
-- Name: db_dbcomment; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbcomment (
    id integer NOT NULL,
    uuid character varying(36) NOT NULL,
    ctime timestamp with time zone NOT NULL,
    mtime timestamp with time zone NOT NULL,
    content text NOT NULL,
    dbnode_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.db_dbcomment OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomment_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbcomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbcomment_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbcomment_id_seq OWNED BY public.db_dbcomment.id;


--
-- Name: db_dbcomputer; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbcomputer (
    id integer NOT NULL,
    uuid character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    hostname character varying(255) NOT NULL,
    description text NOT NULL,
    enabled boolean NOT NULL,
    transport_type character varying(255) NOT NULL,
    scheduler_type character varying(255) NOT NULL,
    transport_params text NOT NULL,
    metadata text NOT NULL
);


ALTER TABLE public.db_dbcomputer OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomputer_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbcomputer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbcomputer_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbcomputer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbcomputer_id_seq OWNED BY public.db_dbcomputer.id;


--
-- Name: db_dbextra; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbextra (
    id integer NOT NULL,
    key character varying(1024) NOT NULL,
    datatype character varying(10) NOT NULL,
    tval text NOT NULL,
    fval double precision,
    ival integer,
    bval boolean,
    dval timestamp with time zone,
    dbnode_id integer NOT NULL
);


ALTER TABLE public.db_dbextra OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbextra_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbextra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbextra_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbextra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbextra_id_seq OWNED BY public.db_dbextra.id;


--
-- Name: db_dbgroup; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbgroup (
    id integer NOT NULL,
    uuid character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    "time" timestamp with time zone NOT NULL,
    description text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.db_dbgroup OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_dbnodes; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbgroup_dbnodes (
    id integer NOT NULL,
    dbgroup_id integer NOT NULL,
    dbnode_id integer NOT NULL
);


ALTER TABLE public.db_dbgroup_dbnodes OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_dbnodes_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbgroup_dbnodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbgroup_dbnodes_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_dbnodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbgroup_dbnodes_id_seq OWNED BY public.db_dbgroup_dbnodes.id;


--
-- Name: db_dbgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbgroup_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbgroup_id_seq OWNED BY public.db_dbgroup.id;


--
-- Name: db_dblink; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
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
-- Name: db_dblink_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dblink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dblink_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dblink_id_seq OWNED BY public.db_dblink.id;


--
-- Name: db_dblog; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dblog (
    id integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    loggername character varying(255) NOT NULL,
    levelname character varying(50) NOT NULL,
    objname character varying(255) NOT NULL,
    objpk integer,
    message text NOT NULL,
    metadata text NOT NULL
);


ALTER TABLE public.db_dblog OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblog_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dblog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dblog_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dblog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dblog_id_seq OWNED BY public.db_dblog.id;


--
-- Name: db_dbnode; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbnode (
    id integer NOT NULL,
    uuid character varying(36) NOT NULL,
    type character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description text NOT NULL,
    ctime timestamp with time zone NOT NULL,
    mtime timestamp with time zone NOT NULL,
    nodeversion integer NOT NULL,
    public boolean NOT NULL,
    dbcomputer_id integer,
    user_id integer NOT NULL,
    process_type character varying(255)
);


ALTER TABLE public.db_dbnode OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbnode_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbnode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbnode_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbnode_id_seq OWNED BY public.db_dbnode.id;


--
-- Name: db_dbsetting; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbsetting (
    id integer NOT NULL,
    key character varying(1024) NOT NULL,
    datatype character varying(10) NOT NULL,
    tval text NOT NULL,
    fval double precision,
    ival integer,
    bval boolean,
    dval timestamp with time zone,
    description text NOT NULL,
    "time" timestamp with time zone NOT NULL
);


ALTER TABLE public.db_dbsetting OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbsetting_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbsetting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbsetting_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbsetting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbsetting_id_seq OWNED BY public.db_dbsetting.id;


--
-- Name: db_dbuser; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(254) NOT NULL,
    last_name character varying(254) NOT NULL,
    institution character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.db_dbuser OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_groups; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbuser_groups (
    id integer NOT NULL,
    dbuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.db_dbuser_groups OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbuser_groups_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbuser_groups_id_seq OWNED BY public.db_dbuser_groups.id;


--
-- Name: db_dbuser_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbuser_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbuser_id_seq OWNED BY public.db_dbuser.id;


--
-- Name: db_dbuser_user_permissions; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbuser_user_permissions (
    id integer NOT NULL,
    dbuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.db_dbuser_user_permissions OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbuser_user_permissions_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbuser_user_permissions_id_seq OWNED BY public.db_dbuser_user_permissions.id;


--
-- Name: db_dbworkflow; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbworkflow (
    id integer NOT NULL,
    uuid character varying(36) NOT NULL,
    ctime timestamp with time zone NOT NULL,
    mtime timestamp with time zone NOT NULL,
    label character varying(255) NOT NULL,
    description text NOT NULL,
    nodeversion integer NOT NULL,
    lastsyncedversion integer NOT NULL,
    state character varying(255) NOT NULL,
    report text NOT NULL,
    module text NOT NULL,
    module_class text NOT NULL,
    script_path text NOT NULL,
    script_md5 character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.db_dbworkflow OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflow_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbworkflow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbworkflow_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbworkflow_id_seq OWNED BY public.db_dbworkflow.id;


--
-- Name: db_dbworkflowdata; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbworkflowdata (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "time" timestamp with time zone NOT NULL,
    data_type character varying(255) NOT NULL,
    value_type character varying(255) NOT NULL,
    json_value text NOT NULL,
    aiida_obj_id integer,
    parent_id integer NOT NULL
);


ALTER TABLE public.db_dbworkflowdata OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflowdata_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbworkflowdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbworkflowdata_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflowdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbworkflowdata_id_seq OWNED BY public.db_dbworkflowdata.id;


--
-- Name: db_dbworkflowstep; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbworkflowstep (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "time" timestamp with time zone NOT NULL,
    nextcall character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    parent_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.db_dbworkflowstep OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflowstep_calculations; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbworkflowstep_calculations (
    id integer NOT NULL,
    dbworkflowstep_id integer NOT NULL,
    dbnode_id integer NOT NULL
);


ALTER TABLE public.db_dbworkflowstep_calculations OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflowstep_calculations_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbworkflowstep_calculations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbworkflowstep_calculations_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflowstep_calculations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbworkflowstep_calculations_id_seq OWNED BY public.db_dbworkflowstep_calculations.id;


--
-- Name: db_dbworkflowstep_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbworkflowstep_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbworkflowstep_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflowstep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbworkflowstep_id_seq OWNED BY public.db_dbworkflowstep.id;


--
-- Name: db_dbworkflowstep_sub_workflows; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.db_dbworkflowstep_sub_workflows (
    id integer NOT NULL,
    dbworkflowstep_id integer NOT NULL,
    dbworkflow_id integer NOT NULL
);


ALTER TABLE public.db_dbworkflowstep_sub_workflows OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflowstep_sub_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.db_dbworkflowstep_sub_workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_dbworkflowstep_sub_workflows_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: db_dbworkflowstep_sub_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.db_dbworkflowstep_sub_workflows_id_seq OWNED BY public.db_dbworkflowstep_sub_workflows.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO %AIIDADB_USER%;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO %AIIDADB_USER%;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO %AIIDADB_USER%;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO %AIIDADB_USER%;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: %AIIDADB_USER%
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO %AIIDADB_USER%;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: %AIIDADB_USER%
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbattribute ALTER COLUMN id SET DEFAULT nextval('public.db_dbattribute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbauthinfo ALTER COLUMN id SET DEFAULT nextval('public.db_dbauthinfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcalcstate ALTER COLUMN id SET DEFAULT nextval('public.db_dbcalcstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcomment ALTER COLUMN id SET DEFAULT nextval('public.db_dbcomment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcomputer ALTER COLUMN id SET DEFAULT nextval('public.db_dbcomputer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbextra ALTER COLUMN id SET DEFAULT nextval('public.db_dbextra_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbgroup ALTER COLUMN id SET DEFAULT nextval('public.db_dbgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes ALTER COLUMN id SET DEFAULT nextval('public.db_dbgroup_dbnodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dblink ALTER COLUMN id SET DEFAULT nextval('public.db_dblink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dblog ALTER COLUMN id SET DEFAULT nextval('public.db_dblog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbnode ALTER COLUMN id SET DEFAULT nextval('public.db_dbnode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbsetting ALTER COLUMN id SET DEFAULT nextval('public.db_dbsetting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser ALTER COLUMN id SET DEFAULT nextval('public.db_dbuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_groups ALTER COLUMN id SET DEFAULT nextval('public.db_dbuser_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.db_dbuser_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflow ALTER COLUMN id SET DEFAULT nextval('public.db_dbworkflow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowdata ALTER COLUMN id SET DEFAULT nextval('public.db_dbworkflowdata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep ALTER COLUMN id SET DEFAULT nextval('public.db_dbworkflowstep_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_calculations ALTER COLUMN id SET DEFAULT nextval('public.db_dbworkflowstep_calculations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_sub_workflows ALTER COLUMN id SET DEFAULT nextval('public.db_dbworkflowstep_sub_workflows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
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


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Data for Name: db_dbattribute; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO public.db_dbattribute (id, key, datatype, tval, fval, ival, bval, dval, dbnode_id) VALUES (1, 'is_local', 'bool', '', NULL, NULL, false, NULL, 1);
INSERT INTO public.db_dbattribute (id, key, datatype, tval, fval, ival, bval, dval, dbnode_id) VALUES (2, 'append_text', 'txt', '', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.db_dbattribute (id, key, datatype, tval, fval, ival, bval, dval, dbnode_id) VALUES (3, 'remote_exec_path', 'txt', '/usr/bin/crystal', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.db_dbattribute (id, key, datatype, tval, fval, ival, bval, dval, dbnode_id) VALUES (4, 'prepend_text', 'txt', '', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.db_dbattribute (id, key, datatype, tval, fval, ival, bval, dval, dbnode_id) VALUES (5, 'input_plugin', 'txt', 'crystal17.main', NULL, NULL, NULL, NULL, 1);


--
-- Name: db_dbattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbattribute_id_seq', 5, true);


--
-- Data for Name: db_dbauthinfo; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO public.db_dbauthinfo (id, auth_params, metadata, enabled, aiidauser_id, dbcomputer_id) VALUES (1, '{"username": "app", "proxy_command": null, "allow_agent": false, "load_system_host_keys": true, "key_filename": "/home/aiida/.ssh/id_rsa", "compress": true, "key_policy": "AutoAddPolicy", "gss_auth": null, "timeout": 60, "gss_kex": null, "gss_host": "torquessh", "safe_interval": 5, "port": 22, "gss_deleg_creds": null, "look_for_keys": false}', '{}', true, 1, 1);


--
-- Name: db_dbauthinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbauthinfo_id_seq', 1, true);


--
-- Data for Name: db_dbcalcstate; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbcalcstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbcalcstate_id_seq', 1, false);


--
-- Data for Name: db_dbcomment; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbcomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbcomment_id_seq', 1, false);


--
-- Data for Name: db_dbcomputer; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO public.db_dbcomputer (id, uuid, name, hostname, description, enabled, transport_type, scheduler_type, transport_params, metadata) VALUES (1, '0daf0d94-ac58-436a-a034-2fd1f1be14e9', 'torquessh', 'torquessh', '', true, 'ssh', 'torque', '{}', '{"append_text": "", "mpirun_command": ["mpirun", "-np", "{tot_num_mpiprocs}"], "workdir": "/scratch/{username}/aiida/", "prepend_text": "", "shebang": "#!/bin/bash"}');


--
-- Name: db_dbcomputer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbcomputer_id_seq', 1, true);


--
-- Data for Name: db_dbextra; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO public.db_dbextra (id, key, datatype, tval, fval, ival, bval, dval, dbnode_id) VALUES (1, '_aiida_hash', 'txt', '6eb184ab3fa78f5dca324138e55a3933699614e0bb1f2e5edb8e60688a975bf2', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.db_dbextra (id, key, datatype, tval, fval, ival, bval, dval, dbnode_id) VALUES (2, 'hidden', 'bool', '', NULL, NULL, false, NULL, 1);


--
-- Name: db_dbextra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbextra_id_seq', 2, true);


--
-- Data for Name: db_dbgroup; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Data for Name: db_dbgroup_dbnodes; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbgroup_dbnodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbgroup_dbnodes_id_seq', 1, false);


--
-- Name: db_dbgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbgroup_id_seq', 1, false);


--
-- Data for Name: db_dblink; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dblink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dblink_id_seq', 1, false);


--
-- Data for Name: db_dblog; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dblog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dblog_id_seq', 1, false);


--
-- Data for Name: db_dbnode; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO public.db_dbnode (id, uuid, type, label, description, ctime, mtime, nodeversion, public, dbcomputer_id, user_id, process_type) VALUES (1, '8e729966-b5aa-4425-a831-cc0e3a6163ad', 'code.Code.', 'cry', 'CRYSTAL14', '2018-12-19 19:12:53.559278+00', '2018-12-19 19:12:53.700292+00', 2, false, 1, 1, NULL);


--
-- Name: db_dbnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbnode_id_seq', 1, true);


--
-- Data for Name: db_dbsetting; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO public.db_dbsetting (id, key, datatype, tval, fval, ival, bval, dval, description, "time") VALUES (15, 'db|schemaversion', 'txt', '1.0.15', NULL, NULL, NULL, NULL, 'The version of the schema used in this database.', '2018-12-19 19:11:47.041807+00');
INSERT INTO public.db_dbsetting (id, key, datatype, tval, fval, ival, bval, dval, description, "time") VALUES (16, 'db|backend', 'txt', 'django', NULL, NULL, NULL, NULL, 'The backend used to communicate with the database.', '2018-12-19 19:11:47.73447+00');


--
-- Name: db_dbsetting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbsetting_id_seq', 16, true);


--
-- Data for Name: db_dbuser; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO public.db_dbuser (id, password, last_login, is_superuser, email, first_name, last_name, institution, is_staff, is_active, date_joined) VALUES (1, '', NULL, false, 'aiida@localhost', 'AiiDA', 'Daemon', '', false, true, '2018-12-19 19:11:47.75914+00');


--
-- Data for Name: db_dbuser_groups; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbuser_groups_id_seq', 1, false);


--
-- Name: db_dbuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbuser_id_seq', 1, true);


--
-- Data for Name: db_dbuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbuser_user_permissions_id_seq', 1, false);


--
-- Data for Name: db_dbworkflow; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbworkflow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbworkflow_id_seq', 1, false);


--
-- Data for Name: db_dbworkflowdata; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbworkflowdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbworkflowdata_id_seq', 1, false);


--
-- Data for Name: db_dbworkflowstep; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Data for Name: db_dbworkflowstep_calculations; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbworkflowstep_calculations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbworkflowstep_calculations_id_seq', 1, false);


--
-- Name: db_dbworkflowstep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbworkflowstep_id_seq', 1, false);


--
-- Data for Name: db_dbworkflowstep_sub_workflows; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Name: db_dbworkflowstep_sub_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.db_dbworkflowstep_sub_workflows_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
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
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
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


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--



--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: %AIIDADB_USER%
--

INSERT INTO public.django_site (id, domain, name) VALUES (1, 'example.com', 'example.com');


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: %AIIDADB_USER%
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: db_dbattribute_dbnode_id_10206dc8cec3d0be_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbattribute
    ADD CONSTRAINT db_dbattribute_dbnode_id_10206dc8cec3d0be_uniq UNIQUE (dbnode_id, key);


--
-- Name: db_dbattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbattribute
    ADD CONSTRAINT db_dbattribute_pkey PRIMARY KEY (id);


--
-- Name: db_dbauthinfo_aiidauser_id_5b91ddd9ac6ddd83_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_aiidauser_id_5b91ddd9ac6ddd83_uniq UNIQUE (aiidauser_id, dbcomputer_id);


--
-- Name: db_dbauthinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_pkey PRIMARY KEY (id);


--
-- Name: db_dbcalcstate_dbnode_id_45de92d4e5e6b644_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcalcstate
    ADD CONSTRAINT db_dbcalcstate_dbnode_id_45de92d4e5e6b644_uniq UNIQUE (dbnode_id, state);


--
-- Name: db_dbcalcstate_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcalcstate
    ADD CONSTRAINT db_dbcalcstate_pkey PRIMARY KEY (id);


--
-- Name: db_dbcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcomment
    ADD CONSTRAINT db_dbcomment_pkey PRIMARY KEY (id);


--
-- Name: db_dbcomputer_name_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcomputer
    ADD CONSTRAINT db_dbcomputer_name_key UNIQUE (name);


--
-- Name: db_dbcomputer_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcomputer
    ADD CONSTRAINT db_dbcomputer_pkey PRIMARY KEY (id);


--
-- Name: db_dbextra_dbnode_id_2a99ce873931fdd4_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbextra
    ADD CONSTRAINT db_dbextra_dbnode_id_2a99ce873931fdd4_uniq UNIQUE (dbnode_id, key);


--
-- Name: db_dbextra_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbextra
    ADD CONSTRAINT db_dbextra_pkey PRIMARY KEY (id);


--
-- Name: db_dbgroup_dbnodes_dbgroup_id_dbnode_id_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_dbgroup_id_dbnode_id_key UNIQUE (dbgroup_id, dbnode_id);


--
-- Name: db_dbgroup_dbnodes_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_pkey PRIMARY KEY (id);


--
-- Name: db_dbgroup_name_680159c7377fefd_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbgroup
    ADD CONSTRAINT db_dbgroup_name_680159c7377fefd_uniq UNIQUE (name, type);


--
-- Name: db_dbgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbgroup
    ADD CONSTRAINT db_dbgroup_pkey PRIMARY KEY (id);


--
-- Name: db_dblink_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dblink
    ADD CONSTRAINT db_dblink_pkey PRIMARY KEY (id);


--
-- Name: db_dblog_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dblog
    ADD CONSTRAINT db_dblog_pkey PRIMARY KEY (id);


--
-- Name: db_dbnode_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbnode
    ADD CONSTRAINT db_dbnode_pkey PRIMARY KEY (id);


--
-- Name: db_dbnode_uuid_711fa857427da5e6_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbnode
    ADD CONSTRAINT db_dbnode_uuid_711fa857427da5e6_uniq UNIQUE (uuid);


--
-- Name: db_dbsetting_key_4cac773d062e1744_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbsetting
    ADD CONSTRAINT db_dbsetting_key_4cac773d062e1744_uniq UNIQUE (key);


--
-- Name: db_dbsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbsetting
    ADD CONSTRAINT db_dbsetting_pkey PRIMARY KEY (id);


--
-- Name: db_dbuser_groups_dbuser_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_groups
    ADD CONSTRAINT db_dbuser_groups_dbuser_id_group_id_key UNIQUE (dbuser_id, group_id);


--
-- Name: db_dbuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_groups
    ADD CONSTRAINT db_dbuser_groups_pkey PRIMARY KEY (id);


--
-- Name: db_dbuser_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser
    ADD CONSTRAINT db_dbuser_pkey PRIMARY KEY (id);


--
-- Name: db_dbuser_user_permissions_dbuser_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_user_permissions
    ADD CONSTRAINT db_dbuser_user_permissions_dbuser_id_permission_id_key UNIQUE (dbuser_id, permission_id);


--
-- Name: db_dbuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_user_permissions
    ADD CONSTRAINT db_dbuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: db_dbworkflow_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflow
    ADD CONSTRAINT db_dbworkflow_pkey PRIMARY KEY (id);


--
-- Name: db_dbworkflowdata_parent_id_1f60f874e728c5f0_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowdata
    ADD CONSTRAINT db_dbworkflowdata_parent_id_1f60f874e728c5f0_uniq UNIQUE (parent_id, name, data_type);


--
-- Name: db_dbworkflowdata_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowdata
    ADD CONSTRAINT db_dbworkflowdata_pkey PRIMARY KEY (id);


--
-- Name: db_dbworkflowstep_calculations_dbworkflowstep_id_dbnode_id_key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_calculations
    ADD CONSTRAINT db_dbworkflowstep_calculations_dbworkflowstep_id_dbnode_id_key UNIQUE (dbworkflowstep_id, dbnode_id);


--
-- Name: db_dbworkflowstep_calculations_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_calculations
    ADD CONSTRAINT db_dbworkflowstep_calculations_pkey PRIMARY KEY (id);


--
-- Name: db_dbworkflowstep_parent_id_57c505d36f0f2dd3_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep
    ADD CONSTRAINT db_dbworkflowstep_parent_id_57c505d36f0f2dd3_uniq UNIQUE (parent_id, name);


--
-- Name: db_dbworkflowstep_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep
    ADD CONSTRAINT db_dbworkflowstep_pkey PRIMARY KEY (id);


--
-- Name: db_dbworkflowstep_sub_workflo_dbworkflowstep_id_dbworkflow__key; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_sub_workflows
    ADD CONSTRAINT db_dbworkflowstep_sub_workflo_dbworkflowstep_id_dbworkflow__key UNIQUE (dbworkflowstep_id, dbworkflow_id);


--
-- Name: db_dbworkflowstep_sub_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_sub_workflows
    ADD CONSTRAINT db_dbworkflowstep_sub_workflows_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: db_dbattribute_3931108d; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbattribute_3931108d ON public.db_dbattribute USING btree (datatype);


--
-- Name: db_dbattribute_3c6e0b8a; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbattribute_3c6e0b8a ON public.db_dbattribute USING btree (key);


--
-- Name: db_dbattribute_7a672316; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbattribute_7a672316 ON public.db_dbattribute USING btree (dbnode_id);


--
-- Name: db_dbattribute_datatype_7e609aede7da800c_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbattribute_datatype_7e609aede7da800c_like ON public.db_dbattribute USING btree (datatype varchar_pattern_ops);


--
-- Name: db_dbattribute_key_6936ff5c4f96a1be_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbattribute_key_6936ff5c4f96a1be_like ON public.db_dbattribute USING btree (key varchar_pattern_ops);


--
-- Name: db_dbauthinfo_669c815a; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbauthinfo_669c815a ON public.db_dbauthinfo USING btree (aiidauser_id);


--
-- Name: db_dbauthinfo_9ed6a91c; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbauthinfo_9ed6a91c ON public.db_dbauthinfo USING btree (dbcomputer_id);


--
-- Name: db_dbcalcstate_7a672316; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbcalcstate_7a672316 ON public.db_dbcalcstate USING btree (dbnode_id);


--
-- Name: db_dbcalcstate_9ed39e2e; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbcalcstate_9ed39e2e ON public.db_dbcalcstate USING btree (state);


--
-- Name: db_dbcalcstate_state_7b15f131504dbe38_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbcalcstate_state_7b15f131504dbe38_like ON public.db_dbcalcstate USING btree (state varchar_pattern_ops);


--
-- Name: db_dbcomment_7a672316; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbcomment_7a672316 ON public.db_dbcomment USING btree (dbnode_id);


--
-- Name: db_dbcomment_e8701ad4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbcomment_e8701ad4 ON public.db_dbcomment USING btree (user_id);


--
-- Name: db_dbcomputer_name_538c8da7bbe500af_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbcomputer_name_538c8da7bbe500af_like ON public.db_dbcomputer USING btree (name varchar_pattern_ops);


--
-- Name: db_dbextra_3931108d; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbextra_3931108d ON public.db_dbextra USING btree (datatype);


--
-- Name: db_dbextra_3c6e0b8a; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbextra_3c6e0b8a ON public.db_dbextra USING btree (key);


--
-- Name: db_dbextra_7a672316; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbextra_7a672316 ON public.db_dbextra USING btree (dbnode_id);


--
-- Name: db_dbextra_datatype_12730358b2c29a0a_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbextra_datatype_12730358b2c29a0a_like ON public.db_dbextra USING btree (datatype varchar_pattern_ops);


--
-- Name: db_dbextra_key_67f77eb2ec05ed40_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbextra_key_67f77eb2ec05ed40_like ON public.db_dbextra USING btree (key varchar_pattern_ops);


--
-- Name: db_dbgroup_599dcce2; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_599dcce2 ON public.db_dbgroup USING btree (type);


--
-- Name: db_dbgroup_b068931c; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_b068931c ON public.db_dbgroup USING btree (name);


--
-- Name: db_dbgroup_dbnodes_7a672316; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_dbnodes_7a672316 ON public.db_dbgroup_dbnodes USING btree (dbnode_id);


--
-- Name: db_dbgroup_dbnodes_a0b4eda0; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_dbnodes_a0b4eda0 ON public.db_dbgroup_dbnodes USING btree (dbgroup_id);


--
-- Name: db_dbgroup_e8701ad4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_e8701ad4 ON public.db_dbgroup USING btree (user_id);


--
-- Name: db_dbgroup_name_30351f1c64285f22_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_name_30351f1c64285f22_like ON public.db_dbgroup USING btree (name varchar_pattern_ops);


--
-- Name: db_dbgroup_type_49745d6ede76abdd_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbgroup_type_49745d6ede76abdd_like ON public.db_dbgroup USING btree (type varchar_pattern_ops);


--
-- Name: db_dblink_599dcce2; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_599dcce2 ON public.db_dblink USING btree (type);


--
-- Name: db_dblink_b082bddd; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_b082bddd ON public.db_dblink USING btree (input_id);


--
-- Name: db_dblink_d304ba20; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_d304ba20 ON public.db_dblink USING btree (label);


--
-- Name: db_dblink_f7f1d83a; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_f7f1d83a ON public.db_dblink USING btree (output_id);


--
-- Name: db_dblink_label_8f8811d475657bc_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_label_8f8811d475657bc_like ON public.db_dblink USING btree (label varchar_pattern_ops);


--
-- Name: db_dblink_type_7365c319e9395009_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblink_type_7365c319e9395009_like ON public.db_dblink USING btree (type varchar_pattern_ops);


--
-- Name: db_dblog_269f51f9; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_269f51f9 ON public.db_dblog USING btree (levelname);


--
-- Name: db_dblog_358be7bf; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_358be7bf ON public.db_dblog USING btree (loggername);


--
-- Name: db_dblog_850eed5f; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_850eed5f ON public.db_dblog USING btree (objpk);


--
-- Name: db_dblog_e3898037; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_e3898037 ON public.db_dblog USING btree (objname);


--
-- Name: db_dblog_levelname_14b334f2645c4b06_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_levelname_14b334f2645c4b06_like ON public.db_dblog USING btree (levelname varchar_pattern_ops);


--
-- Name: db_dblog_loggername_4f4ecb812e82233_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_loggername_4f4ecb812e82233_like ON public.db_dblog USING btree (loggername varchar_pattern_ops);


--
-- Name: db_dblog_objname_704cbe43c1c08fe5_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dblog_objname_704cbe43c1c08fe5_like ON public.db_dblog USING btree (objname varchar_pattern_ops);


--
-- Name: db_dbnode_599dcce2; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_599dcce2 ON public.db_dbnode USING btree (type);


--
-- Name: db_dbnode_66145cb4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_66145cb4 ON public.db_dbnode USING btree (process_type);


--
-- Name: db_dbnode_9ed6a91c; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_9ed6a91c ON public.db_dbnode USING btree (dbcomputer_id);


--
-- Name: db_dbnode_ctime_40323cf9b4b3beda_uniq; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_ctime_40323cf9b4b3beda_uniq ON public.db_dbnode USING btree (ctime);


--
-- Name: db_dbnode_d304ba20; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_d304ba20 ON public.db_dbnode USING btree (label);


--
-- Name: db_dbnode_e8701ad4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_e8701ad4 ON public.db_dbnode USING btree (user_id);


--
-- Name: db_dbnode_label_6242931c5b984b78_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_label_6242931c5b984b78_like ON public.db_dbnode USING btree (label varchar_pattern_ops);


--
-- Name: db_dbnode_mtime_27edb0e547b18070_uniq; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_mtime_27edb0e547b18070_uniq ON public.db_dbnode USING btree (mtime);


--
-- Name: db_dbnode_process_type_4aee8b4a0e613c25_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_process_type_4aee8b4a0e613c25_like ON public.db_dbnode USING btree (process_type varchar_pattern_ops);


--
-- Name: db_dbnode_type_4cda33f938ccd765_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbnode_type_4cda33f938ccd765_like ON public.db_dbnode USING btree (type varchar_pattern_ops);


--
-- Name: db_dbsetting_3931108d; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbsetting_3931108d ON public.db_dbsetting USING btree (datatype);


--
-- Name: db_dbsetting_3c6e0b8a; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbsetting_3c6e0b8a ON public.db_dbsetting USING btree (key);


--
-- Name: db_dbsetting_datatype_50c0180f460a7006_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbsetting_datatype_50c0180f460a7006_like ON public.db_dbsetting USING btree (datatype varchar_pattern_ops);


--
-- Name: db_dbsetting_key_4cac773d062e1744_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbsetting_key_4cac773d062e1744_like ON public.db_dbsetting USING btree (key varchar_pattern_ops);


--
-- Name: db_dbuser_groups_0e939a4f; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbuser_groups_0e939a4f ON public.db_dbuser_groups USING btree (group_id);


--
-- Name: db_dbuser_groups_b2c441d1; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbuser_groups_b2c441d1 ON public.db_dbuser_groups USING btree (dbuser_id);


--
-- Name: db_dbuser_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbuser_user_permissions_8373b171 ON public.db_dbuser_user_permissions USING btree (permission_id);


--
-- Name: db_dbuser_user_permissions_b2c441d1; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbuser_user_permissions_b2c441d1 ON public.db_dbuser_user_permissions USING btree (dbuser_id);


--
-- Name: db_dbworkflow_d304ba20; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflow_d304ba20 ON public.db_dbworkflow USING btree (label);


--
-- Name: db_dbworkflow_e8701ad4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflow_e8701ad4 ON public.db_dbworkflow USING btree (user_id);


--
-- Name: db_dbworkflow_label_55e5f0a232defa37_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflow_label_55e5f0a232defa37_like ON public.db_dbworkflow USING btree (label varchar_pattern_ops);


--
-- Name: db_dbworkflowdata_668c0731; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflowdata_668c0731 ON public.db_dbworkflowdata USING btree (aiida_obj_id);


--
-- Name: db_dbworkflowdata_6be37982; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflowdata_6be37982 ON public.db_dbworkflowdata USING btree (parent_id);


--
-- Name: db_dbworkflowstep_6be37982; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflowstep_6be37982 ON public.db_dbworkflowstep USING btree (parent_id);


--
-- Name: db_dbworkflowstep_calculations_1df98a0a; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflowstep_calculations_1df98a0a ON public.db_dbworkflowstep_calculations USING btree (dbworkflowstep_id);


--
-- Name: db_dbworkflowstep_calculations_7a672316; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflowstep_calculations_7a672316 ON public.db_dbworkflowstep_calculations USING btree (dbnode_id);


--
-- Name: db_dbworkflowstep_e8701ad4; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflowstep_e8701ad4 ON public.db_dbworkflowstep USING btree (user_id);


--
-- Name: db_dbworkflowstep_sub_workflows_1df98a0a; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflowstep_sub_workflows_1df98a0a ON public.db_dbworkflowstep_sub_workflows USING btree (dbworkflowstep_id);


--
-- Name: db_dbworkflowstep_sub_workflows_b6a7b7c8; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX db_dbworkflowstep_sub_workflows_b6a7b7c8 ON public.db_dbworkflowstep_sub_workflows USING btree (dbworkflow_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: tval_idx_for_daemon; Type: INDEX; Schema: public; Owner: %AIIDADB_USER%
--

CREATE INDEX tval_idx_for_daemon ON public.db_dbattribute USING btree (tval) WHERE (tval = ANY (ARRAY['COMPUTED'::text, 'WITHSCHEDULER'::text, 'TOSUBMIT'::text]));


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_d_dbworkflowstep_id_1f84ab0dccc60762_fk_db_dbworkflowstep_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_calculations
    ADD CONSTRAINT db_d_dbworkflowstep_id_1f84ab0dccc60762_fk_db_dbworkflowstep_id FOREIGN KEY (dbworkflowstep_id) REFERENCES public.db_dbworkflowstep(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_d_dbworkflowstep_id_7798ce4345e8e576_fk_db_dbworkflowstep_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_sub_workflows
    ADD CONSTRAINT db_d_dbworkflowstep_id_7798ce4345e8e576_fk_db_dbworkflowstep_id FOREIGN KEY (dbworkflowstep_id) REFERENCES public.db_dbworkflowstep(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbattribute_dbnode_id_783fe2b9b1ee948f_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbattribute
    ADD CONSTRAINT db_dbattribute_dbnode_id_783fe2b9b1ee948f_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbauthinfo_aiidauser_id_b4dbd2ecdabaa58_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_aiidauser_id_b4dbd2ecdabaa58_fk_db_dbuser_id FOREIGN KEY (aiidauser_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbauthinfo_dbcomputer_id_be3c9b99107479b_fk_db_dbcomputer_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbauthinfo
    ADD CONSTRAINT db_dbauthinfo_dbcomputer_id_be3c9b99107479b_fk_db_dbcomputer_id FOREIGN KEY (dbcomputer_id) REFERENCES public.db_dbcomputer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbcalcstate_dbnode_id_5ab286e6811907a3_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcalcstate
    ADD CONSTRAINT db_dbcalcstate_dbnode_id_5ab286e6811907a3_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbcomment_dbnode_id_e225ac462eb8f6c_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcomment
    ADD CONSTRAINT db_dbcomment_dbnode_id_e225ac462eb8f6c_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbcomment_user_id_2e215134d026c3a3_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbcomment
    ADD CONSTRAINT db_dbcomment_user_id_2e215134d026c3a3_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbextra_dbnode_id_c556b194c79dec1_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbextra
    ADD CONSTRAINT db_dbextra_dbnode_id_c556b194c79dec1_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbgroup_dbnodes_dbgroup_id_32d69f1acbc4c03c_fk_db_dbgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_dbgroup_id_32d69f1acbc4c03c_fk_db_dbgroup_id FOREIGN KEY (dbgroup_id) REFERENCES public.db_dbgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbgroup_dbnodes_dbnode_id_53a1829a1973b99c_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbgroup_dbnodes
    ADD CONSTRAINT db_dbgroup_dbnodes_dbnode_id_53a1829a1973b99c_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbgroup_user_id_698e239e754dccc5_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbgroup
    ADD CONSTRAINT db_dbgroup_user_id_698e239e754dccc5_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dblink_input_id_6feafb02380ed56f_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dblink
    ADD CONSTRAINT db_dblink_input_id_6feafb02380ed56f_fk_db_dbnode_id FOREIGN KEY (input_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dblink_output_id_6345a663e713ed93_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dblink
    ADD CONSTRAINT db_dblink_output_id_6345a663e713ed93_fk_db_dbnode_id FOREIGN KEY (output_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbnode_dbcomputer_id_2195c2d4d9b222ff_fk_db_dbcomputer_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbnode
    ADD CONSTRAINT db_dbnode_dbcomputer_id_2195c2d4d9b222ff_fk_db_dbcomputer_id FOREIGN KEY (dbcomputer_id) REFERENCES public.db_dbcomputer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbnode_user_id_43fd81cadf67f183_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbnode
    ADD CONSTRAINT db_dbnode_user_id_43fd81cadf67f183_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbuser__permission_id_77342b1287a009fe_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_user_permissions
    ADD CONSTRAINT db_dbuser__permission_id_77342b1287a009fe_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbuser_groups_dbuser_id_6024db9daf8ecba_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_groups
    ADD CONSTRAINT db_dbuser_groups_dbuser_id_6024db9daf8ecba_fk_db_dbuser_id FOREIGN KEY (dbuser_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbuser_groups_group_id_78e325354186e2b_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_groups
    ADD CONSTRAINT db_dbuser_groups_group_id_78e325354186e2b_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbuser_user_permi_dbuser_id_325dd28d66e30790_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbuser_user_permissions
    ADD CONSTRAINT db_dbuser_user_permi_dbuser_id_325dd28d66e30790_fk_db_dbuser_id FOREIGN KEY (dbuser_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbworkflo_dbworkflow_id_4a3395f4c392c63c_fk_db_dbworkflow_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_sub_workflows
    ADD CONSTRAINT db_dbworkflo_dbworkflow_id_4a3395f4c392c63c_fk_db_dbworkflow_id FOREIGN KEY (dbworkflow_id) REFERENCES public.db_dbworkflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbworkflow_user_id_745f0415fc9f135a_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflow
    ADD CONSTRAINT db_dbworkflow_user_id_745f0415fc9f135a_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbworkflowdat_parent_id_74e8079e6f1c8441_fk_db_dbworkflow_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowdata
    ADD CONSTRAINT db_dbworkflowdat_parent_id_74e8079e6f1c8441_fk_db_dbworkflow_id FOREIGN KEY (parent_id) REFERENCES public.db_dbworkflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbworkflowdata_aiida_obj_id_28130672924934ca_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowdata
    ADD CONSTRAINT db_dbworkflowdata_aiida_obj_id_28130672924934ca_fk_db_dbnode_id FOREIGN KEY (aiida_obj_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbworkflowste_parent_id_33a89b7df301ebbd_fk_db_dbworkflow_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep
    ADD CONSTRAINT db_dbworkflowste_parent_id_33a89b7df301ebbd_fk_db_dbworkflow_id FOREIGN KEY (parent_id) REFERENCES public.db_dbworkflow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbworkflowstep_ca_dbnode_id_5ac7aa3704de0639_fk_db_dbnode_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep_calculations
    ADD CONSTRAINT db_dbworkflowstep_ca_dbnode_id_5ac7aa3704de0639_fk_db_dbnode_id FOREIGN KEY (dbnode_id) REFERENCES public.db_dbnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: db_dbworkflowstep_user_id_32681ba845c275dc_fk_db_dbuser_id; Type: FK CONSTRAINT; Schema: public; Owner: %AIIDADB_USER%
--

ALTER TABLE ONLY public.db_dbworkflowstep
    ADD CONSTRAINT db_dbworkflowstep_user_id_32681ba845c275dc_fk_db_dbuser_id FOREIGN KEY (user_id) REFERENCES public.db_dbuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: %AIIDADB_USER%
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM %AIIDADB_USER%;
GRANT ALL ON SCHEMA public TO %AIIDADB_USER%;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

