--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-07-20 13:59:09

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
-- TOC entry 202 (class 1259 OID 49492)
-- Name: climber; Type: TABLE; Schema: public; Owner: admin_escalade
--

CREATE TABLE public.climber (
    email character varying(255) NOT NULL,
    association boolean NOT NULL,
    nickname character varying(255) NOT NULL,
    password character varying(255)
);


ALTER TABLE public.climber OWNER TO admin_escalade;

--
-- TOC entry 203 (class 1259 OID 49500)
-- Name: com; Type: TABLE; Schema: public; Owner: admin_escalade
--

CREATE TABLE public.com (
    id bigint NOT NULL,
    comment text NOT NULL,
    modified_by character varying(255),
    climber_email character varying(255),
    place_place_id bigint
);


ALTER TABLE public.com OWNER TO admin_escalade;

--
-- TOC entry 208 (class 1259 OID 49540)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: admin_escalade
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO admin_escalade;

--
-- TOC entry 204 (class 1259 OID 49508)
-- Name: place; Type: TABLE; Schema: public; Owner: admin_escalade
--

CREATE TABLE public.place (
    place_id bigint NOT NULL,
    placedescription text,
    place_name character varying(255) NOT NULL,
    region character varying(255),
    tag boolean NOT NULL
);


ALTER TABLE public.place OWNER TO admin_escalade;

--
-- TOC entry 205 (class 1259 OID 49516)
-- Name: route; Type: TABLE; Schema: public; Owner: admin_escalade
--

CREATE TABLE public.route (
    dtype character varying(31) NOT NULL,
    id bigint NOT NULL,
    grade character varying(255),
    routedescription text,
    route_name character varying(255),
    route_type character varying(255),
    sit_start boolean,
    number_of_pitch integer,
    route_length integer,
    spit integer,
    sector_id bigint
);


ALTER TABLE public.route OWNER TO admin_escalade;

--
-- TOC entry 206 (class 1259 OID 49524)
-- Name: sector; Type: TABLE; Schema: public; Owner: admin_escalade
--

CREATE TABLE public.sector (
    id bigint NOT NULL,
    sectordescription text,
    sector_name character varying(255) NOT NULL,
    place_place_id bigint
);


ALTER TABLE public.sector OWNER TO admin_escalade;

--
-- TOC entry 207 (class 1259 OID 49532)
-- Name: topo; Type: TABLE; Schema: public; Owner: admin_escalade
--

CREATE TABLE public.topo (
    id bigint NOT NULL,
    booking boolean NOT NULL,
    topo_available boolean,
    topodescription text,
    topo_name character varying(255) NOT NULL,
    topo_place character varying(255),
    year integer NOT NULL,
    climber_email character varying(255)
);


ALTER TABLE public.topo OWNER TO admin_escalade;

--
-- TOC entry 2863 (class 2613 OID 49567)
-- Name: 49567; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49567');


ALTER LARGE OBJECT 49567 OWNER TO admin_escalade;

--
-- TOC entry 2864 (class 2613 OID 49568)
-- Name: 49568; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49568');


ALTER LARGE OBJECT 49568 OWNER TO admin_escalade;

--
-- TOC entry 2865 (class 2613 OID 49569)
-- Name: 49569; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49569');


ALTER LARGE OBJECT 49569 OWNER TO admin_escalade;

--
-- TOC entry 2866 (class 2613 OID 49570)
-- Name: 49570; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49570');


ALTER LARGE OBJECT 49570 OWNER TO admin_escalade;

--
-- TOC entry 2867 (class 2613 OID 49571)
-- Name: 49571; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49571');


ALTER LARGE OBJECT 49571 OWNER TO admin_escalade;

--
-- TOC entry 2868 (class 2613 OID 49572)
-- Name: 49572; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49572');


ALTER LARGE OBJECT 49572 OWNER TO admin_escalade;

