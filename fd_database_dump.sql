--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: _fluent_migrations; Type: TABLE; Schema: public; Owner: fd_username
--

CREATE TABLE public._fluent_migrations (
    id uuid NOT NULL,
    name text NOT NULL,
    batch bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public._fluent_migrations OWNER TO fd_username;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: fd_username
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    title text NOT NULL,
    image text NOT NULL,
    "ratingsCount" bigint NOT NULL,
    stars double precision NOT NULL,
    "priceStartsAt" bigint NOT NULL,
    "promotionalOffer" text
);


ALTER TABLE public.categories OWNER TO fd_username;

--
-- Data for Name: _fluent_migrations; Type: TABLE DATA; Schema: public; Owner: fd_username
--

COPY public._fluent_migrations (id, name, batch, created_at, updated_at) FROM stdin;
7db63794-8641-4dcb-8012-3da1cfdff50a	App.CreateCategory	1	2024-11-12 06:33:55.310656+00	2024-11-12 06:33:55.310656+00
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: fd_username
--

COPY public.categories (id, title, image, "ratingsCount", stars, "priceStartsAt", "promotionalOffer") FROM stdin;
fd8113b7-5fb0-44aa-ac3f-564d0727b67d	Main Dishes	https://img.freepik.com/free-photo/chicken-caesar-salad-table_140725-4536.jpg?t=st=1731387018~exp=1731390618~hmac=7efda6ddde46b24cceda5ad016ff0b8775ba2f53c896ce4953e86ca36bc709f2&w=740	355	4.9	2500	FREE DRINK
ccb21e98-d919-4d8a-a45c-4d093014f99d	Best Sellers	https://img.freepik.com/free-photo/meat-lasagna-with-tomato-pepper_140725-8622.jpg?t=st=1731387891~exp=1731391491~hmac=e9eb1c3adc4ccd98b6846836b65f675dbbcbb4fbb8657a11376edfcee47e300d&w=740	105	4.8	2000	\N
df94b08b-d13e-4b99-87f0-65e727cfe596	Discounted Offers	https://avatars.mds.yandex.net/i?id=1a06302167d1d2a99dab01f9f3209fc3_l-5858922-images-thumbs&n=13	500	4.6	500	\N
2ec3e5ac-05cb-4747-840c-d2d25ede2487	Testable Name	https://shkolalempinskaya-r86.gosweb.gosuslugi.ru/netcat_files/96/424/pitanie.jpg	500	5	30000	\N
\.


--
-- Name: _fluent_migrations _fluent_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fd_username
--

ALTER TABLE ONLY public._fluent_migrations
    ADD CONSTRAINT _fluent_migrations_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: fd_username
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: _fluent_migrations uq:_fluent_migrations.name; Type: CONSTRAINT; Schema: public; Owner: fd_username
--

ALTER TABLE ONLY public._fluent_migrations
    ADD CONSTRAINT "uq:_fluent_migrations.name" UNIQUE (name);


--
-- PostgreSQL database dump complete
--

