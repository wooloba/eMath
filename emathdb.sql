--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 11.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO emath;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO emath;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO emath;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO emath;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO emath;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO emath;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO emath;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO emath;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO emath;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO emath;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO emath;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO emath;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: presentation_externallink; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.presentation_externallink (
    id integer NOT NULL,
    content character varying(150) NOT NULL,
    url character varying(200) NOT NULL,
    target boolean NOT NULL,
    parent_e_id_id integer NOT NULL
);


ALTER TABLE public.presentation_externallink OWNER TO emath;

--
-- Name: database_externallink_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.database_externallink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_externallink_id_seq OWNER TO emath;

--
-- Name: database_externallink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.database_externallink_id_seq OWNED BY public.presentation_externallink.id;


--
-- Name: presentation_level; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.presentation_level (
    id integer NOT NULL,
    "position" integer NOT NULL,
    "isPage" boolean NOT NULL,
    title character varying(100),
    "tocTitle" character varying(100),
    unit_type character varying(30),
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    "pageNum" integer,
    root_id integer,
    CONSTRAINT database_level_level_check CHECK ((level >= 0)),
    CONSTRAINT database_level_lft_check CHECK ((lft >= 0)),
    CONSTRAINT database_level_rght_check CHECK ((rght >= 0)),
    CONSTRAINT database_level_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.presentation_level OWNER TO emath;

--
-- Name: database_level_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.database_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_level_id_seq OWNER TO emath;

--
-- Name: database_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.database_level_id_seq OWNED BY public.presentation_level.id;


--
-- Name: presentation_para; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.presentation_para (
    id integer NOT NULL,
    content jsonb NOT NULL,
    "position" integer,
    para_parent_id integer NOT NULL
);


ALTER TABLE public.presentation_para OWNER TO emath;

--
-- Name: database_para_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.database_para_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_para_id_seq OWNER TO emath;

--
-- Name: database_para_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.database_para_id_seq OWNED BY public.presentation_para.id;


--
-- Name: presentation_person; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.presentation_person (
    id integer NOT NULL,
    first_name character varying(20) NOT NULL,
    middle_name character varying(20),
    last_name character varying(20) NOT NULL
);


ALTER TABLE public.presentation_person OWNER TO emath;

--
-- Name: database_person_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.database_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_person_id_seq OWNER TO emath;

--
-- Name: database_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.database_person_id_seq OWNED BY public.presentation_person.id;

--
-- Name: presentation_label; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.presentation_label (
    id integer NOT NULL,
    "content" character varying(30),
    linked_para_id integer,
    linked_level_id integer,
    root_id integer
);


ALTER TABLE public.presentation_label OWNER TO emath;

--
-- Name: presentation_label_id_seq; Type: SEQUENCE; Schema: public; Owner: yaozhilu
--

CREATE SEQUENCE public.database_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.database_label_id_seq OWNER TO emath;

--
-- Name: presentation_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yaozhilu
--

ALTER SEQUENCE public.database_label_id_seq OWNED BY public.presentation_label.id;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO emath;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO emath;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO emath;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO emath;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO emath;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: emath
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO emath;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emath
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: emath
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO emath;

--
-- Name: presentation_rootlevel; Type: TABLE; Schema: public; Owner: yaozhilu
--

CREATE TABLE public.presentation_rootlevel (
    id integer NOT NULL,
    html_title character varying(100),
    date date,
    author_id integer,
    contributor jsonb,
    author_index jsonb NOT NULL,
    index_item jsonb NOT NULL,
    symbol_index jsonb NOT NULL,
    new_command jsonb NOT NULL,
    tex_shortcut jsonb NOT NULL
);


ALTER TABLE public.presentation_rootlevel OWNER TO yaozhilu;

--
-- Name: presentation_rootlevel_id_seq; Type: SEQUENCE; Schema: public; Owner: yaozhilu
--

CREATE SEQUENCE public.presentation_rootlevel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presentation_rootlevel_id_seq OWNER TO yaozhilu;

--
-- Name: presentation_rootlevel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yaozhilu
--

ALTER SEQUENCE public.presentation_rootlevel_id_seq OWNED BY public.presentation_rootlevel.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: presentation_externallink id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_externallink ALTER COLUMN id SET DEFAULT nextval('public.database_externallink_id_seq'::regclass);


--
-- Name: presentation_level id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_level ALTER COLUMN id SET DEFAULT nextval('public.database_level_id_seq'::regclass);


--
-- Name: presentation_para id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_para ALTER COLUMN id SET DEFAULT nextval('public.database_para_id_seq'::regclass);


--
-- Name: presentation_person id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_person ALTER COLUMN id SET DEFAULT nextval('public.database_person_id_seq'::regclass);

--
-- Name: presentation_label id; Type: DEFAULT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_label ALTER COLUMN id SET DEFAULT nextval('public.database_label_id_seq'::regclass);


--
-- Name: presentation_rootlevel id; Type: DEFAULT; Schema: public; Owner: yaozhilu
--

ALTER TABLE ONLY public.presentation_rootlevel ALTER COLUMN id SET DEFAULT nextval('public.presentation_rootlevel_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add level	7	add_level
26	Can change level	7	change_level
27	Can delete level	7	delete_level
28	Can view level	7	view_level
29	Can add person	8	add_person
30	Can change person	8	change_person
31	Can delete person	8	delete_person
32	Can view person	8	view_person
33	Can add para	9	add_para
34	Can change para	9	change_para
35	Can delete para	9	delete_para
36	Can view para	9	view_para
37	Can add math display	10	add_mathdisplay
38	Can change math display	10	change_mathdisplay
39	Can delete math display	10	delete_mathdisplay
40	Can view math display	10	view_mathdisplay
41	Can add internal link	11	add_internallink
42	Can change internal link	11	change_internallink
43	Can delete internal link	11	delete_internallink
44	Can view internal link	11	view_internallink
45	Can add external link	12	add_externallink
46	Can change external link	12	change_externallink
47	Can delete external link	12	delete_externallink
48	Can view external link	12	view_externallink
49	Can add root level	13	add_rootlevel
50	Can change root level	13	change_rootlevel
51	Can delete root level	13	delete_rootlevel
52	Can view root level	13	view_rootlevel
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$M3DfqSGuBH0S$SF8i22UAMV53UsOSO7Ur0W9ki+fgGhMbQlTX1bOZBOg=	2020-06-27 20:01:52.261094-06	t	yaozhilu			luyaozhiusing@gmail.com	t	t	2019-07-12 12:46:48.917551-06
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-07-12 12:49:40.293881-06	1	Person object (1)	1	[{"added": {}}]	8	1
2	2019-07-12 12:49:48.583407-06	2	Person object (2)	1	[{"added": {}}]	8	1
3	2019-07-12 12:50:13.979826-06	3	Person object (3)	1	[{"added": {}}]	8	1
4	2019-07-12 12:50:23.008422-06	4	Person object (4)	1	[{"added": {}}]	8	1
5	2019-07-12 12:50:30.009823-06	5	Person object (5)	1	[{"added": {}}]	8	1
6	2019-07-12 12:50:42.912294-06	6	Person object (6)	1	[{"added": {}}]	8	1
7	2019-07-12 12:52:27.781229-06	1	Level object (1)	1	[{"added": {}}]	7	1
8	2019-07-12 12:54:07.532557-06	2	Level object (2)	1	[{"added": {}}]	7	1
9	2019-07-12 12:54:43.951173-06	3	Level object (3)	1	[{"added": {}}]	7	1
10	2019-07-12 12:55:20.636449-06	2	Level object (2)	2	[{"changed": {"fields": ["position"]}}]	7	1
11	2019-07-12 12:55:26.511891-06	2	Level object (2)	2	[{"changed": {"fields": ["position"]}}]	7	1
12	2019-07-12 12:56:12.495415-06	4	Level object (4)	1	[{"added": {}}]	7	1
13	2019-07-12 12:57:42.196671-06	3	Level object (3)	2	[{"changed": {"fields": ["position"]}}]	7	1
14	2019-07-12 12:57:48.656738-06	2	Level object (2)	2	[{"changed": {"fields": ["position"]}}]	7	1
15	2019-07-12 12:59:42.461372-06	5	Level object (5)	1	[{"added": {}}]	7	1
16	2019-07-12 13:00:24.119849-06	6	Level object (6)	1	[{"added": {}}]	7	1
17	2019-07-12 13:01:43.031476-06	7	Level object (7)	1	[{"added": {}}]	7	1
18	2019-07-12 13:02:38.151413-06	8	Level object (8)	1	[{"added": {}}]	7	1
19	2019-07-12 13:03:48.205082-06	9	Level object (9)	1	[{"added": {}}]	7	1
20	2019-07-12 13:04:40.501401-06	10	Level object (10)	1	[{"added": {}}]	7	1
21	2019-07-12 13:04:52.999128-06	10	Level object (10)	2	[]	7	1
22	2019-07-12 13:05:49.864159-06	11	Level object (11)	1	[{"added": {}}]	7	1
23	2019-07-12 13:06:15.232574-06	12	Level object (12)	1	[{"added": {}}]	7	1
24	2019-07-12 13:06:34.652446-06	13	Level object (13)	1	[{"added": {}}]	7	1
25	2019-07-12 13:07:27.030654-06	14	Level object (14)	1	[{"added": {}}]	7	1
26	2019-07-12 13:09:39.093624-06	15	Level object (15)	1	[{"added": {}}]	7	1
27	2019-07-12 13:10:13.400567-06	16	Level object (16)	1	[{"added": {}}]	7	1
28	2019-07-12 13:10:37.512053-06	17	Level object (17)	1	[{"added": {}}]	7	1
29	2019-07-12 13:11:10.323655-06	18	Level object (18)	1	[{"added": {}}]	7	1
30	2019-07-12 13:11:59.124434-06	19	Level object (19)	1	[{"added": {}}]	7	1
31	2019-07-12 13:12:47.24603-06	20	Level object (20)	1	[{"added": {}}]	7	1
32	2019-07-12 13:13:43.209886-06	4	Level object (4)	2	[{"changed": {"fields": ["isPage"]}}]	7	1
33	2019-07-12 13:14:07.505828-06	2	Level object (2)	2	[]	7	1
34	2019-07-12 13:14:15.095542-06	4	Level object (4)	2	[]	7	1
35	2019-07-12 13:14:21.823921-06	2	Level object (2)	2	[]	7	1
36	2019-07-12 13:14:26.827013-06	3	Level object (3)	2	[]	7	1
37	2019-07-12 13:14:38.446283-06	5	Level object (5)	2	[]	7	1
38	2019-07-12 13:15:23.339573-06	1	Para object (1)	1	[{"added": {}}]	9	1
39	2019-07-12 13:15:37.861315-06	2	Para object (2)	1	[{"added": {}}]	9	1
40	2019-07-12 13:16:22.635312-06	3	Para object (3)	1	[{"added": {}}]	9	1
41	2019-07-12 13:16:39.003175-06	4	Para object (4)	1	[{"added": {}}]	9	1
42	2019-07-12 13:17:02.906115-06	5	Para object (5)	1	[{"added": {}}]	9	1
43	2019-07-12 13:17:16.226052-06	6	Para object (6)	1	[{"added": {}}]	9	1
44	2019-07-12 13:17:33.667563-06	7	Para object (7)	1	[{"added": {}}]	9	1
45	2019-07-12 13:19:05.465838-06	21	Level object (21)	1	[{"added": {}}]	7	1
46	2019-07-12 13:19:11.744173-06	1	InternalLink object (1)	1	[{"added": {}}]	11	1
47	2019-07-12 13:19:50.847805-06	8	Para object (8)	1	[{"added": {}}]	9	1
48	2019-07-12 13:20:11.357803-06	9	Para object (9)	1	[{"added": {}}]	9	1
49	2019-07-12 13:20:31.830831-06	10	Para object (10)	1	[{"added": {}}]	9	1
50	2019-07-12 13:20:48.43994-06	11	Para object (11)	1	[{"added": {}}]	9	1
51	2019-07-12 13:21:08.515702-06	12	Para object (12)	1	[{"added": {}}]	9	1
52	2019-07-12 13:22:36.79454-06	22	Level object (22)	1	[{"added": {}}]	7	1
53	2019-07-12 13:22:50.185523-06	2	InternalLink object (2)	1	[{"added": {}}]	11	1
54	2019-07-15 13:00:33.70153-06	13	Para object (13)	1	[{"added": {}}]	9	1
55	2019-07-15 13:00:57.518526-06	14	Para object (14)	1	[{"added": {}}]	9	1
56	2019-07-15 13:01:19.861239-06	15	Para object (15)	1	[{"added": {}}]	9	1
57	2019-07-15 13:01:36.057841-06	16	Para object (16)	1	[{"added": {}}]	9	1
58	2019-07-15 13:01:52.101347-06	17	Para object (17)	1	[{"added": {}}]	9	1
59	2019-07-15 13:02:13.196972-06	18	Para object (18)	1	[{"added": {}}]	9	1
60	2019-07-15 13:02:29.563147-06	19	Para object (19)	1	[{"added": {}}]	9	1
61	2019-07-15 13:02:43.833379-06	20	Para object (20)	1	[{"added": {}}]	9	1
62	2019-07-15 13:38:21.872946-06	1	Level object (1)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
63	2019-07-15 13:38:38.920954-06	4	Level object (4)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
64	2019-07-15 13:38:57.102713-06	3	Level object (3)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
65	2019-07-15 13:39:20.793047-06	5	Level object (5)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
66	2019-07-15 13:39:54.360721-06	15	Level object (15)	2	[]	7	1
67	2019-07-15 13:40:07.873015-06	4	Level object (4)	2	[]	7	1
68	2019-07-15 13:40:17.757395-06	5	Level object (5)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
69	2019-07-15 13:40:29.276839-06	15	Level object (15)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
70	2019-07-15 13:42:06.184066-06	16	Level object (16)	2	[{"changed": {"fields": ["title", "header"]}}]	7	1
71	2019-07-15 13:42:19.125775-06	16	Level object (16)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
72	2019-07-15 13:42:54.665949-06	17	Level object (17)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
73	2019-07-15 13:43:08.638317-06	18	Level object (18)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
74	2019-07-18 14:26:58.401544-06	1	Level object (1)	2	[{"changed": {"fields": ["tocTitle"]}}]	7	1
75	2019-07-18 14:27:55.837073-06	4	Level object (4)	2	[{"changed": {"fields": ["title", "tocTitle"]}}]	7	1
76	2019-07-18 14:29:03.431275-06	2	Level object (2)	2	[{"changed": {"fields": ["html_title"]}}]	7	1
77	2019-07-18 14:34:27.880028-06	21	Level object (21)	2	[{"changed": {"fields": ["tocTitle"]}}]	7	1
78	2019-07-18 14:34:46.884762-06	22	Level object (22)	2	[{"changed": {"fields": ["tocTitle"]}}]	7	1
79	2019-07-18 14:38:08.366017-06	13	Level object (13)	2	[{"changed": {"fields": ["title", "tocTitle"]}}]	7	1
80	2019-07-18 14:40:51.035602-06	2	Level object (2)	2	[{"changed": {"fields": ["position"]}}]	7	1
81	2019-07-18 14:40:58.785238-06	3	Level object (3)	2	[{"changed": {"fields": ["position"]}}]	7	1
82	2019-07-29 14:28:48.033548-06	7	Para object (7)	2	[{"changed": {"fields": ["content"]}}]	9	1
83	2019-07-29 14:30:27.618164-06	11	Para object (11)	2	[{"changed": {"fields": ["content"]}}]	9	1
84	2019-07-29 14:55:46.241048-06	7	Para object (7)	2	[{"changed": {"fields": ["content"]}}]	9	1
85	2019-07-31 13:28:58.99296-06	21	Para object (21)	1	[{"added": {}}]	9	1
86	2019-07-31 13:29:19.294335-06	22	Para object (22)	1	[{"added": {}}]	9	1
87	2019-07-31 13:29:35.496691-06	23	Para object (23)	1	[{"added": {}}]	9	1
88	2019-07-31 13:30:00.207582-06	24	Para object (24)	1	[{"added": {}}]	9	1
89	2019-07-31 13:30:20.010767-06	25	Para object (25)	1	[{"added": {}}]	9	1
90	2019-07-31 13:30:42.338209-06	26	Para object (26)	1	[{"added": {}}]	9	1
91	2019-07-31 13:30:57.773237-06	27	Para object (27)	1	[{"added": {}}]	9	1
92	2019-07-31 13:31:49.578676-06	22	Para object (22)	2	[{"changed": {"fields": ["position"]}}]	9	1
93	2019-07-31 14:35:12.721709-06	28	Para object (28)	1	[{"added": {}}]	9	1
94	2019-07-31 14:35:31.032084-06	29	Para object (29)	1	[{"added": {}}]	9	1
95	2019-07-31 14:35:51.914008-06	30	Para object (30)	1	[{"added": {}}]	9	1
96	2019-07-31 14:36:23.355474-06	31	Para object (31)	1	[{"added": {}}]	9	1
97	2019-07-31 14:36:38.76471-06	32	Para object (32)	1	[{"added": {}}]	9	1
98	2019-07-31 14:36:52.814994-06	33	Para object (33)	1	[{"added": {}}]	9	1
99	2019-07-31 14:37:13.05234-06	34	Para object (34)	1	[{"added": {}}]	9	1
100	2019-07-31 14:37:36.314679-06	35	Para object (35)	1	[{"added": {}}]	9	1
101	2019-08-12 11:37:24.03089-06	4	Para object (4)	2	[{"changed": {"fields": ["content"]}}]	9	1
102	2019-08-12 11:42:15.064609-06	6	Para object (6)	2	[{"changed": {"fields": ["content"]}}]	9	1
103	2019-08-12 11:44:08.276621-06	10	Para object (10)	2	[{"changed": {"fields": ["content"]}}]	9	1
104	2019-08-13 10:08:51.425779-06	36	Para object (36)	1	[{"added": {}}]	9	1
105	2019-08-13 10:09:36.324519-06	37	Para object (37)	1	[{"added": {}}]	9	1
106	2019-08-13 10:14:20.848166-06	38	Para object (38)	1	[{"added": {}}]	9	1
107	2019-08-13 10:16:40.981813-06	39	Para object (39)	1	[{"added": {}}]	9	1
108	2019-08-13 10:19:13.205376-06	40	Para object (40)	1	[{"added": {}}]	9	1
109	2019-08-13 10:21:03.570306-06	41	Para object (41)	1	[{"added": {}}]	9	1
110	2019-08-13 10:23:04.671846-06	42	Para object (42)	1	[{"added": {}}]	9	1
111	2019-08-13 10:24:35.316134-06	43	Para object (43)	1	[{"added": {}}]	9	1
112	2019-08-13 10:25:07.358408-06	44	Para object (44)	1	[{"added": {}}]	9	1
113	2019-08-13 10:31:32.872069-06	36	Para object (36)	2	[{"changed": {"fields": ["content"]}}]	9	1
114	2019-08-13 10:32:04.160916-06	38	Para object (38)	2	[{"changed": {"fields": ["content"]}}]	9	1
115	2019-08-13 10:32:39.424195-06	36	Para object (36)	2	[{"changed": {"fields": ["content"]}}]	9	1
116	2019-08-13 10:33:13.233604-06	36	Para object (36)	2	[{"changed": {"fields": ["content"]}}]	9	1
117	2019-08-13 10:33:42.233819-06	36	Para object (36)	2	[{"changed": {"fields": ["content"]}}]	9	1
118	2019-08-13 10:34:42.528214-06	36	Para object (36)	2	[{"changed": {"fields": ["content"]}}]	9	1
119	2019-08-13 10:39:19.182138-06	36	Para object (36)	2	[]	9	1
120	2019-08-13 10:40:28.526721-06	36	Para object (36)	2	[{"changed": {"fields": ["content"]}}]	9	1
121	2019-08-13 10:41:31.830675-06	39	Para object (39)	2	[{"changed": {"fields": ["content"]}}]	9	1
122	2019-08-13 10:41:57.700566-06	40	Para object (40)	2	[{"changed": {"fields": ["content"]}}]	9	1
123	2019-08-13 10:42:13.203983-06	41	Para object (41)	2	[{"changed": {"fields": ["content"]}}]	9	1
124	2019-08-13 10:42:33.829184-06	42	Para object (42)	2	[{"changed": {"fields": ["content"]}}]	9	1
125	2019-08-13 11:35:44.823121-06	10	Para object (10)	2	[{"changed": {"fields": ["content"]}}]	9	1
126	2019-08-13 12:12:35.520052-06	4	Para object (4)	2	[{"changed": {"fields": ["content"]}}]	9	1
127	2019-08-13 12:13:27.354815-06	4	Para object (4)	2	[{"changed": {"fields": ["content"]}}]	9	1
128	2019-08-13 12:14:08.637105-06	4	Para object (4)	2	[{"changed": {"fields": ["content"]}}]	9	1
129	2019-08-14 13:03:13.694685-06	4	Para object (4)	2	[{"changed": {"fields": ["content"]}}]	9	1
130	2019-08-16 13:26:37.954218-06	23	Level object (23)	1	[{"added": {}}]	7	1
131	2019-08-16 13:27:48.861-06	24	Level object (24)	1	[{"added": {}}]	7	1
132	2019-08-16 13:28:41.355706-06	25	Level object (25)	1	[{"added": {}}]	7	1
133	2019-08-16 13:29:50.024867-06	26	Level object (26)	1	[{"added": {}}]	7	1
134	2019-08-16 13:31:44.941258-06	45	Para object (45)	1	[{"added": {}}]	9	1
135	2019-08-16 13:33:07.598355-06	46	Para object (46)	1	[{"added": {}}]	9	1
136	2019-08-16 13:33:54.458465-06	47	Para object (47)	1	[{"added": {}}]	9	1
137	2019-08-16 13:34:51.745358-06	48	Para object (48)	1	[{"added": {}}]	9	1
138	2019-08-16 13:35:11.799292-06	47	Para object (47)	2	[{"changed": {"fields": ["position"]}}]	9	1
139	2019-08-16 13:36:37.106198-06	49	Para object (49)	1	[{"added": {}}]	9	1
140	2019-08-16 13:37:03.413955-06	50	Para object (50)	1	[{"added": {}}]	9	1
141	2019-08-16 13:37:33.805929-06	51	Para object (51)	1	[{"added": {}}]	9	1
142	2019-08-19 12:01:16.827292-06	5	Level object (5)	2	[{"changed": {"fields": ["pageNum", "isPage"]}}]	7	1
143	2019-08-19 12:02:31.939345-06	5	Level object (5)	2	[{"changed": {"fields": ["pageNum", "isPage"]}}]	7	1
144	2019-08-21 14:51:23.788907-06	23	Level object (23)	2	[{"changed": {"fields": ["tocTitle"]}}]	7	1
145	2019-08-21 14:51:28.201362-06	24	Level object (24)	2	[{"changed": {"fields": ["tocTitle"]}}]	7	1
146	2019-08-21 14:51:33.406586-06	25	Level object (25)	2	[{"changed": {"fields": ["tocTitle"]}}]	7	1
147	2019-08-21 14:51:43.010034-06	25	Level object (25)	2	[]	7	1
148	2019-08-21 14:51:47.90001-06	26	Level object (26)	2	[{"changed": {"fields": ["tocTitle"]}}]	7	1
149	2019-08-22 11:36:36.736035-06	49	Para object (49)	2	[{"changed": {"fields": ["content"]}}]	9	1
150	2019-08-22 11:37:53.16706-06	49	Para object (49)	2	[{"changed": {"fields": ["content"]}}]	9	1
151	2019-08-23 14:49:20.150561-06	51	Para object (51)	3		9	1
152	2019-08-23 14:49:20.220685-06	49	Para object (49)	3		9	1
153	2019-08-23 14:49:20.223364-06	47	Para object (47)	3		9	1
154	2019-08-23 14:49:20.224585-06	45	Para object (45)	3		9	1
155	2019-08-23 14:49:20.227161-06	36	Para object (36)	3		9	1
156	2019-08-23 14:49:20.229194-06	13	Para object (13)	3		9	1
157	2019-08-23 14:49:20.230801-06	1	Para object (1)	3		9	1
158	2019-08-23 14:49:20.232052-06	48	Para object (48)	3		9	1
159	2019-08-23 14:49:20.233295-06	46	Para object (46)	3		9	1
160	2019-08-23 14:49:20.234568-06	37	Para object (37)	3		9	1
161	2019-08-23 14:49:20.236523-06	28	Para object (28)	3		9	1
162	2019-08-23 14:49:20.237882-06	21	Para object (21)	3		9	1
163	2019-08-23 14:49:20.239351-06	14	Para object (14)	3		9	1
164	2019-08-23 14:49:20.240501-06	2	Para object (2)	3		9	1
165	2019-08-23 14:49:20.241693-06	38	Para object (38)	3		9	1
166	2019-08-23 14:49:20.242876-06	29	Para object (29)	3		9	1
167	2019-08-23 14:49:20.245232-06	23	Para object (23)	3		9	1
168	2019-08-23 14:49:20.246395-06	15	Para object (15)	3		9	1
169	2019-08-23 14:49:20.247529-06	3	Para object (3)	3		9	1
170	2019-08-23 14:49:20.248834-06	50	Para object (50)	3		9	1
171	2019-08-23 14:49:20.250118-06	39	Para object (39)	3		9	1
172	2019-08-23 14:49:20.251242-06	30	Para object (30)	3		9	1
173	2019-08-23 14:49:20.252347-06	22	Para object (22)	3		9	1
174	2019-08-23 14:49:20.253469-06	16	Para object (16)	3		9	1
175	2019-08-23 14:49:20.254723-06	4	Para object (4)	3		9	1
176	2019-08-23 14:49:20.255785-06	40	Para object (40)	3		9	1
177	2019-08-23 14:49:20.256973-06	31	Para object (31)	3		9	1
178	2019-08-23 14:49:20.258104-06	24	Para object (24)	3		9	1
179	2019-08-23 14:49:20.259383-06	17	Para object (17)	3		9	1
180	2019-08-23 14:49:20.260663-06	5	Para object (5)	3		9	1
181	2019-08-23 14:49:20.261943-06	41	Para object (41)	3		9	1
182	2019-08-23 14:49:20.26317-06	25	Para object (25)	3		9	1
183	2019-08-23 14:49:20.264192-06	18	Para object (18)	3		9	1
184	2019-08-23 14:49:20.265169-06	6	Para object (6)	3		9	1
185	2019-08-23 14:49:20.266545-06	42	Para object (42)	3		9	1
186	2019-08-23 14:49:20.268311-06	33	Para object (33)	3		9	1
187	2019-08-23 14:49:20.269384-06	32	Para object (32)	3		9	1
188	2019-08-23 14:49:20.270504-06	26	Para object (26)	3		9	1
189	2019-08-23 14:49:20.272184-06	20	Para object (20)	3		9	1
190	2019-08-23 14:49:20.273272-06	19	Para object (19)	3		9	1
191	2019-08-23 14:49:20.274628-06	7	Para object (7)	3		9	1
192	2019-08-23 14:49:20.276106-06	43	Para object (43)	3		9	1
193	2019-08-23 14:49:20.277569-06	34	Para object (34)	3		9	1
194	2019-08-23 14:49:20.278539-06	27	Para object (27)	3		9	1
195	2019-08-23 14:49:20.279736-06	8	Para object (8)	3		9	1
196	2019-08-23 14:49:20.280645-06	44	Para object (44)	3		9	1
197	2019-08-23 14:49:20.281545-06	35	Para object (35)	3		9	1
198	2019-08-23 14:49:20.282489-06	9	Para object (9)	3		9	1
199	2019-08-23 14:49:20.283398-06	10	Para object (10)	3		9	1
200	2019-08-23 14:49:20.284303-06	11	Para object (11)	3		9	1
201	2019-08-23 14:49:20.285192-06	12	Para object (12)	3		9	1
202	2019-08-25 23:34:10.663205-06	52	Para object (52)	1	[{"added": {}}]	9	1
203	2019-08-25 23:35:44.52583-06	53	Para object (53)	1	[{"added": {}}]	9	1
204	2019-08-26 12:31:44.153876-06	52	Para object (52)	2	[]	9	1
205	2019-08-26 12:31:47.826795-06	53	Para object (53)	2	[]	9	1
206	2019-08-26 13:19:03.333873-06	53	Para object (53)	2	[]	9	1
207	2019-08-26 13:45:22.797914-06	54	Para object (54)	1	[{"added": {}}]	9	1
208	2019-08-26 13:46:12.249776-06	55	Para object (55)	1	[{"added": {}}]	9	1
209	2019-08-26 13:47:38.737863-06	56	Para object (56)	1	[{"added": {}}]	9	1
210	2019-08-26 13:48:00.178103-06	57	Para object (57)	1	[{"added": {}}]	9	1
211	2019-08-26 13:48:06.462801-06	57	Para object (57)	2	[]	9	1
212	2019-08-26 13:49:58.536531-06	58	Para object (58)	1	[{"added": {}}]	9	1
213	2019-08-26 14:04:59.867658-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
214	2019-08-26 14:08:52.910028-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
215	2019-08-26 14:12:55.746178-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
216	2019-08-26 14:13:49.70856-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
217	2019-08-26 14:20:39.163002-06	58	Para object (58)	2	[{"changed": {"fields": ["content"]}}]	9	1
218	2019-08-26 14:23:20.541121-06	58	Para object (58)	2	[{"changed": {"fields": ["content"]}}]	9	1
219	2019-08-26 14:45:53.879092-06	58	Para object (58)	2	[{"changed": {"fields": ["content"]}}]	9	1
220	2019-08-28 11:02:10.656821-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
221	2019-08-28 14:17:04.850445-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
222	2019-08-28 14:28:10.920109-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
223	2019-08-28 14:38:49.535453-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
224	2019-08-29 11:09:54.449937-06	54	Para object (54)	2	[]	9	1
225	2019-08-29 11:37:37.307681-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
226	2019-08-29 11:37:43.984471-06	54	Para object (54)	2	[]	9	1
227	2019-08-29 11:41:03.130703-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
228	2019-08-29 15:04:48.974364-06	58	Para object (58)	2	[{"changed": {"fields": ["content"]}}]	9	1
229	2019-09-03 11:26:08.99867-06	59	Para object (59)	1	[{"added": {}}]	9	1
230	2019-09-03 11:56:36.654005-06	60	Para object (60)	1	[{"added": {}}]	9	1
231	2019-09-03 11:56:57.504323-06	61	Para object (61)	1	[{"added": {}}]	9	1
232	2019-09-03 12:03:10.201494-06	62	Para object (62)	1	[{"added": {}}]	9	1
233	2019-09-03 12:03:39.268626-06	63	Para object (63)	1	[{"added": {}}]	9	1
234	2019-09-03 12:06:56.725428-06	64	Para object (64)	1	[{"added": {}}]	9	1
235	2019-09-03 12:07:35.660527-06	65	Para object (65)	1	[{"added": {}}]	9	1
236	2019-09-03 12:08:42.254894-06	27	Level object (27)	1	[{"added": {}}]	7	1
237	2019-09-03 12:09:20.704779-06	66	Para object (66)	1	[{"added": {}}]	9	1
238	2019-09-03 12:09:49.405277-06	67	Para object (67)	1	[{"added": {}}]	9	1
239	2019-09-03 12:10:55.004355-06	27	Level object (27)	2	[{"changed": {"fields": ["position"]}}]	7	1
240	2019-09-03 12:24:55.252917-06	28	Level object (28)	1	[{"added": {}}]	7	1
241	2019-09-03 12:25:30.223961-06	22	Level object (22)	2	[{"changed": {"fields": ["parent"]}}]	7	1
242	2019-09-03 12:25:38.36338-06	21	Level object (21)	2	[{"changed": {"fields": ["parent"]}}]	7	1
243	2019-09-03 12:26:08.681874-06	21	Level object (21)	2	[{"changed": {"fields": ["tocTitle"]}}]	7	1
244	2019-09-03 12:26:18.608841-06	22	Level object (22)	2	[{"changed": {"fields": ["tocTitle"]}}]	7	1
245	2019-09-03 14:39:06.250686-06	64	Para object (64)	2	[{"changed": {"fields": ["content"]}}]	9	1
246	2019-09-03 14:40:04.003184-06	62	Para object (62)	2	[{"changed": {"fields": ["content"]}}]	9	1
247	2019-09-18 12:11:13.759082-06	15	Level object (15)	3		7	1
248	2019-09-18 12:11:13.796982-06	16	Level object (16)	3		7	1
249	2019-09-18 12:11:13.79857-06	23	Level object (23)	3		7	1
250	2019-09-18 12:11:13.800817-06	24	Level object (24)	3		7	1
251	2019-09-18 12:11:13.802267-06	25	Level object (25)	3		7	1
252	2019-09-18 12:11:13.803651-06	26	Level object (26)	3		7	1
253	2019-09-18 12:11:13.805165-06	17	Level object (17)	3		7	1
254	2019-09-18 12:11:13.806515-06	18	Level object (18)	3		7	1
255	2019-09-18 12:11:13.807946-06	6	Level object (6)	3		7	1
256	2019-09-18 12:11:13.809058-06	19	Level object (19)	3		7	1
257	2019-09-18 12:11:13.810009-06	20	Level object (20)	3		7	1
258	2019-09-18 12:11:13.81148-06	7	Level object (7)	3		7	1
259	2019-09-18 12:11:13.814132-06	8	Level object (8)	3		7	1
260	2019-09-18 12:11:13.815298-06	9	Level object (9)	3		7	1
261	2019-09-18 12:11:13.817206-06	10	Level object (10)	3		7	1
262	2019-09-18 12:11:13.818392-06	11	Level object (11)	3		7	1
263	2019-09-18 12:11:13.819436-06	12	Level object (12)	3		7	1
264	2019-09-18 12:11:13.820907-06	13	Level object (13)	3		7	1
265	2019-09-18 12:11:13.822324-06	14	Level object (14)	3		7	1
266	2019-09-18 12:12:09.92484-06	5	Level object (5)	2	[{"changed": {"fields": ["pageNum", "isPage", "date"]}}]	7	1
267	2019-09-18 12:16:15.27864-06	21	Level object (21)	2	[{"changed": {"fields": ["title", "tocTitle"]}}]	7	1
268	2019-09-18 12:16:23.303578-06	22	Level object (22)	2	[{"changed": {"fields": ["title", "tocTitle"]}}]	7	1
269	2019-09-23 12:14:37.198689-06	68	Para object (68)	1	[{"added": {}}]	9	1
270	2019-09-23 12:14:59.292883-06	69	Para object (69)	1	[{"added": {}}]	9	1
271	2019-09-23 12:20:19.331837-06	70	Para object (70)	1	[{"added": {}}]	9	1
272	2019-09-23 12:21:35.014454-06	71	Para object (71)	1	[{"added": {}}]	9	1
273	2019-09-23 12:22:11.586355-06	72	Para object (72)	1	[{"added": {}}]	9	1
274	2019-09-23 12:22:58.426652-06	73	Para object (73)	1	[{"added": {}}]	9	1
275	2019-09-23 12:23:30.403094-06	74	Para object (74)	1	[{"added": {}}]	9	1
276	2019-09-23 12:25:21.054658-06	74	Para object (74)	2	[]	9	1
277	2019-09-23 12:26:00.677784-06	75	Para object (75)	1	[{"added": {}}]	9	1
278	2019-09-23 12:29:14.660733-06	56	Para object (56)	2	[{"changed": {"fields": ["content"]}}]	9	1
279	2019-09-23 12:31:36.889-06	75	Para object (75)	2	[{"changed": {"fields": ["content"]}}]	9	1
280	2019-09-23 12:35:54.633894-06	56	Para object (56)	2	[{"changed": {"fields": ["content"]}}]	9	1
281	2019-09-23 12:36:48.16857-06	56	Para object (56)	2	[{"changed": {"fields": ["content"]}}]	9	1
282	2019-09-23 12:42:14.956379-06	29	Level object (29)	1	[{"added": {}}]	7	1
283	2019-09-23 12:42:40.761928-06	75	Para object (75)	2	[{"changed": {"fields": ["position", "para_parent"]}}]	9	1
284	2019-09-24 14:53:16.101595-06	53	Para object (53)	2	[{"changed": {"fields": ["content"]}}]	9	1
285	2019-09-24 14:53:49.669143-06	53	Para object (53)	2	[{"changed": {"fields": ["content"]}}]	9	1
286	2019-09-25 11:02:44.343761-06	52	Para object (52)	2	[{"changed": {"fields": ["content"]}}]	9	1
287	2019-09-25 11:03:08.649393-06	52	Para object (52)	2	[{"changed": {"fields": ["content"]}}]	9	1
288	2019-09-25 13:03:43.706627-06	73	Para object (73)	2	[{"changed": {"fields": ["content"]}}]	9	1
289	2019-09-25 13:05:11.92547-06	73	Para object (73)	2	[{"changed": {"fields": ["content"]}}]	9	1
290	2019-09-25 13:07:50.870999-06	73	Para object (73)	2	[]	9	1
291	2019-10-07 15:53:54.870158-06	73	Para object (73)	2	[{"changed": {"fields": ["content"]}}]	9	1
292	2019-10-08 13:34:34.330077-06	75	Para object (75)	2	[{"changed": {"fields": ["content"]}}]	9	1
293	2019-10-08 13:35:18.137891-06	68	Para object (68)	2	[{"changed": {"fields": ["content"]}}]	9	1
294	2019-10-08 13:35:51.495215-06	66	Para object (66)	2	[{"changed": {"fields": ["content"]}}]	9	1
295	2019-10-08 13:36:17.669184-06	59	Para object (59)	2	[{"changed": {"fields": ["content"]}}]	9	1
296	2019-10-08 13:36:46.406252-06	52	Para object (52)	2	[{"changed": {"fields": ["content"]}}]	9	1
297	2019-10-08 13:37:10.632218-06	69	Para object (69)	2	[{"changed": {"fields": ["content"]}}]	9	1
298	2019-10-08 13:37:30.637236-06	67	Para object (67)	2	[{"changed": {"fields": ["content"]}}]	9	1
299	2019-10-08 13:37:43.642689-06	60	Para object (60)	2	[]	9	1
300	2019-10-08 13:38:00.022093-06	53	Para object (53)	2	[{"changed": {"fields": ["content"]}}]	9	1
301	2019-10-08 13:38:05.384406-06	70	Para object (70)	2	[]	9	1
302	2019-10-08 13:38:20.560326-06	61	Para object (61)	2	[{"changed": {"fields": ["content"]}}]	9	1
303	2019-10-08 13:39:29.760911-06	54	Para object (54)	2	[]	9	1
304	2019-10-08 13:39:55.429295-06	71	Para object (71)	2	[{"changed": {"fields": ["content"]}}]	9	1
305	2019-10-08 13:40:16.052162-06	62	Para object (62)	2	[]	9	1
306	2019-10-08 13:40:36.704267-06	55	Para object (55)	2	[{"changed": {"fields": ["content"]}}]	9	1
307	2019-10-08 13:40:51.464929-06	72	Para object (72)	2	[{"changed": {"fields": ["content"]}}]	9	1
308	2019-10-08 13:41:06.943844-06	63	Para object (63)	2	[{"changed": {"fields": ["content"]}}]	9	1
309	2019-10-08 13:41:31.459444-06	56	Para object (56)	2	[{"changed": {"fields": ["content"]}}]	9	1
310	2019-10-08 13:42:01.066945-06	73	Para object (73)	2	[{"changed": {"fields": ["content"]}}]	9	1
311	2019-10-08 13:42:24.850191-06	64	Para object (64)	2	[{"changed": {"fields": ["content"]}}]	9	1
312	2019-10-08 13:42:42.02371-06	57	Para object (57)	2	[{"changed": {"fields": ["content"]}}]	9	1
313	2019-10-08 13:43:04.236397-06	74	Para object (74)	2	[{"changed": {"fields": ["content"]}}]	9	1
314	2019-10-08 13:43:20.59121-06	65	Para object (65)	2	[{"changed": {"fields": ["content"]}}]	9	1
315	2019-10-08 13:43:36.484499-06	58	Para object (58)	2	[]	9	1
316	2019-10-08 13:45:13.892633-06	73	Para object (73)	2	[{"changed": {"fields": ["content"]}}]	9	1
317	2019-10-08 14:10:52.895766-06	56	Para object (56)	2	[{"changed": {"fields": ["content"]}}]	9	1
318	2019-10-08 14:12:05.45982-06	56	Para object (56)	2	[{"changed": {"fields": ["content"]}}]	9	1
319	2019-10-08 14:14:06.879538-06	52	Para object (52)	2	[{"changed": {"fields": ["content"]}}]	9	1
320	2019-10-08 16:08:31.477269-06	75	Para object (75)	2	[{"changed": {"fields": ["content"]}}]	9	1
321	2019-10-08 16:09:35.332499-06	68	Para object (68)	2	[{"changed": {"fields": ["content"]}}]	9	1
322	2019-10-08 16:10:02.3657-06	66	Para object (66)	2	[{"changed": {"fields": ["content"]}}]	9	1
323	2019-10-08 16:10:26.356561-06	59	Para object (59)	2	[{"changed": {"fields": ["content"]}}]	9	1
324	2019-10-08 16:11:21.231266-06	52	Para object (52)	2	[{"changed": {"fields": ["content"]}}]	9	1
325	2019-10-08 16:11:30.031453-06	75	Para object (75)	2	[{"changed": {"fields": ["content"]}}]	9	1
326	2019-10-08 16:11:41.158542-06	68	Para object (68)	2	[{"changed": {"fields": ["content"]}}]	9	1
327	2019-10-08 16:11:51.806833-06	66	Para object (66)	2	[{"changed": {"fields": ["content"]}}]	9	1
328	2019-10-08 16:11:59.632837-06	59	Para object (59)	2	[{"changed": {"fields": ["content"]}}]	9	1
329	2019-10-08 16:12:04.435579-06	52	Para object (52)	2	[]	9	1
330	2019-10-08 16:12:42.033985-06	67	Para object (67)	2	[{"changed": {"fields": ["content"]}}]	9	1
331	2019-10-08 16:13:16.822721-06	60	Para object (60)	2	[{"changed": {"fields": ["content"]}}]	9	1
332	2019-10-08 16:13:35.505641-06	53	Para object (53)	2	[{"changed": {"fields": ["content"]}}]	9	1
333	2019-10-08 16:14:01.114202-06	70	Para object (70)	2	[{"changed": {"fields": ["content"]}}]	9	1
334	2019-10-08 16:14:09.711227-06	53	Para object (53)	2	[{"changed": {"fields": ["content"]}}]	9	1
335	2019-10-08 16:14:14.475921-06	60	Para object (60)	2	[]	9	1
336	2019-10-08 16:14:45.359427-06	61	Para object (61)	2	[{"changed": {"fields": ["content"]}}]	9	1
337	2019-10-08 16:15:25.241989-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
338	2019-10-08 16:15:55.76357-06	71	Para object (71)	2	[{"changed": {"fields": ["content"]}}]	9	1
339	2019-10-08 16:16:23.019575-06	62	Para object (62)	2	[{"changed": {"fields": ["content"]}}]	9	1
340	2019-10-08 16:16:50.472461-06	55	Para object (55)	2	[{"changed": {"fields": ["content"]}}]	9	1
341	2019-10-08 16:17:09.38329-06	72	Para object (72)	2	[{"changed": {"fields": ["content"]}}]	9	1
342	2019-10-08 16:17:30.586306-06	63	Para object (63)	2	[{"changed": {"fields": ["content"]}}]	9	1
343	2019-10-08 16:17:38.769996-06	72	Para object (72)	2	[{"changed": {"fields": ["content"]}}]	9	1
344	2019-10-08 16:17:45.789055-06	55	Para object (55)	2	[]	9	1
345	2019-10-08 16:17:55.792961-06	62	Para object (62)	2	[]	9	1
346	2019-10-08 16:18:03.87403-06	63	Para object (63)	2	[]	9	1
347	2019-10-08 16:23:52.645337-06	56	Para object (56)	2	[{"changed": {"fields": ["content"]}}]	9	1
348	2019-10-08 16:24:14.892-06	73	Para object (73)	2	[{"changed": {"fields": ["content"]}}]	9	1
349	2019-10-08 16:24:34.074392-06	64	Para object (64)	2	[{"changed": {"fields": ["content"]}}]	9	1
350	2019-10-08 16:24:55.258098-06	57	Para object (57)	2	[{"changed": {"fields": ["content"]}}]	9	1
351	2019-10-08 16:25:12.028981-06	74	Para object (74)	2	[{"changed": {"fields": ["content"]}}]	9	1
352	2019-10-08 16:25:18.668548-06	57	Para object (57)	2	[{"changed": {"fields": ["content"]}}]	9	1
353	2019-10-08 16:25:22.747895-06	74	Para object (74)	2	[]	9	1
354	2019-10-08 16:25:40.710993-06	65	Para object (65)	2	[{"changed": {"fields": ["content"]}}]	9	1
355	2019-10-08 16:26:01.472056-06	58	Para object (58)	2	[{"changed": {"fields": ["content"]}}]	9	1
356	2019-10-08 16:30:52.822739-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
357	2019-10-08 16:33:29.103447-06	64	Para object (64)	2	[{"changed": {"fields": ["content"]}}]	9	1
358	2019-10-08 16:34:01.794277-06	69	Para object (69)	2	[{"changed": {"fields": ["content"]}}]	9	1
359	2019-10-08 16:34:34.090019-06	69	Para object (69)	2	[{"changed": {"fields": ["content"]}}]	9	1
360	2019-10-08 16:41:10.6481-06	52	Para object (52)	2	[{"changed": {"fields": ["content"]}}]	9	1
361	2019-10-08 16:41:50.797745-06	52	Para object (52)	2	[{"changed": {"fields": ["content"]}}]	9	1
362	2019-10-08 16:42:01.396352-06	53	Para object (53)	2	[{"changed": {"fields": ["content"]}}]	9	1
363	2019-10-08 16:46:28.099669-06	53	Para object (53)	2	[{"changed": {"fields": ["content"]}}]	9	1
364	2019-10-08 16:46:50.734554-06	53	Para object (53)	2	[{"changed": {"fields": ["content"]}}]	9	1
365	2019-10-08 16:52:39.648383-06	64	Para object (64)	2	[{"changed": {"fields": ["content"]}}]	9	1
366	2019-10-16 14:33:59.490618-06	87	Para object (87)	3		9	1
367	2019-10-16 14:34:08.910499-06	88	Para object (88)	3		9	1
368	2019-10-16 14:34:17.314134-06	90	Para object (90)	3		9	1
369	2019-10-16 14:36:03.570029-06	21	Level object (21)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
370	2019-10-16 14:36:34.914671-06	22	Level object (22)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
371	2019-10-17 11:37:01.199204-06	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
372	2019-10-17 11:37:52.344569-06	62	Para object (62)	2	[{"changed": {"fields": ["content"]}}]	9	1
373	2019-10-17 11:38:18.80727-06	73	Para object (73)	2	[{"changed": {"fields": ["content"]}}]	9	1
374	2019-10-17 11:38:49.299795-06	64	Para object (64)	2	[{"changed": {"fields": ["content"]}}]	9	1
375	2019-10-17 11:40:03.231737-06	54	Para object (54)	2	[]	9	1
376	2019-10-18 13:27:13.027748-06	36	Level object (36)	2	[{"changed": {"fields": ["position"]}}]	7	1
377	2019-10-18 13:27:25.292071-06	36	Level object (36)	2	[{"changed": {"fields": ["position"]}}]	7	1
378	2019-10-18 13:29:57.248277-06	35	Level object (35)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
379	2019-10-21 10:58:30.855964-06	35	Level object (35)	3		7	1
380	2019-10-21 10:58:45.713007-06	32	Level object (32)	2	[{"changed": {"fields": ["position"]}}]	7	1
381	2019-10-21 10:59:08.452966-06	33	Level object (33)	2	[{"changed": {"fields": ["position"]}}]	7	1
382	2019-10-21 10:59:20.943364-06	36	Level object (36)	2	[{"changed": {"fields": ["position"]}}]	7	1
383	2019-10-21 11:13:02.280869-06	21	Level object (21)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
384	2019-10-21 11:13:22.950973-06	22	Level object (22)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
385	2019-10-21 11:13:49.315098-06	32	Level object (32)	2	[{"changed": {"fields": ["position"]}}]	7	1
386	2019-10-21 11:13:59.335426-06	31	Level object (31)	2	[{"changed": {"fields": ["position"]}}]	7	1
387	2019-10-21 11:14:05.890411-06	33	Level object (33)	2	[{"changed": {"fields": ["position"]}}]	7	1
388	2019-10-21 11:14:15.514693-06	36	Level object (36)	2	[{"changed": {"fields": ["position"]}}]	7	1
389	2019-10-21 11:15:03.079645-06	31	Level object (31)	2	[{"changed": {"fields": ["position"]}}]	7	1
390	2019-10-21 11:15:12.184768-06	32	Level object (32)	2	[{"changed": {"fields": ["position"]}}]	7	1
391	2019-10-21 11:58:04.644357-06	38	Level object (38)	3		7	1
392	2019-10-21 11:58:14.850105-06	31	Level object (31)	2	[{"changed": {"fields": ["position"]}}]	7	1
393	2019-10-21 12:49:48.710377-06	22	Level object (22)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
394	2019-10-21 12:49:57.17645-06	21	Level object (21)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
395	2019-10-21 12:55:06.242294-06	21	Level object (21)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
396	2019-10-21 12:55:15.037181-06	22	Level object (22)	2	[{"changed": {"fields": ["pageNum"]}}]	7	1
397	2019-10-21 13:01:41.816847-06	45	Level object (45)	3		7	1
398	2019-10-21 13:01:41.914176-06	44	Level object (44)	3		7	1
399	2019-10-21 13:01:41.926732-06	43	Level object (43)	3		7	1
400	2019-10-21 13:01:41.94068-06	42	Level object (42)	3		7	1
401	2019-10-21 13:01:41.990338-06	41	Level object (41)	3		7	1
402	2019-10-21 13:01:42.018493-06	40	Level object (40)	3		7	1
403	2019-10-21 13:01:42.034037-06	39	Level object (39)	3		7	1
404	2019-10-21 13:02:05.24936-06	32	Level object (32)	2	[{"changed": {"fields": ["position"]}}]	7	1
405	2019-10-21 13:02:13.762141-06	33	Level object (33)	2	[{"changed": {"fields": ["position"]}}]	7	1
406	2019-10-21 13:02:24.490772-06	33	Level object (33)	2	[{"changed": {"fields": ["position"]}}]	7	1
407	2019-10-21 13:02:33.735669-06	36	Level object (36)	2	[{"changed": {"fields": ["position"]}}]	7	1
408	2019-10-23 16:33:10.83604-06	51	Level object (51)	2	[{"changed": {"fields": ["title"]}}]	7	1
409	2019-10-23 16:36:17.703517-06	51	Level object (51)	2	[{"changed": {"fields": ["title"]}}]	7	1
410	2019-10-23 16:36:54.44596-06	51	Level object (51)	2	[{"changed": {"fields": ["title"]}}]	7	1
411	2019-10-23 16:37:46.371698-06	51	Level object (51)	2	[{"changed": {"fields": ["title"]}}]	7	1
412	2019-10-23 16:39:38.886836-06	104	Para object (104)	2	[{"changed": {"fields": ["content"]}}]	9	1
413	2019-10-23 16:40:51.162215-06	104	Para object (104)	2	[]	9	1
414	2019-10-23 16:42:41.501718-06	104	Para object (104)	2	[{"changed": {"fields": ["content"]}}]	9	1
415	2019-10-23 16:43:03.278663-06	104	Para object (104)	2	[{"changed": {"fields": ["content"]}}]	9	1
416	2019-11-01 11:32:14.997076-06	22	Level object (22)	2	[{"changed": {"fields": ["position"]}}]	7	1
417	2019-11-05 13:14:55.162824-07	32	Level object (32)	2	[{"changed": {"fields": ["parent"]}}]	7	1
418	2019-11-06 14:06:35.703892-07	1	RootLevel object (1)	1	[{"added": {}}]	13	1
419	2019-11-06 14:06:59.84823-07	1	Level object (1)	2	[{"changed": {"fields": ["root"]}}]	7	1
420	2019-12-31 17:04:43.725109-07	104	Para object (104)	2	[{"changed": {"fields": ["content"]}}]	9	1
421	2019-12-31 17:05:09.287432-07	102	Para object (102)	2	[{"changed": {"fields": ["content"]}}]	9	1
422	2019-12-31 17:05:21.665987-07	99	Para object (99)	2	[{"changed": {"fields": ["content"]}}]	9	1
423	2019-12-31 17:05:55.915248-07	91	Para object (91)	2	[{"changed": {"fields": ["content"]}}]	9	1
424	2019-12-31 17:06:25.401581-07	75	Para object (75)	2	[{"changed": {"fields": ["content"]}}]	9	1
425	2019-12-31 17:06:41.637124-07	68	Para object (68)	2	[{"changed": {"fields": ["content"]}}]	9	1
426	2019-12-31 17:06:58.454268-07	66	Para object (66)	2	[{"changed": {"fields": ["content"]}}]	9	1
427	2019-12-31 17:07:17.750329-07	59	Para object (59)	2	[{"changed": {"fields": ["content"]}}]	9	1
428	2019-12-31 17:07:40.187855-07	52	Para object (52)	2	[{"changed": {"fields": ["content"]}}]	9	1
429	2019-12-31 17:07:55.891209-07	100	Para object (100)	2	[{"changed": {"fields": ["content"]}}]	9	1
430	2019-12-31 17:08:10.228339-07	92	Para object (92)	2	[{"changed": {"fields": ["content"]}}]	9	1
431	2019-12-31 17:08:29.066612-07	69	Para object (69)	2	[{"changed": {"fields": ["content"]}}]	9	1
432	2019-12-31 17:08:50.035303-07	67	Para object (67)	2	[{"changed": {"fields": ["content"]}}]	9	1
433	2019-12-31 17:10:22.740169-07	60	Para object (60)	2	[{"changed": {"fields": ["content"]}}]	9	1
434	2019-12-31 17:10:57.404608-07	53	Para object (53)	2	[{"changed": {"fields": ["content"]}}]	9	1
435	2019-12-31 17:11:14.524662-07	105	Para object (105)	2	[{"changed": {"fields": ["content"]}}]	9	1
436	2019-12-31 17:11:33.580574-07	103	Para object (103)	2	[{"changed": {"fields": ["content"]}}]	9	1
437	2019-12-31 17:12:54.399615-07	93	Para object (93)	2	[{"changed": {"fields": ["content"]}}]	9	1
438	2019-12-31 17:13:22.731328-07	70	Para object (70)	2	[{"changed": {"fields": ["content"]}}]	9	1
439	2019-12-31 17:13:46.383913-07	61	Para object (61)	2	[{"changed": {"fields": ["content"]}}]	9	1
440	2019-12-31 17:14:13.593399-07	54	Para object (54)	2	[{"changed": {"fields": ["content"]}}]	9	1
441	2019-12-31 17:14:33.517669-07	101	Para object (101)	2	[{"changed": {"fields": ["content"]}}]	9	1
442	2019-12-31 17:14:54.75894-07	94	Para object (94)	2	[{"changed": {"fields": ["content"]}}]	9	1
443	2019-12-31 17:15:09.708097-07	71	Para object (71)	2	[{"changed": {"fields": ["content"]}}]	9	1
444	2019-12-31 17:16:19.159736-07	62	Para object (62)	2	[{"changed": {"fields": ["content"]}}]	9	1
445	2019-12-31 17:16:38.545263-07	55	Para object (55)	2	[{"changed": {"fields": ["content"]}}]	9	1
446	2019-12-31 17:16:53.650124-07	98	Para object (98)	2	[{"changed": {"fields": ["content"]}}]	9	1
447	2019-12-31 17:17:12.687493-07	95	Para object (95)	2	[{"changed": {"fields": ["content"]}}]	9	1
448	2019-12-31 17:17:32.169679-07	72	Para object (72)	2	[{"changed": {"fields": ["content"]}}]	9	1
449	2019-12-31 17:17:45.214918-07	63	Para object (63)	2	[{"changed": {"fields": ["content"]}}]	9	1
450	2019-12-31 17:18:00.203924-07	56	Para object (56)	2	[{"changed": {"fields": ["content"]}}]	9	1
451	2019-12-31 17:20:32.122694-07	96	Para object (96)	2	[{"changed": {"fields": ["content"]}}]	9	1
452	2019-12-31 17:20:52.540987-07	73	Para object (73)	2	[{"changed": {"fields": ["content"]}}]	9	1
453	2019-12-31 17:21:07.395751-07	64	Para object (64)	2	[{"changed": {"fields": ["content"]}}]	9	1
454	2019-12-31 17:21:22.561156-07	57	Para object (57)	2	[{"changed": {"fields": ["content"]}}]	9	1
455	2019-12-31 17:21:38.29165-07	74	Para object (74)	2	[{"changed": {"fields": ["content"]}}]	9	1
456	2019-12-31 17:21:57.386197-07	65	Para object (65)	2	[{"changed": {"fields": ["content"]}}]	9	1
457	2019-12-31 17:22:17.110793-07	58	Para object (58)	2	[{"changed": {"fields": ["content"]}}]	9	1
458	2019-12-31 17:22:31.931776-07	106	Para object (106)	2	[{"changed": {"fields": ["content"]}}]	9	1
459	2020-01-13 12:38:07.95932-07	70	Level object (70)	3		7	1
460	2020-01-13 12:38:08.020769-07	71	Level object (71)	3		7	1
461	2020-01-13 12:38:08.045451-07	72	Level object (72)	3		7	1
462	2020-01-13 12:38:08.051144-07	73	Level object (73)	3		7	1
463	2020-01-13 12:38:08.05759-07	74	Level object (74)	3		7	1
464	2020-01-13 12:39:31.712758-07	75	Level object (75)	3		7	1
465	2020-01-15 13:24:17.434998-07	78	Level object (78)	3		7	1
466	2020-01-15 13:24:40.417019-07	76	Level object (76)	3		7	1
467	2020-01-15 13:24:52.39448-07	77	Level object (77)	3		7	1
468	2020-01-20 15:36:08.141244-07	7	Person object (7)	1	[{"added": {}}]	8	1
469	2020-01-20 15:36:17.570694-07	2	RootLevel object (2)	1	[{"added": {}}]	13	1
470	2020-01-20 15:37:01.072663-07	83	Level object (83)	1	[{"added": {}}]	7	1
471	2020-02-10 12:50:48.787133-07	28	Level object (28)	2	[{"changed": {"fields": ["position"]}}]	7	1
472	2020-02-14 13:42:36.083599-07	1	RootLevel object (1)	2	[{"changed": {"fields": ["glossary", "symbol_index", "author_index"]}}]	13	1
473	2020-02-14 13:42:44.52029-07	2	RootLevel object (2)	2	[{"changed": {"fields": ["glossary", "symbol_index", "author_index"]}}]	13	1
474	2020-02-14 13:42:52.961307-07	3	RootLevel object (3)	2	[{"changed": {"fields": ["glossary", "symbol_index", "author_index"]}}]	13	1
475	2020-02-14 13:43:01.08996-07	4	RootLevel object (4)	2	[{"changed": {"fields": ["glossary", "symbol_index", "author_index"]}}]	13	1
476	2020-02-14 13:48:26.376742-07	1	RootLevel object (1)	2	[{"changed": {"fields": ["glossary"]}}]	13	1
477	2020-02-26 12:04:21.73336-07	1	RootLevel object (1)	2	[{"changed": {"fields": ["glossary"]}}]	13	1
478	2020-03-02 12:35:33.856953-07	1	RootLevel object (1)	2	[{"changed": {"fields": ["glossary", "symbol_index", "author_index"]}}]	13	1
479	2020-03-02 12:35:56.199635-07	2	RootLevel object (2)	2	[{"changed": {"fields": ["glossary", "symbol_index", "author_index"]}}]	13	1
480	2020-03-02 12:36:04.382167-07	3	RootLevel object (3)	2	[{"changed": {"fields": ["glossary", "symbol_index", "author_index"]}}]	13	1
481	2020-03-02 16:17:08.328845-07	1	RootLevel object (1)	2	[{"changed": {"fields": ["glossary"]}}]	13	1
482	2020-03-02 17:22:41.139741-07	1	RootLevel object (1)	2	[{"changed": {"fields": ["glossary"]}}]	13	1
483	2020-03-02 19:03:03.072101-07	1	RootLevel object (1)	2	[{"changed": {"fields": ["glossary"]}}]	13	1
484	2020-03-02 19:18:39.608143-07	1	RootLevel object (1)	2	[{"changed": {"fields": ["glossary"]}}]	13	1
485	2020-03-28 10:02:00.137262-06	1	RootLevel object (1)	2	[]	13	1
492	2020-06-14 14:10:33.098406-06	17	RootLevel object (17)	2	[{"changed": {"fields": ["new_command"]}}]	13	1
493	2020-06-14 14:10:40.954429-06	2	RootLevel object (2)	2	[{"changed": {"fields": ["new_command"]}}]	13	1
494	2020-06-14 14:10:47.636963-06	1	RootLevel object (1)	2	[{"changed": {"fields": ["new_command"]}}]	13	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
12	presentation	externallink
11	presentation	internallink
7	presentation	level
10	presentation	mathdisplay
9	presentation	para
8	presentation	person
13	presentation	rootlevel
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-07-12 12:46:02.580133-06
2	auth	0001_initial	2019-07-12 12:46:02.620078-06
3	admin	0001_initial	2019-07-12 12:46:02.677782-06
4	admin	0002_logentry_remove_auto_add	2019-07-12 12:46:02.693173-06
5	admin	0003_logentry_add_action_flag_choices	2019-07-12 12:46:02.702098-06
6	contenttypes	0002_remove_content_type_name	2019-07-12 12:46:02.722562-06
7	auth	0002_alter_permission_name_max_length	2019-07-12 12:46:02.728064-06
8	auth	0003_alter_user_email_max_length	2019-07-12 12:46:02.739623-06
9	auth	0004_alter_user_username_opts	2019-07-12 12:46:02.748452-06
10	auth	0005_alter_user_last_login_null	2019-07-12 12:46:02.757985-06
11	auth	0006_require_contenttypes_0002	2019-07-12 12:46:02.759867-06
12	auth	0007_alter_validators_add_error_messages	2019-07-12 12:46:02.768024-06
13	auth	0008_alter_user_username_max_length	2019-07-12 12:46:02.781183-06
14	auth	0009_alter_user_last_name_max_length	2019-07-12 12:46:02.79147-06
15	auth	0010_alter_group_name_max_length	2019-07-12 12:46:02.800199-06
16	auth	0011_update_proxy_permissions	2019-07-12 12:46:02.809376-06
18	sessions	0001_initial	2019-07-12 12:46:02.910974-06
17	presentation	0001_initial	2019-07-12 12:46:02.874633-06
19	presentation	0002_level_pagenum	2019-07-15 13:35:03.251763-06
20	presentation	0003_auto_20190715_1336	2019-07-15 13:36:55.30088-06
21	presentation	0004_auto_20190715_1338	2019-07-15 13:38:03.19968-06
22	presentation	0005_auto_20190718_1424	2019-07-18 14:25:02.846813-06
23	presentation	0006_auto_20190801_1505	2019-08-01 15:05:52.465998-06
24	presentation	0007_auto_20190823_1441	2019-08-23 14:49:28.839617-06
25	presentation	0008_auto_20190823_1443	2019-08-23 14:49:28.88177-06
26	presentation	0009_remove_para_content1	2019-08-23 14:49:28.891657-06
27	presentation	0010_auto_20190823_1450	2019-08-23 14:50:14.199133-06
28	presentation	0011_remove_para_para_type	2019-08-23 14:56:00.507491-06
29	presentation	0012_auto_20190903_1137	2019-09-03 11:38:05.467242-06
30	presentation	0002_auto_20190916_1134	2019-09-16 11:34:11.139763-06
31	presentation	0003_auto_20191016_1209	2019-10-16 12:09:54.255375-06
32	presentation	0004_auto_20191016_1215	2019-10-16 12:15:48.740354-06
33	presentation	0005_auto_20191022_1322	2019-10-22 13:22:57.636587-06
34	presentation	0006_auto_20191031_1309	2019-10-31 13:10:08.9341-06
35	presentation	0007_auto_20191106_1400	2019-11-06 14:00:27.232794-07
36	presentation	0008_auto_20191106_1405	2019-11-06 14:05:11.424688-07
37	presentation	0009_auto_20191106_1405	2019-11-06 14:05:52.255231-07
38	presentation	0010_auto_20191107_1119	2019-11-07 11:20:06.296679-07
39	presentation	0011_auto_20191231_1334	2019-12-31 13:34:09.607887-07
40	presentation	0012_auto_20200106_1150	2020-01-06 12:05:47.199044-07
41	presentation	0013_auto_20200106_1205	2020-01-06 12:05:47.214228-07
42	presentation	0014_auto_20200110_1204	2020-01-13 12:40:54.390465-07
43	presentation	0015_auto_20200113_1240	2020-01-13 12:40:54.407976-07
44	presentation	0015_auto_20200213_2140	2020-02-14 13:13:21.402976-07
45	presentation	0016_auto_20200213_2140	2020-02-14 13:13:21.434645-07
46	presentation	0017_auto_20200213_2202	2020-02-14 13:13:21.447284-07
47	presentation	0018_auto_20200309_1108	2020-03-09 11:08:55.91387-06
48	presentation	0019_auto_20200311_0945	2020-03-27 21:19:41.357084-06
54	presentation	0025_auto_20200614_1404	2020-06-14 14:12:45.678343-06
49	presentation	0020_auto_20200518_1156	2020-05-23 15:43:01.424426-06
50	presentation	0021_auto_20200518_1157	2020-05-23 15:43:01.452217-06
51	presentation	0022_auto_20200523_1531	2020-05-23 15:43:01.474688-06
52	presentation	0023_auto_20200523_1542	2020-05-23 15:43:01.498271-06
53	presentation	0024_auto_20200523_1545	2020-05-23 15:45:47.311661-06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
rdz9o7k2uekv8hkihlfpywre5emnp6cz	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2019-07-26 12:46:58.753973-06
8539eehje8l32073c6jo7wywnpxit2mh	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2019-08-12 14:24:07.271503-06
6fgmgvpi05cy4yo3m5a91ws4lgbdhoxy	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2019-08-26 15:19:40.64501-06
kjy919mkl3wngvr2db4fvpk8w68gxrnz	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2019-09-10 15:03:08.869941-06
x55hh8xkx8i0glmjwt3icvqynmnriwn6	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2019-10-01 11:13:39.072477-06
rk5gh5myimthodbmb55yxqybb1wvt707	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2019-10-21 14:03:26.221249-06
9yeuunbujvno55mdq7ytb9rpa02cpznn	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2019-11-04 15:14:42.981999-07
548wvndpdaj6ph138h513xbs5p5i9tse	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2019-11-19 13:08:36.252864-07
4ol9d0u57xt3z3u48ag0zps5wwla8mor	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-01-14 13:34:23.434463-07
7zhpc45q8g3etvdwtqqr6lhtgojbhdet	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-01-20 12:05:54.992577-07
zc8sdab5gjmavwb87m05wbq6cbaqv8ll	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-02-03 15:34:08.032622-07
syqshtje0l7nr7jtl9vfu2on3lnjaxkn	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-02-24 12:50:38.611677-07
inwnc2o23nom7gvca8jdov0vjgoyg517	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-03-11 12:14:33.514977-06
o5s4r7hov2salgljxz6rwmk5474xa6mc	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-04-10 21:19:55.901157-06
iymyaypu5sb91pu5dlw88base5myf8el	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-05-23 16:28:41.559618-06
34pne9zistnp7a5uax4jgmjeohv2jvi8	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-06-07 18:42:00.897964-06
7q75x0cl0t32ifpos3c0k079ulzfa7pi	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-06-17 12:55:38.989976-06
1facdjpkwyy3juatmogdmz6y1gvp92mx	OWY4ZDAyY2JjZWJkYWI1Y2Q0YWU4OTM5ZjY1MzY5MzY0YjE1MWQ2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNzRhMjNhZDM2ZjU0ZmViNmYzNjg5MTFlYWRlMTc0OTJjMzg3MGU1In0=	2020-07-11 20:01:52.269122-06
\.


--
-- Data for Name: presentation_externallink; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.presentation_externallink (id, content, url, target, parent_e_id_id) FROM stdin;
\.


--
-- Data for Name: presentation_level; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.presentation_level (id, "position", "isPage", title, "tocTitle", unit_type, lft, rght, tree_id, level, parent_id, "pageNum", root_id) FROM stdin;
96	3	f	<math>2^2</math>	Theorem	\N	30	31	2	3	33	\N	\N
67	1	f	node1	node1	\N	35	38	2	2	3	\N	\N
3	3	f	Determinants and a Second Encounter with Spaces and Linear Maps	Determinants and a Second Encounter with Spaces and Linear Maps	part	26	41	2	1	1	\N	\N
1	0	f	Linear Algebra in Rn	Linear Algebra in Rn	Book	1	44	2	0	\N	\N	1
4	1	t	Linear Algebra in ℝn	Introduction	intro	12	13	2	1	1	1	\N
31	0	t	Higher Dimensions and the Vector Space ℝn -- Introduction	Introduction	section	16	17	2	3	5	2	\N
32	1	t	The Space ℝn: Points and Coordinates	Points and Coordinates	section	18	19	2	3	5	3	\N
36	3	t	Equations in Several Variables	Equations in Several Variables	section	20	21	2	3	5	4	\N
46	4	t	Distance between Points	Distance between Points	section	22	23	2	3	5	5	\N
83	0	f	A Preserved Book	\N	book	1	2	1	0	\N	\N	2
21	0	t	Double the Pennies	Double the Pennies	eg	3	6	2	2	28	-1	\N
22	1	t	Brake Distance Depends in a Quadratic Way on Speed	Brake Distance Depends in a Quadratic Way on Speed	eg	7	10	2	2	28	0	\N
29	7	f	\N	\N	text	4	5	2	3	21	\N	\N
27	7	f	\N	\N	text	8	9	2	3	22	\N	\N
28	-1	f	Appendix	Appendix	part	2	11	2	1	1	\N	\N
5	1	f	Higher Dimensions and the Vector Space ℝn	Higher Dimensions and the Vector Space ℝn	chapter	15	24	2	2	2	\N	\N
2	2	f	The Vector Space ℝn	The Vector Space ℝn	Part	14	25	2	1	1	0	\N
50	1	f	Product of   ℝm and ℝn	Definition	definition	28	29	2	3	33	\N	\N
95	3	f	<math>\\mathbb{R}^m\\times \\mathbb{R}^n = \\mathbb{R}^{m+n}</math>	Proposition	\N	32	33	2	3	33	\N	\N
68	2	f	node2	node2	\N	39	40	2	2	3	\N	\N
99	-1	f	Repository of Singleton	Repository of Singleton	\N	2	3	3	1	98	\N	\N
98	2	f	test5	test1	\N	1	4	3	0	\N	\N	17
33	0	t	Cartesian Products of Subsets of n-Space	Cartesian Products of Subsets of n-Space	section	27	34	2	2	3	6	\N
69	0	t	test	test	\N	36	37	2	3	67	7	\N
71	4	t	new chap	new chap	\N	42	43	2	1	1	8	\N
\.


--
-- Data for Name: presentation_para; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.presentation_para (id, content, "position", para_parent_id) FROM stdin;
102	{"data": "The (cartesian) product of ℝm and ℝn is ℝm×ℝn, defined as the set of all ordered (m+n)-tuples of the form"}	0	50
100	{"data": "To get started, let's recall the set <iLink>ℝ of real numbers.</iLink> Geometrically, real numbers correspond to the points on a line, a 1-dimensional object. Similarly, you have already seen how a pair of real numbers corresponds to a point in a plane, a 2-dimensional object, and a triple of three numbers may be used to describe the location of a point in space surrounding us, which has dimension 3. Here we take these associations a big step forward: we introduce spaces of arbitrarily many dimensions, and these spaces will form our primary work environment. The key constituent in any of these spaces is an ordered n-tuple of numbers, which we think of as a point:"}	1	32
71	{"data": "Oooopss!%20%E2%80%93%20Those%20numbers%20of%20pennies%20start%20out%20small.%20But%20they%20sure%20grow%20rapidly!%20So%20you%20see%20that,%20on%20the%2014-th%20day%20alone,%20you%E2%80%99d%20pay%20your%20prof%20back%20everything%20(s)he%20gave%20you,%20plus%20you'd%20be%20handing%20over%20an%20additional%20$63.84."}	3	21
101	{"data": "We justify the notation ℝn by relating it to the set theoretic product operation to the effect that ℝn=ℝ×⋯×ℝ←n→. For now, this section merely serves to present the set theoretic perspective underlying the formation of the space ℝn. It may be skipped on a first reading."}	3	33
94	{"data": "In popular literature some mystery surrounds the concept of 4-dimensional and even higher dimensional spaces. Let us say for now: such spaces exist. Once we learn how to identify them, we find them all around us, and we use them all the time. – So why are they mysterious? They are pushed into mystery because they are <iLink> not accessible to our visual sense</iLink>!"}	3	31
55	{"data": "Such examples demonstrate how easy it is to comprehend linear relationships and to work with them. In contrast, non-linear relationships can be counter-intuitive and much harder to work with. – For an example of the counter intuitive nature of non linear relationships I'll offer you a deal:"}	3	4
56	{"data": "I give you $100 today, if over the next 14 days you agree to give me 1 penny today, 2 pennies tomorrow, and on each day double the number of pennies of the day before. –<iLink id = '21'> Does this sound like a good deal to you?</iLink>"}	4	4
57	{"data": "So far for a first encounter with ‘linear’ vs. ‘nonlinear’. In this introductory ebook on Linear Algebra we will encounter"}	5	4
58	{"data": "<ol><li>Vector spaces: the envirodnment within which linear processes can be described</li><li>Systems of linear equations, and methods for solving them</li><li>Matrices as a vast extension of the system of real numbers</li><li>Linear transformations andd their relationship to matrices</li><li>Determinants and their relationship to oriented volume</li></ol>"}	6	4
69	{"data": "On%20the%20surface%20this%20sounds%20like%20a%20great%20deal:%20collect%20$100%20while%20only%20having%20to%20pay%20a%20few%20pennies%20back%20for%20each%20of%20the%20next%2014%20days.%20But%20before%20committing%20to%20such%20a%20deal,%20perhaps%20it%20is%20better%20to%20work%20out%20carefully%20what%20actually%20happens%20here.CKVBKHJASBV"}	1	21
91	{"data": "In this chapter we will introduce our work environment: for each integer n≥0 a ‘straight’ and ‘endless’ space, denoted ℝn. The integer n is the dimension the space. A point in ℝn is given by n numbers x1,…,xn, written in order as (x1,…,xn). We will study in detail how to use such points to describe objects like lines and planes in ℝn. We will learn how to move such objects around and how to change their shape. We will learn general rules on how to compute with such points."}	0	31
75	{"data": "Beware of debt: interest is compounded, and this leads to exponential growth of debt if no payments are being made – The same kind of ‘gotcha’ as the example above."}	0	29
68	{"data": "So, what was this deal again? – Your prof offers you $100 today if you agree to pay 1 penny today, 2 pennies tomorrow, 4 pennies the following day, etc. for the next 14 days."}	0	21
66	{"data": "assume that brake distance depends linearly on speed. – Question: Given that it takes .5m to bring the car to a full stop from an initial speed of 10km/h, what would the brake distance be from an initial speed of 80km/h?"}	0	27
99	{"data": "Here%20we%20introduce%20our%20work%20environment:%20for%20each%20of%20the%20numbers%20n,%20with%20n%20one%20of%200,1,2,%E2%80%A6,%20a%20space,%20denoted%20%E2%84%9Dn.%20It%20consists%20of%20all%20ordered%20n-tuples%20of%20real%20numbers."}	0	32
67	{"data": "100km/h = 8⋅10km/h. So the brake distance should be 8⋅(0.5)=4m – a big difference from the truthful 30m in the above table."}	1	27
60	{"data": "Speed [km/h] Brake Distance [m] table!!!!!!"}	1	22
103	{"data": "<Math>({\\\\color{red} x_1,\\\\dots, x_m},{\\\\color{blue} y_1,\\\\dots, y_n})\\\\quad \\\\text{with}\\\\quad ({\\\\color{red} x_1,\\\\dots, x_m})\\\\ \\\\text{in}\\\\ \\\\mathbb{R}{m}\\\\quad \\\\text{and}\\\\quad ({\\\\color{blue} y_1,\\\\dots, y_n})\\\\ \\\\text{in}\\\\ \\\\mathbb{R}{n}</Math>"}	2	50
93	{"data": "!!!!!!!!!!this is a list!!!!!!!!!. A single point is a 0-dimensional space, as it permits no motion inside of it at all. A line or a curve are 1-dimensional spaces: inside of it, at each of its points, there is exactly one direction of motion. It could be called <iLink>forward-backward</iLink>. A plane or a surface are 2-dimensional spaces: inside of it, at each of its points, there are exactly two independent directions of motion. These could be called <iLink>forward-backward and left-right.</iLink> Every other direction of motion can be combined from these two. The space surrounding us is 3-dimensional: inside of it, at each of its points, there are exactly three independent directions of motion. These could be called forward-backward, left-right, and up-down. Every other direction of motion can be combined from these three."}	2	31
61	{"data": "Now%20let%20us%20observe%20the%20following:"}	2	22
141	{"data": "%3CiLink%3EProof%3C/iLink%3E%3CiLink%3Elink2%3C/iLink%3E%3CiLink%3Elink3%3C/iLink%3E"}	1	95
62	{"data": "!!!!!THIS IS A LIST!!!!While a speed of 20km/h is 2⋅10km/h, the brake distance went up by a factor of <math>4=2^2</math>. !! While a speed of 30km/h is 3⋅10km/h, the brake distance went up by a factor of <math>9=3^2</math>. !!While a speed of 40km/h is 4⋅10km/h, the brake distance went up by a factor of <math>16=4^2</math>.!!!etc."}	3	22
63	{"data": "We may summarize this observation as follows: if the brake distance at speed s[km/h] equals d[m], then"}	4	22
73	{"data": "number of pennies paid on day k = <math> 2^k </math> "}	5	21
64	{"data": "the brake distance at speed <math>(k\\\\cdot s)</math>[km/h] equals <math>(k^2 \\\\cdot d)</math>[m]."}	5	22
74	{"data": "For another impression of ‘exponential growth’, work out what happens if you let the penny doubling return scheme run for 21 days instead of for 14."}	6	21
65	{"data": "Thus the brake distance is in a square, or a quadratic, relationship with the initial speed."}	6	22
98	{"data": "One fundamental concern of mathematics is the study of equations and their solutions. Here we introduce equations in n variables (also: unknowns), and we explain how such equations can be used to define certain objects in ℝn."}	4	36
96	{"data": " !!!THIS IS A LIST!!!! We begin by introducing the concept of <iLink>n-tuple of numbers</iLink>. The collection of all n-tuples is the <iLink>space ℝn</iLink>. We then use the product operation on sets to see that <math>\\\\StPrdct{ \\\\RNrSpc{m} }{ \\\\RNrSpc{n} } = \\\\RNrSpc{m+n}</math> !!! We introduce a notion of distance between two points P and Q in ℝn. <iLink>It is based on the Theorem of Pythagoras.</iLink> !!! To be able to make a transition from one point P to another Q, we introduce the arrow <math>\\\\Arrow{P}{Q}</math>. It has the point P at its tail and the point Q at its tip. The length of <math>\\\\Arrow{P}{Q}</math> is the distance between P and Q. !!! An arrow is determined by its tail point, its direction, and its length. A vector consists of all arrows of given direction and length. It is sometimes convenient to think of a vector as an arrow that is allowed to ‘float freely’ while not changing its length nor its direction. We may <iLink>describe a vector</iLink> using a coordinate n-tuple. Thus a coordinate n-tuple now serves two purposes: (a) locate a point and, (b) describe a vector. We explain how these two purposes are related. !!! Next we explain how two vectors can be <iLink>added</iLink>, and how a <iLink>vector is multiplied by a number</iLink>. These operations extend the rules for adding and multiplying numbers to vectors. !!! A vector is determined by its direction and its length. By virtue of these properties vectors lend themselves to modeling any real life quantity that is determined by its direction and its magnitude. Here are some examples:<ol> <li>Shifting (translating) an object from one place to another (without rotating it in the process) moves each point of the object in the same direction by the same distance. Therefore, we may use a vector to describe this translation.</li><li>A ‘force’ is determined by the direction in which it acts and its magnitude. Therefore, we may use a vector to represent this force.</li><li>The ‘velocity’ of a moving object is given by the direction of the motion and its speed. Therefore, we may use a vector to represent this velocity.</ol> As an application, we offer an introduction to linear motions, that is a point shaped particle moving along a line with constant speed."}	5	31
130	{"data": "%3CMath%20inline=%22true%22%3E%5Cnewcommand%7B%5CMtrx%7D%5B1%5D%7B%5Ctexttip%7B#1%7D%7BMatrix%20%5C(%5Csqrt%7B2%7D%5C)%7D%7D%3C/Math%3E%0A%0A%0A%3CMath%20inline=%22true%22%3E%5CMtrx%7BA%7D%20=%20%5Ctexttip%7Bm%7D%7Bmass%7D%20%5Cmathtip%7Ba%7D%7Ba%20=%20%5Cfrac%7Bdv%7D%7Bdt%7D%7D%3C/Math%3E%20%0A%0A%3CiLink%20id=%22%22%3EJHVJVJV%3C/iLink%3E%20%20%0A%20%20%0A%20%20%20%09%20%20%0A%3Cimg%20src=%22https://drive.google.com/uc?id=1K1mpP3g46txT33LhBiWfYRXjxDa4_M4p%22/%3E%20%0A%0A%20%20%0A%20%3Cb%3Ebjjbj%3C/b%3E%20%20%3Ci%3Ebberbejvb%3C/i%3E%20%0A%0A"}	1	69
59	{"data": "The%20distance%20which%20a%20car%20travels%20while%20brakes%20are%20being%20applied%20during%20an%20emergency%20breaking%20maneuver%20depends%20upon%20the%20initial%20speed%20and%20a%20number%20of%20environmental%20conditions%20such%20as%20road,%20tires,%20brake%20force,%20etc.%20Let%20us%20assume%20that%20these%20environmental%20conditions%20remain%20unchanged%20throughout%20while%20the%20following%20data%20were%20collected.%0A%0A%0A%0A"}	0	22
72	{"data": "This%20is%20an%20example%20of%20exponential%20growth,%20a%20%E2%80%98gotcha%E2%80%99%20in%20many%20ways:%0A%0A%3CMath%20inline=%22true%22%3E%5CSum%7BA%7D%7BB%7D%3C/Math%3E%20%0A"}	4	21
106	{"data": "%5C%5C"}	7	4
95	{"data": "Let%20us%20now%20outline%20the%20essence%20of%20this%20introductory%20chapter%20to%20the%20vector%20space%20%E2%84%9Dn.%0A"}	4	31
70	{"data": "days%20and%20pennies%20table%20!!!!!!!%0A%0A%3CMath%20inline=%22true%22%3E%5CSum%7BG%7D%7BB%7D%3C/Math%3E%20%0A%0A"}	2	21
53	{"data": "Let%20us%20begin%20with%20a%20first%20impression%20of%20the%20distinction%20between%20%E2%80%98linear%E2%80%99%20and%20%E2%80%98non-linear%E2%80%99%20processesadsasdaoa%20.%0A%3CMath%3E%0A%5Cleft%5B%0A%5Cbegin%7Barray%7D%7Brcl%7D%0A5%20&%207%20&%209%20%5C%5C%0A1%20&%202%20&%203%20%5C%5C%0A%5Cend%7Barray%7D%0A%5Cright%5D%0A%3C/Math%3E%20"}	1	4
52	{"data": "This%20ebook%20covers%20basic%20topics%20of%20linear%20algebra.%20It%20deals%20with%20vector%20spaces,%20their%20subspaces%20and%20linear%20transformations%20between%20them.%20We%20emphasize%20a%20geometric/visual%20view%20of%20the%20subject%20which%20makes%20it%20particularly%20useful%20for%20science%20and%20engineering%20students.%20Beyond%20our%20immediate%20concerns,%20we%20also%20provide%20a%20good%20foundations%20for%20multivariable%20differential%20calculus%20and%20its%20applications,%20in%20particular%20certain%20aspects%20of%20differential%20equations%20and%20differential%20geometry.%20%E2%80%93%20Background%20knowledge%20assumed%20of%20a%20reader%20is%20very%20modest:%20basic%20algebra%20and%20knowledge%20of%20trigonometric%20functions.%20"}	0	4
92	{"data": "Let%20us%20take%20an%20intuitive%20look%20at%20%3Cb%3Ethe%20dimension%20concept%3C/b%3E%20For%20a%20natural%20number%20n,%20a%20space%20is%20called%20n-dimensional%20if,%20at%20each%20of%20its%20points,%20it%20permits%20exactly%20n%20independent%20directions%20of%20motion%20which%20can%20be%20combined%20to%20reach%20any%20nearby%20point.%20For%20example"}	1	31
107	{"data": "%3Cb%3Efes%3C/b%3E%20"}	0	71
142	{"data": ""}	0	96
143	{"data": "%3CMath%20inline=%22true%22%3E%5CMtrx%7BA%7D%20=%20%5Ctexttip%7Bm%7D%7Bmass%7D%20%5Cmathtip%7Ba%7D%7Ba%20=%20%5Cfrac%7Bdv%7D%7Bdt%7D%7D%3C/Math%3E%20%0A"}	0	46
112	{"data": "%3CMath%3E%0A%5Cxymatrix%7BA%20%5Car@%7B%7D%5Bdr%5D%7C%7B=%7D%20%5Car%5Bd%5D%20%5Car%5Br%5D%20&amp;%20B%20%5Car%5Bd%5D%20%5C%5C%20B%20%5Car%5Br%5D%20&amp;%20C%20%7D%0A%3C/Math%3E%20%0A%3CMath%20inline=%22true%22%3E%0A%5Cxymatrix%7B%20%0A%20%20%20h%5E%7Bk+1%7D(S%5E%7Bn+1%7D,*;c_%7Bf(x)%7D)%0A%20%20%20%20%20%20%5Car%5Bd%5D_%7Bq%5E%7B*%7D%7D%5E%7B%5Ccong%7D%0A%20%20%20%20%20%20%5Car%60r%5Bddd%5D%20%60%5Bddd%5D%5E%7B%5Cgamma%7D_%7B%5Ccong%7D%20%5Bddd%5D%0A%5C%5C%0A%20%20%20h%5E%7Bk+1%7D(D%5E%7Bn+1%7D,S%5E%7Bn%7D;c_%7Bf(x)%7D)%0A%5C%5C%0A%20%20%20h%5E%7Bk%7D(S%5E%7Bn%7D;c_%7Bf(x)%7D)%0A%20%20%20%20%20%20%5Car%5Bu%5D%5E%7B%5Cdelta%7D%0A%5C%5C%0A%20%20%20h%5E%7Bk%7D(S%5E%7Bn%7D,*;c_%7Bf(x)%7D)%20%0A%20%20%20%20%20%20%5Car%5Bu%5D%5E%7Bi%5E%7B*%7D%7D%0A%7D%20%0A%3C/Math%3E%20%20%0A%3CMath%20inline=%22true%22%3E%5CMtrx%7BA%7D%3C/Math%3E%20%0A"}	0	69
54	{"data": "%3Cul%3E%0A%3Cli%3ESuppose%20you%20are%20traveling%20at%20constant%20speed%20of%2080km/h.%20After%20one%20hour%20you%20will%20have%20covered%20a%20distance%20of%2080km.%20After%202%20hours%20you%20will%20have%20covered%20a%20distance%20of%20160km;%20after%203%20hours%20a%0Adistance%20of%20240km,%20etc.%20%E2%80%93%20Thus%20%E2%80%98time%0Atraveled%E2%80%99%20and%20%E2%80%98distance%20covered%E2%80%99%20are%20in%20a%20linear%20relationship%20%3CMath%3E%5Ctext%7Bdistance%20traveled%20in%20$k$%20hours%7D=k%5Ccdot%5Ctext%7B(distance%20traveled%20in%20$1$%20hour)%7D%3C/Math%3E%3C/li%3E%0A%0A%3Cli%3E%20Suppose%20each%20day%20you%20put%20a%20marble%20into%20some%20bag.%20Then%20you%20know%20that%20after%201%20day%20you%20will%20have%201%20marble,%20after%202%20days%20you%20will%20have%20two%20marbles;%20after%203%20days%20you%20will%20have%203%20marbles%20in%20the%20bag,%20etc.%20%E2%80%93%20This%20is%20an%20example%20of%20a%20linear%20relationship:%20%3CMath%3E%5Ctext%7Bno.of%20marbles%20after%20$k$%20days%20%7D=k%5Ccdot%5Ctext%7B(no.of%20marbles%20after%20$1$%20day)%7D%3C/Math%3E%3C/li%3E%0A%0A%3Cli%3EWhen%20driving%20a%20car,%20let%E2%80%99s%20make%20a%20table%20which%20records%20the%20distance%20it%20takes%20to%20brake%20the%20vehicle%20to%20a%20full%20stop%20from%20a%20given%20speed.%20%E2%80%93%20Such%20a%20table%20%3CiLink%20id=%2222%22%3E%20reveals%20a%20quadratic%20relationship%20%3C/iLink%3Ebetween%20speed%20and%20brake%20distance%20to%20a%20full%20stop.%3C/li%3E%0AIn%20a%20cell%20growth%20experiment%20you%20might%20encounter%20a%20table%20like%20the%20following%0A%3Ctable%3E%0A%3Ctr%3E%3Ctd%3EDay%3C/td%3E%3Ctd%3E1%3C/td%3E%3Ctd%3E2%3C/td%3E%3Ctd%3E3%3C/td%3E%3Ctd%3E4%3C/td%3E%3Ctd%3E5%3C/td%3E%3Ctd%3E6%3C/td%3E%3Ctd%3E7%3C/td%3E%3C/tr%3E%0A%3Ctr%3E%3Ctd%3ECell%0AMass%3C/td%3E%3Ctd%3Em%3C/td%3E%3Ctd%3E2m%3C/td%3E%3Ctd%3E4m%3C/td%3E%3Ctd%3E8m%3C/td%3E%3Ctd%3E16m%3C/td%3E%3Ctd%3E32m%3C/td%3E%3Ctd%3E64m%3C/td%3E%0A%3C/tr%3E%0A%3C/table%3EThis%20corresponds%20to%20a%20substance%20which%20doubles%20itself%20every%20day.%20Thus%20%E2%80%98number%20of%20days%20passed%E2%80%99%20and%20%E2%80%98cell%20mass%E2%80%99%20are%20not%20in%20a%20linear%20relationship%20but%20rather%20in%20an%20exponential%20relationship:%20%3Cp%3Ecell%20mass%0Aon%20day%20k%20=%3CMath%20inline=%22%22%3E2%5E%7Bk-1%7D%5Ccdot%3C/Math%3E(cell%20mass%20on%20day%201)%0A%3C/p%3E%0A%0A%3C/ul%3E%0Afsfjkjfbefhkskjfbsjfbkbf"}	2	4
140	{"data": "For%20all%20m,n%E2%89%A51,%20%3CMath%20inline=%22true%22%3E%5Cmathbb%7BR%7D%5Em%5Ctimes%20%5Cmathbb%7BR%7D%5En%20=%20%5Cmathbb%7BR%7D%5E%7Bm+n%7D%3C/Math%3E."}	0	95
\.


--
-- Data for Name: presentation_person; Type: TABLE DATA; Schema: public; Owner: emath
--

COPY public.presentation_person (id, first_name, middle_name, last_name) FROM stdin;
1	fn1	md1	ln1
2	fn2	\N	ln2
3	fn3	md3	ln3
4	fn4	\N	ln4
5	fn5	\N	ln5
6	fn6	\N	ln6
7	George	\N	Peschke
\.


--
-- Data for Name: presentation_rootlevel; Type: TABLE DATA; Schema: public; Owner: yaozhilu
--

COPY public.presentation_rootlevel (id, html_title, date, author_id, contributor, author_index, index_item, symbol_index, new_command, tex_shortcut) FROM stdin;
2	Preserved Book	2020-01-20	7	\N	{"treeData": {}}	{"treeData": {}}	{"treeData": {}}	{"basicCommand": [{"tex": "\\\\newcommand{\\\\Sum}[2]{#1\\\\oplus #2}", "note": "#1 + #2"}, {"tex": "\\\\newcommand{\\\\SSum}[3]{#1\\\\oplus #2\\\\oplus #3}", "note": "#1 + #2 + #3"}, {"tex": "\\\\newcommand{\\\\FamSum}[2]{\\\\bigoplus_{#1} #2}", "note": "sum over #1 of family #2"}, {"tex": "\\\\newcommand{\\\\Fld}[1]{\\\\mathbb{#1}}", "note": "Field symbol set in mathbb"}]}	{"basicShortcut": [{"tex": "\\\\Defn{ConceptToBeDefined}","note": ""}, {"tex": "\\\\AnglBr{arg1}","note": ""}]}
1	Linear Algebra in Euclidean Space	2019-11-06	1	2	{"treeData": {}}	{"treeData": {"adwa": 102, "test!a": 140, "test!test3": 140, "test!1para!1stindex": 112}}	{"treeData": {}}	{"test.tex": [{"tex": "----------------------------632283438054318015263916\\r\\nContent-Disposition: form-data; name=\\"file\\"; filename=\\"test.tex\\"\\r\\nContent-Type: application/x-tex\\r\\n\\r\\n\\r\\n\\\\newcommand{\\\\Test1}[2]{#1\\\\oplus #2}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% #1 + #2\\r\\n\\r\\n----------------------------632283438054318015263916--\\r\\n", "note": ""}], "Algebra.tex": [{"tex": "----------------------------243398684747659916116864\\r\\nContent-Disposition: form-data; name=\\"file\\"; filename=\\"Algebra.tex\\"\\r\\nContent-Type: application/x-tex\\r\\n\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%\\r\\n%%%%%    Commands file for AMSLATEX\\r\\n%%%%%\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n\\\\newcommand{\\\\Sum}[2]{#1\\\\oplus #2}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% #1 + #2\\r\\n\\\\newcommand{\\\\SSum}[3]{#1\\\\oplus #2\\\\oplus #3}\\t\\t\\t\\t\\t\\t% #1 + #2 + #3\\r\\n\\\\newcommand{\\\\FamSum}[2]{\\\\bigoplus_{#1} #2}\\t\\t\\t\\t\\t\\t% sum over #1 of family #2\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%\\tGroups\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n\\\\newcommand{\\\\DhdrlGrp}[1]{D_{#1}}\\t\\t\\t\\t\\t\\t% Dihedral group order 2(#1)\\r\\n%\\r\\n%\\\\newcommand{\\\\SGrps}[1]{\\\\text{\\\\it SGrps}(#1)}    % subgroups of #1\\r\\n\\\\newcommand{\\\\NSGrps}[1]{\\\\text{\\\\it NSGrps}(#1)}  % normal subgroups of #1\\r\\n\\\\newcommand{\\\\Cmmttr}[2]{\\\\left[#1,#2\\\\right]}\\t% Commutator  [ #1 , #2 ]\\r\\n\\\\newcommand{\\\\CmmtGrp}[2]{\\\\Gamma^{#1}#2}\\t\\t\\t% Commutator subgroup of order #1 in #2\\r\\n\\\\newcommand{\\\\cmmtGrp}[1]{\\\\Gamma^{#1}}\\t\\t\\t\\t% Commutator subgroup functor of order #1\\r\\n\\\\newcommand{\\\\Cnjgtn}[1]{\\\\gamma_{#1}}\\t\\t\\t\\t% Conjugation map to inner automorphism group\\r\\n\\\\newcommand{\\\\Ablnz}[1]{#1_{\\\\text{\\\\it ab}}}\\t% Abelianization of group #1\\t(deprecated)\\r\\n\\\\newcommand{\\\\Ablnztn}{\\\\text{\\\\it ab}}        % Abelianization functor\\r\\n\\\\newcommand{\\\\AblnztnOf}[1]{\\\\text{\\\\it ab}\\\\left(#1\\\\right)}\\t % Abelianization of #1\\r\\n\\\\newcommand{\\\\AbCore}[1]{\\\\mathsf{Ab}(#1)}\\t\\t% AbCore of #1\\r\\n\\\\newcommand{\\\\AbCoreOf}[1]{\\\\text{\\\\it Ab}(#1)}   % AbCore of #1\\r\\n\\\\newcommand{\\\\Nlptfy}[2]{N^{#1}#2}\\t\\t\\t\\t\\t\\t% Nilpotification of order #1 applied to #2\\r\\n\\\\newcommand{\\\\nlptfy}[1]{N^{#1}}\\t\\t\\t\\t\\t\\t\\t% Nilpotification functor\\r\\n\\\\newcommand{\\\\NlptUnt}[2]{\\\\nu^{#1}_{#2}}\\t\\t\\t% Nilpotification unit of order #1 applied to #2\\r\\n\\\\newcommand{\\\\CntrGrp}[1]{\\\\zeta #1}\\t\\t\\t\\t\\t% Center of #1\\r\\n% Group constructs\\r\\n\\\\newcommand{\\\\FrGrp}[1]{F(#1)}\\t\\t\\t\\t\\t\\t% free group on set #1\\r\\n\\\\newcommand{\\\\FrGrpf}[1]{F_{#1}}\\t\\t\\t\\t\\t% free grp on #1 generators\\r\\n\\\\newcommand{\\\\FrPrdct}[2]{#1 * #2}\\t\\t\\t\\t% free product #1 * #2\\r\\n\\\\newcommand{\\\\FamFrPrdct}[2]{*_{#1} #2}\\t% free product: *_{#1}#2\\r\\n\\\\newcommand{\\\\CrssEff}[2]{\\\\text{\\\\it cr}(#1,#2)}\\t% cross effect of #1 and #2\\r\\n\\\\newcommand{\\\\SDPr}[1][]{\\\\rtimes_{#1}}\\t\\t\\t\\t\\t\\t% Semidirect product over #1\\r\\n\\\\newcommand{\\\\SDrctPr}[3]{#2\\\\rtimes_{#1}#3}\\t\\t\\t% Semidirect prdct #2 SPrdct_{#1} #3\\r\\n%\\r\\n\\\\newcommand{\\\\YCExtGrp}[2]{\\\\text{\\\\it YExt}\\\\left( #1,#2\\\\right)}\\t\\t\\t% YExt(#1,#2) central grp extensions\\r\\n\\\\newcommand{\\\\YExtGrp}[3]{\\\\text{\\\\it YExt}_{#1}\\\\left( #2,#3\\\\right)}\\t% YExt_#1(#2,#3) grp extensions\\r\\n%%%%%%%%%%%%%%%%\\r\\n\\\\newcommand{\\\\FrMod}[2]{{#1}[#2]}    \\t\\t% free #1-module over set #2\\r\\n\\\\newcommand{\\\\FrZMod}[1]{{\\\\ZNr}[#1]}\\t\\t\\t% free abelian group over set #1\\r\\n\\\\newcommand{\\\\GrGrp}[1]{\\\\text{\\\\it Gr}(#1)}\\t\\t% Grothendieck group of #1\\r\\n\\\\newcommand{\\\\PicGrp}[1]{\\\\text{\\\\it Pic}(#1)}\\t% Picard Group\\r\\n\\\\newcommand{\\\\StbrgGrp}[1]{\\\\text{\\\\it St}(#1)}\\t% Steinberg Group\\r\\n\\\\newcommand{\\\\StbrgMdl}[1]{\\\\text{\\\\it St}(#1)}\\t% Steinberg module\\r\\n\\\\newcommand{\\\\ElmMtrx}[2]{e_{#1}(#2)}\\t\\t\\t\\t% Elementary Matrix\\r\\n\\\\newcommand{\\\\ElmGrp}[2][]{E_{#1}(#2)}\\t\\t\\t\\t% Grp of elm-matrices, [size #1], ring #2\\r\\n\\\\newcommand{\\\\SngMtrx}[2]{s_{#1}(#2)}\\t\\t\\t\\t% Singleton Matrix\\r\\n\\\\newcommand{\\\\StbrgES}[2]{\\\\varepsilon_{#1}(#2)}\\t% Steinberg Elementary Symbol\\r\\n\\\\newcommand{\\\\StbrgSS}[2]{\\\\sigma_{#1}(#2)}\\t\\t\\t\\t% Steinberg Singleton Symbol\\r\\n%\\r\\n\\\\newcommand{\\\\EndoRng}[2]{\\\\text{\\\\it End}_{#1}(#2)}\\t\\t\\t% Endo-ring of #2 over #1\\r\\n\\\\newcommand{\\\\GrpRng}[2]{#1\\\\left[#2\\\\right]}\\t\\t\\t\\t\\t\\t% grp over #1 of group #2\\r\\n\\\\newcommand{\\\\ZGrpRng}[1]{{\\\\mathbb Z}\\\\left[#1\\\\right]}\\t% Z-group ring of group #1\\r\\n\\\\newcommand{\\\\ZAugIdl}[1]{I\\\\left[#1\\\\right]}\\t\\t\\t\\t\\t\\t% Augmentation ideal of #1 over Z\\r\\n\\\\newcommand{\\\\AugIdl}[2]{I_{#1}\\\\left[#2\\\\right]}\\t\\t\\t\\t% augmentation idl over ring #1 of grp #2\\r\\n\\\\newcommand{\\\\Drvtn}[2]{\\\\text{\\\\it Der}(#1,#2)}\\t\\t\\t\\t\\t% Derivations #1 -> #2\\r\\n%\\r\\n\\\\newcommand{\\\\GalGrp}[1]{\\\\text{\\\\it Gal}(#1)}\\t% Galois group of #1\\r\\n\\\\newcommand{\\\\AutGrpRel}[2]{\\\\text{\\\\it Aut}_{#1}(#2)}\\t% Automorphism group of #2 over #1\\r\\n\\\\newcommand{\\\\IntFlds}[2]{\\\\text{\\\\it Flds}(#1,#2)}\\t\\t% fields between #1 and #2\\r\\n\\\\newcommand{\\\\IntNFlds}[2]{\\\\text{\\\\it NFlds}(#1,#2)}\\t% normal fields between #1 and #2\\r\\n\\\\newcommand{\\\\FixSet}[1]{\\\\text{\\\\it Fix}(#1)}     % fix set of #1\\r\\n%\\r\\n\\\\newcommand{\\\\LAlg}[1]{\\\\EuFrak{#1}}\\t\\t\\t\\t\\t% Symbol for Lie Algebra\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%\\tAlgebra\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n\\\\newcommand{\\\\Fld}[1]{\\\\mathbb{#1}}\\t% Field symbol set in mathbb\\r\\n\\\\newcommand{\\\\Dimnsn}[2]{\\\\text{\\\\it dim}_{#1}(#2)}\\t% dimension of #2 over #1\\r\\n\\\\newcommand{\\\\Annhltr}[1]{\\\\text{\\\\it ann}(#1)}\\t\\t\\t% annihilator\\r\\n%\\r\\n\\\\newcommand{\\\\WeylGrp}{W}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% Weyl group\\r\\n\\\\newcommand{\\\\WeylGrpOf}[1]{W\\\\left(#1\\\\right)}\\t\\t\\t% Weyl group of\\r\\n\\\\newcommand{\\\\WeylGrpOfIn}[2]{W_{#2}\\\\left(#1\\\\right)}\\t\\t\\t% Weyl group of #1 in #2\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%\\tHomological Algebra\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%\\\\newcommand{\\\\KrnlPr}[1]{\\\\mathit{Eq}\\\\left(#1\\\\right)}\\t\\t\\t% kernel pair of #1\\t(appears in categories)\\r\\n\\\\newcommand{\\\\Hmlgy}[2]{H_{#1}#2}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% Homology\\r\\n\\\\newcommand{\\\\HmlgyCoeffs}[3]{H_{#1}\\\\left(#2;#3\\\\right)}\\t% Homology with coefficients\\r\\n\\\\newcommand{\\\\HmlgyKer}[2]{H^{k}_{#1}#2}\\t\\t\\t\\t\\t\\t\\t\\t\\t% Kernel construction of homology\\r\\n\\\\newcommand{\\\\HmlgyCoKer}[2]{H^{c}_{#1}#2}\\t\\t\\t\\t\\t\\t\\t\\t% CoKernel construction of homology\\r\\n\\\\newcommand{\\\\ChnCat}{\\\\mathit{chn}}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% Cat modeling chain complexes\\r\\n\\\\newcommand{\\\\ChnCmplxs}{\\\\mathcal{C}\\\\mathit{hn}}\\t\\t\\t\\t\\t% Chain complexes\\r\\n\\\\newcommand{\\\\CatChnCmplxsIn}[1]{\\\\mathcal{C}\\\\mathit{hn}(#1)}\\t\\t% Chain complexes\\r\\n\\\\newcommand{\\\\ChnCmplxsPls}{\\\\mathcal{C}\\\\mathit{hn}_{+}}\\t% Chain complexes, >=0\\r\\n\\\\newcommand{\\\\CatChnCmplxsPlsIn}[1]{\\\\mathcal{C}\\\\mathit{hn}(#1)}\\t% category of chn cmplxs in #1\\r\\n\\\\newcommand{\\\\CatChnChnCmplxsPlsIn}[1]{\\\\text{\\\\it CC}#1}\\t% category of double chn cmplxs in #1\\r\\n\\\\newcommand{\\\\LChnCmplxsPls}[1]{#1\\\\text{\\\\it -$\\\\cal C$hn}_{+}}\\t% Chain complexes, >=0\\r\\n\\\\newcommand{\\\\CChnCmplxs}{\\\\text{\\\\it $\\\\cal CC$hn}}\\t\\t\\t\\t% CoChain complexes\\r\\n\\\\newcommand{\\\\LChn}[1]{#1\\\\text{\\\\it -$\\\\cal C$hn}}\\t\\t\\t\\t\\t% Cat of ch cmplxs left #1-modules\\r\\n\\\\newcommand{\\\\RChn}[1]{\\\\text{\\\\it $\\\\cal C$hn-}#1}\\t\\t\\t\\t\\t% Cat of ch cmplxs right #1-modules\\r\\n\\\\newcommand{\\\\BChn}[2]{#1\\\\text{\\\\it -$\\\\cal C$hn-}#2}\\t\\t\\t% Cat of ch cmplxs bi-#1-#2-modules\\r\\n\\\\newcommand{\\\\hoChnCmplxs}{\\\\text{\\\\it ho$\\\\cal C$hn}}\\t\\t\\t% Cat of chain complexes\\r\\n\\\\newcommand{\\\\hoLChn}[1]{#1\\\\text{\\\\it -ho$\\\\cal C$hn}}\\t\\t\\t% Cat of ch cmplxs left #1-modules\\r\\n\\\\newcommand{\\\\hoRChn}[1]{\\\\text{\\\\it ho$\\\\cal C$hn-}#1}\\t\\t\\t% Cat of ch cmplxs right #1-modules\\r\\n\\\\newcommand{\\\\CChn}{\\\\text{\\\\it $\\\\cal CC$hn}}\\t\\t\\t\\t\\t\\t\\t% Cat of cochain complexes\\r\\n\\\\newcommand{\\\\LCChn}[1]{#1\\\\text{\\\\it -$\\\\cal CC$hn}}\\t\\t\\t\\t% Cat of coch cmplxs left #1-modules\\r\\n\\\\newcommand{\\\\RCChn}[1]{\\\\text{\\\\it $\\\\cal CC$hn-}#1}\\t\\t\\t\\t% Cat of coch cmplxs right #1-modules\\r\\n\\\\newcommand{\\\\hoCChn}{\\\\text{\\\\it ho$\\\\cal CC$hn}}\\t\\t\\t\\t\\t% Cat of cochain complexes\\r\\n\\\\newcommand{\\\\hoLCChn}[1]{#1\\\\text{\\\\it -ho$\\\\cal CC$hn}}\\t\\t% Cat of coch cmplxs left #1-modules\\r\\n\\\\newcommand{\\\\hoRCChn}[1]{\\\\text{\\\\it ho$\\\\cal C$hn-}#1}\\t\\t% Cat of coch cmplxs right #1-modules\\r\\n\\\\newcommand{\\\\LESCat}[1]{\\\\text{\\\\it LES}(#1)}\\t\\t\\t\\t\\t\\t\\t% Cat of LESs in #1\\r\\n\\\\newcommand{\\\\LESMap}[1]{#1}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% Morphism of LESs\\r\\n\\\\newcommand{\\\\MLESCat}[1]{\\\\text{\\\\it $\\\\EuScript{Y}$LES}(#1)}\\t\\t\\t\\t\\t\\t% Yoneda cat of marked LESs in #1\\r\\n\\\\newcommand{\\\\MLESMap}[1]{\\\\langle #1\\\\rangle}\\t\\t\\t\\t\\t\\t\\t% Morphism of marked long exact sequences\\r\\n%\\r\\n\\\\newcommand{\\\\DGAbs}{\\\\text{\\\\it DG}\\\\AbGrps}\\t\\t\\t\\t\\t\\t\\t\\t% DGA's (chain complexes)\\r\\n%\\r\\n\\\\newcommand{\\\\ChnIntrvl}[1]{\\\\mathbb{I}_{#1}}\\t\\t\\t\\t\\t\\t\\t\\t\\t% unit interval complex over #1\\r\\n\\\\newcommand{\\\\ChnCyl}[1]{\\\\mathit{cyl}(#1)}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% cylinder complex over #1\\r\\n\\\\newcommand{\\\\ChnCylAt}[2]{\\\\mathit{cyl}_{#2}(#1)}\\t\\t\\t\\t\\t\\t% cylinder complex over #1\\r\\n\\\\newcommand{\\\\ChnCone}[1]{\\\\mathit{cone}(#1)}\\t\\t\\t\\t\\t\\t\\t\\t\\t% cone complex over #1\\r\\n\\\\newcommand{\\\\ChnConeAt}[2]{\\\\mathit{cone}_{#2}(#1)}\\t\\t\\t\\t\\t% cone complex over #1\\r\\n\\\\newcommand{\\\\ChnConeV}[2]{\\\\mathit{cone}^{#2}(#1)}\\t\\t\\t\\t\\t\\t% cone complex over #1\\r\\n\\\\newcommand{\\\\ChnConeAtV}[3]{\\\\mathit{cone}^{#3}_{#2}(#1)}\\t\\t% cone complex over #1\\r\\n\\\\newcommand{\\\\ChnSspnsn}[1]{\\\\Sigma #1}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% Suspension complex of #1\\r\\n\\\\newcommand{\\\\ChnPi}[2]{\\\\left[ #1,#2\\\\right]}\\t\\t\\t\\t\\t\\t\\t\\t\\t% Chain homotopy classes #1 --> #2\\r\\n\\\\newcommand{\\\\EiMacCpx}[2]{K(#1,#2)}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% Eilenberg-Mac Lane complex\\r\\n\\\\newcommand{\\\\TotAChnCpx}{\\\\mathit{Tot}^{\\\\oplus}}\\t\\t\\t\\t\\t\\t\\t% Additive Tot functor\\r\\n\\\\newcommand{\\\\TotAChnCpxOf}[1]{\\\\mathit{Tot}^{\\\\oplus}(#1)}\\t\\t% Additive Tot(chain cpx #1)\\r\\n\\\\newcommand{\\\\TotAChnCpxOfAt}[2]{\\\\mathit{Tot}^{\\\\oplus}_{#2}(#1)}\\t\\t% Additive Tot(chain cpx #1) in position #2\\r\\n\\\\newcommand{\\\\TotPChnCpx}{\\\\mathit{Tot}^{\\\\Pi}}\\t\\t\\t\\t\\t\\t\\t\\t% Product Tot functor\\r\\n\\\\newcommand{\\\\TotPChnCpxOf}[1]{\\\\mathit{Tot}^{\\\\Pi}(#1)}\\t\\t\\t\\t% Product Tot(chain cpx #1)\\r\\n\\\\newcommand{\\\\TotPChnCpxOfAt}[2]{\\\\mathit{Tot}^{\\\\Pi}_{#2}(#1)}\\t% Product Tot(chain cpx #1) in position #2\\r\\n\\\\newcommand{\\\\HorFilt}[3][]{\\\\text{\\\\it Hor\\\\hspace{1pt}}^{#2}({#3})_{#1}}\\t\\t% Hor^#2(#3)_#1\\r\\n\\\\newcommand{\\\\TotHorFilt}[2]{#1^{\\\\overset{#2}{\\\\to}} }\\t\\t\\t\\t\\t% #1^{horizontal #2}\\r\\n\\\\newcommand{\\\\VerFilt}[3][]{\\\\text{\\\\it Ver\\\\hspace{2pt}}^{#2}({#3})_{#1}}\\t\\t% Ver^#2(#3)_#1\\r\\n\\\\newcommand{\\\\TotVerFilt}[2]{#1^{\\\\uparrow #2} }\\t\\t\\t\\t\\t\\t\\t\\t% #1^{horizontal #2}\\r\\n%\\r\\n\\\\newcommand{\\\\LDrvd}[3]{L_{#2}#1(#3)}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% #1-derived #2 applied to #3\\r\\n\\\\newcommand{\\\\LDrvdOfDim}[2]{L_{#2}#1}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% Lft-drvd of #1, dim #2\\r\\n\\\\newcommand{\\\\LDrvdOfDimAt}[3]{L_{#2}#1\\\\left(#3\\\\right)}\\t\\t\\t\\t% Lft-drvd of #1, dim #2; object #3\\r\\n\\\\newcommand{\\\\RDrvd}[3]{R^{#2}#1(#3)}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% #1-right derived of #2 applied to #3\\r\\n\\\\newcommand{\\\\LDrvdC}[3]{L^{#2}#1(#3)}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% #1-derived #2 applied to #3\\r\\n\\\\newcommand{\\\\RDrvdC}[3]{R_{#2}#1(#3)}\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% #1-right derived of #2 applied to #3\\r\\n\\\\newcommand{\\\\Ext}[3]{\\\\mathit{Ext}^{#1}\\\\left(#2,#3\\\\right)}\\t\\t\\t% Ext^{#1}(#2,#3)\\r\\n\\\\newcommand{\\\\ExtOver}[4]{\\\\mathit{Ext}^{#1}_{#2}\\\\left(#3,#4\\\\right)}\\t\\t% Ext^{#1}_{#2}(#3,#4)\\r\\n\\\\newcommand{\\\\ExtAbGrps}[2]{\\\\mathit{Ext}\\\\left(#1,#2\\\\right)}\\t\\t% Ext(#1,#2) in abelian groups\\r\\n\\\\newcommand{\\\\ExtFnctr}[4]{\\\\text{\\\\it Ext}_{#1}^{#2}(#3,#4)}\\t\\t% Ext-functor\\r\\n\\\\newcommand{\\\\YExt}[4][]{\\\\text{\\\\it YExt}^{#1}_{#2}(#3,#4)}   \\t% Yoneda module extensions: length #1\\r\\n\\\\newcommand{\\\\YGrpExt}[2]{\\\\text{\\\\it YExt}(#1,#2)}    \\t\\t\\t\\t\\t% Yoneda group extensions\\r\\n\\\\newcommand{\\\\Tens}[1][]{\\\\otimes_{#1}} \\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t% Tensor product over #1\\r\\n\\\\newcommand{\\\\Tensor}[2]{#1 \\\\otimes #2}\\r\\n\\\\newcommand{\\\\TensorOver}[3]{#1 \\\\otimes_{#3} #2}\\r\\n\\\\newcommand{\\\\AbTor}[2]{\\\\text{\\\\it Tor}\\\\left( #1 , #2 \\\\right)}\\t%\\r\\n\\\\newcommand{\\\\Tor}[3]{\\\\text{\\\\it Tor}_{#1}\\\\left(#2 , #3\\\\right)} % Tor\\r\\n\\\\newcommand{\\\\TorOver}[4]{\\\\text{\\\\it Tor}_{#1}^{#2}\\\\left(#3 , #4\\\\right)} % Tor\\r\\n\\\\newcommand{\\\\TorAbGrps}[2]{\\\\text{\\\\it Tor}\\\\left( #1 , #2 \\\\right)}\\t%\\r\\n\\\\newcommand{\\\\TorFnctr}[4][]{\\\\text{\\\\it Tor}^{#1}_{#2}(#3,#4)}\\t% Tor-functor (deprecated)\\r\\n%\\r\\n\\\\newcommand{\\\\GrpHmlgy}[3]{H_{#1}(#2;#3)}\\t\\t\\t\\t\\t\\t% H_{#1}(#2;#3)\\r\\n\\\\newcommand{\\\\GrpHmlgyDimOf}[2]{H_{#1}#2}\\r\\n\\\\newcommand{\\\\GrpHmlgyDimOfCoeffs}[3]{H_{#1}\\\\left(#2;#3\\\\right)}\\r\\n\\\\newcommand{\\\\GrpCHmlgy}[3]{H^{#1}(#2;#3)}\\t\\t\\t\\t\\t\\t% H^{#1}(#2;#3)\\r\\n\\\\newcommand{\\\\GrpCHmlgyDimOf}[2]{H^{#1}#2}\\r\\n\\\\newcommand{\\\\GrpCHmlgyDimOfCoeffs}[3]{H^{#1}\\\\left(#2;#3\\\\right)}\\r\\n\\\\newcommand{\\\\TateHmlgy}[3]{\\\\hat{H}_{#1}(#2;#3)}\\t\\t\\t% Tate Homology\\r\\n%\\r\\n%%%%\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%\\tCommutative Algebra\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n\\\\newcommand{\\\\PrjSpc}[2]{#1\\\\hskip -.25em P^{#2}}\\t\\t% Proj. space over #1, dimension #2\\r\\n\\\\newcommand{\\\\prjspc}[2]{P^{#1}\\\\left(#2\\\\right)}\\t\\t% Proj. space dimension #1 of #2\\r\\n\\\\newcommand{\\\\GrssmnSpc}[2]{G_{#1}\\\\left(#2\\\\right)} % Grassmann space of dim-#1 subspaces in #2\\r\\n\\\\newcommand{\\\\PIdlSpec}[1]{\\\\text{\\\\it Spec}(#1)}\\t\\t% Spectrum of ring #1\\r\\n\\\\newcommand{\\\\RngShf}[1]{{\\\\cal O}_{#1}}\\t\\t% ring sheaf on space #1\\r\\n\\\\newcommand{\\\\StrcShf}[1]{{\\\\cal O}_{#1}}   % Structure sheaf of #1\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%\\tMultilinear Algebra\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n\\\\newcommand{\\\\AltAlg}[2][]{A_{#1}\\\\left(#2\\\\right)}\\t\\t\\t\\t% Altern algebra of module #2, [gradation #1]\\r\\n\\\\newcommand{\\\\AltAlgi}[2][]{\\\\alpha_{#1}\\\\left(#2\\\\right)}\\t% Internal Altern alg module #2, [gradation #1]\\r\\n\\\\newcommand{\\\\TenAlg}[2][]{T_{#1}\\\\left(#2\\\\right)}\\t\\t\\t\\t% Tensor alg of module #2, [gradation #1]\\r\\n\\\\DeclareMathOperator{\\\\Altntr}{Alt}\\t\\t\\t% Alternator on a graded algebra\\r\\n\\\\DeclareMathOperator{\\\\AltntrV}{alt}\\t\\t\\t% Alternator on graded alg of the dual of an inner prod spc\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%\\tLocalization and Colocalization\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n\\\\newcommand{\\\\LOrtho}[1]{{}^{\\\\bot}{#1}}\\t\\t\\t\\t\\t% left orthogonal complement\\r\\n\\\\newcommand{\\\\ROrtho}[1]{{#1}^{\\\\bot}}\\t\\t\\t\\t\\t\\t% right orthogonal complement\\r\\n\\\\newcommand{\\\\RflctvCat}[1]{\\\\EuScript{#1}}\\t\\t\\t\\t% Reflective subcat\\r\\n\\\\newcommand{\\\\Lclz}[2][]{\\\\eta^{#1}_{#2}}\\t\\t\\t\\t\\t% Localization of #2\\r\\n\\\\newcommand{\\\\CLclz}[2][]{\\\\varepsilon^{#1}_{#2}}\\t% Colocalization of #2\\r\\n\\\\newcommand{\\\\TrsnCat}[1][]{\\\\EuScript{T}_{#1}}\\t\\t% Torsion category ass. to #1\\r\\n\\\\newcommand{\\\\TTrsnCat}[1][]{\\\\tilde{\\\\EuScript{T}}_{#1}}% Torsion category ass. to #1, with L=0=L_1\\r\\n\\\\newcommand{\\\\TrsnFrCat}[1][]{\\\\EuScript{F}_{#1}}\\t% Torsion free category ass. to #1\\r\\n\\\\newcommand{\\\\CTrsnCat}[1][]{\\\\EuScript{C}_{#1}}\\t% Cotorsion category ass. to #1\\r\\n\\\\newcommand{\\\\TrsnPr}[2]{(\\\\EuScript{#1},\\\\EuScript{#2})}\\t% torsion pair (#1,#2)\\r\\n\\\\newcommand{\\\\TTFCat}{\\\\EuScript{C}}\\t\\t\\t\\t\\t\\t% TTF class of a TTF-triple\\r\\n\\\\newcommand{\\\\TTF}{(\\\\EuScript{T},\\\\EuScript{C},\\\\EuScript{F})}\\t% TTF-triple\\r\\n\\\\newcommand{\\\\Trsn}[1]{\\\\tau{#1}}\\t\\t\\t\\t\\t\\t\\t\\t% torsion in #1\\r\\n\\\\newcommand{\\\\TTrsn}[1]{\\\\tilde{\\\\tau}{#1}}\\t\\t\\t% universal lift of torsion in #1\\r\\n\\\\newcommand{\\\\TrsnFr}[1]{\\\\varphi{#1}}\\t\\t\\t\\t\\t% torsion free in #1\\r\\n%\\r\\n\\\\newcommand{\\\\TrsnSbGrpAt}[1]{T_{#1}}\\t\\t\\t\\t\\t% torsion subgroup at prime(s) #1\\r\\n\\\\newcommand{\\\\TrsnSbGrpAtOf}[2]{T_{#1}#2}\\t\\t\\t% torsion subgroup at prime(s) #1 of #2\\r\\n\\\\newcommand{\\\\NullObjAt}[1]{\\\\tau_{#1}}\\t\\t\\t\\t\\t% subobject nullified by #1\\r\\n\\\\newcommand{\\\\NullObjAtOf}[2]{\\\\tau_{#1}#2}\\t\\t\\t% subobject of #2 nullified by #1\\r\\n%\\r\\n\\\\newcommand{\\\\Nilptfctn}[1]{N^{#1}}                            % Nilpotification functor of order #1\\r\\n\\\\newcommand{\\\\NilptfctnOf}[2]{N^{#1}\\\\left(#2\\\\right)}\\t      \\t\\t% Nilpotification of order #1 of object #2\\r\\n\\\\newcommand{\\\\NilptfctnKrnl}[1]{\\\\alpha^{#1}}               \\t  % Nilpotification functor of order #1\\r\\n\\\\newcommand{\\\\NilptfctnKrnlOf}[2]{\\\\alpha^{#1}\\\\left(#2\\\\right)}\\t% Nilpotification of order #1 of object #2\\r\\n\\\\newcommand{\\\\NilCmpltn}{\\\\hat{N}}                              % nilpotent completion\\r\\n\\\\newcommand{\\\\NilCmpltnOf}[1]{\\\\hat{N}\\\\left( #1\\\\right)}  \\t\\t\\t\\t% nilpotent completion of #1\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n%%%%%\\tDeprecated\\r\\n%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\\r\\n\\\\newcommand{\\\\Chn}{\\\\text{\\\\it $\\\\cal C$hn}}\\t\\t\\t\\t\\t\\t\\t% Cat of chain complexes (deprecated)\\r\\n\\\\newcommand{\\\\hoChn}{\\\\text{\\\\it ho$\\\\cal C$hn}}\\t\\t\\t\\t\\t% homotopy Cat of chain complexes (deprecated)\\r\\n\\r\\n----------------------------243398684747659916116864--\\r\\n", "note": ""}], "basicCommand": [{"tex": "\\\\newcommand{\\\\Sum}[2]{#1\\\\oplus #2}", "note": "#1 + #2"}, {"tex": "\\\\newcommand{\\\\SSum}[3]{#1\\\\oplus #2\\\\oplus #3}", "note": "#1 + #2 + #3"}, {"tex": "\\\\newcommand{\\\\FamSum}[2]{\\\\bigoplus_{#1} #2}", "note": "sum over #1 of family #2"}, {"tex": "\\\\newcommand{\\\\Fld}[1]{\\\\mathbb{#1}}", "note": "Field symbol set in mathbb"}]}	{"basicShortcut": [{"tex": "\\\\Defn{ConceptToBeDefined}","note": ""}, {"tex": "\\\\AnglBr{arg1}","note": ""}]}
17	test1	2020-05-18	\N	\N	{"treeData": {}}	{"treeData": {}}	{"treeData": {}}	{"basicCommand": [{"tex": "\\\\newcommand{\\\\Sum}[2]{#1\\\\oplus #2}", "note": "#1 + #2"}, {"tex": "\\\\newcommand{\\\\SSum}[3]{#1\\\\oplus #2\\\\oplus #3}", "note": "#1 + #2 + #3"}, {"tex": "\\\\newcommand{\\\\FamSum}[2]{\\\\bigoplus_{#1} #2}", "note": "sum over #1 of family #2"}, {"tex": "\\\\newcommand{\\\\Fld}[1]{\\\\mathbb{#1}}", "note": "Field symbol set in mathbb"}]}	{"basicShortcut": [{"tex": "\\\\Defn{ConceptToBeDefined}","note": ""}, {"tex": "\\\\AnglBr{arg1}","note": ""}]}
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: database_externallink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.database_externallink_id_seq', 1, false);


--
-- Name: database_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.database_level_id_seq', 97, true);


--
-- Name: database_para_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.database_para_id_seq', 147, true);


--
-- Name: database_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.database_person_id_seq', 7, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 494, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emath
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 54, true);


--
-- Name: presentation_rootlevel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yaozhilu
--

SELECT pg_catalog.setval('public.presentation_rootlevel_id_seq', 16, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: presentation_externallink database_externallink_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_externallink
    ADD CONSTRAINT database_externallink_pkey PRIMARY KEY (id);


--
-- Name: presentation_level database_level_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_level
    ADD CONSTRAINT database_level_pkey PRIMARY KEY (id);


--
-- Name: presentation_para database_para_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_para
    ADD CONSTRAINT database_para_pkey PRIMARY KEY (id);


--
-- Name: presentation_person database_person_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_person
    ADD CONSTRAINT database_person_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: presentation_level presentation_level_root_id_key; Type: CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_level
    ADD CONSTRAINT presentation_level_root_id_key UNIQUE (root_id);


--
-- Name: presentation_rootlevel presentation_rootlevel_pkey; Type: CONSTRAINT; Schema: public; Owner: yaozhilu
--

ALTER TABLE ONLY public.presentation_rootlevel
    ADD CONSTRAINT presentation_rootlevel_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: database_externallink_parent_e_id_id_6dc28d45; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX database_externallink_parent_e_id_id_6dc28d45 ON public.presentation_externallink USING btree (parent_e_id_id);


--
-- Name: database_level_parent_id_fa9da85a; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX database_level_parent_id_fa9da85a ON public.presentation_level USING btree (parent_id);


--
-- Name: database_level_tree_id_f21415da; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX database_level_tree_id_f21415da ON public.presentation_level USING btree (tree_id);


--
-- Name: database_para_para_parent_id_5e3b29cc; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX database_para_para_parent_id_5e3b29cc ON public.presentation_para USING btree (para_parent_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: emath
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: presentation_rootlevel_author_id_d2cc679f; Type: INDEX; Schema: public; Owner: yaozhilu
--

CREATE INDEX presentation_rootlevel_author_id_d2cc679f ON public.presentation_rootlevel USING btree (author_id);


--
-- Name: presentation_rootlevel_contributor_id_bfc784f1; Type: INDEX; Schema: public; Owner: yaozhilu
--

-- CREATE INDEX presentation_rootlevel_contributor_id_bfc784f1 ON public.presentation_rootlevel USING btree (contributor_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: presentation_externallink database_externallin_parent_e_id_id_6dc28d45_fk_database_; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_externallink
    ADD CONSTRAINT database_externallin_parent_e_id_id_6dc28d45_fk_database_ FOREIGN KEY (parent_e_id_id) REFERENCES public.presentation_para(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: presentation_level database_level_parent_id_fa9da85a_fk_database_level_id; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_level
    ADD CONSTRAINT database_level_parent_id_fa9da85a_fk_database_level_id FOREIGN KEY (parent_id) REFERENCES public.presentation_level(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: presentation_para database_para_para_parent_id_5e3b29cc_fk_database_level_id; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_para
    ADD CONSTRAINT database_para_para_parent_id_5e3b29cc_fk_database_level_id FOREIGN KEY (para_parent_id) REFERENCES public.presentation_level(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: presentation_level presentation_level_root_id_43c01d0a_fk_presentat; Type: FK CONSTRAINT; Schema: public; Owner: emath
--

ALTER TABLE ONLY public.presentation_level
    ADD CONSTRAINT presentation_level_root_id_43c01d0a_fk_presentat FOREIGN KEY (root_id) REFERENCES public.presentation_rootlevel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: presentation_rootlevel presentation_rootlev_author_id_d2cc679f_fk_presentat; Type: FK CONSTRAINT; Schema: public; Owner: yaozhilu
--

ALTER TABLE ONLY public.presentation_rootlevel
    ADD CONSTRAINT presentation_rootlev_author_id_d2cc679f_fk_presentat FOREIGN KEY (author_id) REFERENCES public.presentation_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: presentation_rootlevel presentation_rootlev_contributor_id_bfc784f1_fk_presentat; Type: FK CONSTRAINT; Schema: public; Owner: yaozhilu
--

-- ALTER TABLE ONLY public.presentation_rootlevel
--     ADD CONSTRAINT presentation_rootlev_contributor_id_bfc784f1_fk_presentat FOREIGN KEY (contributor_id) REFERENCES public.presentation_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