--
-- TOC entry 2869 (class 2613 OID 49573)
-- Name: 49573; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49573');


ALTER LARGE OBJECT 49573 OWNER TO admin_escalade;

--
-- TOC entry 2870 (class 2613 OID 49574)
-- Name: 49574; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49574');


ALTER LARGE OBJECT 49574 OWNER TO admin_escalade;

--
-- TOC entry 2871 (class 2613 OID 49575)
-- Name: 49575; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49575');


ALTER LARGE OBJECT 49575 OWNER TO admin_escalade;

--
-- TOC entry 2872 (class 2613 OID 49576)
-- Name: 49576; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49576');


ALTER LARGE OBJECT 49576 OWNER TO admin_escalade;

--
-- TOC entry 2873 (class 2613 OID 49577)
-- Name: 49577; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49577');


ALTER LARGE OBJECT 49577 OWNER TO admin_escalade;

--
-- TOC entry 2874 (class 2613 OID 49578)
-- Name: 49578; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49578');


ALTER LARGE OBJECT 49578 OWNER TO admin_escalade;

--
-- TOC entry 2875 (class 2613 OID 49579)
-- Name: 49579; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49579');


ALTER LARGE OBJECT 49579 OWNER TO admin_escalade;

--
-- TOC entry 2876 (class 2613 OID 49580)
-- Name: 49580; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49580');


ALTER LARGE OBJECT 49580 OWNER TO admin_escalade;

--
-- TOC entry 2877 (class 2613 OID 49581)
-- Name: 49581; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49581');


ALTER LARGE OBJECT 49581 OWNER TO admin_escalade;

--
-- TOC entry 2878 (class 2613 OID 49582)
-- Name: 49582; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49582');


ALTER LARGE OBJECT 49582 OWNER TO admin_escalade;

--
-- TOC entry 2879 (class 2613 OID 49583)
-- Name: 49583; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49583');


ALTER LARGE OBJECT 49583 OWNER TO admin_escalade;

--
-- TOC entry 2880 (class 2613 OID 49584)
-- Name: 49584; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49584');


ALTER LARGE OBJECT 49584 OWNER TO admin_escalade;

--
-- TOC entry 2881 (class 2613 OID 49585)
-- Name: 49585; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49585');


ALTER LARGE OBJECT 49585 OWNER TO admin_escalade;

--
-- TOC entry 2882 (class 2613 OID 49586)
-- Name: 49586; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49586');


ALTER LARGE OBJECT 49586 OWNER TO admin_escalade;

--
-- TOC entry 2883 (class 2613 OID 49587)
-- Name: 49587; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49587');


ALTER LARGE OBJECT 49587 OWNER TO admin_escalade;

--
-- TOC entry 2884 (class 2613 OID 49588)
-- Name: 49588; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49588');


ALTER LARGE OBJECT 49588 OWNER TO admin_escalade;

--
-- TOC entry 2885 (class 2613 OID 49589)
-- Name: 49589; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49589');


ALTER LARGE OBJECT 49589 OWNER TO admin_escalade;

--
-- TOC entry 2886 (class 2613 OID 49590)
-- Name: 49590; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49590');


ALTER LARGE OBJECT 49590 OWNER TO admin_escalade;

--
-- TOC entry 2887 (class 2613 OID 49591)
-- Name: 49591; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49591');


ALTER LARGE OBJECT 49591 OWNER TO admin_escalade;

--
-- TOC entry 2888 (class 2613 OID 49592)
-- Name: 49592; Type: BLOB; Schema: -; Owner: admin_escalade
--

SELECT pg_catalog.lo_create('49592');


ALTER LARGE OBJECT 49592 OWNER TO admin_escalade;

--
-- TOC entry 2856 (class 0 OID 49492)
-- Dependencies: 202
-- Data for Name: climber; Type: TABLE DATA; Schema: public; Owner: admin_escalade
--

