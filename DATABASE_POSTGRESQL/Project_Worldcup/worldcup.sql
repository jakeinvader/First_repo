--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (162, 2018, 'Final', 971, 972, 4, 2);
INSERT INTO public.games VALUES (163, 2018, 'Third Place', 973, 974, 2, 0);
INSERT INTO public.games VALUES (164, 2018, 'Semi-Final', 972, 974, 2, 1);
INSERT INTO public.games VALUES (165, 2018, 'Semi-Final', 971, 973, 1, 0);
INSERT INTO public.games VALUES (166, 2018, 'Quarter-Final', 972, 976, 3, 2);
INSERT INTO public.games VALUES (167, 2018, 'Quarter-Final', 974, 978, 2, 0);
INSERT INTO public.games VALUES (168, 2018, 'Quarter-Final', 973, 980, 2, 1);
INSERT INTO public.games VALUES (169, 2018, 'Quarter-Final', 971, 982, 2, 0);
INSERT INTO public.games VALUES (170, 2018, 'Eighth-Final', 974, 984, 2, 1);
INSERT INTO public.games VALUES (171, 2018, 'Eighth-Final', 978, 986, 1, 0);
INSERT INTO public.games VALUES (172, 2018, 'Eighth-Final', 973, 988, 3, 2);
INSERT INTO public.games VALUES (173, 2018, 'Eighth-Final', 980, 990, 2, 0);
INSERT INTO public.games VALUES (174, 2018, 'Eighth-Final', 972, 992, 2, 1);
INSERT INTO public.games VALUES (175, 2018, 'Eighth-Final', 976, 994, 2, 1);
INSERT INTO public.games VALUES (176, 2018, 'Eighth-Final', 982, 996, 2, 1);
INSERT INTO public.games VALUES (177, 2018, 'Eighth-Final', 971, 998, 4, 3);
INSERT INTO public.games VALUES (178, 2014, 'Final', 999, 998, 1, 0);
INSERT INTO public.games VALUES (179, 2014, 'Third Place', 1001, 980, 3, 0);
INSERT INTO public.games VALUES (180, 2014, 'Semi-Final', 998, 1001, 1, 0);
INSERT INTO public.games VALUES (181, 2014, 'Semi-Final', 999, 980, 7, 1);
INSERT INTO public.games VALUES (182, 2014, 'Quarter-Final', 1001, 1004, 1, 0);
INSERT INTO public.games VALUES (183, 2014, 'Quarter-Final', 998, 973, 1, 0);
INSERT INTO public.games VALUES (184, 2014, 'Quarter-Final', 980, 984, 2, 1);
INSERT INTO public.games VALUES (185, 2014, 'Quarter-Final', 999, 971, 1, 0);
INSERT INTO public.games VALUES (186, 2014, 'Eighth-Final', 980, 1006, 2, 1);
INSERT INTO public.games VALUES (187, 2014, 'Eighth-Final', 984, 982, 2, 0);
INSERT INTO public.games VALUES (188, 2014, 'Eighth-Final', 971, 1008, 2, 0);
INSERT INTO public.games VALUES (189, 2014, 'Eighth-Final', 999, 1010, 2, 1);
INSERT INTO public.games VALUES (190, 2014, 'Eighth-Final', 1001, 990, 2, 1);
INSERT INTO public.games VALUES (191, 2014, 'Eighth-Final', 1004, 1012, 2, 1);
INSERT INTO public.games VALUES (192, 2014, 'Eighth-Final', 998, 986, 1, 0);
INSERT INTO public.games VALUES (193, 2014, 'Eighth-Final', 973, 1014, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (971, 'France');
INSERT INTO public.teams VALUES (972, 'Croatia');
INSERT INTO public.teams VALUES (973, 'Belgium');
INSERT INTO public.teams VALUES (974, 'England');
INSERT INTO public.teams VALUES (976, 'Russia');
INSERT INTO public.teams VALUES (978, 'Sweden');
INSERT INTO public.teams VALUES (980, 'Brazil');
INSERT INTO public.teams VALUES (982, 'Uruguay');
INSERT INTO public.teams VALUES (984, 'Colombia');
INSERT INTO public.teams VALUES (986, 'Switzerland');
INSERT INTO public.teams VALUES (988, 'Japan');
INSERT INTO public.teams VALUES (990, 'Mexico');
INSERT INTO public.teams VALUES (992, 'Denmark');
INSERT INTO public.teams VALUES (994, 'Spain');
INSERT INTO public.teams VALUES (996, 'Portugal');
INSERT INTO public.teams VALUES (998, 'Argentina');
INSERT INTO public.teams VALUES (999, 'Germany');
INSERT INTO public.teams VALUES (1001, 'Netherlands');
INSERT INTO public.teams VALUES (1004, 'Costa Rica');
INSERT INTO public.teams VALUES (1006, 'Chile');
INSERT INTO public.teams VALUES (1008, 'Nigeria');
INSERT INTO public.teams VALUES (1010, 'Algeria');
INSERT INTO public.teams VALUES (1012, 'Greece');
INSERT INTO public.teams VALUES (1014, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 193, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1014, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

