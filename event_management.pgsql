--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

SET default_table_access_method = heap;

--
-- Name: event_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_master (
    id integer NOT NULL,
    event_type_id integer,
    vanue_id integer,
    vanue_location_id integer,
    name character varying(255),
    slug character varying(255),
    event_code character varying(255),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    no_of_participant integer,
    description text,
    status character varying(255),
    status_reason text,
    comment text,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_recurring boolean,
    no_of_occurrences integer,
    "interval" integer,
    interval_type integer
);


ALTER TABLE public.event_master OWNER TO postgres;

--
-- Name: event_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_media (
    id integer NOT NULL,
    event_id integer,
    file_name character varying(255),
    file_type character varying(255),
    size character varying(255),
    extension character varying(255),
    file_location timestamp without time zone,
    status boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.event_media OWNER TO postgres;

--
-- Name: event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_types (
    id integer NOT NULL,
    name character varying(255),
    status boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.event_types OWNER TO postgres;

--
-- Name: ticket_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_master (
    id integer NOT NULL,
    event_id integer,
    ticket_type character varying(255),
    price double precision,
    tax double precision,
    discount double precision,
    status boolean,
    created_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    no_of_tickets integer,
    available_from timestamp without time zone,
    available_to timestamp without time zone,
    cancel_before timestamp without time zone
);


ALTER TABLE public.ticket_master OWNER TO postgres;

--
-- Name: ticket_order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_order_details (
    id integer NOT NULL,
    ticket_order_id integer,
    guest_name character varying(255),
    date_of_birth date,
    gender character varying(20),
    is_main_guest boolean,
    price double precision,
    tax double precision,
    discount double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ticket_order_details OWNER TO postgres;

--
-- Name: ticket_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_orders (
    id integer NOT NULL,
    user_id integer,
    event_id integer,
    ticket_id integer,
    no_of_guests integer,
    amount double precision,
    status boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ticket_orders OWNER TO postgres;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    id integer NOT NULL,
    role_name character varying(120),
    status boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    role_id integer,
    email character varying(120),
    password character varying(120),
    name character varying(120),
    avatar character varying(255),
    phone character varying(120),
    address_line1 character varying(255),
    address_line2 character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    zip character varying(20),
    date_of_birth date,
    gender character varying(20),
    status boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: vanue_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vanue_locations (
    id integer NOT NULL,
    vanue_id integer,
    name character varying(255),
    address_line1 character varying(255),
    address_line2 character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    zip character varying(255),
    latitude double precision,
    longitude double precision,
    phone character varying(120),
    email character varying(255),
    status boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.vanue_locations OWNER TO postgres;

--
-- Name: vanues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vanues (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    slug character varying(255),
    vanue_type character varying(255),
    logo character varying(255),
    description text,
    phone character varying(120),
    email character varying(255),
    website character varying(255),
    status boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.vanues OWNER TO postgres;

--
-- Data for Name: event_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_master (id, event_type_id, vanue_id, vanue_location_id, name, slug, event_code, start_date, end_date, no_of_participant, description, status, status_reason, comment, created_by, created_at, updated_at, is_recurring, no_of_occurrences, "interval", interval_type) FROM stdin;
\.


--
-- Data for Name: event_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_media (id, event_id, file_name, file_type, size, extension, file_location, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_types (id, name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ticket_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_master (id, event_id, ticket_type, price, tax, discount, status, created_by, created_at, updated_at, no_of_tickets, available_from, available_to, cancel_before) FROM stdin;
\.


--
-- Data for Name: ticket_order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_order_details (id, ticket_order_id, guest_name, date_of_birth, gender, is_main_guest, price, tax, discount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ticket_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_orders (id, user_id, event_id, ticket_id, no_of_guests, amount, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (id, role_name, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, role_id, email, password, name, avatar, phone, address_line1, address_line2, city, state, country, zip, date_of_birth, gender, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vanue_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vanue_locations (id, vanue_id, name, address_line1, address_line2, city, state, country, zip, latitude, longitude, phone, email, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vanues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vanues (id, user_id, name, slug, vanue_type, logo, description, phone, email, website, status, created_at, updated_at) FROM stdin;
\.


--
-- Name: event_master event_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_master
    ADD CONSTRAINT event_master_pkey PRIMARY KEY (id);


--
-- Name: event_media event_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_media
    ADD CONSTRAINT event_media_pkey PRIMARY KEY (id);


--
-- Name: event_types event_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: ticket_master ticket_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_master
    ADD CONSTRAINT ticket_master_pkey PRIMARY KEY (id);


--
-- Name: ticket_order_details ticket_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_order_details
    ADD CONSTRAINT ticket_order_details_pkey PRIMARY KEY (id);


--
-- Name: ticket_orders ticket_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_orders
    ADD CONSTRAINT ticket_orders_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vanue_locations vanue_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vanue_locations
    ADD CONSTRAINT vanue_locations_pkey PRIMARY KEY (id);


--
-- Name: vanues vanues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vanues
    ADD CONSTRAINT vanues_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