INSERT INTO public.climber (email, association, nickname, password) VALUES ('climber1@gmail.com', true, 'climber1', 'NFUJohn+RdAMNMWp6jhJUCq9PaKxkL3pEAOAauD/jmt3Z1tvrfttLw==');
INSERT INTO public.climber (email, association, nickname, password) VALUES ('climber2@gmail.com', false, 'climber2', 'S1Udgj2scGKTvRRxvl1M2lMhkiSWSnxwCF/5sSJmOB0/HdvIOrxchw==');


--
-- TOC entry 2857 (class 0 OID 49500)
-- Dependencies: 203
-- Data for Name: com; Type: TABLE DATA; Schema: public; Owner: admin_escalade
--



--
-- TOC entry 2858 (class 0 OID 49508)
-- Dependencies: 204
-- Data for Name: place; Type: TABLE DATA; Schema: public; Owner: admin_escalade
--

INSERT INTO public.place (place_id, placedescription, place_name, region, tag) VALUES (7, '49573', 'Les Salces', 'Occitanie', false);
INSERT INTO public.place (place_id, placedescription, place_name, region, tag) VALUES (19, '49583', 'Roc du Gorb', 'Occitanie', false);


--
-- TOC entry 2859 (class 0 OID 49516)
-- Dependencies: 205
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: admin_escalade
--

INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('Boulder', 11, '6a', '49577', 'Le dé de 6', 'Bloc', true, NULL, NULL, NULL, 8);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('Boulder', 12, '5c+', '49578', 'L''angle terre', 'Bloc', false, NULL, NULL, NULL, 8);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('Boulder', 13, '4+', NULL, 'La dalle a Juju', 'Bloc', false, NULL, NULL, NULL, 8);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('Boulder', 14, '8a', '49579', 'Le toit des fous', 'Bloc', true, NULL, NULL, NULL, 9);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('Boulder', 15, '5b+', '49580', 'Le gruyere', 'Bloc', true, NULL, NULL, NULL, 9);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('Boulder', 16, '6b', '49581', 'Dent Tales', 'Bloc', false, NULL, NULL, NULL, 10);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('SinglePitch', 17, '4', '49582', 'Skoll Air', 'Voie Sportive', NULL, NULL, 9, 5, 10);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('SinglePitch', 18, '5a', NULL, 'Arabesque', 'Voie Sportive', NULL, NULL, 12, 6, 10);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('SinglePitch', 23, '7b', '49587', 'Pas de claquettes!', 'Voie Sportive', NULL, NULL, 7, 4, 20);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('SinglePitch', 24, '4a', '49588', 'Schtroumpfette', 'Voie Sportive', NULL, NULL, 14, 8, 21);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('SinglePitch', 25, '3c', '49589', 'Gargamel', 'Voie Sportive', NULL, NULL, 12, 6, 21);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('SinglePitch', 26, '5c+', '49590', 'Le grand schtroumpf', 'Voie Sportive', NULL, NULL, 17, 8, 21);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('MultiPitch', 27, '6a', '49591', 'La face interne', 'Grande Voie', NULL, 2, NULL, NULL, 22);
INSERT INTO public.route (dtype, id, grade, routedescription, route_name, route_type, sit_start, number_of_pitch, route_length, spit, sector_id) VALUES ('MultiPitch', 28, '6b', '49592', 'La face externe', 'Grande Voie', NULL, 2, NULL, NULL, 22);


--
-- TOC entry 2860 (class 0 OID 49524)
-- Dependencies: 206
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: admin_escalade
--

INSERT INTO public.sector (id, sectordescription, sector_name, place_place_id) VALUES (8, '49574', 'Rocher des Fées', 7);
INSERT INTO public.sector (id, sectordescription, sector_name, place_place_id) VALUES (9, '49575', 'Le Mi-haut', 7);
INSERT INTO public.sector (id, sectordescription, sector_name, place_place_id) VALUES (10, '49576', 'Les hauteurs', 7);
INSERT INTO public.sector (id, sectordescription, sector_name, place_place_id) VALUES (20, '49584', 'La plage', 19);
INSERT INTO public.sector (id, sectordescription, sector_name, place_place_id) VALUES (21, '49585', 'L''ile aux enfants', 19);
INSERT INTO public.sector (id, sectordescription, sector_name, place_place_id) VALUES (22, '49586', 'La face ouest', 19);


--
-- TOC entry 2861 (class 0 OID 49532)
-- Dependencies: 207
-- Data for Name: topo; Type: TABLE DATA; Schema: public; Owner: admin_escalade
--

INSERT INTO public.topo (id, booking, topo_available, topodescription, topo_name, topo_place, year, climber_email) VALUES (1, false, true, '49567', 'Votre premier 7a à vue', 'France', 2002, 'climber1@gmail.com');
INSERT INTO public.topo (id, booking, topo_available, topodescription, topo_name, topo_place, year, climber_email) VALUES (2, false, true, '49568', 'Escalade les Calanques', 'Les Calanques', 2016, 'climber1@gmail.com');
INSERT INTO public.topo (id, booking, topo_available, topodescription, topo_name, topo_place, year, climber_email) VALUES (3, false, true, '49569', 'Escalade au naturel dans les Hautes Pyrénées', 'Hautes Pyrénées', 2014, 'climber1@gmail.com');
INSERT INTO public.topo (id, booking, topo_available, topodescription, topo_name, topo_place, year, climber_email) VALUES (4, false, true, '49570', 'Escalade à Fontainebleau : Les plus beaux sites', 'Fontainebleau', 2012, 'climber2@gmail.com');
INSERT INTO public.topo (id, booking, topo_available, topodescription, topo_name, topo_place, year, climber_email) VALUES (5, false, true, '49571', 'Boulder en España', 'Espagne', 2019, 'climber2@gmail.com');
INSERT INTO public.topo (id, booking, topo_available, topodescription, topo_name, topo_place, year, climber_email) VALUES (6, false, true, '49572', 'Topo des blocs Ailefroide', 'Ailefroide', 2018, 'climber2@gmail.com');


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 208
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: admin_escalade
--

SELECT pg_catalog.setval('public.hibernate_sequence', 28, true);


--
-- TOC entry 2889 (class 0 OID 0)
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: -
--

BEGIN;

SELECT pg_catalog.lo_open('49567', 131072);
SELECT pg_catalog.lowrite(0, '\x556e652073c3a96c656374696f6e2064652037612c2064616e73206c65732064696666c3a972656e7465732072c3a967696f6e73206465204672616e63652c206164617074c3a9732061752022c3a020767565222e204963692070617320646520706173207370c3a963696669717565206e69206465206d6f7576656d656e7420646520626c6f632c207175652064657320766f6965732072c3a973692064616e73206c65206e697665617520376120706f757220666169726520766f747265207072656d69c3a872652063726f697820c3a0207675652064616e7320636574746520636f746174696f6e2e0d0a4c697672657420646973706f6e69626c652070617220636f72726573706f6e64616e63652061757072c3a873206465204d6172632056696c6c616c6f72612e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49568', 131072);
SELECT pg_catalog.lowrite(0, '\x4c65206d6173736966206465732043616c616e717565732065737420756e652073756363657373696f6e20696e696e746572726f6d70756520646520706f696e7465732c2064652066616365732c20646520726f63686573206e7565732c2065742064652066616c616973657320c3a02070696320737572206c61206d6572206f6d6e697072c3a973656e74652e20426c6f746920656e747265206c61206dc3a974726f706f6c65206d61727365696c6c61697365206175206e6f72642d6f756573742c206574206c6520706f7274206465204361737369732070756973206465204c612043696f746174206175207375642d6573742c2063657420657370616365206e61747572656c2065737420646576656e752050617263204e61747572656c20656e20323031322e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49569', 131072);
SELECT pg_catalog.lowrite(0, '\x457363616c61646573206175206e61747572656c207072c3a973656e7465206c6573203137207369746573206420657363616c6164652c2034383920766f6965732072c3a9706572746f7269c3a9657320646573204861757465732d507972c3a96ec3a96573206173736f6369c3a97320c3a020756e65207072c3a973656e746174696f6e2064657320657370c3a8636573207370c3a9636966697175657320c3a020636861717565206c69657520656e206661756e6520657420666c6f72652e204c206f626a6563746966206573742064206f757672697220617520706c7573206772616e64206e6f6d627265206c61207072617469717565206465732073697465732e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49570', 131072);
SELECT pg_catalog.lowrite(0, '\x466f6e7461696e65626c6561752c20756e206c69657520756e69717565206175206d6f6e646520706f757220707261746971756572206c27657363616c61646520646520626c6f632e204365747465206e6f7576656c6c6520c3a9646974696f6e2c20636f6d706cc3a974c3a96520657420656e7269636869652c2070726f706f736520646573206361727465732064c3a97461696c6cc3a965732065742064657320696e666f726d6174696f6e732070726174697175657320706f757220766f7573206163636f6d7061676e657220737572206c6573207369746573206427657363616c6164652e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49571', 131072);
SELECT pg_catalog.lowrite(0, '\x556e652073c3a96c656374696f6e2064657320706c757320626561757820626c6f637320646520343220736974657320746f7574206175746f7572206465206c2745737061676e652e20446520416c626172726163696e20c3a020456c20436f67756c202c20647520626c6f6320747261646974696f6e6e656c2061752070737963686f626c6f632e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49572', 131072);
SELECT pg_catalog.lowrite(0, '\x546f706f2064752063c3a96cc3a862726520736974652064652041696c6566726f696465206fc3b92073652064c3a9726f756c652063686171756520616e6ec3a965206c65205441422c207072c3a973656e74c3a920706172206c61207465616d2064657320436f6c6c6574732e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49573', 131072);
SELECT pg_catalog.lowrite(0, '\x5369746520646520626c6f6320657420646520766f6965732073706f72746976652073697475c3a92064616e73206c2748c3a97261756c742e20446570756973204c6f64c3a87665207072656e647265206c6120646972656374696f6e206465205361696e74205072697661742c207075697320636f6e74696e756572206a757371752761752076696c6c616765206465204c65732053616c6365732e2041206c27656e7472c3a9652064752076696c6c616765207072656e64726520c3a020676175636865206c65206368656d696e20696e64697175c3a92022526f63686572206465732046c3a9657322202e20417072c3a873206c652063696d657469c3a8726520617474656e64726520642761766f69722070617373c3a9206c6573206465726e69c3a87265732068616269746174696f6e7320706f7572207365206761726572206c65206c6f6e67206475206368656d696e2e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49574', 131072);
SELECT pg_catalog.lowrite(0, '\x5072656d696572207365637465757220656e206172726976616e742c206c6520726f63686572206465732066c3a965732065737420696e64697175c3a920657420657374206c65207365756c20726f6368657220737572206c657175656c206c27657363616c6164652065737420494e544552444954452e204a75737465206465727269c3a8726520636520726f63686572207365207369747565206c652073656374657572206475206dc3aa6d65206e6f6d2e204c65207365637465757220646520626c6f632c20617373657a20706c61742c206c657320726f636865722061636365737369626c65732e2042656175636f757020646520626c6f632064616e73206c657320636f746174696f6e73203420657420352c2070657520646520686175746575722e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49575', 131072);
SELECT pg_catalog.lowrite(0, '\x5072656e647265206c65206368656d696e206d6f6e74616e742076657273206c6120676175636865206c6f727371756520766f757320c3aa746573206661636520617520726f63686572206465732066c3a965732e204c65207365637465757220736520736974756520656e7669726f6e203130306d206175206465737375732e20432765737420756e207365637465757220646520626c6f6320706c757320646966666963696c65207175652063656c756920647520726f63686572206465732066c3a9657320617665632064657320626c6f6373207472c3a87320686175747320282021617474656e74696f6e21204365727461696e7320626c6f637320666c65757274656e742061766563206c657320386d292e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49576', 131072);
SELECT pg_catalog.lowrite(0, '\x536563746575722073697475c3a920617520646573737573206475207365637465757220224c65204d692d6861757422202c206c6520747261766572736572206574207072656e647265206c652073656e74696572206d6f6e74616e7420737572206c61206761756368652e2049636920766f75732074726f75766572657a207072696e636970616c656d656e74206465732064616c6c65732e204c652064c3a96275742064752073656374657572206573742070617273656dc3a920646520626c6f63732c206d61697320766f75732074726f75766572657a206175737369206465206c6120766f69652073706f727469766520617520666f6e642064752073656374657572206176656320756e652076696e677461696e6520646520766f69657320c3a971756970c3a965732e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49577', 131072);
SELECT pg_catalog.lowrite(0, '\x4c6520366120706f757220656e66616e7420706172206578656c6c656e63652120326d3330207365756c656d656e74');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49578', 131072);
SELECT pg_catalog.lowrite(0, '\x556e65206172c3aa746520617665632064657320696e7665727320706c61747320c3a020636f6d70726573736572');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49579', 131072);
SELECT pg_catalog.lowrite(0, '\x70726f6a6574');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49580', 131072);
SELECT pg_catalog.lowrite(0, '\x47726f732064c3a9766572732073757220756e20726f6368657220657863657074696f6e6e656c20212121');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49581', 131072);
SELECT pg_catalog.lowrite(0, '\x4e6520636865726368657a20706173206c6573206d61696e73202e2e2e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49582', 131072);
SELECT pg_catalog.lowrite(0, '\x566f696520c3a9636f6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49583', 131072);
SELECT pg_catalog.lowrite(0, '\x446570756973206c652076696c6c616765204261722c20736520646972696765722076657273206c652056696175722e20417072c3a873207175656c7175657320766972616765206c65206368656d696e2076657273206c65207061726b696e672065737420696e64697175c3a92073757220766f7472652064726f6974652e20526f75746520676f7564726f6e6ec3a9652073757220756e65206772616e646520706172746965206d61697320726f756c657a206175207061733a20656e66616e747320c3a02070726f78696d6974c3a92065742063616d70696e672e204475207061726b696e67206c652073656e746965722065737420726f79616c20657420706c61742e204172726976c3a92061752073697465206c65732064696666c3a972656e747320736563746575727320736f6e7420696e64697175c3a97320706172206465732070616e6e656175782e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49584', 131072);
SELECT pg_catalog.lowrite(0, '\x536563746575722071756920706f727465206269656e20736f6e206e6f6d203a20656e206172726976616e7420737572206c65207369746520706172206c65206368656d696e20766f75732061706572636576657a20696d6dc3a964696174656d656e7420756e6520706c616765206465207361626c6520626c6f74696520656e747265206c612072697669c3a87265206574206c612066616c61697365203a206327657374206269656e20696369206c652073656374657572206465206c6120706c6167652e20496369206c657320766f69657320736f6e7420636f7572746573206d616973206c657320636f746174696f6e7320736f6e74206c657320706c757320c3a96c6576c3a96573206475207369746520283762206d6178292e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49585', 131072);
SELECT pg_catalog.lowrite(0, '\x4c276573706163652073697475c3a973206a7573746520c3a02064726f697465206475207365637465757220226c6120706c616765222c2069636920632765737420756e652066616c6169736520c3a9636f6c652c207061726661697420706f75722061707072656e647265203a2064752034206d616a6f726974616972656d656e7420657420656e206469c3a86472652021');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49586', 131072);
SELECT pg_catalog.lowrite(0, '\x53656374657572206c6520706c757320c3a0206c276f7565737420636f6d6d6520736f6e206e6f6d206c27696e6469717565203a20706f7572206c6520726570c3a972657220636865726368657a20756e652062656c6c65206661696c6c6520706f757220766f757320656e666f6e6365722064616e73206c6120726f6368652e0d0a49636920766f7573206e652076657272657a2071756520322064c3a9706172747320646520766f6965732c20636520736f6e74206c65732032206772616e64657320766f69657320647520726f6320647520476f72622061766563206c612032c3a86d65206c6f6e677565757220636f6d6d756e652e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49587', 131072);
SELECT pg_catalog.lowrite(0, '\x5472c3a87320636f757274206d616973207472c3a87320747970c3a920626c6f6321');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49588', 131072);
SELECT pg_catalog.lowrite(0, '\x4469c3a864726520c3a9636f6c652e20506f696e747320c3a0206c27657874c3a972696575722e');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49589', 131072);
SELECT pg_catalog.lowrite(0, '\x5061726661697420706f7572206c657320656e66616e7473');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49590', 131072);
SELECT pg_catalog.lowrite(0, '\x42656c6c652064616c6c65207375722072c3a9676c6574746573');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49591', 131072);
SELECT pg_catalog.lowrite(0, '\x44c3a97061727420617520666f6e64206465206c61206661696c6c65');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('49592', 131072);
SELECT pg_catalog.lowrite(0, '\x4465726e69c3a87265206c6f6e677565757220636f6d6d756e652061766563206c65203661');
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- TOC entry 2714 (class 2606 OID 49499)
-- Name: climber climber_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.climber
    ADD CONSTRAINT climber_pkey PRIMARY KEY (email);


--
-- TOC entry 2716 (class 2606 OID 49507)
-- Name: com com_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.com
    ADD CONSTRAINT com_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 49515)
-- Name: place place_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_pkey PRIMARY KEY (place_id);


--
-- TOC entry 2720 (class 2606 OID 49523)
-- Name: route route_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 49531)
-- Name: sector sector_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 49539)
-- Name: topo topo_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT topo_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 49542)
-- Name: com fk74w6qduhhxlyfcmg617uqb7np; Type: FK CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.com
    ADD CONSTRAINT fk74w6qduhhxlyfcmg617uqb7np FOREIGN KEY (climber_email) REFERENCES public.climber(email);


--
-- TOC entry 2726 (class 2606 OID 49547)
-- Name: com fkah9ns1xjigii7u9me2p3l3uas; Type: FK CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.com
    ADD CONSTRAINT fkah9ns1xjigii7u9me2p3l3uas FOREIGN KEY (place_place_id) REFERENCES public.place(place_id);


--
-- TOC entry 2727 (class 2606 OID 49552)
-- Name: route fkcqd7iydihtx8iv1gi2dg0455y; Type: FK CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT fkcqd7iydihtx8iv1gi2dg0455y FOREIGN KEY (sector_id) REFERENCES public.sector(id);


--
-- TOC entry 2728 (class 2606 OID 49557)
-- Name: sector fkhyxgjgwbhma4oe37pbl2r7cjw; Type: FK CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT fkhyxgjgwbhma4oe37pbl2r7cjw FOREIGN KEY (place_place_id) REFERENCES public.place(place_id);


--
-- TOC entry 2729 (class 2606 OID 49562)
-- Name: topo fkmupc8pvli3ssox7d85dmi2uhc; Type: FK CONSTRAINT; Schema: public; Owner: admin_escalade
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT fkmupc8pvli3ssox7d85dmi2uhc FOREIGN KEY (climber_email) REFERENCES public.climber(email);


-- Completed on 2020-07-20 13:59:09

--
-- PostgreSQL database dump complete
--

