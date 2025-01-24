--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    phone character varying(20),
    loyalty_points integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    hire_date date NOT NULL,
    role character varying(50) NOT NULL,
    email character varying(100),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_employee_id_seq OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- Name: inventory_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_tracking (
    tracking_id integer NOT NULL,
    product_id integer,
    quantity_change integer NOT NULL,
    change_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    reason character varying(100),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.inventory_tracking OWNER TO postgres;

--
-- Name: inventory_tracking_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_tracking_tracking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_tracking_tracking_id_seq OWNER TO postgres;

--
-- Name: inventory_tracking_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_tracking_tracking_id_seq OWNED BY public.inventory_tracking.tracking_id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    order_detail_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- Name: order_details_order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_details_order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_details_order_detail_id_seq OWNER TO postgres;

--
-- Name: order_details_order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_details_order_detail_id_seq OWNED BY public.order_details.order_detail_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    employee_id integer,
    customer_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    payment_method character varying(50) NOT NULL,
    order_status character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    category character varying(50) NOT NULL,
    unit_price character varying NOT NULL,
    cost_price character varying NOT NULL,
    in_stock boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- Name: inventory_tracking tracking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_tracking ALTER COLUMN tracking_id SET DEFAULT nextval('public.inventory_tracking_tracking_id_seq'::regclass);


--
-- Name: order_details order_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details ALTER COLUMN order_detail_id SET DEFAULT nextval('public.order_details_order_detail_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, first_name, last_name, email, phone, loyalty_points, created_at) FROM stdin;
492	Paul	Hawkins	bmorris@example.net	9958687561434	708	2022-06-13 03:01:06
493	Jessica	Hendricks	sandramalone@example.com	3378843199040	241	2020-09-08 21:31:15
494	Christian	Shepherd	lreed@example.net	8814427344096	239	2023-03-27 18:02:37
495	Robert	Perry	ninalucero@example.com	6819873900353	956	2024-05-20 19:48:10
496	Courtney	Miller	coxmartin@example.net	7185028607446	677	2020-01-05 06:32:44
497	Roy	Gilbert	mannrebecca@example.net	5752641899968	828	2021-12-18 14:27:24
498	Shannon	Gonzalez	riverajames@example.net	1913572104679	803	2022-04-16 23:40:58
499	Denise	Brown	matthewpena@example.com	2904231549618	414	2024-09-22 09:57:22
500	Sean	Farmer	courtneygreen@example.com	9404201311506	655	2023-07-03 22:00:37
501	Michelle	Duncan	dkerr@example.org	8954575228954	861	2024-09-01 05:43:34
502	Patricia	Allen	jeffery15@example.org	3377837161791	963	2022-01-26 20:46:21
503	Matthew	Fitzgerald	copelanderica@example.com	6499593588274	838	2020-08-26 01:01:15
504	Garrett	Davidson	wardedwin@example.com	8277712333115	724	2021-12-04 19:26:48
505	Brandi	Robinson	nicholashunt@example.org	2986910458164	426	2020-01-19 17:52:58
506	Wendy	Miller	brianlambert@example.net	3355189748460	90	2022-08-03 22:18:55
507	James	Torres	riveralaura@example.org	5093323481749	452	2023-02-14 10:00:38
508	Geoffrey	Smith	nicole04@example.net	2762353685785	54	2022-04-22 08:56:46
509	Tamara	Stone	bguerrero@example.com	4539983852775	419	2023-11-24 21:14:44
510	Audrey	Marquez	ericrodriguez@example.org	5131282836107	120	2021-01-16 11:48:40
511	Karen	George	stacey59@example.com	5679173949846	232	2022-07-04 12:46:05
512	Amy	Davis	jordanclark@example.com	8631953055417	98	2022-09-04 20:13:05
513	Terri	Nelson	franciscorobinson@example.org	5907924525267	975	2020-02-03 13:30:25
514	Kathryn	Wallace	brownspencer@example.com	2934081930911	134	2021-07-01 12:07:23
515	Nathaniel	Jones	alanwest@example.org	1454799684221	139	2020-10-07 17:05:16
516	Christine	Curry	evansfrederick@example.com	6837295418746	981	2021-11-30 17:47:11
517	Kristen	Rodriguez	dwatts@example.org	9951200120044	950	2020-05-29 02:43:10
518	Michelle	Hurst	dawsonsandra@example.net	8514161943171	973	2021-12-06 05:31:41
519	Angela	Beltran	gabrielmendoza@example.com	7340349136433	693	2024-12-20 06:54:19
520	Miguel	Summers	denise22@example.com	7260808919781	252	2023-07-28 22:43:40
521	Shelly	Smith	oshields@example.com	4079107396473	315	2021-10-12 12:57:57
522	Megan	Hicks	scott58@example.net	7390776883598	626	2021-05-06 22:33:42
523	Melissa	Roth	rachelporter@example.org	8668157599613	513	2021-08-13 05:44:59
524	Nicholas	Erickson	ashleydorsey@example.net	4278311221779	585	2021-09-12 13:57:27
525	Julia	Cuevas	tabbott@example.net	7825887167677	545	2020-09-21 16:04:50
526	Michael	Evans	jamesmorris@example.net	7888145717009	464	2020-12-01 01:06:14
527	Jason	Washington	flemingoscar@example.com	9501555133453	514	2024-08-21 09:33:02
528	Brian	Hubbard	melindastevenson@example.net	9304636522988	950	2024-01-14 02:06:39
529	Christopher	Ferguson	rdavis@example.com	3597514805337	174	2023-10-10 10:03:50
530	Tracy	Hardy	owensandrea@example.net	7828249627511	286	2023-09-12 17:00:26
531	Shannon	Butler	jeanettewhite@example.org	8929812259009	928	2020-04-16 15:47:25
532	Samantha	Jones	tburgess@example.com	4746981590078	763	2020-01-04 22:18:27
533	Emily	Brooks	smithbill@example.org	3946694728366	66	2023-01-23 23:01:53
534	Adam	Ochoa	espinozajesus@example.net	5067411524493	738	2024-08-18 03:42:24
535	David	Harmon	lindseychristina@example.com	8409427052444	360	2024-01-23 11:04:34
536	Jennifer	Reid	garnerpatricia@example.net	2078967411404	904	2020-12-11 03:43:51
537	Michelle	Rivera	miranda43@example.com	7868078669327	537	2022-05-13 05:49:21
538	Amber	Jordan	russell22@example.org	5469542631029	936	2023-02-08 02:09:04
539	Mercedes	Jacobs	harry43@example.com	9703875925439	220	2020-12-16 17:50:13
540	Kristine	Bean	hendersonkathryn@example.com	2608789298269	830	2022-09-11 02:53:18
541	Adam	Copeland	villarrealchristopher@example.org	3144087939965	549	2020-09-19 19:07:24
542	Nina	Bradley	robert89@example.org	5625561813221	854	2021-05-07 20:46:50
543	Desiree	Brewer	smithderrick@example.com	5533108876421	697	2023-12-01 16:48:26
544	Phillip	Martin	xwalters@example.com	8929889207997	349	2024-11-14 06:07:59
545	Samantha	Gomez	padillaveronica@example.net	1438417409132	231	2022-08-11 08:07:24
546	Daniel	Newman	williamsbrenda@example.com	6670314873999	953	2022-12-29 11:58:12
547	Anthony	Parker	alexanderchristopher@example.net	1116039199021	372	2020-03-31 03:11:32
548	Jacob	Bailey	smithnancy@example.org	4766689476945	649	2023-02-01 21:45:28
549	Manuel	Carroll	steve62@example.org	9292182419993	689	2022-03-13 12:32:30
550	Jasmine	James	kingnicole@example.com	2399240057663	961	2024-12-17 06:45:13
551	Carolyn	Ryan	robin10@example.net	4647463370435	489	2024-12-30 20:25:38
552	Tammy	Morris	johnrowe@example.com	2613366371398	296	2021-02-18 04:12:14
553	Bradley	King	ellen97@example.com	4958514098431	802	2020-07-10 15:37:07
554	Meghan	Wiley	kevinharris@example.com	2768648227472	594	2021-06-07 19:31:05
555	Aaron	Arnold	adam75@example.org	2926082122046	992	2022-03-01 18:35:06
556	Kristen	Gonzales	frank21@example.net	3897889413120	982	2020-02-29 03:03:04
557	Mary	Collins	jonestaylor@example.net	2814450312526	608	2024-08-11 06:10:37
558	Robert	Reyes	andrewsallison@example.com	7204538060705	409	2021-08-19 10:11:54
559	Richard	Ramirez	karen94@example.net	2244335439105	623	2020-04-23 09:10:58
560	Sabrina	Rodriguez	kevin74@example.com	9383280305403	150	2023-08-31 04:38:30
561	Ashley	Gordon	robertclark@example.net	2855571083433	521	2020-05-08 07:38:10
562	Jasmine	Washington	tuckerjennifer@example.org	5997477830067	127	2022-08-16 14:07:51
563	Eric	Mcintosh	grodriguez@example.net	3445009902970	626	2022-07-02 19:14:05
564	Jeanette	Thomas	santosangela@example.org	9488666120643	773	2024-10-04 17:22:44
565	Mark	Bates	littlejason@example.net	1940351090739	641	2021-05-02 03:51:18
566	Nicole	Ruiz	jonesmelissa@example.com	6047810845108	879	2021-01-05 05:50:37
567	Dakota	Kane	joel82@example.net	6183656604739	261	2020-01-18 03:39:04
568	Timothy	Cannon	pevans@example.org	1246415089717	263	2022-10-03 06:51:39
569	Steven	Bell	eric09@example.net	4207114745361	829	2021-11-21 12:08:59
570	Michael	Gordon	jennifer29@example.org	2399095354708	887	2022-06-08 02:18:59
571	Albert	Adams	uross@example.com	4903933158578	50	2024-07-26 07:00:49
572	Amanda	Vang	hweber@example.net	5766900740169	438	2021-05-17 14:40:32
573	Elizabeth	Leon	tiffany01@example.com	1900607458740	490	2023-11-26 23:20:31
574	Kendra	Aguilar	alexander83@example.org	8498661206269	776	2021-03-20 22:32:25
575	Katherine	Wilson	james24@example.net	1439579942576	448	2024-06-02 21:23:45
576	Paul	Kim	sarah88@example.com	4647373875339	17	2020-06-06 17:55:22
577	Michael	Russell	mbuckley@example.com	9084963135658	43	2022-08-09 05:36:00
578	Mark	Shea	donnafuller@example.net	5770539375824	271	2021-03-28 11:58:10
579	Morgan	Wang	raymond17@example.org	4179619027335	431	2024-12-21 12:36:23
580	Crystal	Haynes	ann24@example.org	1308374656964	866	2021-11-14 15:47:04
581	Joshua	Saunders	fhicks@example.com	9897158590903	987	2023-03-31 21:25:55
582	Cassandra	Jones	conniehouston@example.net	7671807691470	436	2022-03-19 08:18:51
583	David	Ramsey	alan53@example.com	2805650693702	382	2020-05-27 04:21:34
584	Donna	Wheeler	vcarey@example.net	6641698120555	452	2022-08-22 05:06:40
585	Daniel	Miller	david60@example.net	1712312279256	27	2023-06-27 02:38:47
586	Erik	Mcconnell	aconrad@example.org	7549564946090	727	2020-03-05 21:17:46
587	Katherine	Brooks	markjackson@example.com	3895612237511	390	2020-07-10 08:19:33
588	Rebecca	Chambers	badams@example.com	7347075178011	652	2021-07-13 17:08:45
589	Connie	Johnston	brittanycooke@example.org	6399007511416	235	2022-06-20 23:47:37
590	Deborah	Wright	kevinlambert@example.net	2767450534760	718	2021-01-19 14:20:24
591	Christopher	Grant	christydavis@example.org	7896253803123	10	2020-02-13 17:46:00
592	Daniel	Rogers	timothyfrancis@example.com	8523336364132	791	2020-05-21 09:58:48
593	Deborah	Rice	floresjeffery@example.org	1196801789305	680	2022-07-18 23:17:44
594	Benjamin	Rice	kristie43@example.net	2031904307214	753	2022-01-14 02:21:07
595	David	Kelly	carterbobby@example.net	2979119298574	804	2022-04-02 21:52:59
596	Jennifer	Mcgee	parkerstephanie@example.com	1024256052852	730	2020-12-02 07:03:48
597	Stacie	Castaneda	fernandezsherry@example.net	4405950370558	420	2022-04-11 06:04:09
598	Jessica	Ramirez	mooresandra@example.org	2100407574258	225	2021-12-14 02:01:31
599	Haley	Beck	daniel80@example.org	6632526796689	464	2023-05-19 09:06:26
600	Elizabeth	Lowe	jstewart@example.org	2863120782492	828	2021-07-13 04:18:08
601	Joseph	Campbell	johnmurphy@example.org	1526055607994	801	2021-09-18 17:43:34
602	Tracy	Hardy	jeffrey24@example.com	6938630311863	399	2020-01-12 18:48:45
603	Jennifer	Horn	olong@example.com	8792786414488	331	2023-05-28 20:23:02
604	Dean	Humphrey	xescobar@example.org	9959383406831	403	2022-10-24 22:35:53
605	Anne	Morris	ucombs@example.org	2619216451455	723	2020-10-23 00:24:21
606	Thomas	Doyle	michelleking@example.net	4548144407912	512	2021-03-08 23:16:29
607	Nathaniel	Rivera	xhutchinson@example.net	3833192646939	310	2023-06-06 15:55:54
608	Shane	Blevins	nixonderrick@example.org	3037390873717	435	2024-05-18 21:41:55
609	Monica	Sullivan	katie10@example.net	4467817118793	27	2021-10-11 10:53:13
610	Jose	Mcbride	bradleywise@example.net	8885960241389	872	2023-01-12 23:31:09
611	Steven	Castaneda	woodbarbara@example.net	2290287260469	107	2020-10-23 22:50:13
612	Scott	Moore	bperry@example.net	3146302700854	419	2024-12-14 14:10:32
613	Matthew	Clark	elizabeth55@example.org	4753555735873	88	2023-02-12 10:28:32
614	Willie	Garcia	sfox@example.net	4333161130304	97	2023-02-12 17:21:40
615	Zachary	Lawrence	rjacobs@example.org	5770374312466	151	2021-05-10 16:18:49
616	Amy	Maldonado	gonzalezryan@example.net	7806627479965	572	2020-09-25 05:42:02
617	Joyce	Watts	simmonscynthia@example.org	7248242788467	943	2022-05-06 03:18:20
618	Greg	Jenkins	fgarrett@example.org	6546259896865	183	2024-04-09 20:53:27
619	Kelly	Holland	vicki19@example.org	2473821586521	571	2021-04-19 18:12:47
620	Michael	Black	davidfoley@example.net	5440740848736	923	2021-07-18 04:15:15
621	Mark	Campbell	walterwood@example.org	8524526715615	840	2022-12-26 02:04:45
622	Robert	Vega	richard91@example.org	3785437167866	987	2024-11-13 18:26:55
623	Brenda	Howard	mritter@example.com	3234147351628	63	2022-06-13 19:55:13
624	Melissa	Jackson	jmonroe@example.org	3776981753216	563	2022-02-09 08:40:03
625	Suzanne	Malone	harmontimothy@example.com	3646063703390	502	2020-03-09 09:19:40
626	Anthony	Dixon	stephenadams@example.org	4152516230923	138	2020-02-21 23:41:29
627	Christopher	Miller	christopher22@example.com	7870506297481	979	2024-02-25 20:12:07
628	Bonnie	Thornton	david47@example.net	3466055011059	149	2022-01-28 22:21:59
629	Danielle	Hall	meaganchavez@example.net	2594568074790	800	2024-06-21 04:05:16
630	Kayla	Stevens	zwilson@example.org	2958274322654	514	2022-09-21 15:38:05
631	Brian	Howard	mpena@example.com	6073926708523	383	2022-04-16 05:05:48
632	Michael	Carrillo	cassidy06@example.com	7268215398255	462	2021-07-29 13:51:35
633	Joseph	Wheeler	glovermichael@example.net	5161906890418	711	2024-03-27 07:55:16
634	Melanie	Carrillo	marcus56@example.com	8320309036713	823	2020-06-19 21:14:57
635	James	Tyler	pmcknight@example.org	7031971738230	475	2021-01-25 19:48:23
636	Zachary	Kelly	taylorchristopher@example.net	5167559195344	903	2021-01-05 01:37:47
637	Megan	Walker	frankhill@example.org	6117308435676	558	2023-04-17 19:50:20
638	Peter	Brown	russellluis@example.com	1928619892962	287	2023-02-09 23:51:57
639	Mark	Armstrong	hogankathleen@example.org	2555610297104	761	2020-08-21 15:58:12
640	Eugene	Herring	graveseugene@example.net	6717321805345	307	2021-06-12 04:36:54
641	Anthony	Hart	jeremy44@example.org	7932485404175	717	2023-01-12 01:27:01
642	David	Roach	thomaswilliam@example.org	6445422592333	173	2024-05-09 13:47:13
643	Marcus	Stewart	agill@example.com	9648488873035	348	2021-12-14 10:21:38
644	Patrick	Arias	williamscrystal@example.com	4538967619488	362	2022-10-08 00:32:43
645	Stephanie	Morales	hooperjustin@example.org	1385249089588	476	2022-11-08 14:15:53
646	Jonathan	Smith	butlersusan@example.net	9461754719447	873	2024-01-09 14:17:47
647	Richard	Martin	albertcooper@example.org	6557573447468	223	2023-10-26 00:41:57
648	Robert	Ramos	derrick11@example.net	5688484755209	795	2024-02-27 00:16:59
649	Allen	Tyler	olivercrystal@example.com	7610719490698	458	2022-06-20 10:19:11
650	Samuel	Schroeder	murphyregina@example.com	6112175687547	757	2023-09-13 03:26:56
651	Stacy	Warren	hudsonnicholas@example.net	4605810208845	536	2024-05-20 22:41:15
652	Charles	Barrett	marievazquez@example.net	3167909493355	543	2024-04-19 05:17:00
653	Bridget	Myers	shannonbrooks@example.org	4793100912389	254	2024-06-28 22:40:31
654	Michael	Miller	raymondcooper@example.com	1350660013179	612	2021-12-02 23:57:02
655	Jeffrey	Kramer	robert13@example.org	6265820039208	63	2023-02-02 20:30:46
656	Joe	Sampson	smithchristian@example.org	4334395033908	458	2022-07-17 23:16:43
657	John	Cruz	rjones@example.com	9827756474126	759	2023-12-19 20:52:18
658	Jennifer	Carter	adam09@example.org	8583675487125	249	2022-10-25 16:16:09
659	Victoria	Griffin	foxjason@example.org	5465214695086	122	2023-09-01 10:24:23
660	Daniel	Larson	vstout@example.com	5162114939611	795	2021-06-24 16:19:14
661	Hannah	Flores	maldonadoanthony@example.com	2847219251756	85	2023-09-27 15:40:23
662	Robert	Turner	vargasjames@example.com	4926602063949	647	2022-05-12 20:46:38
663	Joanna	Thompson	hrodriguez@example.org	4391471462419	97	2024-08-31 07:01:52
664	Beverly	Lin	ejensen@example.org	2163294469838	804	2022-07-13 10:15:03
665	Michael	Miller	rodriguezlisa@example.org	7403622920469	784	2020-06-27 17:15:25
666	Tracy	Smith	xjimenez@example.org	8332745322544	354	2022-02-05 21:04:41
667	Derrick	Rodriguez	ganderson@example.net	3255371528276	117	2024-10-23 01:38:59
668	Nicholas	Haynes	pcastro@example.org	6622629672148	168	2022-03-19 01:22:19
669	Robert	Patel	urobertson@example.org	8221630690552	470	2023-04-18 00:48:26
670	Katie	Perez	sarahchang@example.net	9107887340006	743	2020-07-10 13:27:26
671	Victoria	Martinez	jonescody@example.net	5178725698965	324	2022-02-15 20:23:13
672	Daniel	Daniel	josejones@example.net	4360100478413	203	2021-03-10 03:20:01
673	Carla	Davidson	marissa61@example.com	5357464211080	997	2020-09-09 18:27:49
674	Lisa	Stewart	tyler53@example.com	3233635534036	354	2023-10-18 23:52:04
675	Jeffrey	Morgan	stephen60@example.org	9074699649111	53	2021-01-23 11:08:12
676	Deborah	Fields	brenda52@example.com	1904806116901	155	2020-02-23 05:30:05
677	Daniel	Moore	johnsonjohn@example.org	6354079179449	152	2020-12-30 03:05:08
678	Taylor	Anthony	jennifersloan@example.com	3556945750078	941	2024-02-14 05:41:42
679	Eric	Flores	jsanders@example.org	9755413039925	517	2022-09-11 20:06:16
680	Carrie	Skinner	uroach@example.org	6251863101159	543	2021-07-22 04:59:47
681	Jeffrey	Martin	jbyrd@example.net	5480862740688	451	2024-08-07 19:30:59
682	Scott	Davis	lauriesmith@example.net	4777186696869	983	2021-12-18 00:47:17
683	Nathaniel	Banks	gallowaylaura@example.com	7788348880965	221	2020-04-24 01:19:48
684	Michael	Maldonado	deborahgreen@example.com	7207054430788	666	2024-02-10 09:31:41
685	Jason	Garcia	williamgonzalez@example.net	2329644410078	239	2023-02-16 01:11:51
686	Miranda	Harding	matthew09@example.org	9420528649520	754	2020-06-09 05:22:52
687	Douglas	Hubbard	ryanevans@example.com	2612628017052	10	2021-08-20 21:41:56
688	Emily	Crawford	sextonheather@example.com	5742110376696	355	2023-04-25 02:26:48
689	Lori	Santiago	ubailey@example.com	8426193862753	46	2021-07-28 08:40:13
690	Robert	Christian	fergusonjohnny@example.com	6041338993108	295	2022-06-08 17:53:45
691	Joseph	Torres	kelseyclayton@example.org	6326268915948	751	2023-08-09 13:28:45
692	Angela	Morris	krista81@example.net	\N	-710	2023-08-09 13:48:24
693	Eddie	Murphy	denise83@example.net	\N	-525	2023-08-09 20:00:01
694	Jennifer	Lara	santostimothy@example.com	\N	-304	2023-08-09 03:19:18
695	Lisa	Davis	christopher59@example.net	\N	-993	2023-08-09 10:33:21
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, first_name, last_name, hire_date, role, email, created_at) FROM stdin;
1	John	Gordon	2020-07-19	Cashier	john04@example.net	2020-07-19 07:48:20
2	Gregory	Curry	2023-05-15	Waitress	rachaelfreeman@example.org	2023-05-15 02:28:15
3	Chris	Allen	2022-11-27	Waitress	petercox@example.org	2022-11-27 14:52:27
4	Ryan	Mitchell	2021-07-06	Cashier	smithsteven@example.net	2021-07-06 06:00:29
5	Tyler	Wiggins	2021-10-21	Manager	vgriffin@example.com	2021-10-21 21:23:43
6	Sharon	Wilkinson	2022-05-16	Cashier	wilsonlisa@example.net	2022-05-16 07:39:13
7	Linda	Montgomery	2022-03-10	Waitress	uwilkerson@example.org	2022-03-10 01:46:33
8	Angela	Francis	2022-01-03	Waiter	hwebb@example.net	2022-01-03 23:22:56
9	David	Dunn	2020-06-21	Manager	patricia74@example.com	2020-06-21 02:48:44
10	Adam	Russell	2021-01-07	Waitress	jamiejohnson@example.net	2021-01-07 04:49:53
11	Douglas	Mooney	2024-03-27	Waiter	hodgedavid@example.net	2024-03-27 21:58:27
12	Amanda	Welch	2022-12-04	Waitress	valerie71@example.net	2022-12-04 00:18:04
13	Julie	Anderson	2021-02-26	Cashier	ryanclarke@example.com	2021-02-26 06:31:28
14	Joshua	Bowen	2022-04-05	Waitress	sierra59@example.net	2022-04-05 15:44:51
15	Danielle	Ellis	2023-05-03	Manager	jessicadoyle@example.com	2023-05-03 13:05:51
16	Michael	Parks	2024-03-22	Waiter	louishawkins@example.com	2024-03-22 16:13:01
17	Joshua	Bates	2020-03-14	Waiter	jose89@example.org	2020-03-14 11:02:16
18	Nicole	Guzman	2020-02-15	Manager	lori39@example.net	2020-02-15 16:50:37
19	Sarah	Kline	2021-02-05	Cashier	shanemartinez@example.com	2021-02-05 07:42:41
20	Jessica	Sexton	2024-06-28	Waiter	mjones@example.net	2024-06-28 10:03:13
21	Brenda	Snyder	2021-02-09	Cashier	kathleennorton@example.org	2021-02-09 19:48:52
22	Emily	Stanley	2023-05-06	Manager	turnerkristen@example.net	2023-05-06 02:01:45
23	Raymond	Reyes	2023-12-29	Cashier	chumphrey@example.org	2023-12-29 23:07:35
24	Eddie	Chandler	2022-07-02	Waitress	andersonandrew@example.net	2022-07-02 14:24:50
25	Mary	Johnson	2020-12-14	Waiter	qwood@example.com	2020-12-14 07:22:13
26	Christina	Diaz	2020-04-27	Waitress	shieldskimberly@example.com	2020-04-27 19:43:32
27	Kevin	Walton	2023-04-23	Barista	sarah18@example.net	2023-04-23 06:43:16
28	Robert	Acosta	2022-03-18	Waitress	isolomon@example.com	2022-03-18 04:54:59
29	Frederick	Gibson	2022-07-28	Cashier	elizabethgreen@example.org	2022-07-28 02:10:54
30	Sarah	Lee	2024-01-25	Waiter	xharris@example.net	2024-01-25 07:57:08
31	Chase	Solomon	2024-07-11	Manager	parkermartin@example.org	2024-07-11 23:47:39
32	Kristin	Mills	2023-10-22	Cashier	carolyn98@example.net	2023-10-22 10:06:24
33	Julie	Scott	2024-02-26	Barista	dbailey@example.org	2024-02-26 12:13:05
34	Valerie	Sutton	2024-01-16	Waiter	jimjones@example.com	2024-01-16 15:27:47
35	Elizabeth	Sanchez	2022-10-17	Barista	colin77@example.com	2022-10-17 09:19:09
36	Tommy	Castillo	2024-05-12	Waitress	garyhernandez@example.net	2024-05-12 17:04:39
37	Emily	Diaz	2024-08-11	Waitress	hgonzalez@example.org	2024-08-11 18:29:13
38	Richard	Erickson	2022-12-22	Cashier	andrea08@example.net	2022-12-22 01:58:18
39	Brian	Fowler	2023-03-13	Waiter	matthew65@example.net	2023-03-13 05:50:41
40	Chad	Dickson	2024-03-08	Barista	janeschroeder@example.net	2024-03-08 01:04:27
41	Louis	Savage	2020-01-02	Waiter	chapmantiffany@example.com	2020-01-02 15:51:21
42	David	Brown	2020-04-14	Manager	jesse23@example.org	2020-04-14 07:26:12
43	Shannon	Williams	2021-12-22	Waiter	zmatthews@example.net	2021-12-22 07:06:52
44	Alicia	Rogers	2022-01-26	Waiter	christianjordan@example.org	2022-01-26 12:07:04
45	Autumn	Davidson	2023-09-09	Waitress	nathan54@example.net	2023-09-09 14:22:19
46	Michelle	Webb	2020-01-11	Waiter	ecobb@example.net	2020-01-11 21:45:03
47	Christina	Lopez	2021-05-30	Waitress	hernandezfrank@example.net	2021-05-30 21:45:51
48	Megan	Gonzalez	2023-11-16	Manager	rwilliams@example.com	2023-11-16 03:07:30
49	Kimberly	Armstrong	2020-09-25	Waitress	heather04@example.net	2020-09-25 07:32:07
50	Zachary	Smith	2024-02-03	Cashier	nicole97@example.org	2024-02-03 19:22:34
51	Eric	Carter	2023-01-27	Waitress	melanie08@example.org	2023-01-27 15:34:44
52	Chad	Allen	2023-08-22	Cashier	joshuaholmes@example.org	2023-08-22 23:33:57
53	Elizabeth	Mcgee	2023-01-27	Waitress	lawrencetaylor@example.org	2023-01-27 14:38:04
54	Amy	Davis	2024-06-25	Barista	jasonhughes@example.net	2024-06-25 20:13:16
55	David	Jackson	2022-03-05	Manager	williamsalicia@example.net	2022-03-05 06:01:05
56	Dana	Riddle	2021-10-14	Barista	gary71@example.org	2021-10-14 08:27:35
57	Rachael	Hernandez	2021-03-14	Cashier	ghubbard@example.net	2021-03-14 01:47:05
58	Bonnie	Munoz	2022-06-15	Waitress	taylorvincent@example.com	2022-06-15 02:45:59
59	Stacey	Harmon	2020-09-19	Manager	ryan47@example.com	2020-09-19 23:22:19
60	Daniel	Shaffer	2021-11-17	Barista	qedwards@example.org	2021-11-17 21:02:09
61	Andrew	Schwartz	2020-01-10	Waitress	zedwards@example.com	2020-01-10 12:32:04
62	Ashley	Rocha	2020-04-15	Barista	curtispamela@example.net	2020-04-15 07:16:15
63	Juan	Burch	2020-09-11	Waiter	cooperlarry@example.org	2020-09-11 11:34:35
64	Joshua	Smith	2022-02-04	Barista	kanderson@example.net	2022-02-04 13:09:38
65	Jenna	Gilbert	2022-11-11	Waiter	xstone@example.net	2022-11-11 04:31:21
66	Yolanda	Brown	2024-06-10	Cashier	kimshawna@example.net	2024-06-10 17:49:07
67	Monica	George	2021-12-27	Waitress	matthew93@example.com	2021-12-27 19:24:08
68	Sara	Goodman	2021-11-01	Waiter	douglasruiz@example.net	2021-11-01 15:04:50
69	David	Fleming	2023-03-14	Manager	fgilbert@example.org	2023-03-14 00:51:26
70	Jessica	Goodman	2020-09-09	Waitress	kyle59@example.com	2020-09-09 08:27:51
71	Reginald	Jackson	2023-09-02	Cashier	imorris@example.net	2023-09-02 13:37:31
72	Priscilla	Jones	2020-07-10	Manager	adam57@example.org	2020-07-10 18:39:19
73	Donald	Johnson	2023-12-17	Cashier	johnsonjoshua@example.net	2023-12-17 02:32:43
74	Deborah	Hardin	2024-02-22	Waiter	grayfrederick@example.net	2024-02-22 12:34:57
75	Mark	Lopez	2020-10-30	Waiter	beth21@example.org	2020-10-30 04:24:39
76	John	Robinson	2022-08-12	Manager	johnsonwalter@example.com	2022-08-12 02:20:49
77	Nicole	Dougherty	2022-05-12	Manager	williambaker@example.com	2022-05-12 10:59:27
78	Joshua	Cantu	2022-08-01	Waiter	lawrencefrederick@example.com	2022-08-01 16:07:18
79	Steven	Jacobs	2022-11-30	Manager	thowe@example.net	2022-11-30 04:03:03
80	Zachary	Berg	2023-08-08	Manager	garciachristina@example.org	2023-08-08 23:27:05
81	Samantha	Rivera	2022-12-27	Cashier	jaredlane@example.net	2022-12-27 07:30:06
82	Melanie	Davis	2023-01-16	Manager	cheryl49@example.net	2023-01-16 13:50:50
83	Stephen	George	2022-08-25	Waitress	karenweber@example.com	2022-08-25 13:41:05
84	John	Shah	2023-06-28	Barista	lbaxter@example.com	2023-06-28 06:03:41
85	Robert	Johnson	2024-10-30	Cashier	amy02@example.com	2024-10-30 01:39:05
86	Ronald	Rodriguez	2022-12-16	Waiter	jadejones@example.net	2022-12-16 10:51:56
87	Jessica	Nguyen	2023-10-19	Barista	xmejia@example.com	2023-10-19 05:21:39
88	Thomas	Davis	2020-07-18	Waiter	conwaysuzanne@example.com	2020-07-18 09:51:22
89	Charles	Lee	2024-08-19	Manager	raymondkrystal@example.net	2024-08-19 10:24:13
90	Mary	Wang	2023-08-27	Waitress	jenkinsmark@example.net	2023-08-27 00:15:57
91	Kathryn	Lee	2023-06-28	Cashier	frances12@example.com	2023-06-28 00:17:26
92	Angela	Romero	2020-03-05	Manager	bobbyknight@example.org	2020-03-05 16:17:25
93	Marcus	Hunter	2022-10-08	Cashier	jeffreyjackson@example.org	2022-10-08 05:38:05
94	Charles	Johnson	2020-12-20	Waitress	thomasrice@example.com	2020-12-20 08:36:30
95	Jennifer	Ramirez	2023-04-04	Manager	timothy01@example.com	2023-04-04 10:55:40
96	Ryan	Jackson	2022-02-13	Cashier	blittle@example.org	2022-02-13 10:32:57
97	Christina	Hensley	2023-04-06	Cashier	chloesmith@example.net	2023-04-06 14:27:36
98	Danielle	Mason	2023-08-30	Manager	trubio@example.com	2023-08-30 15:38:14
99	Tiffany	King	2024-11-24	Waiter	iburns@example.net	2024-11-24 03:48:06
100	Amanda	Johnson	2024-06-09	Manager	daniel53@example.net	2024-06-09 01:37:26
101	Sarah	Clark	2021-06-25	today	johnsonkatherine@example.com	2024-06-09 02:55:19
102	James	Huber	2022-04-01	third	wvargas@example.org	2024-06-09 05:21:22
103	Christopher	Carrillo	2021-07-09	me	taylor32@example.net	2024-06-09 03:15:26
\.


--
-- Data for Name: inventory_tracking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_tracking (tracking_id, product_id, quantity_change, change_date, reason, created_at) FROM stdin;
1	53	3	2024-11-01 00:00:00	Restock	2024-11-01 00:00:00
2	54	10	2024-08-05 00:00:00	Restock	2024-08-05 00:00:00
3	55	6	2023-11-12 00:00:00	Damaged	2023-11-12 00:00:00
4	56	8	2023-05-29 00:00:00	Damaged	2023-05-29 00:00:00
5	57	6	2023-09-22 00:00:00	Restock	2023-09-22 00:00:00
6	58	1	2024-12-12 00:00:00	Restock	2024-12-12 00:00:00
7	59	3	2023-04-21 00:00:00	Expired	2023-04-21 00:00:00
8	60	4	2023-08-06 00:00:00	Damaged	2023-08-06 00:00:00
9	61	7	2024-07-30 00:00:00	Restock	2024-07-30 00:00:00
10	62	7	2024-02-26 00:00:00	Restock	2024-02-26 00:00:00
11	63	6	2023-07-09 00:00:00	Restock	2023-07-09 00:00:00
12	64	8	2023-02-20 00:00:00	Restock	2023-02-20 00:00:00
13	65	8	2023-11-08 00:00:00	Restock	2023-11-08 00:00:00
14	66	10	2024-05-11 00:00:00	ERROR	2024-05-11 00:00:00
15	67	2	2023-08-05 00:00:00	Restock	2023-08-05 00:00:00
16	68	2	2024-08-31 00:00:00	Damaged	2024-08-31 00:00:00
17	69	6	2024-03-24 00:00:00	Restock	2024-03-24 00:00:00
18	70	5	2023-07-05 00:00:00	Damaged	2023-07-05 00:00:00
19	71	8	2024-10-02 00:00:00	Restock	2024-10-02 00:00:00
20	72	7	2023-06-19 00:00:00	Restock	2023-06-19 00:00:00
21	73	4	2023-09-25 00:00:00	Damaged	2023-09-25 00:00:00
22	74	10	2023-03-05 00:00:00	Damaged	2023-03-05 00:00:00
23	75	6	2023-01-24 00:00:00	Restock	2023-01-24 00:00:00
24	76	4	2023-05-24 00:00:00	Damaged	2023-05-24 00:00:00
25	77	9	2023-10-04 00:00:00	Damaged	2023-10-04 00:00:00
26	78	8	2023-10-12 00:00:00	Restock	2023-10-12 00:00:00
27	79	8	2024-09-03 00:00:00	Restock	2024-09-03 00:00:00
28	80	5	2024-11-12 00:00:00	Expired	2024-11-12 00:00:00
29	81	7	2024-12-04 00:00:00	Restock	2024-12-04 00:00:00
30	82	10	2023-10-30 00:00:00	Restock	2023-10-30 00:00:00
31	83	3	2024-03-17 00:00:00	Restock	2024-03-17 00:00:00
32	84	9	2023-11-28 00:00:00	Damaged	2023-11-28 00:00:00
33	85	5	2023-10-25 00:00:00	Restock	2023-10-25 00:00:00
34	86	6	2024-07-15 00:00:00	Expired	2024-07-15 00:00:00
35	87	10	2023-03-31 00:00:00	Restock	2023-03-31 00:00:00
36	88	4	2023-01-05 00:00:00	Damaged	2023-01-05 00:00:00
37	89	10	2024-02-20 00:00:00	ERROR	2024-02-20 00:00:00
38	90	7	2023-12-23 00:00:00	Damaged	2023-12-23 00:00:00
39	91	6	2023-05-30 00:00:00	Restock	2023-05-30 00:00:00
40	92	6	2023-05-20 00:00:00	Damaged	2023-05-20 00:00:00
41	93	1	2024-01-09 00:00:00	Restock	2024-01-09 00:00:00
42	94	9	2023-11-06 00:00:00	Damaged	2023-11-06 00:00:00
43	95	7	2023-06-01 00:00:00	Restock	2023-06-01 00:00:00
44	96	9	2024-03-15 00:00:00	ERROR	2024-03-15 00:00:00
45	97	9	2024-08-14 00:00:00	Restock	2024-08-14 00:00:00
46	98	10	2023-11-12 00:00:00	Restock	2023-11-12 00:00:00
47	99	1	2023-12-11 00:00:00	Restock	2023-12-11 00:00:00
48	100	5	2023-10-24 00:00:00	Damaged	2023-10-24 00:00:00
49	101	8	2023-03-18 00:00:00	ERROR	2023-03-18 00:00:00
50	102	1	2023-10-13 00:00:00	Restock	2023-10-13 00:00:00
51	103	5	2024-10-12 00:00:00	Damaged	2024-10-12 00:00:00
52	104	3	2024-04-09 00:00:00	Damaged	2024-04-09 00:00:00
53	105	2	2023-02-27 00:00:00	Damaged	2023-02-27 00:00:00
54	106	4	2024-12-21 00:00:00	Restock	2024-12-21 00:00:00
55	53	1	2024-05-06 00:00:00	Restock	2024-05-06 00:00:00
56	54	9	2023-10-24 00:00:00	ERROR	2023-10-24 00:00:00
57	55	6	2023-04-19 00:00:00	Restock	2023-04-19 00:00:00
58	56	7	2024-05-22 00:00:00	Restock	2024-05-22 00:00:00
59	57	2	2023-07-23 00:00:00	Restock	2023-07-23 00:00:00
60	58	6	2024-08-31 00:00:00	Restock	2024-08-31 00:00:00
61	59	6	2024-09-20 00:00:00	Damaged	2024-09-20 00:00:00
62	60	6	2024-08-24 00:00:00	ERROR	2024-08-24 00:00:00
63	61	2	2023-12-17 00:00:00	Damaged	2023-12-17 00:00:00
64	62	4	2023-06-21 00:00:00	Damaged	2023-06-21 00:00:00
65	63	5	2024-05-06 00:00:00	Restock	2024-05-06 00:00:00
66	64	7	2023-09-29 00:00:00	Restock	2023-09-29 00:00:00
67	65	6	2023-06-24 00:00:00	Restock	2023-06-24 00:00:00
68	66	2	2023-12-25 00:00:00	Restock	2023-12-25 00:00:00
69	67	6	2023-06-05 00:00:00	Restock	2023-06-05 00:00:00
70	68	10	2023-09-23 00:00:00	Restock	2023-09-23 00:00:00
71	69	8	2024-04-01 00:00:00	Restock	2024-04-01 00:00:00
72	70	10	2024-03-28 00:00:00	Restock	2024-03-28 00:00:00
73	71	2	2024-09-07 00:00:00	Damaged	2024-09-07 00:00:00
74	72	2	2023-12-11 00:00:00	Restock	2023-12-11 00:00:00
75	73	10	2024-05-16 00:00:00	Restock	2024-05-16 00:00:00
76	74	6	2023-02-16 00:00:00	Restock	2023-02-16 00:00:00
77	75	9	2023-05-23 00:00:00	Damaged	2023-05-23 00:00:00
78	76	4	2023-12-29 00:00:00	Restock	2023-12-29 00:00:00
79	77	10	2023-12-25 00:00:00	Restock	2023-12-25 00:00:00
80	78	1	2023-08-30 00:00:00	Restock	2023-08-30 00:00:00
81	79	9	2023-10-13 00:00:00	Damaged	2023-10-13 00:00:00
82	80	8	2023-01-19 00:00:00	ERROR	2023-01-19 00:00:00
83	81	7	2024-05-13 00:00:00	Restock	2024-05-13 00:00:00
84	82	6	2024-04-24 00:00:00	Restock	2024-04-24 00:00:00
85	83	3	2024-07-05 00:00:00	Expired	2024-07-05 00:00:00
86	84	6	2023-08-28 00:00:00	Expired	2023-08-28 00:00:00
87	85	1	2024-05-06 00:00:00	Restock	2024-05-06 00:00:00
88	86	10	2023-08-26 00:00:00	Expired	2023-08-26 00:00:00
89	87	9	2024-03-22 00:00:00	Damaged	2024-03-22 00:00:00
90	88	7	2024-09-06 00:00:00	Restock	2024-09-06 00:00:00
91	89	9	2024-01-03 00:00:00	Damaged	2024-01-03 00:00:00
92	90	9	2023-06-25 00:00:00	Restock	2023-06-25 00:00:00
93	91	8	2023-10-15 00:00:00	Restock	2023-10-15 00:00:00
94	92	5	2024-07-13 00:00:00	Expired	2024-07-13 00:00:00
95	93	4	2023-09-11 00:00:00	Damaged	2023-09-11 00:00:00
96	94	1	2024-06-04 00:00:00	Expired	2024-06-04 00:00:00
97	95	7	2024-07-22 00:00:00	ERROR	2024-07-22 00:00:00
98	96	1	2023-01-12 00:00:00	Damaged	2023-01-12 00:00:00
99	97	9	2023-11-27 00:00:00	Expired	2023-11-27 00:00:00
100	98	1	2024-04-07 00:00:00	Restock	2024-04-07 00:00:00
101	99	4	2024-05-26 00:00:00	Damaged	2024-05-26 00:00:00
102	100	1	2023-06-06 00:00:00	Damaged	2023-06-06 00:00:00
103	101	7	2024-06-08 00:00:00	Restock	2024-06-08 00:00:00
104	102	4	2023-09-05 00:00:00	Expired	2023-09-05 00:00:00
105	103	9	2024-05-28 00:00:00	Restock	2024-05-28 00:00:00
106	104	9	2023-11-26 00:00:00	Damaged	2023-11-26 00:00:00
107	105	5	2024-01-10 00:00:00	Restock	2024-01-10 00:00:00
108	106	9	2023-12-08 00:00:00	Damaged	2023-12-08 00:00:00
109	53	2	2023-05-08 00:00:00	Restock	2023-05-08 00:00:00
110	54	8	2024-10-12 00:00:00	Damaged	2024-10-12 00:00:00
111	55	5	2024-02-18 00:00:00	Restock	2024-02-18 00:00:00
112	56	8	2024-11-14 00:00:00	ERROR	2024-11-14 00:00:00
113	57	10	2024-10-16 00:00:00	Restock	2024-10-16 00:00:00
114	58	1	2023-03-30 00:00:00	Restock	2023-03-30 00:00:00
115	59	4	2023-01-27 00:00:00	Restock	2023-01-27 00:00:00
116	60	3	2023-11-01 00:00:00	Expired	2023-11-01 00:00:00
117	61	5	2024-03-22 00:00:00	Restock	2024-03-22 00:00:00
118	62	1	2024-01-28 00:00:00	Restock	2024-01-28 00:00:00
119	63	5	2024-10-04 00:00:00	Expired	2024-10-04 00:00:00
120	64	4	2024-03-17 00:00:00	Restock	2024-03-17 00:00:00
121	65	8	2023-01-28 00:00:00	Damaged	2023-01-28 00:00:00
122	66	3	2023-01-09 00:00:00	Damaged	2023-01-09 00:00:00
123	67	7	2023-05-23 00:00:00	Restock	2023-05-23 00:00:00
124	68	9	2024-05-11 00:00:00	ERROR	2024-05-11 00:00:00
125	69	8	2023-11-17 00:00:00	Restock	2023-11-17 00:00:00
126	70	8	2024-03-20 00:00:00	Restock	2024-03-20 00:00:00
127	71	10	2024-04-14 00:00:00	Restock	2024-04-14 00:00:00
128	72	7	2023-04-18 00:00:00	Damaged	2023-04-18 00:00:00
129	73	3	2024-04-09 00:00:00	Restock	2024-04-09 00:00:00
130	74	10	2024-04-02 00:00:00	Restock	2024-04-02 00:00:00
131	75	7	2024-04-02 00:00:00	Restock	2024-04-02 00:00:00
132	76	5	2024-03-22 00:00:00	Damaged	2024-03-22 00:00:00
133	77	9	2024-03-05 00:00:00	Expired	2024-03-05 00:00:00
134	78	2	2023-04-20 00:00:00	Damaged	2023-04-20 00:00:00
135	79	7	2024-08-05 00:00:00	Damaged	2024-08-05 00:00:00
136	80	4	2023-07-12 00:00:00	Restock	2023-07-12 00:00:00
137	81	7	2023-12-02 00:00:00	Damaged	2023-12-02 00:00:00
138	82	8	2024-10-26 00:00:00	Restock	2024-10-26 00:00:00
139	83	10	2024-01-19 00:00:00	Damaged	2024-01-19 00:00:00
140	84	4	2023-11-03 00:00:00	Restock	2023-11-03 00:00:00
141	85	6	2024-12-09 00:00:00	Expired	2024-12-09 00:00:00
142	86	5	2023-11-16 00:00:00	Damaged	2023-11-16 00:00:00
143	87	2	2023-07-13 00:00:00	Restock	2023-07-13 00:00:00
144	88	5	2024-09-09 00:00:00	Restock	2024-09-09 00:00:00
145	89	6	2024-08-30 00:00:00	Expired	2024-08-30 00:00:00
146	90	1	2023-07-25 00:00:00	Damaged	2023-07-25 00:00:00
147	91	4	2024-08-06 00:00:00	Restock	2024-08-06 00:00:00
148	92	5	2024-08-12 00:00:00	Restock	2024-08-12 00:00:00
149	93	6	2023-01-11 00:00:00	Restock	2023-01-11 00:00:00
150	94	9	2023-04-11 00:00:00	Restock	2023-04-11 00:00:00
151	95	3	2024-06-19 00:00:00	Damaged	2024-06-19 00:00:00
152	96	9	2023-03-04 00:00:00	Damaged	2023-03-04 00:00:00
153	97	3	2024-09-13 00:00:00	Restock	2024-09-13 00:00:00
154	98	1	2024-02-24 00:00:00	Expired	2024-02-24 00:00:00
155	99	5	2023-01-11 00:00:00	Restock	2023-01-11 00:00:00
156	100	3	2023-06-01 00:00:00	Restock	2023-06-01 00:00:00
157	101	7	2023-08-02 00:00:00	Damaged	2023-08-02 00:00:00
158	102	10	2023-08-22 00:00:00	Restock	2023-08-22 00:00:00
159	103	2	2023-04-26 00:00:00	Damaged	2023-04-26 00:00:00
160	104	1	2024-08-01 00:00:00	Expired	2024-08-01 00:00:00
161	105	7	2024-04-08 00:00:00	Restock	2024-04-08 00:00:00
162	106	1	2023-02-19 00:00:00	Restock	2023-02-19 00:00:00
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_details (order_detail_id, order_id, product_id, quantity, unit_price, subtotal, created_at) FROM stdin;
1	1001	80	1	15.00	15.00	2023-01-03 10:42:46
2	1001	65	8	18.00	144.00	2023-01-03 10:42:46
3	1002	57	4	43.00	172.00	2023-01-03 15:25:52
4	1002	58	2	9.00	18.00	2023-01-03 15:25:52
5	1002	69	6	41.00	246.00	2023-01-03 15:25:52
6	1002	57	3	43.00	129.00	2023-01-03 15:25:52
7	1003	106	5	11.00	55.00	2023-01-04 15:57:02
8	1003	77	6	32.00	192.00	2023-01-04 15:57:02
9	1003	76	2	42.00	84.00	2023-01-04 15:57:02
10	1003	69	8	41.00	328.00	2023-01-04 15:57:02
11	1004	85	2	34.00	68.00	2023-01-04 18:34:18
12	1005	74	2	37.00	74.00	2023-01-04 21:41:43
13	1005	93	7	48.00	336.00	2023-01-04 21:41:43
14	1005	90	3	20.00	60.00	2023-01-04 21:41:43
15	1005	106	2	11.00	22.00	2023-01-04 21:41:43
16	1006	61	6	10.00	60.00	2023-01-05 04:44:08
17	1007	94	3	23.00	69.00	2023-01-05 06:05:41
18	1007	62	8	13.00	104.00	2023-01-05 06:05:41
19	1008	83	6	23.00	138.00	2023-01-07 05:36:03
20	1009	68	7	33.00	231.00	2023-01-07 11:26:34
21	1009	83	6	23.00	138.00	2023-01-07 11:26:34
22	1009	81	3	35.00	105.00	2023-01-07 11:26:34
23	1010	103	4	19.00	76.00	2023-01-07 13:52:53
24	1010	53	7	47.00	329.00	2023-01-07 13:52:53
25	1010	78	4	19.00	76.00	2023-01-07 13:52:53
26	1010	56	4	21.00	84.00	2023-01-07 13:52:53
27	1011	71	7	29.00	203.00	2023-01-08 02:57:51
28	1012	66	3	47.00	141.00	2023-01-08 09:39:06
29	1012	66	1	47.00	47.00	2023-01-08 09:39:06
30	1012	76	3	42.00	126.00	2023-01-08 09:39:06
31	1012	77	3	32.00	96.00	2023-01-08 09:39:06
32	1013	70	5	23.00	115.00	2023-01-08 23:32:06
33	1013	70	7	23.00	161.00	2023-01-08 23:32:06
34	1013	96	5	7.00	35.00	2023-01-08 23:32:06
35	1013	98	7	46.00	322.00	2023-01-08 23:32:06
36	1013	104	8	37.00	296.00	2023-01-08 23:32:06
37	1014	66	7	47.00	329.00	2023-01-09 07:39:36
38	1015	78	7	19.00	133.00	2023-01-09 11:37:45
39	1015	100	4	35.00	140.00	2023-01-09 11:37:45
40	1015	100	1	35.00	35.00	2023-01-09 11:37:45
41	1016	72	6	11.00	66.00	2023-01-10 15:36:46
42	1016	68	2	33.00	66.00	2023-01-10 15:36:46
43	1016	91	2	10.00	20.00	2023-01-10 15:36:46
44	1016	69	3	41.00	123.00	2023-01-10 15:36:46
45	1017	79	8	32.00	256.00	2023-01-11 02:09:58
46	1018	77	5	32.00	160.00	2023-01-13 11:29:27
47	1018	83	7	23.00	161.00	2023-01-13 11:29:27
48	1019	81	7	35.00	245.00	2023-01-14 12:52:32
49	1020	105	6	15.00	90.00	2023-01-15 01:38:08
50	1020	99	2	20.00	40.00	2023-01-15 01:38:08
51	1020	80	3	15.00	45.00	2023-01-15 01:38:08
52	1021	53	3	47.00	141.00	2023-01-15 18:16:34
53	1021	61	6	10.00	60.00	2023-01-15 18:16:34
54	1022	89	3	6.00	18.00	2023-01-16 08:12:19
55	1022	58	2	9.00	18.00	2023-01-16 08:12:19
56	1022	97	8	34.00	272.00	2023-01-16 08:12:19
57	1023	92	4	33.00	132.00	2023-01-16 15:38:22
58	1023	61	8	10.00	80.00	2023-01-16 15:38:22
59	1024	57	2	43.00	86.00	2023-01-16 23:53:45
60	1024	106	8	11.00	88.00	2023-01-16 23:53:45
61	1025	99	2	20.00	40.00	2023-01-17 09:58:35
62	1025	64	8	37.00	296.00	2023-01-17 09:58:35
63	1025	102	5	38.00	190.00	2023-01-17 09:58:35
64	1025	93	6	48.00	288.00	2023-01-17 09:58:35
65	1026	59	3	2.00	6.00	2023-01-17 11:52:28
66	1026	102	3	38.00	114.00	2023-01-17 11:52:28
67	1026	106	1	11.00	11.00	2023-01-17 11:52:28
68	1027	74	1	37.00	37.00	2023-01-17 12:56:52
69	1027	53	6	47.00	282.00	2023-01-17 12:56:52
70	1027	73	4	23.00	92.00	2023-01-17 12:56:52
71	1028	90	4	20.00	80.00	2023-01-17 18:07:20
72	1029	59	4	2.00	8.00	2023-01-18 19:25:52
73	1029	102	5	38.00	190.00	2023-01-18 19:25:52
74	1029	67	1	37.00	37.00	2023-01-18 19:25:52
75	1030	56	3	21.00	63.00	2023-01-19 03:01:46
76	1030	102	4	38.00	152.00	2023-01-19 03:01:46
77	1031	71	3	29.00	87.00	2023-01-20 00:17:09
78	1031	99	8	20.00	160.00	2023-01-20 00:17:09
79	1032	67	2	37.00	74.00	2023-01-20 00:38:23
80	1032	71	4	29.00	116.00	2023-01-20 00:38:23
81	1032	75	8	39.00	312.00	2023-01-20 00:38:23
82	1033	91	1	10.00	10.00	2023-01-21 05:09:11
83	1033	96	4	7.00	28.00	2023-01-21 05:09:11
84	1033	57	4	43.00	172.00	2023-01-21 05:09:11
85	1033	97	6	34.00	204.00	2023-01-21 05:09:11
86	1033	86	5	44.00	220.00	2023-01-21 05:09:11
87	1034	82	5	12.00	60.00	2023-01-21 07:56:28
88	1034	66	5	47.00	235.00	2023-01-21 07:56:28
89	1034	90	6	20.00	120.00	2023-01-21 07:56:28
90	1034	78	8	19.00	152.00	2023-01-21 07:56:28
91	1035	80	3	15.00	45.00	2023-01-21 11:07:57
92	1035	79	1	32.00	32.00	2023-01-21 11:07:57
93	1035	96	8	7.00	56.00	2023-01-21 11:07:57
94	1035	91	8	10.00	80.00	2023-01-21 11:07:57
95	1035	89	4	6.00	24.00	2023-01-21 11:07:57
96	1036	68	8	33.00	264.00	2023-01-22 08:43:34
97	1036	57	1	43.00	43.00	2023-01-22 08:43:34
98	1036	92	7	33.00	231.00	2023-01-22 08:43:34
99	1036	79	7	32.00	224.00	2023-01-22 08:43:34
100	1036	94	4	23.00	92.00	2023-01-22 08:43:34
101	1037	72	5	11.00	55.00	2023-01-23 02:58:13
102	1037	90	2	20.00	40.00	2023-01-23 02:58:13
103	1037	72	2	11.00	22.00	2023-01-23 02:58:13
104	1038	94	3	23.00	69.00	2023-01-24 03:20:30
105	1038	103	5	19.00	95.00	2023-01-24 03:20:30
106	1038	73	1	23.00	23.00	2023-01-24 03:20:30
107	1039	87	6	7.00	42.00	2023-01-24 16:40:10
108	1039	100	4	35.00	140.00	2023-01-24 16:40:10
109	1039	94	3	23.00	69.00	2023-01-24 16:40:10
110	1039	88	8	21.00	168.00	2023-01-24 16:40:10
111	1040	84	8	21.00	168.00	2023-01-24 19:03:49
112	1040	71	5	29.00	145.00	2023-01-24 19:03:49
113	1040	62	1	13.00	13.00	2023-01-24 19:03:49
114	1041	77	2	32.00	64.00	2023-01-25 21:43:48
115	1041	82	3	12.00	36.00	2023-01-25 21:43:48
116	1041	70	6	23.00	138.00	2023-01-25 21:43:48
117	1042	90	2	20.00	40.00	2023-01-26 13:11:45
118	1042	103	2	19.00	38.00	2023-01-26 13:11:45
119	1043	85	3	34.00	102.00	2023-01-26 20:59:07
120	1044	90	8	20.00	160.00	2023-01-27 11:16:51
121	1044	67	4	37.00	148.00	2023-01-27 11:16:51
122	1044	79	7	32.00	224.00	2023-01-27 11:16:51
123	1044	94	1	23.00	23.00	2023-01-27 11:16:51
124	1044	104	3	37.00	111.00	2023-01-27 11:16:51
125	1045	81	2	35.00	70.00	2023-01-27 22:01:19
126	1045	79	3	32.00	96.00	2023-01-27 22:01:19
127	1045	81	6	35.00	210.00	2023-01-27 22:01:19
128	1046	106	7	11.00	77.00	2023-01-30 07:24:55
129	1047	106	3	11.00	33.00	2023-02-01 01:42:21
130	1048	98	2	46.00	92.00	2023-02-01 08:40:09
131	1048	68	4	33.00	132.00	2023-02-01 08:40:09
132	1048	74	5	37.00	185.00	2023-02-01 08:40:09
133	1048	104	7	37.00	259.00	2023-02-01 08:40:09
134	1048	57	3	43.00	129.00	2023-02-01 08:40:09
135	1049	96	7	7.00	49.00	2023-02-05 16:26:34
136	1049	98	5	46.00	230.00	2023-02-05 16:26:34
137	1049	89	6	6.00	36.00	2023-02-05 16:26:34
138	1049	60	8	48.00	384.00	2023-02-05 16:26:34
139	1050	94	2	23.00	46.00	2023-02-05 19:21:59
140	1050	81	3	35.00	105.00	2023-02-05 19:21:59
141	1050	100	4	35.00	140.00	2023-02-05 19:21:59
142	1050	105	2	15.00	30.00	2023-02-05 19:21:59
143	1050	64	8	37.00	296.00	2023-02-05 19:21:59
144	1051	54	6	47.00	282.00	2023-02-07 02:36:19
145	1051	101	7	4.00	28.00	2023-02-07 02:36:19
146	1051	70	2	23.00	46.00	2023-02-07 02:36:19
147	1051	84	7	21.00	147.00	2023-02-07 02:36:19
148	1052	72	4	11.00	44.00	2023-02-07 18:22:14
149	1052	103	3	19.00	57.00	2023-02-07 18:22:14
150	1052	92	6	33.00	198.00	2023-02-07 18:22:14
151	1052	86	7	44.00	308.00	2023-02-07 18:22:14
152	1053	103	3	19.00	57.00	2023-02-08 10:21:10
153	1053	80	1	15.00	15.00	2023-02-08 10:21:10
154	1053	99	2	20.00	40.00	2023-02-08 10:21:10
155	1054	86	3	44.00	132.00	2023-02-08 11:49:52
156	1054	90	7	20.00	140.00	2023-02-08 11:49:52
157	1054	81	8	35.00	280.00	2023-02-08 11:49:52
158	1054	102	7	38.00	266.00	2023-02-08 11:49:52
159	1054	104	1	37.00	37.00	2023-02-08 11:49:52
160	1055	81	3	35.00	105.00	2023-02-08 21:18:08
161	1055	72	3	11.00	33.00	2023-02-08 21:18:08
162	1055	68	2	33.00	66.00	2023-02-08 21:18:08
163	1056	69	1	41.00	41.00	2023-02-09 01:42:16
164	1056	102	1	38.00	38.00	2023-02-09 01:42:16
165	1056	57	3	43.00	129.00	2023-02-09 01:42:16
166	1057	87	6	7.00	42.00	2023-02-10 02:29:32
167	1057	87	8	7.00	56.00	2023-02-10 02:29:32
168	1057	87	3	7.00	21.00	2023-02-10 02:29:32
169	1057	100	4	35.00	140.00	2023-02-10 02:29:32
170	1057	106	7	11.00	77.00	2023-02-10 02:29:32
171	1058	82	2	12.00	24.00	2023-02-10 03:44:42
172	1059	79	5	32.00	160.00	2023-02-10 06:24:43
173	1059	55	4	17.00	68.00	2023-02-10 06:24:43
174	1059	87	8	7.00	56.00	2023-02-10 06:24:43
175	1059	103	1	19.00	19.00	2023-02-10 06:24:43
176	1059	64	4	37.00	148.00	2023-02-10 06:24:43
177	1060	85	7	34.00	238.00	2023-02-10 10:58:15
178	1060	57	3	43.00	129.00	2023-02-10 10:58:15
179	1060	55	8	17.00	136.00	2023-02-10 10:58:15
180	1060	100	3	35.00	105.00	2023-02-10 10:58:15
181	1060	98	5	46.00	230.00	2023-02-10 10:58:15
182	1061	89	1	6.00	6.00	2023-02-13 05:32:20
183	1061	68	3	33.00	99.00	2023-02-13 05:32:20
184	1061	76	7	42.00	294.00	2023-02-13 05:32:20
185	1061	67	6	37.00	222.00	2023-02-13 05:32:20
186	1062	94	3	23.00	69.00	2023-02-13 20:49:25
187	1062	103	1	19.00	19.00	2023-02-13 20:49:25
188	1062	79	5	32.00	160.00	2023-02-13 20:49:25
189	1062	69	4	41.00	164.00	2023-02-13 20:49:25
190	1063	99	4	20.00	80.00	2023-02-16 00:07:01
191	1063	63	3	10.00	30.00	2023-02-16 00:07:01
192	1064	83	1	23.00	23.00	2023-02-16 10:38:25
193	1064	60	5	48.00	240.00	2023-02-16 10:38:25
194	1064	88	1	21.00	21.00	2023-02-16 10:38:25
195	1065	81	1	35.00	35.00	2023-02-17 02:20:48
196	1065	90	8	20.00	160.00	2023-02-17 02:20:48
197	1065	81	6	35.00	210.00	2023-02-17 02:20:48
198	1065	99	6	20.00	120.00	2023-02-17 02:20:48
199	1066	62	8	13.00	104.00	2023-02-17 07:32:58
200	1066	96	7	7.00	49.00	2023-02-17 07:32:58
201	1066	105	4	15.00	60.00	2023-02-17 07:32:58
202	1066	98	5	46.00	230.00	2023-02-17 07:32:58
203	1067	56	7	21.00	147.00	2023-02-18 18:12:09
204	1067	79	3	32.00	96.00	2023-02-18 18:12:09
205	1067	103	7	19.00	133.00	2023-02-18 18:12:09
206	1067	89	5	6.00	30.00	2023-02-18 18:12:09
207	1068	70	3	23.00	69.00	2023-02-19 14:00:39
208	1068	99	7	20.00	140.00	2023-02-19 14:00:39
209	1068	75	8	39.00	312.00	2023-02-19 14:00:39
210	1069	95	7	13.00	91.00	2023-02-20 12:15:09
211	1069	93	1	48.00	48.00	2023-02-20 12:15:09
212	1070	56	2	21.00	42.00	2023-02-20 12:34:41
213	1070	101	6	4.00	24.00	2023-02-20 12:34:41
214	1070	73	1	23.00	23.00	2023-02-20 12:34:41
215	1071	77	8	32.00	256.00	2023-02-22 16:27:03
216	1071	64	7	37.00	259.00	2023-02-22 16:27:03
217	1072	88	3	21.00	63.00	2023-02-25 08:38:22
218	1073	79	7	32.00	224.00	2023-02-26 11:34:26
219	1073	99	5	20.00	100.00	2023-02-26 11:34:26
220	1073	78	4	19.00	76.00	2023-02-26 11:34:26
221	1073	90	2	20.00	40.00	2023-02-26 11:34:26
222	1074	82	4	12.00	48.00	2023-02-26 14:45:44
223	1074	73	2	23.00	46.00	2023-02-26 14:45:44
224	1075	99	2	20.00	40.00	2023-02-27 11:43:50
225	1075	59	7	2.00	14.00	2023-02-27 11:43:50
226	1075	103	1	19.00	19.00	2023-02-27 11:43:50
227	1076	88	8	21.00	168.00	2023-02-28 23:00:01
228	1076	64	2	37.00	74.00	2023-02-28 23:00:01
229	1077	81	3	35.00	105.00	2023-03-01 03:39:10
230	1077	92	4	33.00	132.00	2023-03-01 03:39:10
231	1077	78	6	19.00	114.00	2023-03-01 03:39:10
232	1077	94	7	23.00	161.00	2023-03-01 03:39:10
233	1077	64	1	37.00	37.00	2023-03-01 03:39:10
234	1078	88	4	21.00	84.00	2023-03-03 00:11:23
235	1078	71	8	29.00	232.00	2023-03-03 00:11:23
236	1079	89	7	6.00	42.00	2023-03-04 03:54:53
237	1080	78	5	19.00	95.00	2023-03-04 14:27:03
238	1080	94	6	23.00	138.00	2023-03-04 14:27:03
239	1080	93	3	48.00	144.00	2023-03-04 14:27:03
240	1080	75	3	39.00	117.00	2023-03-04 14:27:03
241	1081	89	4	6.00	24.00	2023-03-05 08:26:29
242	1082	76	8	42.00	336.00	2023-03-06 00:32:53
243	1083	68	3	33.00	99.00	2023-03-08 15:11:35
244	1083	97	6	34.00	204.00	2023-03-08 15:11:35
245	1084	54	3	47.00	141.00	2023-03-08 19:56:26
246	1084	57	5	43.00	215.00	2023-03-08 19:56:26
247	1085	101	3	4.00	12.00	2023-03-09 09:34:30
248	1086	86	8	44.00	352.00	2023-03-09 21:59:32
249	1086	84	8	21.00	168.00	2023-03-09 21:59:32
250	1087	57	3	43.00	129.00	2023-03-11 10:47:09
251	1087	62	8	13.00	104.00	2023-03-11 10:47:09
252	1087	102	5	38.00	190.00	2023-03-11 10:47:09
253	1088	102	5	38.00	190.00	2023-03-11 19:02:11
254	1089	106	1	11.00	11.00	2023-03-12 12:40:08
255	1090	99	3	20.00	60.00	2023-03-12 20:36:10
256	1090	73	8	23.00	184.00	2023-03-12 20:36:10
257	1090	93	3	48.00	144.00	2023-03-12 20:36:10
258	1090	81	5	35.00	175.00	2023-03-12 20:36:10
259	1090	62	6	13.00	78.00	2023-03-12 20:36:10
260	1091	81	6	35.00	210.00	2023-03-13 07:02:39
261	1091	96	6	7.00	42.00	2023-03-13 07:02:39
262	1091	92	7	33.00	231.00	2023-03-13 07:02:39
263	1091	68	3	33.00	99.00	2023-03-13 07:02:39
264	1091	100	2	35.00	70.00	2023-03-13 07:02:39
265	1092	97	6	34.00	204.00	2023-03-13 14:31:27
266	1092	83	1	23.00	23.00	2023-03-13 14:31:27
267	1092	61	1	10.00	10.00	2023-03-13 14:31:27
268	1092	83	5	23.00	115.00	2023-03-13 14:31:27
269	1093	65	8	18.00	144.00	2023-03-13 18:53:02
270	1093	85	1	34.00	34.00	2023-03-13 18:53:02
271	1093	99	6	20.00	120.00	2023-03-13 18:53:02
272	1094	97	4	34.00	136.00	2023-03-15 02:56:29
273	1094	68	2	33.00	66.00	2023-03-15 02:56:29
274	1094	106	7	11.00	77.00	2023-03-15 02:56:29
275	1095	77	4	32.00	128.00	2023-03-16 01:46:42
276	1096	71	5	29.00	145.00	2023-03-16 07:00:14
277	1096	89	8	6.00	48.00	2023-03-16 07:00:14
278	1096	76	8	42.00	336.00	2023-03-16 07:00:14
279	1096	65	5	18.00	90.00	2023-03-16 07:00:14
280	1097	97	7	34.00	238.00	2023-03-16 17:07:02
281	1097	59	1	2.00	2.00	2023-03-16 17:07:02
282	1097	94	6	23.00	138.00	2023-03-16 17:07:02
283	1097	101	4	4.00	16.00	2023-03-16 17:07:02
284	1097	62	1	13.00	13.00	2023-03-16 17:07:02
285	1098	76	6	42.00	252.00	2023-03-18 00:00:10
286	1098	104	1	37.00	37.00	2023-03-18 00:00:10
287	1098	53	2	47.00	94.00	2023-03-18 00:00:10
288	1098	98	8	46.00	368.00	2023-03-18 00:00:10
289	1098	79	1	32.00	32.00	2023-03-18 00:00:10
290	1099	91	3	10.00	30.00	2023-03-18 00:40:29
291	1099	105	5	15.00	75.00	2023-03-18 00:40:29
292	1100	56	7	21.00	147.00	2023-03-21 07:50:40
293	1100	105	4	15.00	60.00	2023-03-21 07:50:40
294	1100	84	8	21.00	168.00	2023-03-21 07:50:40
295	1100	63	2	10.00	20.00	2023-03-21 07:50:40
296	1100	65	7	18.00	126.00	2023-03-21 07:50:40
297	1101	74	4	37.00	148.00	2023-03-21 13:15:54
298	1102	58	5	9.00	45.00	2023-03-21 13:32:44
299	1102	99	3	20.00	60.00	2023-03-21 13:32:44
300	1102	56	5	21.00	105.00	2023-03-21 13:32:44
301	1103	93	5	48.00	240.00	2023-03-21 14:57:56
302	1103	66	7	47.00	329.00	2023-03-21 14:57:56
303	1103	95	5	13.00	65.00	2023-03-21 14:57:56
304	1103	97	4	34.00	136.00	2023-03-21 14:57:56
305	1104	85	2	34.00	68.00	2023-03-21 21:15:55
306	1104	62	7	13.00	91.00	2023-03-21 21:15:55
307	1104	81	3	35.00	105.00	2023-03-21 21:15:55
308	1105	59	1	2.00	2.00	2023-03-24 09:23:52
309	1106	77	7	32.00	224.00	2023-03-24 10:37:09
310	1106	59	5	2.00	10.00	2023-03-24 10:37:09
311	1106	87	2	7.00	14.00	2023-03-24 10:37:09
312	1106	97	8	34.00	272.00	2023-03-24 10:37:09
313	1107	77	1	32.00	32.00	2023-03-25 18:16:08
314	1107	84	3	21.00	63.00	2023-03-25 18:16:08
315	1107	62	1	13.00	13.00	2023-03-25 18:16:08
316	1107	55	6	17.00	102.00	2023-03-25 18:16:08
317	1108	102	8	38.00	304.00	2023-03-25 18:17:31
318	1109	54	5	47.00	235.00	2023-03-26 00:10:32
319	1109	54	8	47.00	376.00	2023-03-26 00:10:32
320	1109	104	4	37.00	148.00	2023-03-26 00:10:32
321	1109	83	3	23.00	69.00	2023-03-26 00:10:32
322	1110	105	5	15.00	75.00	2023-03-28 05:53:41
323	1110	66	1	47.00	47.00	2023-03-28 05:53:41
324	1110	101	4	4.00	16.00	2023-03-28 05:53:41
325	1110	97	3	34.00	102.00	2023-03-28 05:53:41
326	1111	56	3	21.00	63.00	2023-04-01 04:20:07
327	1112	59	2	2.00	4.00	2023-04-01 22:41:25
328	1113	96	6	7.00	42.00	2023-04-02 13:10:35
329	1113	58	7	9.00	63.00	2023-04-02 13:10:35
330	1113	86	3	44.00	132.00	2023-04-02 13:10:35
331	1113	63	5	10.00	50.00	2023-04-02 13:10:35
332	1114	101	6	4.00	24.00	2023-04-03 06:14:04
333	1114	64	3	37.00	111.00	2023-04-03 06:14:04
334	1114	91	8	10.00	80.00	2023-04-03 06:14:04
335	1114	58	5	9.00	45.00	2023-04-03 06:14:04
336	1115	62	6	13.00	78.00	2023-04-04 07:29:26
337	1115	85	5	34.00	170.00	2023-04-04 07:29:26
338	1115	86	7	44.00	308.00	2023-04-04 07:29:26
339	1116	67	6	37.00	222.00	2023-04-05 17:52:14
340	1116	82	6	12.00	72.00	2023-04-05 17:52:14
341	1116	99	6	20.00	120.00	2023-04-05 17:52:14
342	1116	60	7	48.00	336.00	2023-04-05 17:52:14
343	1117	93	8	48.00	384.00	2023-04-05 22:55:09
344	1117	66	1	47.00	47.00	2023-04-05 22:55:09
345	1117	71	1	29.00	29.00	2023-04-05 22:55:09
346	1117	101	5	4.00	20.00	2023-04-05 22:55:09
347	1117	82	6	12.00	72.00	2023-04-05 22:55:09
348	1118	68	5	33.00	165.00	2023-04-05 23:03:59
349	1118	87	6	7.00	42.00	2023-04-05 23:03:59
350	1118	54	3	47.00	141.00	2023-04-05 23:03:59
351	1118	97	1	34.00	34.00	2023-04-05 23:03:59
352	1118	77	7	32.00	224.00	2023-04-05 23:03:59
353	1119	53	8	47.00	376.00	2023-04-07 02:30:42
354	1119	67	5	37.00	185.00	2023-04-07 02:30:42
355	1119	62	4	13.00	52.00	2023-04-07 02:30:42
356	1119	79	7	32.00	224.00	2023-04-07 02:30:42
357	1120	67	7	37.00	259.00	2023-04-08 13:02:45
358	1120	53	1	47.00	47.00	2023-04-08 13:02:45
359	1121	81	8	35.00	280.00	2023-04-08 20:05:24
360	1121	65	7	18.00	126.00	2023-04-08 20:05:24
361	1121	61	2	10.00	20.00	2023-04-08 20:05:24
362	1122	65	5	18.00	90.00	2023-04-09 18:51:24
363	1122	86	1	44.00	44.00	2023-04-09 18:51:24
364	1122	78	5	19.00	95.00	2023-04-09 18:51:24
365	1122	80	8	15.00	120.00	2023-04-09 18:51:24
366	1123	105	5	15.00	75.00	2023-04-11 08:36:06
367	1123	104	5	37.00	185.00	2023-04-11 08:36:06
368	1123	96	5	7.00	35.00	2023-04-11 08:36:06
369	1124	75	6	39.00	234.00	2023-04-11 20:16:13
370	1124	79	2	32.00	64.00	2023-04-11 20:16:13
371	1125	98	3	46.00	138.00	2023-04-11 22:04:23
372	1125	96	7	7.00	49.00	2023-04-11 22:04:23
373	1125	84	3	21.00	63.00	2023-04-11 22:04:23
374	1125	78	4	19.00	76.00	2023-04-11 22:04:23
375	1125	60	8	48.00	384.00	2023-04-11 22:04:23
376	1126	93	2	48.00	96.00	2023-04-12 03:48:16
377	1126	105	7	15.00	105.00	2023-04-12 03:48:16
378	1126	91	6	10.00	60.00	2023-04-12 03:48:16
379	1126	82	4	12.00	48.00	2023-04-12 03:48:16
380	1126	72	4	11.00	44.00	2023-04-12 03:48:16
381	1127	86	1	44.00	44.00	2023-04-12 03:57:28
382	1127	100	1	35.00	35.00	2023-04-12 03:57:28
383	1128	53	4	47.00	188.00	2023-04-12 23:00:49
384	1128	65	4	18.00	72.00	2023-04-12 23:00:49
385	1128	65	3	18.00	54.00	2023-04-12 23:00:49
386	1128	92	1	33.00	33.00	2023-04-12 23:00:49
387	1128	78	7	19.00	133.00	2023-04-12 23:00:49
388	1129	58	8	9.00	72.00	2023-04-13 05:32:40
389	1129	56	2	21.00	42.00	2023-04-13 05:32:40
390	1129	99	4	20.00	80.00	2023-04-13 05:32:40
391	1129	105	1	15.00	15.00	2023-04-13 05:32:40
392	1129	98	7	46.00	322.00	2023-04-13 05:32:40
393	1130	84	4	21.00	84.00	2023-04-13 06:16:59
394	1130	72	1	11.00	11.00	2023-04-13 06:16:59
395	1130	66	7	47.00	329.00	2023-04-13 06:16:59
396	1130	100	8	35.00	280.00	2023-04-13 06:16:59
397	1131	99	7	20.00	140.00	2023-04-16 11:43:37
398	1131	71	2	29.00	58.00	2023-04-16 11:43:37
399	1131	54	6	47.00	282.00	2023-04-16 11:43:37
400	1131	102	2	38.00	76.00	2023-04-16 11:43:37
401	1131	104	5	37.00	185.00	2023-04-16 11:43:37
402	1132	75	8	39.00	312.00	2023-04-16 14:26:07
403	1132	66	6	47.00	282.00	2023-04-16 14:26:07
404	1133	74	5	37.00	185.00	2023-04-18 03:11:27
405	1133	54	6	47.00	282.00	2023-04-18 03:11:27
406	1133	78	4	19.00	76.00	2023-04-18 03:11:27
407	1133	54	4	47.00	188.00	2023-04-18 03:11:27
408	1134	58	7	9.00	63.00	2023-04-18 08:41:55
409	1134	68	8	33.00	264.00	2023-04-18 08:41:55
410	1134	67	3	37.00	111.00	2023-04-18 08:41:55
411	1135	90	8	20.00	160.00	2023-04-18 20:19:51
412	1135	64	5	37.00	185.00	2023-04-18 20:19:51
413	1135	75	7	39.00	273.00	2023-04-18 20:19:51
414	1135	92	2	33.00	66.00	2023-04-18 20:19:51
415	1136	53	5	47.00	235.00	2023-04-20 05:12:45
416	1136	90	2	20.00	40.00	2023-04-20 05:12:45
417	1136	53	7	47.00	329.00	2023-04-20 05:12:45
418	1136	96	6	7.00	42.00	2023-04-20 05:12:45
419	1137	54	2	47.00	94.00	2023-04-20 09:06:23
420	1137	93	6	48.00	288.00	2023-04-20 09:06:23
421	1138	58	7	9.00	63.00	2023-04-20 20:58:16
422	1138	101	4	4.00	16.00	2023-04-20 20:58:16
423	1138	84	3	21.00	63.00	2023-04-20 20:58:16
424	1139	91	6	10.00	60.00	2023-04-21 18:03:42
425	1139	78	2	19.00	38.00	2023-04-21 18:03:42
426	1139	87	2	7.00	14.00	2023-04-21 18:03:42
427	1139	104	1	37.00	37.00	2023-04-21 18:03:42
428	1140	74	1	37.00	37.00	2023-04-23 05:32:49
429	1140	103	3	19.00	57.00	2023-04-23 05:32:49
430	1140	54	8	47.00	376.00	2023-04-23 05:32:49
431	1141	67	5	37.00	185.00	2023-04-23 09:58:19
432	1141	82	7	12.00	84.00	2023-04-23 09:58:19
433	1141	60	5	48.00	240.00	2023-04-23 09:58:19
434	1141	87	5	7.00	35.00	2023-04-23 09:58:19
435	1141	74	5	37.00	185.00	2023-04-23 09:58:19
436	1142	81	2	35.00	70.00	2023-04-23 18:13:17
437	1142	64	4	37.00	148.00	2023-04-23 18:13:17
438	1142	102	1	38.00	38.00	2023-04-23 18:13:17
439	1142	93	8	48.00	384.00	2023-04-23 18:13:17
440	1142	71	8	29.00	232.00	2023-04-23 18:13:17
441	1143	73	4	23.00	92.00	2023-04-23 18:20:47
442	1143	66	7	47.00	329.00	2023-04-23 18:20:47
443	1144	80	7	15.00	105.00	2023-04-24 00:02:01
444	1144	58	2	9.00	18.00	2023-04-24 00:02:01
445	1144	72	4	11.00	44.00	2023-04-24 00:02:01
446	1144	85	3	34.00	102.00	2023-04-24 00:02:01
447	1144	79	3	32.00	96.00	2023-04-24 00:02:01
448	1145	91	4	10.00	40.00	2023-04-24 01:42:07
449	1145	89	7	6.00	42.00	2023-04-24 01:42:07
450	1145	62	1	13.00	13.00	2023-04-24 01:42:07
451	1145	98	1	46.00	46.00	2023-04-24 01:42:07
452	1145	106	8	11.00	88.00	2023-04-24 01:42:07
453	1146	77	5	32.00	160.00	2023-04-24 18:27:02
454	1146	90	7	20.00	140.00	2023-04-24 18:27:02
455	1147	100	2	35.00	70.00	2023-04-25 19:42:21
456	1148	102	7	38.00	266.00	2023-04-25 20:46:42
457	1148	58	1	9.00	9.00	2023-04-25 20:46:42
458	1148	104	8	37.00	296.00	2023-04-25 20:46:42
459	1148	60	6	48.00	288.00	2023-04-25 20:46:42
460	1148	94	4	23.00	92.00	2023-04-25 20:46:42
461	1149	58	1	9.00	9.00	2023-04-26 11:21:03
462	1150	92	6	33.00	198.00	2023-04-27 05:35:25
463	1150	86	6	44.00	264.00	2023-04-27 05:35:25
464	1151	96	5	7.00	35.00	2023-04-28 20:24:44
465	1151	71	3	29.00	87.00	2023-04-28 20:24:44
466	1151	72	5	11.00	55.00	2023-04-28 20:24:44
467	1151	102	7	38.00	266.00	2023-04-28 20:24:44
468	1151	80	7	15.00	105.00	2023-04-28 20:24:44
469	1152	73	5	23.00	115.00	2023-04-30 13:04:59
470	1152	91	7	10.00	70.00	2023-04-30 13:04:59
471	1152	60	4	48.00	192.00	2023-04-30 13:04:59
472	1152	56	2	21.00	42.00	2023-04-30 13:04:59
473	1152	104	7	37.00	259.00	2023-04-30 13:04:59
474	1153	86	5	44.00	220.00	2023-04-30 16:30:25
475	1153	66	8	47.00	376.00	2023-04-30 16:30:25
476	1153	103	1	19.00	19.00	2023-04-30 16:30:25
477	1153	106	6	11.00	66.00	2023-04-30 16:30:25
478	1154	96	8	7.00	56.00	2023-05-01 14:19:48
479	1155	53	3	47.00	141.00	2023-05-01 14:40:52
480	1155	86	4	44.00	176.00	2023-05-01 14:40:52
481	1155	91	7	10.00	70.00	2023-05-01 14:40:52
482	1156	70	8	23.00	184.00	2023-05-01 16:54:43
483	1156	96	1	7.00	7.00	2023-05-01 16:54:43
484	1157	68	3	33.00	99.00	2023-05-02 15:29:56
485	1157	104	2	37.00	74.00	2023-05-02 15:29:56
486	1157	86	2	44.00	88.00	2023-05-02 15:29:56
487	1157	97	7	34.00	238.00	2023-05-02 15:29:56
488	1157	61	7	10.00	70.00	2023-05-02 15:29:56
489	1158	89	1	6.00	6.00	2023-05-03 20:40:57
490	1159	61	7	10.00	70.00	2023-05-05 16:55:13
491	1160	102	6	38.00	228.00	2023-05-05 21:23:23
492	1161	88	7	21.00	147.00	2023-05-06 16:13:29
493	1161	103	4	19.00	76.00	2023-05-06 16:13:29
494	1162	54	1	47.00	47.00	2023-05-06 20:25:36
495	1162	75	6	39.00	234.00	2023-05-06 20:25:36
496	1162	88	7	21.00	147.00	2023-05-06 20:25:36
497	1162	54	5	47.00	235.00	2023-05-06 20:25:36
498	1162	94	6	23.00	138.00	2023-05-06 20:25:36
499	1163	99	4	20.00	80.00	2023-05-07 01:33:34
500	1163	95	1	13.00	13.00	2023-05-07 01:33:34
501	1163	69	3	41.00	123.00	2023-05-07 01:33:34
502	1163	60	6	48.00	288.00	2023-05-07 01:33:34
503	1164	84	8	21.00	168.00	2023-05-07 05:49:33
504	1164	86	1	44.00	44.00	2023-05-07 05:49:33
505	1164	90	5	20.00	100.00	2023-05-07 05:49:33
506	1164	103	3	19.00	57.00	2023-05-07 05:49:33
507	1164	100	3	35.00	105.00	2023-05-07 05:49:33
508	1165	88	3	21.00	63.00	2023-05-07 16:31:19
509	1166	95	8	13.00	104.00	2023-05-07 20:32:49
510	1166	78	8	19.00	152.00	2023-05-07 20:32:49
511	1166	76	7	42.00	294.00	2023-05-07 20:32:49
512	1167	104	7	37.00	259.00	2023-05-08 12:02:26
513	1167	57	5	43.00	215.00	2023-05-08 12:02:26
514	1167	94	6	23.00	138.00	2023-05-08 12:02:26
515	1167	67	3	37.00	111.00	2023-05-08 12:02:26
516	1168	55	7	17.00	119.00	2023-05-09 21:46:44
517	1169	81	5	35.00	175.00	2023-05-09 22:34:49
518	1169	101	3	4.00	12.00	2023-05-09 22:34:49
519	1170	73	6	23.00	138.00	2023-05-10 05:24:03
520	1170	99	2	20.00	40.00	2023-05-10 05:24:03
521	1171	92	1	33.00	33.00	2023-05-12 00:47:50
522	1171	70	1	23.00	23.00	2023-05-12 00:47:50
523	1172	89	1	6.00	6.00	2023-05-12 02:03:27
524	1172	68	8	33.00	264.00	2023-05-12 02:03:27
525	1172	54	2	47.00	94.00	2023-05-12 02:03:27
526	1172	76	7	42.00	294.00	2023-05-12 02:03:27
527	1172	71	2	29.00	58.00	2023-05-12 02:03:27
528	1173	79	6	32.00	192.00	2023-05-12 11:06:51
529	1173	100	6	35.00	210.00	2023-05-12 11:06:51
530	1173	74	7	37.00	259.00	2023-05-12 11:06:51
531	1174	103	1	19.00	19.00	2023-05-12 13:46:34
532	1174	100	7	35.00	245.00	2023-05-12 13:46:34
533	1175	71	7	29.00	203.00	2023-05-13 19:53:04
534	1175	81	1	35.00	35.00	2023-05-13 19:53:04
535	1175	90	4	20.00	80.00	2023-05-13 19:53:04
536	1175	53	1	47.00	47.00	2023-05-13 19:53:04
537	1175	97	3	34.00	102.00	2023-05-13 19:53:04
538	1176	68	1	33.00	33.00	2023-05-13 23:07:59
539	1176	80	6	15.00	90.00	2023-05-13 23:07:59
540	1177	91	3	10.00	30.00	2023-05-14 18:12:07
541	1177	66	7	47.00	329.00	2023-05-14 18:12:07
542	1178	62	5	13.00	65.00	2023-05-14 22:03:46
543	1179	81	6	35.00	210.00	2023-05-15 17:39:43
544	1179	74	7	37.00	259.00	2023-05-15 17:39:43
545	1179	84	2	21.00	42.00	2023-05-15 17:39:43
546	1180	105	1	15.00	15.00	2023-05-17 00:16:03
547	1180	53	5	47.00	235.00	2023-05-17 00:16:03
548	1180	91	1	10.00	10.00	2023-05-17 00:16:03
549	1181	60	4	48.00	192.00	2023-05-17 03:05:14
550	1181	81	6	35.00	210.00	2023-05-17 03:05:14
551	1182	81	3	35.00	105.00	2023-05-17 13:38:59
552	1182	105	4	15.00	60.00	2023-05-17 13:38:59
553	1182	97	4	34.00	136.00	2023-05-17 13:38:59
554	1183	70	4	23.00	92.00	2023-05-19 05:26:04
555	1183	64	8	37.00	296.00	2023-05-19 05:26:04
556	1183	53	7	47.00	329.00	2023-05-19 05:26:04
557	1183	64	7	37.00	259.00	2023-05-19 05:26:04
558	1183	86	3	44.00	132.00	2023-05-19 05:26:04
559	1184	96	7	7.00	49.00	2023-05-19 10:20:35
560	1184	80	6	15.00	90.00	2023-05-19 10:20:35
561	1184	79	1	32.00	32.00	2023-05-19 10:20:35
562	1184	66	1	47.00	47.00	2023-05-19 10:20:35
563	1185	71	6	29.00	174.00	2023-05-20 02:07:04
564	1185	106	7	11.00	77.00	2023-05-20 02:07:04
565	1185	56	4	21.00	84.00	2023-05-20 02:07:04
566	1186	71	1	29.00	29.00	2023-05-20 06:50:29
567	1186	95	8	13.00	104.00	2023-05-20 06:50:29
568	1186	89	8	6.00	48.00	2023-05-20 06:50:29
569	1186	76	6	42.00	252.00	2023-05-20 06:50:29
570	1186	80	5	15.00	75.00	2023-05-20 06:50:29
571	1187	101	4	4.00	16.00	2023-05-20 17:05:49
572	1187	80	3	15.00	45.00	2023-05-20 17:05:49
573	1188	68	1	33.00	33.00	2023-05-20 22:43:02
574	1188	70	3	23.00	69.00	2023-05-20 22:43:02
575	1188	96	5	7.00	35.00	2023-05-20 22:43:02
576	1188	77	7	32.00	224.00	2023-05-20 22:43:02
577	1188	89	8	6.00	48.00	2023-05-20 22:43:02
578	1189	71	4	29.00	116.00	2023-05-21 13:50:52
579	1189	68	2	33.00	66.00	2023-05-21 13:50:52
580	1189	93	3	48.00	144.00	2023-05-21 13:50:52
581	1190	103	7	19.00	133.00	2023-05-21 14:47:28
582	1191	67	6	37.00	222.00	2023-05-22 04:35:55
583	1191	62	1	13.00	13.00	2023-05-22 04:35:55
584	1192	70	8	23.00	184.00	2023-05-22 06:11:11
585	1192	86	7	44.00	308.00	2023-05-22 06:11:11
586	1192	57	5	43.00	215.00	2023-05-22 06:11:11
587	1192	101	2	4.00	8.00	2023-05-22 06:11:11
588	1193	75	6	39.00	234.00	2023-05-22 17:37:52
589	1193	66	3	47.00	141.00	2023-05-22 17:37:52
590	1193	78	1	19.00	19.00	2023-05-22 17:37:52
591	1193	61	7	10.00	70.00	2023-05-22 17:37:52
592	1194	86	7	44.00	308.00	2023-05-22 20:11:42
593	1194	58	4	9.00	36.00	2023-05-22 20:11:42
594	1194	101	5	4.00	20.00	2023-05-22 20:11:42
595	1195	85	2	34.00	68.00	2023-05-23 06:36:07
596	1195	75	8	39.00	312.00	2023-05-23 06:36:07
597	1195	84	3	21.00	63.00	2023-05-23 06:36:07
598	1195	72	1	11.00	11.00	2023-05-23 06:36:07
599	1195	79	4	32.00	128.00	2023-05-23 06:36:07
600	1196	69	5	41.00	205.00	2023-05-23 11:27:51
601	1196	88	4	21.00	84.00	2023-05-23 11:27:51
602	1196	91	4	10.00	40.00	2023-05-23 11:27:51
603	1196	105	4	15.00	60.00	2023-05-23 11:27:51
604	1196	61	2	10.00	20.00	2023-05-23 11:27:51
605	1197	82	2	12.00	24.00	2023-05-23 21:46:42
606	1197	74	5	37.00	185.00	2023-05-23 21:46:42
607	1197	80	7	15.00	105.00	2023-05-23 21:46:42
608	1198	75	4	39.00	156.00	2023-05-24 19:07:50
609	1199	105	7	15.00	105.00	2023-05-25 09:48:30
610	1199	54	3	47.00	141.00	2023-05-25 09:48:30
611	1199	84	2	21.00	42.00	2023-05-25 09:48:30
612	1199	77	3	32.00	96.00	2023-05-25 09:48:30
613	1200	93	4	48.00	192.00	2023-05-25 19:44:21
614	1200	54	8	47.00	376.00	2023-05-25 19:44:21
615	1201	97	5	34.00	170.00	2023-05-25 22:34:50
616	1201	100	8	35.00	280.00	2023-05-25 22:34:50
617	1201	87	4	7.00	28.00	2023-05-25 22:34:50
618	1201	91	1	10.00	10.00	2023-05-25 22:34:50
619	1202	85	5	34.00	170.00	2023-05-26 15:47:58
620	1202	98	5	46.00	230.00	2023-05-26 15:47:58
621	1202	53	8	47.00	376.00	2023-05-26 15:47:58
622	1202	77	5	32.00	160.00	2023-05-26 15:47:58
623	1202	95	8	13.00	104.00	2023-05-26 15:47:58
624	1203	60	5	48.00	240.00	2023-05-28 13:05:06
625	1203	59	4	2.00	8.00	2023-05-28 13:05:06
626	1203	61	7	10.00	70.00	2023-05-28 13:05:06
627	1203	69	8	41.00	328.00	2023-05-28 13:05:06
628	1204	54	7	47.00	329.00	2023-05-30 14:03:16
629	1204	76	7	42.00	294.00	2023-05-30 14:03:16
630	1205	105	5	15.00	75.00	2023-05-31 00:11:48
631	1205	68	7	33.00	231.00	2023-05-31 00:11:48
632	1205	95	1	13.00	13.00	2023-05-31 00:11:48
633	1205	68	4	33.00	132.00	2023-05-31 00:11:48
634	1206	60	2	48.00	96.00	2023-06-01 01:52:53
635	1206	74	4	37.00	148.00	2023-06-01 01:52:53
636	1206	56	3	21.00	63.00	2023-06-01 01:52:53
637	1207	69	4	41.00	164.00	2023-06-01 21:47:21
638	1207	58	2	9.00	18.00	2023-06-01 21:47:21
639	1207	55	5	17.00	85.00	2023-06-01 21:47:21
640	1208	87	4	7.00	28.00	2023-06-02 02:40:37
641	1208	77	5	32.00	160.00	2023-06-02 02:40:37
642	1209	55	8	17.00	136.00	2023-06-02 05:47:09
643	1209	74	8	37.00	296.00	2023-06-02 05:47:09
644	1209	65	1	18.00	18.00	2023-06-02 05:47:09
645	1210	98	4	46.00	184.00	2023-06-02 08:45:51
646	1210	55	4	17.00	68.00	2023-06-02 08:45:51
647	1211	73	3	23.00	69.00	2023-06-02 14:46:03
648	1211	105	4	15.00	60.00	2023-06-02 14:46:03
649	1212	60	3	48.00	144.00	2023-06-03 01:31:48
650	1212	95	3	13.00	39.00	2023-06-03 01:31:48
651	1212	85	1	34.00	34.00	2023-06-03 01:31:48
652	1212	78	6	19.00	114.00	2023-06-03 01:31:48
653	1212	98	8	46.00	368.00	2023-06-03 01:31:48
654	1213	69	3	41.00	123.00	2023-06-05 08:48:40
655	1213	56	3	21.00	63.00	2023-06-05 08:48:40
656	1213	53	4	47.00	188.00	2023-06-05 08:48:40
657	1213	91	5	10.00	50.00	2023-06-05 08:48:40
658	1213	69	3	41.00	123.00	2023-06-05 08:48:40
659	1214	83	8	23.00	184.00	2023-06-06 14:20:15
660	1215	82	4	12.00	48.00	2023-06-07 17:31:31
661	1215	99	4	20.00	80.00	2023-06-07 17:31:31
662	1215	94	3	23.00	69.00	2023-06-07 17:31:31
663	1215	80	3	15.00	45.00	2023-06-07 17:31:31
664	1216	61	4	10.00	40.00	2023-06-08 11:31:09
665	1216	96	1	7.00	7.00	2023-06-08 11:31:09
666	1216	87	4	7.00	28.00	2023-06-08 11:31:09
667	1216	87	5	7.00	35.00	2023-06-08 11:31:09
668	1216	79	5	32.00	160.00	2023-06-08 11:31:09
669	1217	55	6	17.00	102.00	2023-06-08 19:03:57
670	1217	60	5	48.00	240.00	2023-06-08 19:03:57
671	1218	69	1	41.00	41.00	2023-06-10 01:47:24
672	1219	96	7	7.00	49.00	2023-06-10 06:05:43
673	1219	85	7	34.00	238.00	2023-06-10 06:05:43
674	1220	58	5	9.00	45.00	2023-06-10 07:14:29
675	1220	65	5	18.00	90.00	2023-06-10 07:14:29
676	1220	97	7	34.00	238.00	2023-06-10 07:14:29
677	1221	103	3	19.00	57.00	2023-06-10 11:12:18
678	1221	62	8	13.00	104.00	2023-06-10 11:12:18
679	1221	60	8	48.00	384.00	2023-06-10 11:12:18
680	1221	90	8	20.00	160.00	2023-06-10 11:12:18
681	1221	94	6	23.00	138.00	2023-06-10 11:12:18
682	1222	61	6	10.00	60.00	2023-06-10 14:07:16
683	1222	88	4	21.00	84.00	2023-06-10 14:07:16
684	1222	78	5	19.00	95.00	2023-06-10 14:07:16
685	1223	59	6	2.00	12.00	2023-06-12 13:41:51
686	1224	99	7	20.00	140.00	2023-06-12 23:42:14
687	1224	98	5	46.00	230.00	2023-06-12 23:42:14
688	1224	67	6	37.00	222.00	2023-06-12 23:42:14
689	1224	105	8	15.00	120.00	2023-06-12 23:42:14
690	1224	78	2	19.00	38.00	2023-06-12 23:42:14
691	1225	58	7	9.00	63.00	2023-06-13 00:05:02
692	1225	98	3	46.00	138.00	2023-06-13 00:05:02
693	1225	69	4	41.00	164.00	2023-06-13 00:05:02
694	1226	101	1	4.00	4.00	2023-06-13 04:38:28
695	1227	79	1	32.00	32.00	2023-06-15 04:58:00
696	1227	65	3	18.00	54.00	2023-06-15 04:58:00
697	1227	91	8	10.00	80.00	2023-06-15 04:58:00
698	1227	84	1	21.00	21.00	2023-06-15 04:58:00
699	1227	90	5	20.00	100.00	2023-06-15 04:58:00
700	1228	94	5	23.00	115.00	2023-06-16 07:28:36
701	1228	90	3	20.00	60.00	2023-06-16 07:28:36
702	1228	98	8	46.00	368.00	2023-06-16 07:28:36
703	1228	102	2	38.00	76.00	2023-06-16 07:28:36
704	1228	59	1	2.00	2.00	2023-06-16 07:28:36
705	1229	106	3	11.00	33.00	2023-06-17 15:26:01
706	1229	61	8	10.00	80.00	2023-06-17 15:26:01
707	1229	59	3	2.00	6.00	2023-06-17 15:26:01
708	1229	91	4	10.00	40.00	2023-06-17 15:26:01
709	1230	78	7	19.00	133.00	2023-06-18 11:16:19
710	1230	63	1	10.00	10.00	2023-06-18 11:16:19
711	1230	84	8	21.00	168.00	2023-06-18 11:16:19
712	1231	66	6	47.00	282.00	2023-06-18 17:23:14
713	1232	71	6	29.00	174.00	2023-06-18 18:40:15
714	1232	104	7	37.00	259.00	2023-06-18 18:40:15
715	1232	61	2	10.00	20.00	2023-06-18 18:40:15
716	1233	86	3	44.00	132.00	2023-06-19 01:28:57
717	1233	103	2	19.00	38.00	2023-06-19 01:28:57
718	1233	99	4	20.00	80.00	2023-06-19 01:28:57
719	1233	55	3	17.00	51.00	2023-06-19 01:28:57
720	1233	95	2	13.00	26.00	2023-06-19 01:28:57
721	1234	63	2	10.00	20.00	2023-06-19 04:30:03
722	1235	92	6	33.00	198.00	2023-06-19 09:38:36
723	1235	59	3	2.00	6.00	2023-06-19 09:38:36
724	1235	92	1	33.00	33.00	2023-06-19 09:38:36
725	1235	79	2	32.00	64.00	2023-06-19 09:38:36
726	1235	83	1	23.00	23.00	2023-06-19 09:38:36
727	1236	56	3	21.00	63.00	2023-06-20 20:10:05
728	1236	56	8	21.00	168.00	2023-06-20 20:10:05
729	1236	85	8	34.00	272.00	2023-06-20 20:10:05
730	1237	79	7	32.00	224.00	2023-06-20 23:39:42
731	1238	63	4	10.00	40.00	2023-06-21 13:08:58
732	1238	77	3	32.00	96.00	2023-06-21 13:08:58
733	1238	102	4	38.00	152.00	2023-06-21 13:08:58
734	1239	89	2	6.00	12.00	2023-06-21 22:16:46
735	1239	98	7	46.00	322.00	2023-06-21 22:16:46
736	1240	86	7	44.00	308.00	2023-06-21 23:24:44
737	1241	94	3	23.00	69.00	2023-06-24 05:05:28
738	1242	54	4	47.00	188.00	2023-06-24 17:57:12
739	1243	80	7	15.00	105.00	2023-06-27 22:18:21
740	1243	72	3	11.00	33.00	2023-06-27 22:18:21
741	1243	80	7	15.00	105.00	2023-06-27 22:18:21
742	1244	56	4	21.00	84.00	2023-06-28 03:37:30
743	1244	102	1	38.00	38.00	2023-06-28 03:37:30
744	1244	94	3	23.00	69.00	2023-06-28 03:37:30
745	1245	100	4	35.00	140.00	2023-06-28 20:59:51
746	1245	102	4	38.00	152.00	2023-06-28 20:59:51
747	1245	72	7	11.00	77.00	2023-06-28 20:59:51
748	1246	57	1	43.00	43.00	2023-07-01 09:26:22
749	1246	79	4	32.00	128.00	2023-07-01 09:26:22
750	1247	84	7	21.00	147.00	2023-07-02 14:33:10
751	1247	96	7	7.00	49.00	2023-07-02 14:33:10
752	1248	103	3	19.00	57.00	2023-07-03 06:13:43
753	1249	90	4	20.00	80.00	2023-07-03 22:06:50
754	1250	99	8	20.00	160.00	2023-07-05 20:46:56
755	1250	68	1	33.00	33.00	2023-07-05 20:46:56
756	1250	93	3	48.00	144.00	2023-07-05 20:46:56
757	1251	70	1	23.00	23.00	2023-07-06 01:21:41
758	1252	86	3	44.00	132.00	2023-07-07 00:04:46
759	1252	54	2	47.00	94.00	2023-07-07 00:04:46
760	1252	85	6	34.00	204.00	2023-07-07 00:04:46
761	1252	59	7	2.00	14.00	2023-07-07 00:04:46
762	1253	94	3	23.00	69.00	2023-07-07 20:30:46
763	1254	57	1	43.00	43.00	2023-07-07 22:09:06
764	1254	79	3	32.00	96.00	2023-07-07 22:09:06
765	1254	68	2	33.00	66.00	2023-07-07 22:09:06
766	1254	55	6	17.00	102.00	2023-07-07 22:09:06
767	1254	88	1	21.00	21.00	2023-07-07 22:09:06
768	1255	62	3	13.00	39.00	2023-07-09 03:33:17
769	1256	65	2	18.00	36.00	2023-07-09 17:54:29
770	1256	77	6	32.00	192.00	2023-07-09 17:54:29
771	1256	86	1	44.00	44.00	2023-07-09 17:54:29
772	1256	103	4	19.00	76.00	2023-07-09 17:54:29
773	1256	92	5	33.00	165.00	2023-07-09 17:54:29
774	1257	79	7	32.00	224.00	2023-07-10 22:40:25
775	1257	63	4	10.00	40.00	2023-07-10 22:40:25
776	1257	87	2	7.00	14.00	2023-07-10 22:40:25
777	1257	58	5	9.00	45.00	2023-07-10 22:40:25
778	1257	60	8	48.00	384.00	2023-07-10 22:40:25
779	1258	86	8	44.00	352.00	2023-07-11 09:56:37
780	1258	71	6	29.00	174.00	2023-07-11 09:56:37
781	1258	58	3	9.00	27.00	2023-07-11 09:56:37
782	1259	59	1	2.00	2.00	2023-07-11 13:38:38
783	1260	78	8	19.00	152.00	2023-07-11 20:49:15
784	1260	90	8	20.00	160.00	2023-07-11 20:49:15
785	1260	62	3	13.00	39.00	2023-07-11 20:49:15
786	1260	68	6	33.00	198.00	2023-07-11 20:49:15
787	1260	72	1	11.00	11.00	2023-07-11 20:49:15
788	1261	99	8	20.00	160.00	2023-07-12 00:33:16
789	1261	93	7	48.00	336.00	2023-07-12 00:33:16
790	1261	74	4	37.00	148.00	2023-07-12 00:33:16
791	1262	61	5	10.00	50.00	2023-07-12 04:01:21
792	1262	62	3	13.00	39.00	2023-07-12 04:01:21
793	1262	84	8	21.00	168.00	2023-07-12 04:01:21
794	1262	75	3	39.00	117.00	2023-07-12 04:01:21
795	1263	102	3	38.00	114.00	2023-07-12 06:24:41
796	1263	106	3	11.00	33.00	2023-07-12 06:24:41
797	1263	81	1	35.00	35.00	2023-07-12 06:24:41
798	1264	101	8	4.00	32.00	2023-07-12 17:58:43
799	1264	78	7	19.00	133.00	2023-07-12 17:58:43
800	1264	88	3	21.00	63.00	2023-07-12 17:58:43
801	1265	77	7	32.00	224.00	2023-07-13 03:21:52
802	1265	102	2	38.00	76.00	2023-07-13 03:21:52
803	1265	95	3	13.00	39.00	2023-07-13 03:21:52
804	1265	75	5	39.00	195.00	2023-07-13 03:21:52
805	1265	85	8	34.00	272.00	2023-07-13 03:21:52
806	1266	105	4	15.00	60.00	2023-07-14 07:10:35
807	1267	71	8	29.00	232.00	2023-07-14 15:29:47
808	1267	89	4	6.00	24.00	2023-07-14 15:29:47
809	1267	70	4	23.00	92.00	2023-07-14 15:29:47
810	1267	103	8	19.00	152.00	2023-07-14 15:29:47
811	1267	58	1	9.00	9.00	2023-07-14 15:29:47
812	1268	106	5	11.00	55.00	2023-07-14 16:50:44
813	1268	98	5	46.00	230.00	2023-07-14 16:50:44
814	1268	72	3	11.00	33.00	2023-07-14 16:50:44
815	1268	81	1	35.00	35.00	2023-07-14 16:50:44
816	1268	93	6	48.00	288.00	2023-07-14 16:50:44
817	1269	55	4	17.00	68.00	2023-07-14 23:06:02
818	1269	91	4	10.00	40.00	2023-07-14 23:06:02
819	1269	98	4	46.00	184.00	2023-07-14 23:06:02
820	1270	102	6	38.00	228.00	2023-07-15 04:56:04
821	1270	72	6	11.00	66.00	2023-07-15 04:56:04
822	1270	59	5	2.00	10.00	2023-07-15 04:56:04
823	1270	59	3	2.00	6.00	2023-07-15 04:56:04
824	1270	57	6	43.00	258.00	2023-07-15 04:56:04
825	1271	93	7	48.00	336.00	2023-07-15 13:19:26
826	1272	99	6	20.00	120.00	2023-07-17 11:36:32
827	1272	65	7	18.00	126.00	2023-07-17 11:36:32
828	1272	105	1	15.00	15.00	2023-07-17 11:36:32
829	1273	73	1	23.00	23.00	2023-07-17 12:32:26
830	1274	104	3	37.00	111.00	2023-07-17 15:32:40
831	1274	80	6	15.00	90.00	2023-07-17 15:32:40
832	1274	59	8	2.00	16.00	2023-07-17 15:32:40
833	1274	106	3	11.00	33.00	2023-07-17 15:32:40
834	1275	88	8	21.00	168.00	2023-07-17 19:33:13
835	1276	92	6	33.00	198.00	2023-07-18 21:16:15
836	1276	80	4	15.00	60.00	2023-07-18 21:16:15
837	1277	70	3	23.00	69.00	2023-07-19 12:11:48
838	1277	76	4	42.00	168.00	2023-07-19 12:11:48
839	1278	53	7	47.00	329.00	2023-07-20 07:45:46
840	1278	103	7	19.00	133.00	2023-07-20 07:45:46
841	1279	88	5	21.00	105.00	2023-07-20 11:51:22
842	1279	95	4	13.00	52.00	2023-07-20 11:51:22
843	1279	53	2	47.00	94.00	2023-07-20 11:51:22
844	1279	88	6	21.00	126.00	2023-07-20 11:51:22
845	1279	74	2	37.00	74.00	2023-07-20 11:51:22
846	1280	79	6	32.00	192.00	2023-07-21 01:00:46
847	1281	84	5	21.00	105.00	2023-07-21 14:56:26
848	1281	67	3	37.00	111.00	2023-07-21 14:56:26
849	1281	76	2	42.00	84.00	2023-07-21 14:56:26
850	1281	86	3	44.00	132.00	2023-07-21 14:56:26
851	1281	91	6	10.00	60.00	2023-07-21 14:56:26
852	1282	71	3	29.00	87.00	2023-07-21 23:47:12
853	1282	91	7	10.00	70.00	2023-07-21 23:47:12
854	1282	72	8	11.00	88.00	2023-07-21 23:47:12
855	1282	56	5	21.00	105.00	2023-07-21 23:47:12
856	1282	98	7	46.00	322.00	2023-07-21 23:47:12
857	1283	60	2	48.00	96.00	2023-07-22 03:43:00
858	1283	94	5	23.00	115.00	2023-07-22 03:43:00
859	1284	96	3	7.00	21.00	2023-07-22 09:51:08
860	1285	104	1	37.00	37.00	2023-07-23 22:16:13
861	1286	68	3	33.00	99.00	2023-07-24 01:50:24
862	1286	79	1	32.00	32.00	2023-07-24 01:50:24
863	1286	99	1	20.00	20.00	2023-07-24 01:50:24
864	1286	86	2	44.00	88.00	2023-07-24 01:50:24
865	1287	86	4	44.00	176.00	2023-07-25 09:31:21
866	1287	71	2	29.00	58.00	2023-07-25 09:31:21
867	1287	76	1	42.00	42.00	2023-07-25 09:31:21
868	1288	76	8	42.00	336.00	2023-07-25 12:08:29
869	1288	64	7	37.00	259.00	2023-07-25 12:08:29
870	1288	103	5	19.00	95.00	2023-07-25 12:08:29
871	1288	97	8	34.00	272.00	2023-07-25 12:08:29
872	1289	103	8	19.00	152.00	2023-07-25 15:12:53
873	1290	80	7	15.00	105.00	2023-07-26 23:00:08
874	1290	89	1	6.00	6.00	2023-07-26 23:00:08
875	1290	72	8	11.00	88.00	2023-07-26 23:00:08
876	1291	53	6	47.00	282.00	2023-07-27 02:27:37
877	1291	99	4	20.00	80.00	2023-07-27 02:27:37
878	1291	101	2	4.00	8.00	2023-07-27 02:27:37
879	1292	75	5	39.00	195.00	2023-07-29 03:39:17
880	1292	79	4	32.00	128.00	2023-07-29 03:39:17
881	1292	58	6	9.00	54.00	2023-07-29 03:39:17
882	1293	75	4	39.00	156.00	2023-07-29 06:23:24
883	1293	68	2	33.00	66.00	2023-07-29 06:23:24
884	1293	103	4	19.00	76.00	2023-07-29 06:23:24
885	1293	99	6	20.00	120.00	2023-07-29 06:23:24
886	1293	105	6	15.00	90.00	2023-07-29 06:23:24
887	1294	66	3	47.00	141.00	2023-07-30 13:39:21
888	1294	64	1	37.00	37.00	2023-07-30 13:39:21
889	1294	61	4	10.00	40.00	2023-07-30 13:39:21
890	1295	90	5	20.00	100.00	2023-07-30 16:24:16
891	1295	92	4	33.00	132.00	2023-07-30 16:24:16
892	1295	96	3	7.00	21.00	2023-07-30 16:24:16
893	1295	106	1	11.00	11.00	2023-07-30 16:24:16
894	1295	101	8	4.00	32.00	2023-07-30 16:24:16
895	1296	88	8	21.00	168.00	2023-07-30 17:44:33
896	1297	77	5	32.00	160.00	2023-07-30 22:39:05
897	1297	65	7	18.00	126.00	2023-07-30 22:39:05
898	1297	103	7	19.00	133.00	2023-07-30 22:39:05
899	1297	76	7	42.00	294.00	2023-07-30 22:39:05
900	1298	67	7	37.00	259.00	2023-07-31 04:00:14
901	1299	92	7	33.00	231.00	2023-08-02 20:42:18
902	1299	54	4	47.00	188.00	2023-08-02 20:42:18
903	1300	75	3	39.00	117.00	2023-08-04 19:14:23
904	1301	102	4	38.00	152.00	2023-08-04 23:31:47
905	1301	61	4	10.00	40.00	2023-08-04 23:31:47
906	1301	61	2	10.00	20.00	2023-08-04 23:31:47
907	1301	85	3	34.00	102.00	2023-08-04 23:31:47
908	1302	83	7	23.00	161.00	2023-08-05 12:31:36
909	1302	59	5	2.00	10.00	2023-08-05 12:31:36
910	1302	77	1	32.00	32.00	2023-08-05 12:31:36
911	1303	90	1	20.00	20.00	2023-08-06 00:13:46
912	1303	89	6	6.00	36.00	2023-08-06 00:13:46
913	1303	88	5	21.00	105.00	2023-08-06 00:13:46
914	1304	70	5	23.00	115.00	2023-08-06 14:30:58
915	1304	82	6	12.00	72.00	2023-08-06 14:30:58
916	1304	100	7	35.00	245.00	2023-08-06 14:30:58
917	1304	94	1	23.00	23.00	2023-08-06 14:30:58
918	1305	78	6	19.00	114.00	2023-08-07 14:59:37
919	1305	60	5	48.00	240.00	2023-08-07 14:59:37
920	1305	66	2	47.00	94.00	2023-08-07 14:59:37
921	1305	87	6	7.00	42.00	2023-08-07 14:59:37
922	1305	102	6	38.00	228.00	2023-08-07 14:59:37
923	1306	76	7	42.00	294.00	2023-08-11 13:45:36
924	1306	61	4	10.00	40.00	2023-08-11 13:45:36
925	1306	86	3	44.00	132.00	2023-08-11 13:45:36
926	1306	92	2	33.00	66.00	2023-08-11 13:45:36
927	1307	102	4	38.00	152.00	2023-08-11 22:05:16
928	1308	68	1	33.00	33.00	2023-08-11 22:24:21
929	1308	77	3	32.00	96.00	2023-08-11 22:24:21
930	1308	70	2	23.00	46.00	2023-08-11 22:24:21
931	1309	91	1	10.00	10.00	2023-08-12 12:42:17
932	1309	73	8	23.00	184.00	2023-08-12 12:42:17
933	1309	85	2	34.00	68.00	2023-08-12 12:42:17
934	1309	71	8	29.00	232.00	2023-08-12 12:42:17
935	1309	103	3	19.00	57.00	2023-08-12 12:42:17
936	1310	93	4	48.00	192.00	2023-08-13 18:27:07
937	1310	86	8	44.00	352.00	2023-08-13 18:27:07
938	1310	67	4	37.00	148.00	2023-08-13 18:27:07
939	1310	98	2	46.00	92.00	2023-08-13 18:27:07
940	1311	58	8	9.00	72.00	2023-08-14 02:36:26
941	1312	82	5	12.00	60.00	2023-08-14 18:36:14
942	1313	59	2	2.00	4.00	2023-08-15 06:05:17
943	1313	64	1	37.00	37.00	2023-08-15 06:05:17
944	1313	72	8	11.00	88.00	2023-08-15 06:05:17
945	1313	94	6	23.00	138.00	2023-08-15 06:05:17
946	1314	72	2	11.00	22.00	2023-08-15 07:56:21
947	1314	83	4	23.00	92.00	2023-08-15 07:56:21
948	1315	54	1	47.00	47.00	2023-08-15 09:34:30
949	1315	63	8	10.00	80.00	2023-08-15 09:34:30
950	1315	92	5	33.00	165.00	2023-08-15 09:34:30
951	1316	88	3	21.00	63.00	2023-08-15 17:17:19
952	1316	80	3	15.00	45.00	2023-08-15 17:17:19
953	1317	84	2	21.00	42.00	2023-08-16 03:10:44
954	1317	90	7	20.00	140.00	2023-08-16 03:10:44
955	1317	89	2	6.00	12.00	2023-08-16 03:10:44
956	1318	94	4	23.00	92.00	2023-08-16 22:15:30
957	1318	78	6	19.00	114.00	2023-08-16 22:15:30
958	1318	99	5	20.00	100.00	2023-08-16 22:15:30
959	1318	91	1	10.00	10.00	2023-08-16 22:15:30
960	1319	80	5	15.00	75.00	2023-08-18 11:00:13
961	1319	91	6	10.00	60.00	2023-08-18 11:00:13
962	1319	101	1	4.00	4.00	2023-08-18 11:00:13
963	1320	97	1	34.00	34.00	2023-08-20 17:10:47
964	1320	100	7	35.00	245.00	2023-08-20 17:10:47
965	1320	77	8	32.00	256.00	2023-08-20 17:10:47
966	1320	65	4	18.00	72.00	2023-08-20 17:10:47
967	1320	104	8	37.00	296.00	2023-08-20 17:10:47
968	1321	84	6	21.00	126.00	2023-08-20 20:27:14
969	1321	91	6	10.00	60.00	2023-08-20 20:27:14
970	1321	88	1	21.00	21.00	2023-08-20 20:27:14
971	1321	54	3	47.00	141.00	2023-08-20 20:27:14
972	1321	92	6	33.00	198.00	2023-08-20 20:27:14
973	1322	64	4	37.00	148.00	2023-08-21 22:05:52
974	1322	101	7	4.00	28.00	2023-08-21 22:05:52
975	1322	71	6	29.00	174.00	2023-08-21 22:05:52
976	1322	94	6	23.00	138.00	2023-08-21 22:05:52
977	1323	94	1	23.00	23.00	2023-08-23 00:07:03
978	1324	83	3	23.00	69.00	2023-08-26 04:54:49
979	1325	58	4	9.00	36.00	2023-08-26 19:31:32
980	1326	75	6	39.00	234.00	2023-08-27 01:26:01
981	1326	88	4	21.00	84.00	2023-08-27 01:26:01
982	1326	76	3	42.00	126.00	2023-08-27 01:26:01
983	1326	96	2	7.00	14.00	2023-08-27 01:26:01
984	1326	88	4	21.00	84.00	2023-08-27 01:26:01
985	1327	96	2	7.00	14.00	2023-08-27 04:23:25
986	1327	58	1	9.00	9.00	2023-08-27 04:23:25
987	1327	69	2	41.00	82.00	2023-08-27 04:23:25
988	1328	91	5	10.00	50.00	2023-08-27 06:03:09
989	1328	72	7	11.00	77.00	2023-08-27 06:03:09
990	1329	102	7	38.00	266.00	2023-08-27 23:08:35
991	1330	58	1	9.00	9.00	2023-08-27 23:39:04
992	1330	84	8	21.00	168.00	2023-08-27 23:39:04
993	1330	64	2	37.00	74.00	2023-08-27 23:39:04
994	1330	58	7	9.00	63.00	2023-08-27 23:39:04
995	1331	87	7	7.00	49.00	2023-08-28 01:06:13
996	1331	56	2	21.00	42.00	2023-08-28 01:06:13
997	1331	99	4	20.00	80.00	2023-08-28 01:06:13
998	1331	102	2	38.00	76.00	2023-08-28 01:06:13
999	1332	64	2	37.00	74.00	2023-08-29 16:15:15
1000	1332	91	4	10.00	40.00	2023-08-29 16:15:15
1001	1333	73	1	23.00	23.00	2023-08-29 22:50:12
1002	1333	56	1	21.00	21.00	2023-08-29 22:50:12
1003	1334	69	5	41.00	205.00	2023-08-30 08:12:09
1004	1334	68	2	33.00	66.00	2023-08-30 08:12:09
1005	1334	71	4	29.00	116.00	2023-08-30 08:12:09
1006	1334	103	1	19.00	19.00	2023-08-30 08:12:09
1007	1335	72	7	11.00	77.00	2023-08-30 11:57:33
1008	1335	55	2	17.00	34.00	2023-08-30 11:57:33
1009	1335	63	1	10.00	10.00	2023-08-30 11:57:33
1010	1335	72	5	11.00	55.00	2023-08-30 11:57:33
1011	1335	69	3	41.00	123.00	2023-08-30 11:57:33
1012	1336	106	3	11.00	33.00	2023-08-31 11:28:37
1013	1336	99	6	20.00	120.00	2023-08-31 11:28:37
1014	1336	53	7	47.00	329.00	2023-08-31 11:28:37
1015	1336	77	8	32.00	256.00	2023-08-31 11:28:37
1016	1337	76	6	42.00	252.00	2023-09-01 02:35:50
1017	1337	67	5	37.00	185.00	2023-09-01 02:35:50
1018	1338	96	2	7.00	14.00	2023-09-01 02:47:53
1019	1338	76	5	42.00	210.00	2023-09-01 02:47:53
1020	1339	96	5	7.00	35.00	2023-09-01 08:36:35
1021	1340	82	1	12.00	12.00	2023-09-02 00:31:28
1022	1340	105	4	15.00	60.00	2023-09-02 00:31:28
1023	1340	79	5	32.00	160.00	2023-09-02 00:31:28
1024	1340	66	4	47.00	188.00	2023-09-02 00:31:28
1025	1340	66	5	47.00	235.00	2023-09-02 00:31:28
1026	1341	105	2	15.00	30.00	2023-09-02 04:33:12
1027	1341	95	7	13.00	91.00	2023-09-02 04:33:12
1028	1341	105	6	15.00	90.00	2023-09-02 04:33:12
1029	1341	95	3	13.00	39.00	2023-09-02 04:33:12
1030	1341	89	6	6.00	36.00	2023-09-02 04:33:12
1031	1342	98	2	46.00	92.00	2023-09-02 15:39:42
1032	1342	71	1	29.00	29.00	2023-09-02 15:39:42
1033	1342	86	2	44.00	88.00	2023-09-02 15:39:42
1034	1342	55	6	17.00	102.00	2023-09-02 15:39:42
1035	1342	56	5	21.00	105.00	2023-09-02 15:39:42
1036	1343	72	3	11.00	33.00	2023-09-02 20:34:14
1037	1343	103	7	19.00	133.00	2023-09-02 20:34:14
1038	1343	95	5	13.00	65.00	2023-09-02 20:34:14
1039	1343	54	6	47.00	282.00	2023-09-02 20:34:14
1040	1344	57	2	43.00	86.00	2023-09-03 06:48:43
1041	1345	59	1	2.00	2.00	2023-09-04 21:09:45
1042	1345	100	7	35.00	245.00	2023-09-04 21:09:45
1043	1345	88	8	21.00	168.00	2023-09-04 21:09:45
1044	1346	54	3	47.00	141.00	2023-09-05 09:56:20
1045	1346	106	3	11.00	33.00	2023-09-05 09:56:20
1046	1346	68	2	33.00	66.00	2023-09-05 09:56:20
1047	1346	86	4	44.00	176.00	2023-09-05 09:56:20
1048	1347	59	5	2.00	10.00	2023-09-05 18:22:24
1049	1347	97	7	34.00	238.00	2023-09-05 18:22:24
1050	1347	57	8	43.00	344.00	2023-09-05 18:22:24
1051	1347	57	2	43.00	86.00	2023-09-05 18:22:24
1052	1348	59	8	2.00	16.00	2023-09-05 22:32:39
1053	1348	73	5	23.00	115.00	2023-09-05 22:32:39
1054	1349	71	1	29.00	29.00	2023-09-06 04:20:47
1055	1349	88	3	21.00	63.00	2023-09-06 04:20:47
1056	1349	91	3	10.00	30.00	2023-09-06 04:20:47
1057	1349	99	5	20.00	100.00	2023-09-06 04:20:47
1058	1349	91	6	10.00	60.00	2023-09-06 04:20:47
1059	1350	70	4	23.00	92.00	2023-09-06 19:06:35
1060	1350	76	1	42.00	42.00	2023-09-06 19:06:35
1061	1350	69	1	41.00	41.00	2023-09-06 19:06:35
1062	1350	84	1	21.00	21.00	2023-09-06 19:06:35
1063	1351	95	2	13.00	26.00	2023-09-07 03:24:23
1064	1351	86	3	44.00	132.00	2023-09-07 03:24:23
1065	1351	92	2	33.00	66.00	2023-09-07 03:24:23
1066	1351	55	7	17.00	119.00	2023-09-07 03:24:23
1067	1352	65	8	18.00	144.00	2023-09-07 17:10:49
1068	1352	78	1	19.00	19.00	2023-09-07 17:10:49
1069	1352	82	7	12.00	84.00	2023-09-07 17:10:49
1070	1352	100	7	35.00	245.00	2023-09-07 17:10:49
1071	1353	89	1	6.00	6.00	2023-09-09 01:57:14
1072	1354	64	6	37.00	222.00	2023-09-09 10:03:51
1073	1354	80	1	15.00	15.00	2023-09-09 10:03:51
1074	1354	101	1	4.00	4.00	2023-09-09 10:03:51
1075	1355	100	3	35.00	105.00	2023-09-09 11:17:03
1076	1355	97	4	34.00	136.00	2023-09-09 11:17:03
1077	1355	78	1	19.00	19.00	2023-09-09 11:17:03
1078	1355	99	7	20.00	140.00	2023-09-09 11:17:03
1079	1355	81	4	35.00	140.00	2023-09-09 11:17:03
1080	1356	82	5	12.00	60.00	2023-09-09 15:14:24
1081	1356	74	4	37.00	148.00	2023-09-09 15:14:24
1082	1356	67	5	37.00	185.00	2023-09-09 15:14:24
1083	1356	66	3	47.00	141.00	2023-09-09 15:14:24
1084	1356	93	8	48.00	384.00	2023-09-09 15:14:24
1085	1357	98	2	46.00	92.00	2023-09-09 21:11:42
1086	1357	100	5	35.00	175.00	2023-09-09 21:11:42
1087	1357	79	4	32.00	128.00	2023-09-09 21:11:42
1088	1357	58	2	9.00	18.00	2023-09-09 21:11:42
1089	1357	98	3	46.00	138.00	2023-09-09 21:11:42
1090	1358	104	6	37.00	222.00	2023-09-10 09:08:25
1091	1359	56	1	21.00	21.00	2023-09-10 14:41:44
1092	1359	87	6	7.00	42.00	2023-09-10 14:41:44
1093	1359	84	1	21.00	21.00	2023-09-10 14:41:44
1094	1359	70	6	23.00	138.00	2023-09-10 14:41:44
1095	1360	58	1	9.00	9.00	2023-09-11 06:04:15
1096	1360	101	2	4.00	8.00	2023-09-11 06:04:15
1097	1361	84	4	21.00	84.00	2023-09-12 05:28:29
1098	1362	103	8	19.00	152.00	2023-09-13 02:01:47
1099	1362	106	6	11.00	66.00	2023-09-13 02:01:47
1100	1362	66	2	47.00	94.00	2023-09-13 02:01:47
1101	1362	63	8	10.00	80.00	2023-09-13 02:01:47
1102	1363	67	3	37.00	111.00	2023-09-13 13:25:49
1103	1363	86	8	44.00	352.00	2023-09-13 13:25:49
1104	1363	100	3	35.00	105.00	2023-09-13 13:25:49
1105	1363	68	3	33.00	99.00	2023-09-13 13:25:49
1106	1363	92	1	33.00	33.00	2023-09-13 13:25:49
1107	1364	68	4	33.00	132.00	2023-09-15 13:01:17
1108	1365	58	2	9.00	18.00	2023-09-16 03:20:17
1109	1365	66	1	47.00	47.00	2023-09-16 03:20:17
1110	1366	89	6	6.00	36.00	2023-09-16 21:47:02
1111	1366	73	7	23.00	161.00	2023-09-16 21:47:02
1112	1367	55	6	17.00	102.00	2023-09-16 23:54:32
1113	1367	53	7	47.00	329.00	2023-09-16 23:54:32
1114	1367	79	1	32.00	32.00	2023-09-16 23:54:32
1115	1368	80	8	15.00	120.00	2023-09-17 06:48:15
1116	1368	81	1	35.00	35.00	2023-09-17 06:48:15
1117	1368	75	7	39.00	273.00	2023-09-17 06:48:15
1118	1368	60	3	48.00	144.00	2023-09-17 06:48:15
1119	1369	66	1	47.00	47.00	2023-09-17 17:08:54
1120	1369	56	2	21.00	42.00	2023-09-17 17:08:54
1121	1369	67	2	37.00	74.00	2023-09-17 17:08:54
1122	1370	102	4	38.00	152.00	2023-09-18 15:39:06
1123	1370	102	6	38.00	228.00	2023-09-18 15:39:06
1124	1371	75	2	39.00	78.00	2023-09-19 00:45:37
1125	1372	94	2	23.00	46.00	2023-09-19 01:48:57
1126	1372	104	7	37.00	259.00	2023-09-19 01:48:57
1127	1372	76	2	42.00	84.00	2023-09-19 01:48:57
1128	1373	70	4	23.00	92.00	2023-09-20 19:48:41
1129	1374	63	3	10.00	30.00	2023-09-21 04:25:10
1130	1374	103	5	19.00	95.00	2023-09-21 04:25:10
1131	1374	85	5	34.00	170.00	2023-09-21 04:25:10
1132	1374	103	5	19.00	95.00	2023-09-21 04:25:10
1133	1375	75	7	39.00	273.00	2023-09-21 08:27:54
1134	1376	73	7	23.00	161.00	2023-09-21 16:06:27
1135	1376	61	8	10.00	80.00	2023-09-21 16:06:27
1136	1376	105	6	15.00	90.00	2023-09-21 16:06:27
1137	1376	66	5	47.00	235.00	2023-09-21 16:06:27
1138	1376	106	6	11.00	66.00	2023-09-21 16:06:27
1139	1377	84	4	21.00	84.00	2023-09-22 05:34:35
1140	1378	56	8	21.00	168.00	2023-09-22 05:51:55
1141	1378	93	6	48.00	288.00	2023-09-22 05:51:55
1142	1378	95	7	13.00	91.00	2023-09-22 05:51:55
1143	1378	65	2	18.00	36.00	2023-09-22 05:51:55
1144	1379	74	1	37.00	37.00	2023-09-24 06:07:26
1145	1380	102	7	38.00	266.00	2023-09-25 13:47:36
1146	1380	71	3	29.00	87.00	2023-09-25 13:47:36
1147	1380	63	1	10.00	10.00	2023-09-25 13:47:36
1148	1381	62	5	13.00	65.00	2023-09-26 06:25:42
1149	1381	56	5	21.00	105.00	2023-09-26 06:25:42
1150	1381	91	6	10.00	60.00	2023-09-26 06:25:42
1151	1381	63	3	10.00	30.00	2023-09-26 06:25:42
1152	1381	83	7	23.00	161.00	2023-09-26 06:25:42
1153	1382	82	6	12.00	72.00	2023-09-26 06:26:18
1154	1382	77	8	32.00	256.00	2023-09-26 06:26:18
1155	1382	53	4	47.00	188.00	2023-09-26 06:26:18
1156	1383	61	8	10.00	80.00	2023-09-26 15:04:31
1157	1383	76	7	42.00	294.00	2023-09-26 15:04:31
1158	1384	64	7	37.00	259.00	2023-09-26 22:21:58
1159	1384	102	8	38.00	304.00	2023-09-26 22:21:58
1160	1384	58	3	9.00	27.00	2023-09-26 22:21:58
1161	1384	88	8	21.00	168.00	2023-09-26 22:21:58
1162	1384	84	4	21.00	84.00	2023-09-26 22:21:58
1163	1385	63	2	10.00	20.00	2023-09-27 03:19:54
1164	1385	98	4	46.00	184.00	2023-09-27 03:19:54
1165	1386	104	8	37.00	296.00	2023-09-28 11:21:12
1166	1386	80	3	15.00	45.00	2023-09-28 11:21:12
1167	1386	76	7	42.00	294.00	2023-09-28 11:21:12
1168	1386	59	2	2.00	4.00	2023-09-28 11:21:12
1169	1386	69	1	41.00	41.00	2023-09-28 11:21:12
1170	1387	82	2	12.00	24.00	2023-10-01 13:25:50
1171	1388	56	3	21.00	63.00	2023-10-01 14:16:07
1172	1388	89	6	6.00	36.00	2023-10-01 14:16:07
1173	1388	65	6	18.00	108.00	2023-10-01 14:16:07
1174	1388	87	8	7.00	56.00	2023-10-01 14:16:07
1175	1388	78	4	19.00	76.00	2023-10-01 14:16:07
1176	1389	78	2	19.00	38.00	2023-10-02 15:10:43
1177	1389	62	1	13.00	13.00	2023-10-02 15:10:43
1178	1389	59	1	2.00	2.00	2023-10-02 15:10:43
1179	1390	58	8	9.00	72.00	2023-10-02 19:32:25
1180	1390	95	5	13.00	65.00	2023-10-02 19:32:25
1181	1390	65	8	18.00	144.00	2023-10-02 19:32:25
1182	1390	66	3	47.00	141.00	2023-10-02 19:32:25
1183	1391	91	6	10.00	60.00	2023-10-03 09:08:15
1184	1391	102	8	38.00	304.00	2023-10-03 09:08:15
1185	1391	63	7	10.00	70.00	2023-10-03 09:08:15
1186	1391	85	8	34.00	272.00	2023-10-03 09:08:15
1187	1392	71	2	29.00	58.00	2023-10-04 03:07:30
1188	1392	84	5	21.00	105.00	2023-10-04 03:07:30
1189	1393	102	6	38.00	228.00	2023-10-04 09:51:47
1190	1394	62	4	13.00	52.00	2023-10-04 21:28:34
1191	1394	67	1	37.00	37.00	2023-10-04 21:28:34
1192	1394	71	6	29.00	174.00	2023-10-04 21:28:34
1193	1394	102	8	38.00	304.00	2023-10-04 21:28:34
1194	1394	63	1	10.00	10.00	2023-10-04 21:28:34
1195	1395	69	2	41.00	82.00	2023-10-05 06:08:57
1196	1395	60	1	48.00	48.00	2023-10-05 06:08:57
1197	1395	88	6	21.00	126.00	2023-10-05 06:08:57
1198	1395	89	1	6.00	6.00	2023-10-05 06:08:57
1199	1396	104	1	37.00	37.00	2023-10-05 09:38:18
1200	1396	87	2	7.00	14.00	2023-10-05 09:38:18
1201	1397	105	8	15.00	120.00	2023-10-07 06:56:26
1202	1397	74	7	37.00	259.00	2023-10-07 06:56:26
1203	1397	53	7	47.00	329.00	2023-10-07 06:56:26
1204	1398	105	7	15.00	105.00	2023-10-08 03:42:04
1205	1398	70	1	23.00	23.00	2023-10-08 03:42:04
1206	1398	88	6	21.00	126.00	2023-10-08 03:42:04
1207	1398	92	4	33.00	132.00	2023-10-08 03:42:04
1208	1399	82	1	12.00	12.00	2023-10-08 09:41:39
1209	1399	83	8	23.00	184.00	2023-10-08 09:41:39
1210	1399	102	2	38.00	76.00	2023-10-08 09:41:39
1211	1400	55	8	17.00	136.00	2023-10-08 12:59:54
1212	1400	65	8	18.00	144.00	2023-10-08 12:59:54
1213	1401	64	1	37.00	37.00	2023-10-08 18:18:21
1214	1401	61	7	10.00	70.00	2023-10-08 18:18:21
1215	1401	54	8	47.00	376.00	2023-10-08 18:18:21
1216	1401	64	4	37.00	148.00	2023-10-08 18:18:21
1217	1402	74	5	37.00	185.00	2023-10-09 14:47:41
1218	1402	54	5	47.00	235.00	2023-10-09 14:47:41
1219	1402	84	6	21.00	126.00	2023-10-09 14:47:41
1220	1402	81	3	35.00	105.00	2023-10-09 14:47:41
1221	1403	103	5	19.00	95.00	2023-10-10 09:46:31
1222	1404	94	5	23.00	115.00	2023-10-10 13:45:41
1223	1404	99	7	20.00	140.00	2023-10-10 13:45:41
1224	1404	92	1	33.00	33.00	2023-10-10 13:45:41
1225	1404	83	7	23.00	161.00	2023-10-10 13:45:41
1226	1405	61	3	10.00	30.00	2023-10-10 15:27:47
1227	1405	104	6	37.00	222.00	2023-10-10 15:27:47
1228	1405	62	4	13.00	52.00	2023-10-10 15:27:47
1229	1405	101	2	4.00	8.00	2023-10-10 15:27:47
1230	1406	85	7	34.00	238.00	2023-10-11 03:13:48
1231	1406	88	4	21.00	84.00	2023-10-11 03:13:48
1232	1406	83	4	23.00	92.00	2023-10-11 03:13:48
1233	1406	79	5	32.00	160.00	2023-10-11 03:13:48
1234	1407	102	5	38.00	190.00	2023-10-11 07:36:49
1235	1407	61	1	10.00	10.00	2023-10-11 07:36:49
1236	1407	100	5	35.00	175.00	2023-10-11 07:36:49
1237	1407	89	8	6.00	48.00	2023-10-11 07:36:49
1238	1407	70	4	23.00	92.00	2023-10-11 07:36:49
1239	1408	98	1	46.00	46.00	2023-10-11 13:12:52
1240	1408	66	2	47.00	94.00	2023-10-11 13:12:52
1241	1409	67	1	37.00	37.00	2023-10-12 11:14:44
1242	1409	81	2	35.00	70.00	2023-10-12 11:14:44
1243	1410	80	3	15.00	45.00	2023-10-12 11:34:30
1244	1411	64	4	37.00	148.00	2023-10-12 15:43:25
1245	1411	53	2	47.00	94.00	2023-10-12 15:43:25
1246	1411	75	5	39.00	195.00	2023-10-12 15:43:25
1247	1411	83	1	23.00	23.00	2023-10-12 15:43:25
1248	1412	97	4	34.00	136.00	2023-10-12 23:13:37
1249	1412	55	1	17.00	17.00	2023-10-12 23:13:37
1250	1413	70	2	23.00	46.00	2023-10-12 23:33:47
1251	1413	71	4	29.00	116.00	2023-10-12 23:33:47
1252	1413	103	7	19.00	133.00	2023-10-12 23:33:47
1253	1413	92	8	33.00	264.00	2023-10-12 23:33:47
1254	1414	92	3	33.00	99.00	2023-10-13 10:56:43
1255	1414	94	8	23.00	184.00	2023-10-13 10:56:43
1256	1414	56	2	21.00	42.00	2023-10-13 10:56:43
1257	1414	92	7	33.00	231.00	2023-10-13 10:56:43
1258	1414	97	3	34.00	102.00	2023-10-13 10:56:43
1259	1415	93	7	48.00	336.00	2023-10-14 01:21:40
1260	1415	105	4	15.00	60.00	2023-10-14 01:21:40
1261	1416	99	4	20.00	80.00	2023-10-14 17:10:16
1262	1416	95	4	13.00	52.00	2023-10-14 17:10:16
1263	1416	71	1	29.00	29.00	2023-10-14 17:10:16
1264	1416	89	4	6.00	24.00	2023-10-14 17:10:16
1265	1417	64	7	37.00	259.00	2023-10-14 22:46:44
1266	1417	93	6	48.00	288.00	2023-10-14 22:46:44
1267	1417	104	2	37.00	74.00	2023-10-14 22:46:44
1268	1417	79	1	32.00	32.00	2023-10-14 22:46:44
1269	1417	93	8	48.00	384.00	2023-10-14 22:46:44
1270	1418	70	2	23.00	46.00	2023-10-15 00:34:09
1271	1418	102	2	38.00	76.00	2023-10-15 00:34:09
1272	1418	103	6	19.00	114.00	2023-10-15 00:34:09
1273	1419	59	1	2.00	2.00	2023-10-16 02:08:27
1274	1420	70	6	23.00	138.00	2023-10-16 06:18:48
1275	1421	106	3	11.00	33.00	2023-10-16 13:08:57
1276	1421	77	2	32.00	64.00	2023-10-16 13:08:57
1277	1421	93	5	48.00	240.00	2023-10-16 13:08:57
1278	1421	75	6	39.00	234.00	2023-10-16 13:08:57
1279	1421	74	2	37.00	74.00	2023-10-16 13:08:57
1280	1422	72	7	11.00	77.00	2023-10-16 22:33:04
1281	1422	82	5	12.00	60.00	2023-10-16 22:33:04
1282	1422	88	5	21.00	105.00	2023-10-16 22:33:04
1283	1422	104	4	37.00	148.00	2023-10-16 22:33:04
1284	1423	60	8	48.00	384.00	2023-10-18 07:25:24
1285	1423	88	1	21.00	21.00	2023-10-18 07:25:24
1286	1423	100	8	35.00	280.00	2023-10-18 07:25:24
1287	1424	66	3	47.00	141.00	2023-10-18 12:59:49
1288	1425	71	1	29.00	29.00	2023-10-19 01:57:22
1289	1425	62	1	13.00	13.00	2023-10-19 01:57:22
1290	1425	97	2	34.00	68.00	2023-10-19 01:57:22
1291	1425	86	2	44.00	88.00	2023-10-19 01:57:22
1292	1425	83	3	23.00	69.00	2023-10-19 01:57:22
1293	1426	53	6	47.00	282.00	2023-10-20 20:16:20
1294	1426	93	1	48.00	48.00	2023-10-20 20:16:20
1295	1426	56	3	21.00	63.00	2023-10-20 20:16:20
1296	1427	101	6	4.00	24.00	2023-10-21 02:37:03
1297	1428	83	4	23.00	92.00	2023-10-21 09:35:35
1298	1428	54	2	47.00	94.00	2023-10-21 09:35:35
1299	1428	59	4	2.00	8.00	2023-10-21 09:35:35
1300	1429	76	6	42.00	252.00	2023-10-21 16:10:38
1301	1429	60	6	48.00	288.00	2023-10-21 16:10:38
1302	1429	70	4	23.00	92.00	2023-10-21 16:10:38
1303	1429	95	4	13.00	52.00	2023-10-21 16:10:38
1304	1430	96	2	7.00	14.00	2023-10-21 18:31:04
1305	1431	74	1	37.00	37.00	2023-10-22 16:06:18
1306	1431	88	8	21.00	168.00	2023-10-22 16:06:18
1307	1431	94	8	23.00	184.00	2023-10-22 16:06:18
1308	1431	103	2	19.00	38.00	2023-10-22 16:06:18
1309	1432	90	8	20.00	160.00	2023-10-22 21:11:29
1310	1432	98	8	46.00	368.00	2023-10-22 21:11:29
1311	1432	68	2	33.00	66.00	2023-10-22 21:11:29
1312	1432	84	4	21.00	84.00	2023-10-22 21:11:29
1313	1432	102	1	38.00	38.00	2023-10-22 21:11:29
1314	1433	87	6	7.00	42.00	2023-10-23 14:26:14
1315	1433	100	5	35.00	175.00	2023-10-23 14:26:14
1316	1433	68	3	33.00	99.00	2023-10-23 14:26:14
1317	1433	76	5	42.00	210.00	2023-10-23 14:26:14
1318	1433	90	6	20.00	120.00	2023-10-23 14:26:14
1319	1434	99	7	20.00	140.00	2023-10-27 18:02:28
1320	1434	63	5	10.00	50.00	2023-10-27 18:02:28
1321	1435	88	5	21.00	105.00	2023-10-27 18:44:45
1322	1436	90	1	20.00	20.00	2023-10-28 02:44:03
1323	1436	72	6	11.00	66.00	2023-10-28 02:44:03
1324	1437	57	3	43.00	129.00	2023-10-28 03:38:00
1325	1437	87	1	7.00	7.00	2023-10-28 03:38:00
1326	1438	91	1	10.00	10.00	2023-10-28 20:11:31
1327	1438	95	6	13.00	78.00	2023-10-28 20:11:31
1328	1438	60	2	48.00	96.00	2023-10-28 20:11:31
1329	1438	69	7	41.00	287.00	2023-10-28 20:11:31
1330	1439	96	4	7.00	28.00	2023-10-29 04:21:43
1331	1439	104	8	37.00	296.00	2023-10-29 04:21:43
1332	1440	103	3	19.00	57.00	2023-10-29 19:44:41
1333	1440	98	7	46.00	322.00	2023-10-29 19:44:41
1334	1440	83	2	23.00	46.00	2023-10-29 19:44:41
1335	1440	57	6	43.00	258.00	2023-10-29 19:44:41
1336	1441	65	1	18.00	18.00	2023-10-29 19:57:54
1337	1441	80	5	15.00	75.00	2023-10-29 19:57:54
1338	1441	94	5	23.00	115.00	2023-10-29 19:57:54
1339	1442	59	6	2.00	12.00	2023-10-31 00:42:15
1340	1442	53	8	47.00	376.00	2023-10-31 00:42:15
1341	1442	88	7	21.00	147.00	2023-10-31 00:42:15
1342	1443	89	4	6.00	24.00	2023-10-31 01:22:59
1343	1443	53	6	47.00	282.00	2023-10-31 01:22:59
1344	1443	95	5	13.00	65.00	2023-10-31 01:22:59
1345	1443	97	4	34.00	136.00	2023-10-31 01:22:59
1346	1443	58	6	9.00	54.00	2023-10-31 01:22:59
1347	1444	67	5	37.00	185.00	2023-10-31 19:57:48
1348	1444	104	1	37.00	37.00	2023-10-31 19:57:48
1349	1444	58	1	9.00	9.00	2023-10-31 19:57:48
1350	1444	59	5	2.00	10.00	2023-10-31 19:57:48
1351	1445	95	2	13.00	26.00	2023-11-02 06:29:32
1352	1445	65	7	18.00	126.00	2023-11-02 06:29:32
1353	1445	60	6	48.00	288.00	2023-11-02 06:29:32
1354	1446	90	4	20.00	80.00	2023-11-03 10:17:17
1355	1446	62	5	13.00	65.00	2023-11-03 10:17:17
1356	1446	75	5	39.00	195.00	2023-11-03 10:17:17
1357	1446	70	6	23.00	138.00	2023-11-03 10:17:17
1358	1447	93	8	48.00	384.00	2023-11-05 11:18:22
1359	1447	97	6	34.00	204.00	2023-11-05 11:18:22
1360	1447	55	3	17.00	51.00	2023-11-05 11:18:22
1361	1447	67	4	37.00	148.00	2023-11-05 11:18:22
1362	1447	93	5	48.00	240.00	2023-11-05 11:18:22
1363	1448	80	7	15.00	105.00	2023-11-06 12:25:35
1364	1448	63	5	10.00	50.00	2023-11-06 12:25:35
1365	1448	66	4	47.00	188.00	2023-11-06 12:25:35
1366	1448	90	6	20.00	120.00	2023-11-06 12:25:35
1367	1448	57	6	43.00	258.00	2023-11-06 12:25:35
1368	1449	62	7	13.00	91.00	2023-11-06 17:28:53
1369	1449	54	7	47.00	329.00	2023-11-06 17:28:53
1370	1449	86	2	44.00	88.00	2023-11-06 17:28:53
1371	1449	66	4	47.00	188.00	2023-11-06 17:28:53
1372	1449	78	8	19.00	152.00	2023-11-06 17:28:53
1373	1450	82	2	12.00	24.00	2023-11-07 01:40:28
1374	1450	87	6	7.00	42.00	2023-11-07 01:40:28
1375	1450	77	6	32.00	192.00	2023-11-07 01:40:28
1376	1451	100	2	35.00	70.00	2023-11-07 03:15:40
1377	1451	90	2	20.00	40.00	2023-11-07 03:15:40
1378	1451	77	8	32.00	256.00	2023-11-07 03:15:40
1379	1451	84	2	21.00	42.00	2023-11-07 03:15:40
1380	1451	89	6	6.00	36.00	2023-11-07 03:15:40
1381	1452	88	8	21.00	168.00	2023-11-07 05:16:29
1382	1453	93	1	48.00	48.00	2023-11-07 06:59:19
1383	1453	78	2	19.00	38.00	2023-11-07 06:59:19
1384	1453	73	2	23.00	46.00	2023-11-07 06:59:19
1385	1454	92	4	33.00	132.00	2023-11-07 19:13:48
1386	1455	56	1	21.00	21.00	2023-11-09 02:06:32
1387	1455	61	2	10.00	20.00	2023-11-09 02:06:32
1388	1456	84	5	21.00	105.00	2023-11-09 04:16:51
1389	1456	78	1	19.00	19.00	2023-11-09 04:16:51
1390	1457	68	1	33.00	33.00	2023-11-09 06:14:32
1391	1457	84	8	21.00	168.00	2023-11-09 06:14:32
1392	1457	80	3	15.00	45.00	2023-11-09 06:14:32
1393	1457	77	6	32.00	192.00	2023-11-09 06:14:32
1394	1457	85	5	34.00	170.00	2023-11-09 06:14:32
1395	1458	106	1	11.00	11.00	2023-11-11 20:30:24
1396	1458	77	6	32.00	192.00	2023-11-11 20:30:24
1397	1458	78	6	19.00	114.00	2023-11-11 20:30:24
1398	1458	104	2	37.00	74.00	2023-11-11 20:30:24
1399	1458	69	2	41.00	82.00	2023-11-11 20:30:24
1400	1459	74	7	37.00	259.00	2023-11-12 06:27:51
1401	1459	74	6	37.00	222.00	2023-11-12 06:27:51
1402	1460	81	5	35.00	175.00	2023-11-12 07:48:02
1403	1460	103	4	19.00	76.00	2023-11-12 07:48:02
1404	1460	64	6	37.00	222.00	2023-11-12 07:48:02
1405	1460	60	7	48.00	336.00	2023-11-12 07:48:02
1406	1460	90	8	20.00	160.00	2023-11-12 07:48:02
1407	1461	106	7	11.00	77.00	2023-11-12 21:22:38
1408	1461	74	2	37.00	74.00	2023-11-12 21:22:38
1409	1461	95	1	13.00	13.00	2023-11-12 21:22:38
1410	1462	99	5	20.00	100.00	2023-11-13 01:23:37
1411	1463	57	4	43.00	172.00	2023-11-13 10:00:08
1412	1463	87	3	7.00	21.00	2023-11-13 10:00:08
1413	1463	57	1	43.00	43.00	2023-11-13 10:00:08
1414	1463	101	2	4.00	8.00	2023-11-13 10:00:08
1415	1463	62	7	13.00	91.00	2023-11-13 10:00:08
1416	1464	71	6	29.00	174.00	2023-11-14 04:05:35
1417	1464	68	6	33.00	198.00	2023-11-14 04:05:35
1418	1465	67	5	37.00	185.00	2023-11-15 01:41:57
1419	1465	61	2	10.00	20.00	2023-11-15 01:41:57
1420	1465	89	6	6.00	36.00	2023-11-15 01:41:57
1421	1465	104	3	37.00	111.00	2023-11-15 01:41:57
1422	1465	96	4	7.00	28.00	2023-11-15 01:41:57
1423	1466	105	3	15.00	45.00	2023-11-15 04:05:31
1424	1466	106	2	11.00	22.00	2023-11-15 04:05:31
1425	1466	60	3	48.00	144.00	2023-11-15 04:05:31
1426	1466	66	5	47.00	235.00	2023-11-15 04:05:31
1427	1467	78	6	19.00	114.00	2023-11-16 06:46:01
1428	1467	105	7	15.00	105.00	2023-11-16 06:46:01
1429	1467	68	5	33.00	165.00	2023-11-16 06:46:01
1430	1468	104	6	37.00	222.00	2023-11-16 19:55:07
1431	1468	62	7	13.00	91.00	2023-11-16 19:55:07
1432	1468	93	3	48.00	144.00	2023-11-16 19:55:07
1433	1468	88	1	21.00	21.00	2023-11-16 19:55:07
1434	1469	57	7	43.00	301.00	2023-11-18 04:08:47
1435	1469	78	6	19.00	114.00	2023-11-18 04:08:47
1436	1469	77	2	32.00	64.00	2023-11-18 04:08:47
1437	1470	87	5	7.00	35.00	2023-11-18 16:09:25
1438	1471	65	1	18.00	18.00	2023-11-19 03:07:05
1439	1471	75	3	39.00	117.00	2023-11-19 03:07:05
1440	1471	102	4	38.00	152.00	2023-11-19 03:07:05
1441	1472	69	2	41.00	82.00	2023-11-19 08:05:34
1442	1472	93	3	48.00	144.00	2023-11-19 08:05:34
1443	1473	86	3	44.00	132.00	2023-11-19 22:05:43
1444	1473	61	7	10.00	70.00	2023-11-19 22:05:43
1445	1473	58	5	9.00	45.00	2023-11-19 22:05:43
1446	1474	74	7	37.00	259.00	2023-11-20 10:46:02
1447	1475	79	1	32.00	32.00	2023-11-23 19:03:25
1448	1476	85	6	34.00	204.00	2023-11-28 00:02:07
1449	1476	57	1	43.00	43.00	2023-11-28 00:02:07
1450	1476	88	5	21.00	105.00	2023-11-28 00:02:07
1451	1476	101	7	4.00	28.00	2023-11-28 00:02:07
1452	1476	88	6	21.00	126.00	2023-11-28 00:02:07
1453	1477	80	7	15.00	105.00	2023-11-28 01:09:54
1454	1477	92	5	33.00	165.00	2023-11-28 01:09:54
1455	1477	75	5	39.00	195.00	2023-11-28 01:09:54
1456	1477	78	3	19.00	57.00	2023-11-28 01:09:54
1457	1478	80	6	15.00	90.00	2023-11-28 17:39:41
1458	1478	91	1	10.00	10.00	2023-11-28 17:39:41
1459	1479	77	4	32.00	128.00	2023-11-28 19:27:36
1460	1480	59	4	2.00	8.00	2023-11-28 23:41:57
1461	1480	103	2	19.00	38.00	2023-11-28 23:41:57
1462	1480	74	8	37.00	296.00	2023-11-28 23:41:57
1463	1481	105	6	15.00	90.00	2023-12-02 15:21:02
1464	1481	56	4	21.00	84.00	2023-12-02 15:21:02
1465	1481	74	1	37.00	37.00	2023-12-02 15:21:02
1466	1482	81	2	35.00	70.00	2023-12-03 10:13:37
1467	1482	68	5	33.00	165.00	2023-12-03 10:13:37
1468	1482	104	2	37.00	74.00	2023-12-03 10:13:37
1469	1482	92	2	33.00	66.00	2023-12-03 10:13:37
1470	1482	93	6	48.00	288.00	2023-12-03 10:13:37
1471	1483	58	4	9.00	36.00	2023-12-03 21:11:24
1472	1484	71	7	29.00	203.00	2023-12-04 15:41:20
1473	1484	91	7	10.00	70.00	2023-12-04 15:41:20
1474	1484	106	3	11.00	33.00	2023-12-04 15:41:20
1475	1484	97	4	34.00	136.00	2023-12-04 15:41:20
1476	1485	56	7	21.00	147.00	2023-12-05 19:50:00
1477	1485	104	7	37.00	259.00	2023-12-05 19:50:00
1478	1485	84	2	21.00	42.00	2023-12-05 19:50:00
1479	1485	89	3	6.00	18.00	2023-12-05 19:50:00
1480	1485	83	3	23.00	69.00	2023-12-05 19:50:00
1481	1486	68	6	33.00	198.00	2023-12-08 11:55:39
1482	1486	74	7	37.00	259.00	2023-12-08 11:55:39
1483	1486	58	5	9.00	45.00	2023-12-08 11:55:39
1484	1486	100	3	35.00	105.00	2023-12-08 11:55:39
1485	1487	56	6	21.00	126.00	2023-12-09 20:10:57
1486	1487	87	7	7.00	49.00	2023-12-09 20:10:57
1487	1487	91	7	10.00	70.00	2023-12-09 20:10:57
1488	1488	88	5	21.00	105.00	2023-12-11 03:54:14
1489	1488	73	2	23.00	46.00	2023-12-11 03:54:14
1490	1489	71	2	29.00	58.00	2023-12-13 12:11:13
1491	1489	96	4	7.00	28.00	2023-12-13 12:11:13
1492	1489	56	3	21.00	63.00	2023-12-13 12:11:13
1493	1489	85	7	34.00	238.00	2023-12-13 12:11:13
1494	1489	62	6	13.00	78.00	2023-12-13 12:11:13
1495	1490	80	7	15.00	105.00	2023-12-13 14:20:32
1496	1491	92	6	33.00	198.00	2023-12-14 10:38:37
1497	1491	98	1	46.00	46.00	2023-12-14 10:38:37
1498	1492	88	8	21.00	168.00	2023-12-15 21:05:07
1499	1492	83	3	23.00	69.00	2023-12-15 21:05:07
1500	1493	72	8	11.00	88.00	2023-12-16 14:08:25
1501	1493	96	7	7.00	49.00	2023-12-16 14:08:25
1502	1494	96	2	7.00	14.00	2023-12-17 01:02:52
1503	1495	68	3	33.00	99.00	2023-12-17 07:19:21
1504	1495	90	2	20.00	40.00	2023-12-17 07:19:21
1505	1496	77	6	32.00	192.00	2023-12-18 08:34:14
1506	1496	64	6	37.00	222.00	2023-12-18 08:34:14
1507	1496	88	7	21.00	147.00	2023-12-18 08:34:14
1508	1497	85	7	34.00	238.00	2023-12-19 04:27:24
1509	1497	64	1	37.00	37.00	2023-12-19 04:27:24
1510	1498	97	2	34.00	68.00	2023-12-19 05:22:53
1511	1498	66	1	47.00	47.00	2023-12-19 05:22:53
1512	1498	94	3	23.00	69.00	2023-12-19 05:22:53
1513	1499	72	5	11.00	55.00	2023-12-20 05:08:12
1514	1499	71	2	29.00	58.00	2023-12-20 05:08:12
1515	1500	81	7	35.00	245.00	2023-12-20 11:21:27
1516	1500	53	4	47.00	188.00	2023-12-20 11:21:27
1517	1500	102	8	38.00	304.00	2023-12-20 11:21:27
1518	1500	59	6	2.00	12.00	2023-12-20 11:21:27
1519	1501	80	2	15.00	30.00	2023-12-21 20:49:32
1520	1501	81	7	35.00	245.00	2023-12-21 20:49:32
1521	1501	78	1	19.00	19.00	2023-12-21 20:49:32
1522	1501	63	7	10.00	70.00	2023-12-21 20:49:32
1523	1501	61	1	10.00	10.00	2023-12-21 20:49:32
1524	1502	62	5	13.00	65.00	2023-12-22 23:37:31
1525	1502	103	4	19.00	76.00	2023-12-22 23:37:31
1526	1502	66	4	47.00	188.00	2023-12-22 23:37:31
1527	1502	95	1	13.00	13.00	2023-12-22 23:37:31
1528	1503	105	5	15.00	75.00	2023-12-23 14:51:50
1529	1503	54	1	47.00	47.00	2023-12-23 14:51:50
1530	1503	94	6	23.00	138.00	2023-12-23 14:51:50
1531	1503	77	1	32.00	32.00	2023-12-23 14:51:50
1532	1504	87	5	7.00	35.00	2023-12-23 21:18:25
1533	1504	65	2	18.00	36.00	2023-12-23 21:18:25
1534	1504	99	4	20.00	80.00	2023-12-23 21:18:25
1535	1505	103	3	19.00	57.00	2023-12-24 06:15:44
1536	1505	81	8	35.00	280.00	2023-12-24 06:15:44
1537	1506	93	4	48.00	192.00	2023-12-24 14:00:38
1538	1507	103	1	19.00	19.00	2023-12-25 03:49:05
1539	1507	63	1	10.00	10.00	2023-12-25 03:49:05
1540	1507	92	7	33.00	231.00	2023-12-25 03:49:05
1541	1508	77	7	32.00	224.00	2023-12-25 12:35:24
1542	1509	84	1	21.00	21.00	2023-12-27 01:50:44
1543	1510	88	1	21.00	21.00	2023-12-28 23:07:48
1544	1510	62	7	13.00	91.00	2023-12-28 23:07:48
1545	1511	79	8	32.00	256.00	2023-12-31 19:11:02
1546	1511	71	5	29.00	145.00	2023-12-31 19:11:02
1547	1511	95	7	13.00	91.00	2023-12-31 19:11:02
1548	1511	61	6	10.00	60.00	2023-12-31 19:11:02
1549	1511	96	8	7.00	56.00	2023-12-31 19:11:02
1550	1512	94	4	23.00	92.00	2024-01-01 13:43:42
1551	1512	88	2	21.00	42.00	2024-01-01 13:43:42
1552	1512	93	7	48.00	336.00	2024-01-01 13:43:42
1553	1513	106	4	11.00	44.00	2024-01-02 02:12:36
1554	1513	56	2	21.00	42.00	2024-01-02 02:12:36
1555	1513	73	6	23.00	138.00	2024-01-02 02:12:36
1556	1513	69	1	41.00	41.00	2024-01-02 02:12:36
1557	1514	84	3	21.00	63.00	2024-01-02 08:11:27
1558	1514	80	5	15.00	75.00	2024-01-02 08:11:27
1559	1514	61	1	10.00	10.00	2024-01-02 08:11:27
1560	1515	68	6	33.00	198.00	2024-01-02 10:04:13
1561	1515	96	2	7.00	14.00	2024-01-02 10:04:13
1562	1515	71	5	29.00	145.00	2024-01-02 10:04:13
1563	1515	54	1	47.00	47.00	2024-01-02 10:04:13
1564	1516	106	6	11.00	66.00	2024-01-03 01:08:40
1565	1516	81	8	35.00	280.00	2024-01-03 01:08:40
1566	1516	78	7	19.00	133.00	2024-01-03 01:08:40
1567	1517	86	8	44.00	352.00	2024-01-03 05:05:58
1568	1517	71	2	29.00	58.00	2024-01-03 05:05:58
1569	1517	56	4	21.00	84.00	2024-01-03 05:05:58
1570	1517	100	4	35.00	140.00	2024-01-03 05:05:58
1571	1518	73	3	23.00	69.00	2024-01-04 05:57:07
1572	1519	96	3	7.00	21.00	2024-01-05 00:27:07
1573	1519	54	2	47.00	94.00	2024-01-05 00:27:07
1574	1519	78	3	19.00	57.00	2024-01-05 00:27:07
1575	1520	79	2	32.00	64.00	2024-01-05 05:55:39
1576	1520	53	8	47.00	376.00	2024-01-05 05:55:39
1577	1521	57	1	43.00	43.00	2024-01-05 22:25:51
1578	1521	89	6	6.00	36.00	2024-01-05 22:25:51
1579	1521	97	6	34.00	204.00	2024-01-05 22:25:51
1580	1522	75	5	39.00	195.00	2024-01-06 16:56:29
1581	1522	86	4	44.00	176.00	2024-01-06 16:56:29
1582	1522	54	1	47.00	47.00	2024-01-06 16:56:29
1583	1522	95	7	13.00	91.00	2024-01-06 16:56:29
1584	1523	84	7	21.00	147.00	2024-01-08 10:16:09
1585	1524	99	3	20.00	60.00	2024-01-08 14:28:03
1586	1525	94	1	23.00	23.00	2024-01-09 00:08:23
1587	1525	71	4	29.00	116.00	2024-01-09 00:08:23
1588	1525	95	5	13.00	65.00	2024-01-09 00:08:23
1589	1525	67	5	37.00	185.00	2024-01-09 00:08:23
1590	1526	68	5	33.00	165.00	2024-01-09 00:19:18
1591	1526	60	7	48.00	336.00	2024-01-09 00:19:18
1592	1526	66	6	47.00	282.00	2024-01-09 00:19:18
1593	1526	102	1	38.00	38.00	2024-01-09 00:19:18
1594	1526	89	2	6.00	12.00	2024-01-09 00:19:18
1595	1527	103	6	19.00	114.00	2024-01-09 19:23:27
1596	1528	62	1	13.00	13.00	2024-01-09 20:19:50
1597	1528	66	7	47.00	329.00	2024-01-09 20:19:50
1598	1528	78	2	19.00	38.00	2024-01-09 20:19:50
1599	1529	92	1	33.00	33.00	2024-01-10 08:32:46
1600	1530	105	3	15.00	45.00	2024-01-11 03:01:22
1601	1530	106	2	11.00	22.00	2024-01-11 03:01:22
1602	1530	105	6	15.00	90.00	2024-01-11 03:01:22
1603	1531	100	6	35.00	210.00	2024-01-11 20:20:04
1604	1531	79	2	32.00	64.00	2024-01-11 20:20:04
1605	1531	87	4	7.00	28.00	2024-01-11 20:20:04
1606	1532	86	3	44.00	132.00	2024-01-14 01:45:19
1607	1532	106	8	11.00	88.00	2024-01-14 01:45:19
1608	1532	105	6	15.00	90.00	2024-01-14 01:45:19
1609	1533	100	2	35.00	70.00	2024-01-14 10:52:12
1610	1533	95	4	13.00	52.00	2024-01-14 10:52:12
1611	1534	85	2	34.00	68.00	2024-01-15 18:48:20
1612	1534	68	7	33.00	231.00	2024-01-15 18:48:20
1613	1535	60	1	48.00	48.00	2024-01-15 23:44:41
1614	1535	85	3	34.00	102.00	2024-01-15 23:44:41
1615	1536	94	3	23.00	69.00	2024-01-17 16:38:23
1616	1536	106	3	11.00	33.00	2024-01-17 16:38:23
1617	1536	70	2	23.00	46.00	2024-01-17 16:38:23
1618	1537	89	1	6.00	6.00	2024-01-17 19:12:24
1619	1537	89	3	6.00	18.00	2024-01-17 19:12:24
1620	1537	68	4	33.00	132.00	2024-01-17 19:12:24
1621	1537	61	4	10.00	40.00	2024-01-17 19:12:24
1622	1537	59	2	2.00	4.00	2024-01-17 19:12:24
1623	1538	82	8	12.00	96.00	2024-01-18 07:30:20
1624	1538	72	5	11.00	55.00	2024-01-18 07:30:20
1625	1538	64	7	37.00	259.00	2024-01-18 07:30:20
1626	1538	78	5	19.00	95.00	2024-01-18 07:30:20
1627	1539	64	3	37.00	111.00	2024-01-18 17:10:21
1628	1540	55	3	17.00	51.00	2024-01-19 19:59:37
1629	1540	103	4	19.00	76.00	2024-01-19 19:59:37
1630	1541	89	7	6.00	42.00	2024-01-20 12:42:29
1631	1542	63	8	10.00	80.00	2024-01-20 17:45:43
1632	1542	65	2	18.00	36.00	2024-01-20 17:45:43
1633	1543	102	1	38.00	38.00	2024-01-21 09:33:30
1634	1543	71	8	29.00	232.00	2024-01-21 09:33:30
1635	1543	76	7	42.00	294.00	2024-01-21 09:33:30
1636	1544	63	3	10.00	30.00	2024-01-22 04:49:11
1637	1544	58	2	9.00	18.00	2024-01-22 04:49:11
1638	1544	80	3	15.00	45.00	2024-01-22 04:49:11
1639	1544	59	6	2.00	12.00	2024-01-22 04:49:11
1640	1544	85	3	34.00	102.00	2024-01-22 04:49:11
1641	1545	91	3	10.00	30.00	2024-01-22 23:35:48
1642	1545	56	3	21.00	63.00	2024-01-22 23:35:48
1643	1545	92	8	33.00	264.00	2024-01-22 23:35:48
1644	1545	93	6	48.00	288.00	2024-01-22 23:35:48
1645	1546	92	6	33.00	198.00	2024-01-23 01:46:55
1646	1546	59	4	2.00	8.00	2024-01-23 01:46:55
1647	1547	61	7	10.00	70.00	2024-01-24 03:00:46
1648	1547	75	6	39.00	234.00	2024-01-24 03:00:46
1649	1547	76	3	42.00	126.00	2024-01-24 03:00:46
1650	1547	100	1	35.00	35.00	2024-01-24 03:00:46
1651	1547	87	6	7.00	42.00	2024-01-24 03:00:46
1652	1548	97	4	34.00	136.00	2024-01-24 22:01:07
1653	1548	77	3	32.00	96.00	2024-01-24 22:01:07
1654	1548	98	6	46.00	276.00	2024-01-24 22:01:07
1655	1548	82	1	12.00	12.00	2024-01-24 22:01:07
1656	1549	78	2	19.00	38.00	2024-01-25 04:27:09
1657	1549	95	3	13.00	39.00	2024-01-25 04:27:09
1658	1550	64	1	37.00	37.00	2024-01-25 16:45:43
1659	1550	93	1	48.00	48.00	2024-01-25 16:45:43
1660	1551	96	8	7.00	56.00	2024-01-26 09:34:07
1661	1552	106	4	11.00	44.00	2024-01-26 11:19:50
1662	1552	56	7	21.00	147.00	2024-01-26 11:19:50
1663	1552	78	5	19.00	95.00	2024-01-26 11:19:50
1664	1552	100	1	35.00	35.00	2024-01-26 11:19:50
1665	1553	102	5	38.00	190.00	2024-01-27 11:54:25
1666	1553	89	2	6.00	12.00	2024-01-27 11:54:25
1667	1553	85	3	34.00	102.00	2024-01-27 11:54:25
1668	1553	97	8	34.00	272.00	2024-01-27 11:54:25
1669	1553	85	4	34.00	136.00	2024-01-27 11:54:25
1670	1554	94	8	23.00	184.00	2024-01-27 20:20:31
1671	1554	78	4	19.00	76.00	2024-01-27 20:20:31
1672	1555	78	6	19.00	114.00	2024-01-28 05:25:21
1673	1555	55	7	17.00	119.00	2024-01-28 05:25:21
1674	1556	56	3	21.00	63.00	2024-01-28 10:48:16
1675	1556	61	8	10.00	80.00	2024-01-28 10:48:16
1676	1556	97	3	34.00	102.00	2024-01-28 10:48:16
1677	1557	59	2	2.00	4.00	2024-01-29 01:17:34
1678	1558	89	8	6.00	48.00	2024-01-29 10:02:17
1679	1558	76	4	42.00	168.00	2024-01-29 10:02:17
1680	1558	71	8	29.00	232.00	2024-01-29 10:02:17
1681	1559	87	2	7.00	14.00	2024-01-29 11:32:52
1682	1559	53	5	47.00	235.00	2024-01-29 11:32:52
1683	1559	87	3	7.00	21.00	2024-01-29 11:32:52
1684	1559	73	7	23.00	161.00	2024-01-29 11:32:52
1685	1559	88	2	21.00	42.00	2024-01-29 11:32:52
1686	1560	95	4	13.00	52.00	2024-01-29 22:26:46
1687	1561	70	5	23.00	115.00	2024-01-30 22:08:19
1688	1562	99	1	20.00	20.00	2024-01-31 10:13:29
1689	1562	101	6	4.00	24.00	2024-01-31 10:13:29
1690	1562	62	2	13.00	26.00	2024-01-31 10:13:29
1691	1562	67	7	37.00	259.00	2024-01-31 10:13:29
1692	1562	87	2	7.00	14.00	2024-01-31 10:13:29
1693	1563	74	4	37.00	148.00	2024-02-01 10:32:44
1694	1563	90	7	20.00	140.00	2024-02-01 10:32:44
1695	1564	88	1	21.00	21.00	2024-02-03 16:05:07
1696	1564	57	5	43.00	215.00	2024-02-03 16:05:07
1697	1564	87	6	7.00	42.00	2024-02-03 16:05:07
1698	1564	73	5	23.00	115.00	2024-02-03 16:05:07
1699	1565	59	5	2.00	10.00	2024-02-04 03:48:41
1700	1565	69	4	41.00	164.00	2024-02-04 03:48:41
1701	1565	82	2	12.00	24.00	2024-02-04 03:48:41
1702	1566	93	6	48.00	288.00	2024-02-06 15:40:25
1703	1567	95	2	13.00	26.00	2024-02-08 09:11:56
1704	1568	81	1	35.00	35.00	2024-02-08 09:15:43
1705	1568	57	5	43.00	215.00	2024-02-08 09:15:43
1706	1568	63	6	10.00	60.00	2024-02-08 09:15:43
1707	1569	96	6	7.00	42.00	2024-02-08 12:50:28
1708	1569	95	8	13.00	104.00	2024-02-08 12:50:28
1709	1570	58	2	9.00	18.00	2024-02-09 00:02:18
1710	1570	70	5	23.00	115.00	2024-02-09 00:02:18
1711	1570	88	4	21.00	84.00	2024-02-09 00:02:18
1712	1571	63	4	10.00	40.00	2024-02-09 00:58:13
1713	1571	91	2	10.00	20.00	2024-02-09 00:58:13
1714	1572	71	4	29.00	116.00	2024-02-10 02:28:38
1715	1572	61	5	10.00	50.00	2024-02-10 02:28:38
1716	1572	84	6	21.00	126.00	2024-02-10 02:28:38
1717	1573	67	2	37.00	74.00	2024-02-10 04:58:09
1718	1573	69	1	41.00	41.00	2024-02-10 04:58:09
1719	1574	96	4	7.00	28.00	2024-02-10 13:57:35
1720	1574	81	8	35.00	280.00	2024-02-10 13:57:35
1721	1574	58	1	9.00	9.00	2024-02-10 13:57:35
1722	1574	87	8	7.00	56.00	2024-02-10 13:57:35
1723	1575	77	1	32.00	32.00	2024-02-11 00:54:23
1724	1575	102	2	38.00	76.00	2024-02-11 00:54:23
1725	1575	70	8	23.00	184.00	2024-02-11 00:54:23
1726	1575	82	6	12.00	72.00	2024-02-11 00:54:23
1727	1576	99	6	20.00	120.00	2024-02-11 02:32:24
1728	1576	76	5	42.00	210.00	2024-02-11 02:32:24
1729	1576	61	4	10.00	40.00	2024-02-11 02:32:24
1730	1576	78	5	19.00	95.00	2024-02-11 02:32:24
1731	1576	62	4	13.00	52.00	2024-02-11 02:32:24
1732	1577	65	5	18.00	90.00	2024-02-11 10:09:00
1733	1577	100	4	35.00	140.00	2024-02-11 10:09:00
1734	1577	63	4	10.00	40.00	2024-02-11 10:09:00
1735	1577	103	7	19.00	133.00	2024-02-11 10:09:00
1736	1578	105	4	15.00	60.00	2024-02-13 04:10:47
1737	1578	58	6	9.00	54.00	2024-02-13 04:10:47
1738	1578	88	1	21.00	21.00	2024-02-13 04:10:47
1739	1578	94	1	23.00	23.00	2024-02-13 04:10:47
1740	1579	59	4	2.00	8.00	2024-02-13 07:35:58
1741	1579	105	7	15.00	105.00	2024-02-13 07:35:58
1742	1579	55	8	17.00	136.00	2024-02-13 07:35:58
1743	1579	94	5	23.00	115.00	2024-02-13 07:35:58
1744	1580	83	6	23.00	138.00	2024-02-14 21:05:08
1745	1580	89	7	6.00	42.00	2024-02-14 21:05:08
1746	1580	105	3	15.00	45.00	2024-02-14 21:05:08
1747	1580	86	2	44.00	88.00	2024-02-14 21:05:08
1748	1581	103	7	19.00	133.00	2024-02-15 13:09:38
1749	1581	77	3	32.00	96.00	2024-02-15 13:09:38
1750	1581	76	7	42.00	294.00	2024-02-15 13:09:38
1751	1581	94	7	23.00	161.00	2024-02-15 13:09:38
1752	1581	71	5	29.00	145.00	2024-02-15 13:09:38
1753	1582	57	3	43.00	129.00	2024-02-16 02:21:53
1754	1582	100	5	35.00	175.00	2024-02-16 02:21:53
1755	1583	65	1	18.00	18.00	2024-02-16 12:03:14
1756	1584	85	6	34.00	204.00	2024-02-17 14:31:34
1757	1584	85	5	34.00	170.00	2024-02-17 14:31:34
1758	1584	54	2	47.00	94.00	2024-02-17 14:31:34
1759	1584	103	7	19.00	133.00	2024-02-17 14:31:34
1760	1585	105	8	15.00	120.00	2024-02-17 18:21:23
1761	1585	65	1	18.00	18.00	2024-02-17 18:21:23
1762	1585	104	1	37.00	37.00	2024-02-17 18:21:23
1763	1585	95	6	13.00	78.00	2024-02-17 18:21:23
1764	1585	72	5	11.00	55.00	2024-02-17 18:21:23
1765	1586	97	8	34.00	272.00	2024-02-18 04:24:11
1766	1586	96	7	7.00	49.00	2024-02-18 04:24:11
1767	1587	88	8	21.00	168.00	2024-02-19 09:39:22
1768	1587	101	6	4.00	24.00	2024-02-19 09:39:22
1769	1588	86	7	44.00	308.00	2024-02-19 23:24:11
1770	1588	63	7	10.00	70.00	2024-02-19 23:24:11
1771	1589	79	5	32.00	160.00	2024-02-20 01:24:23
1772	1589	83	7	23.00	161.00	2024-02-20 01:24:23
1773	1589	88	1	21.00	21.00	2024-02-20 01:24:23
1774	1590	93	7	48.00	336.00	2024-02-20 01:25:17
1775	1590	94	2	23.00	46.00	2024-02-20 01:25:17
1776	1590	95	7	13.00	91.00	2024-02-20 01:25:17
1777	1591	55	3	17.00	51.00	2024-02-20 12:21:22
1778	1591	92	3	33.00	99.00	2024-02-20 12:21:22
1779	1591	76	6	42.00	252.00	2024-02-20 12:21:22
1780	1591	92	4	33.00	132.00	2024-02-20 12:21:22
1781	1592	96	7	7.00	49.00	2024-02-21 06:37:17
1782	1592	59	7	2.00	14.00	2024-02-21 06:37:17
1783	1592	91	8	10.00	80.00	2024-02-21 06:37:17
1784	1592	73	5	23.00	115.00	2024-02-21 06:37:17
1785	1593	56	8	21.00	168.00	2024-02-21 18:06:10
1786	1593	99	7	20.00	140.00	2024-02-21 18:06:10
1787	1593	54	6	47.00	282.00	2024-02-21 18:06:10
1788	1593	90	4	20.00	80.00	2024-02-21 18:06:10
1789	1594	56	7	21.00	147.00	2024-02-22 05:06:36
1790	1594	62	5	13.00	65.00	2024-02-22 05:06:36
1791	1594	63	4	10.00	40.00	2024-02-22 05:06:36
1792	1594	67	3	37.00	111.00	2024-02-22 05:06:36
1793	1594	64	2	37.00	74.00	2024-02-22 05:06:36
1794	1595	66	6	47.00	282.00	2024-02-24 01:57:56
1795	1595	85	7	34.00	238.00	2024-02-24 01:57:56
1796	1595	99	2	20.00	40.00	2024-02-24 01:57:56
1797	1596	94	1	23.00	23.00	2024-02-24 02:49:04
1798	1596	100	2	35.00	70.00	2024-02-24 02:49:04
1799	1597	87	1	7.00	7.00	2024-02-24 10:06:56
1800	1597	69	2	41.00	82.00	2024-02-24 10:06:56
1801	1597	78	3	19.00	57.00	2024-02-24 10:06:56
1802	1597	78	7	19.00	133.00	2024-02-24 10:06:56
1803	1597	96	1	7.00	7.00	2024-02-24 10:06:56
1804	1598	67	7	37.00	259.00	2024-02-24 14:31:51
1805	1598	68	7	33.00	231.00	2024-02-24 14:31:51
1806	1598	101	1	4.00	4.00	2024-02-24 14:31:51
1807	1598	90	8	20.00	160.00	2024-02-24 14:31:51
1808	1598	80	2	15.00	30.00	2024-02-24 14:31:51
1809	1599	88	6	21.00	126.00	2024-02-26 16:11:03
1810	1600	65	4	18.00	72.00	2024-02-26 22:11:14
1811	1600	67	5	37.00	185.00	2024-02-26 22:11:14
1812	1600	102	2	38.00	76.00	2024-02-26 22:11:14
1813	1600	65	4	18.00	72.00	2024-02-26 22:11:14
1814	1600	84	7	21.00	147.00	2024-02-26 22:11:14
1815	1601	71	8	29.00	232.00	2024-03-03 03:45:18
1816	1601	87	3	7.00	21.00	2024-03-03 03:45:18
1817	1601	86	4	44.00	176.00	2024-03-03 03:45:18
1818	1601	98	6	46.00	276.00	2024-03-03 03:45:18
1819	1602	102	3	38.00	114.00	2024-03-03 12:29:37
1820	1602	105	5	15.00	75.00	2024-03-03 12:29:37
1821	1602	83	6	23.00	138.00	2024-03-03 12:29:37
1822	1602	57	3	43.00	129.00	2024-03-03 12:29:37
1823	1602	56	3	21.00	63.00	2024-03-03 12:29:37
1824	1603	53	7	47.00	329.00	2024-03-03 18:10:57
1825	1603	58	2	9.00	18.00	2024-03-03 18:10:57
1826	1604	66	6	47.00	282.00	2024-03-03 20:55:39
1827	1605	77	2	32.00	64.00	2024-03-05 05:24:58
1828	1605	56	8	21.00	168.00	2024-03-05 05:24:58
1829	1605	82	7	12.00	84.00	2024-03-05 05:24:58
1830	1605	92	5	33.00	165.00	2024-03-05 05:24:58
1831	1606	99	6	20.00	120.00	2024-03-05 16:17:48
1832	1606	86	4	44.00	176.00	2024-03-05 16:17:48
1833	1606	97	6	34.00	204.00	2024-03-05 16:17:48
1834	1606	97	3	34.00	102.00	2024-03-05 16:17:48
1835	1606	67	3	37.00	111.00	2024-03-05 16:17:48
1836	1607	99	8	20.00	160.00	2024-03-06 00:00:07
1837	1607	70	3	23.00	69.00	2024-03-06 00:00:07
1838	1607	80	6	15.00	90.00	2024-03-06 00:00:07
1839	1608	70	3	23.00	69.00	2024-03-06 11:47:54
1840	1609	101	6	4.00	24.00	2024-03-06 21:21:19
1841	1610	87	1	7.00	7.00	2024-03-08 15:43:34
1842	1611	66	7	47.00	329.00	2024-03-09 22:41:33
1843	1612	71	7	29.00	203.00	2024-03-11 15:21:46
1844	1612	85	8	34.00	272.00	2024-03-11 15:21:46
1845	1612	92	6	33.00	198.00	2024-03-11 15:21:46
1846	1612	96	1	7.00	7.00	2024-03-11 15:21:46
1847	1612	75	3	39.00	117.00	2024-03-11 15:21:46
1848	1613	67	5	37.00	185.00	2024-03-11 17:58:42
1849	1614	76	3	42.00	126.00	2024-03-12 12:19:47
1850	1614	53	4	47.00	188.00	2024-03-12 12:19:47
1851	1614	67	6	37.00	222.00	2024-03-12 12:19:47
1852	1615	96	2	7.00	14.00	2024-03-13 01:53:54
1853	1615	75	2	39.00	78.00	2024-03-13 01:53:54
1854	1615	57	5	43.00	215.00	2024-03-13 01:53:54
1855	1615	80	3	15.00	45.00	2024-03-13 01:53:54
1856	1616	53	1	47.00	47.00	2024-03-13 08:05:10
1857	1616	96	2	7.00	14.00	2024-03-13 08:05:10
1858	1616	96	2	7.00	14.00	2024-03-13 08:05:10
1859	1617	70	1	23.00	23.00	2024-03-13 18:47:52
1860	1617	90	2	20.00	40.00	2024-03-13 18:47:52
1861	1618	101	5	4.00	20.00	2024-03-14 20:53:41
1862	1619	77	7	32.00	224.00	2024-03-17 05:05:57
1863	1620	70	5	23.00	115.00	2024-03-21 18:02:33
1864	1620	65	4	18.00	72.00	2024-03-21 18:02:33
1865	1620	62	6	13.00	78.00	2024-03-21 18:02:33
1866	1620	63	2	10.00	20.00	2024-03-21 18:02:33
1867	1620	104	3	37.00	111.00	2024-03-21 18:02:33
1868	1621	96	5	7.00	35.00	2024-03-22 18:31:24
1869	1621	58	7	9.00	63.00	2024-03-22 18:31:24
1870	1622	59	8	2.00	16.00	2024-03-23 04:57:04
1871	1622	66	1	47.00	47.00	2024-03-23 04:57:04
1872	1623	96	4	7.00	28.00	2024-03-23 18:05:02
1873	1623	101	8	4.00	32.00	2024-03-23 18:05:02
1874	1623	65	1	18.00	18.00	2024-03-23 18:05:02
1875	1623	100	8	35.00	280.00	2024-03-23 18:05:02
1876	1623	88	4	21.00	84.00	2024-03-23 18:05:02
1877	1624	100	6	35.00	210.00	2024-03-24 00:53:29
1878	1624	69	6	41.00	246.00	2024-03-24 00:53:29
1879	1625	88	3	21.00	63.00	2024-03-25 00:49:05
1880	1625	106	6	11.00	66.00	2024-03-25 00:49:05
1881	1625	59	3	2.00	6.00	2024-03-25 00:49:05
1882	1625	80	1	15.00	15.00	2024-03-25 00:49:05
1883	1626	101	6	4.00	24.00	2024-03-25 10:34:08
1884	1626	54	1	47.00	47.00	2024-03-25 10:34:08
1885	1626	94	4	23.00	92.00	2024-03-25 10:34:08
1886	1627	103	8	19.00	152.00	2024-03-25 12:52:37
1887	1627	101	5	4.00	20.00	2024-03-25 12:52:37
1888	1627	88	1	21.00	21.00	2024-03-25 12:52:37
1889	1628	101	4	4.00	16.00	2024-03-25 20:05:39
1890	1628	103	6	19.00	114.00	2024-03-25 20:05:39
1891	1628	84	7	21.00	147.00	2024-03-25 20:05:39
1892	1628	63	8	10.00	80.00	2024-03-25 20:05:39
1893	1629	82	6	12.00	72.00	2024-03-26 01:58:08
1894	1630	53	1	47.00	47.00	2024-03-26 13:56:18
1895	1630	80	2	15.00	30.00	2024-03-26 13:56:18
1896	1631	96	2	7.00	14.00	2024-03-27 00:09:48
1897	1631	94	3	23.00	69.00	2024-03-27 00:09:48
1898	1631	80	3	15.00	45.00	2024-03-27 00:09:48
1899	1631	105	1	15.00	15.00	2024-03-27 00:09:48
1900	1631	84	5	21.00	105.00	2024-03-27 00:09:48
1901	1632	100	1	35.00	35.00	2024-03-28 22:21:04
1902	1632	61	6	10.00	60.00	2024-03-28 22:21:04
1903	1633	82	7	12.00	84.00	2024-03-29 00:03:46
1904	1633	64	1	37.00	37.00	2024-03-29 00:03:46
1905	1633	94	5	23.00	115.00	2024-03-29 00:03:46
1906	1633	90	8	20.00	160.00	2024-03-29 00:03:46
1907	1633	84	4	21.00	84.00	2024-03-29 00:03:46
1908	1634	79	3	32.00	96.00	2024-03-29 04:27:13
1909	1634	65	6	18.00	108.00	2024-03-29 04:27:13
1910	1634	74	5	37.00	185.00	2024-03-29 04:27:13
1911	1634	81	2	35.00	70.00	2024-03-29 04:27:13
1912	1635	59	5	2.00	10.00	2024-03-30 07:25:31
1913	1635	75	4	39.00	156.00	2024-03-30 07:25:31
1914	1635	87	6	7.00	42.00	2024-03-30 07:25:31
1915	1635	79	7	32.00	224.00	2024-03-30 07:25:31
1916	1636	65	4	18.00	72.00	2024-03-30 23:32:28
1917	1636	88	2	21.00	42.00	2024-03-30 23:32:28
1918	1637	74	8	37.00	296.00	2024-03-31 16:41:27
1919	1638	74	2	37.00	74.00	2024-04-02 08:51:10
1920	1638	91	6	10.00	60.00	2024-04-02 08:51:10
1921	1638	77	7	32.00	224.00	2024-04-02 08:51:10
1922	1638	65	7	18.00	126.00	2024-04-02 08:51:10
1923	1638	55	6	17.00	102.00	2024-04-02 08:51:10
1924	1639	77	6	32.00	192.00	2024-04-02 11:33:12
1925	1639	79	4	32.00	128.00	2024-04-02 11:33:12
1926	1639	79	1	32.00	32.00	2024-04-02 11:33:12
1927	1639	99	8	20.00	160.00	2024-04-02 11:33:12
1928	1639	68	3	33.00	99.00	2024-04-02 11:33:12
1929	1640	100	8	35.00	280.00	2024-04-03 12:16:07
1930	1641	55	2	17.00	34.00	2024-04-03 23:25:46
1931	1641	70	6	23.00	138.00	2024-04-03 23:25:46
1932	1641	88	7	21.00	147.00	2024-04-03 23:25:46
1933	1641	56	5	21.00	105.00	2024-04-03 23:25:46
1934	1642	67	7	37.00	259.00	2024-04-04 10:49:15
1935	1643	70	4	23.00	92.00	2024-04-04 12:16:26
1936	1643	68	5	33.00	165.00	2024-04-04 12:16:26
1937	1643	80	4	15.00	60.00	2024-04-04 12:16:26
1938	1643	61	4	10.00	40.00	2024-04-04 12:16:26
1939	1644	69	7	41.00	287.00	2024-04-04 17:13:40
1940	1644	84	4	21.00	84.00	2024-04-04 17:13:40
1941	1644	66	1	47.00	47.00	2024-04-04 17:13:40
1942	1644	58	6	9.00	54.00	2024-04-04 17:13:40
1943	1645	67	6	37.00	222.00	2024-04-04 18:10:38
1944	1645	66	4	47.00	188.00	2024-04-04 18:10:38
1945	1645	61	4	10.00	40.00	2024-04-04 18:10:38
1946	1645	97	2	34.00	68.00	2024-04-04 18:10:38
1947	1645	73	2	23.00	46.00	2024-04-04 18:10:38
1948	1646	104	2	37.00	74.00	2024-04-04 23:37:11
1949	1646	86	2	44.00	88.00	2024-04-04 23:37:11
1950	1646	99	1	20.00	20.00	2024-04-04 23:37:11
1951	1646	95	5	13.00	65.00	2024-04-04 23:37:11
1952	1646	75	8	39.00	312.00	2024-04-04 23:37:11
1953	1647	63	6	10.00	60.00	2024-04-05 15:35:11
1954	1647	98	1	46.00	46.00	2024-04-05 15:35:11
1955	1647	83	7	23.00	161.00	2024-04-05 15:35:11
1956	1648	88	3	21.00	63.00	2024-04-06 16:51:56
1957	1648	88	1	21.00	21.00	2024-04-06 16:51:56
1958	1648	98	3	46.00	138.00	2024-04-06 16:51:56
1959	1648	69	3	41.00	123.00	2024-04-06 16:51:56
1960	1648	97	1	34.00	34.00	2024-04-06 16:51:56
1961	1649	90	4	20.00	80.00	2024-04-09 14:20:30
1962	1649	76	1	42.00	42.00	2024-04-09 14:20:30
1963	1649	55	1	17.00	17.00	2024-04-09 14:20:30
1964	1649	88	6	21.00	126.00	2024-04-09 14:20:30
1965	1650	96	1	7.00	7.00	2024-04-10 14:03:40
1966	1650	59	6	2.00	12.00	2024-04-10 14:03:40
1967	1651	82	6	12.00	72.00	2024-04-11 07:16:22
1968	1652	60	5	48.00	240.00	2024-04-12 16:13:49
1969	1652	91	5	10.00	50.00	2024-04-12 16:13:49
1970	1652	99	7	20.00	140.00	2024-04-12 16:13:49
1971	1652	105	1	15.00	15.00	2024-04-12 16:13:49
1972	1653	98	1	46.00	46.00	2024-04-13 03:48:13
1973	1653	86	4	44.00	176.00	2024-04-13 03:48:13
1974	1653	99	1	20.00	20.00	2024-04-13 03:48:13
1975	1653	98	7	46.00	322.00	2024-04-13 03:48:13
1976	1654	102	5	38.00	190.00	2024-04-13 11:52:09
1977	1655	77	6	32.00	192.00	2024-04-14 06:58:04
1978	1655	84	6	21.00	126.00	2024-04-14 06:58:04
1979	1655	77	8	32.00	256.00	2024-04-14 06:58:04
1980	1655	57	3	43.00	129.00	2024-04-14 06:58:04
1981	1655	70	3	23.00	69.00	2024-04-14 06:58:04
1982	1656	89	6	6.00	36.00	2024-04-14 14:00:08
1983	1656	78	8	19.00	152.00	2024-04-14 14:00:08
1984	1656	73	1	23.00	23.00	2024-04-14 14:00:08
1985	1656	97	2	34.00	68.00	2024-04-14 14:00:08
1986	1656	87	1	7.00	7.00	2024-04-14 14:00:08
1987	1657	82	2	12.00	24.00	2024-04-14 23:13:07
1988	1657	103	7	19.00	133.00	2024-04-14 23:13:07
1989	1657	91	5	10.00	50.00	2024-04-14 23:13:07
1990	1657	83	4	23.00	92.00	2024-04-14 23:13:07
1991	1657	102	2	38.00	76.00	2024-04-14 23:13:07
1992	1658	54	6	47.00	282.00	2024-04-15 05:51:14
1993	1659	82	1	12.00	12.00	2024-04-16 06:20:39
1994	1659	90	6	20.00	120.00	2024-04-16 06:20:39
1995	1659	78	8	19.00	152.00	2024-04-16 06:20:39
1996	1659	96	8	7.00	56.00	2024-04-16 06:20:39
1997	1660	89	7	6.00	42.00	2024-04-16 20:40:08
1998	1660	84	3	21.00	63.00	2024-04-16 20:40:08
1999	1660	96	1	7.00	7.00	2024-04-16 20:40:08
2000	1660	83	3	23.00	69.00	2024-04-16 20:40:08
2001	1660	67	7	37.00	259.00	2024-04-16 20:40:08
2002	1661	93	1	48.00	48.00	2024-04-17 15:38:22
2003	1661	80	4	15.00	60.00	2024-04-17 15:38:22
2004	1661	91	4	10.00	40.00	2024-04-17 15:38:22
2005	1661	102	5	38.00	190.00	2024-04-17 15:38:22
2006	1662	53	8	47.00	376.00	2024-04-17 17:18:42
2007	1662	79	7	32.00	224.00	2024-04-17 17:18:42
2008	1663	97	2	34.00	68.00	2024-04-19 22:22:17
2009	1664	53	7	47.00	329.00	2024-04-21 01:21:36
2010	1664	100	2	35.00	70.00	2024-04-21 01:21:36
2011	1665	68	5	33.00	165.00	2024-04-21 04:25:48
2012	1665	80	3	15.00	45.00	2024-04-21 04:25:48
2013	1665	106	1	11.00	11.00	2024-04-21 04:25:48
2014	1666	57	7	43.00	301.00	2024-04-21 19:21:53
2015	1666	65	5	18.00	90.00	2024-04-21 19:21:53
2016	1666	84	8	21.00	168.00	2024-04-21 19:21:53
2017	1667	64	7	37.00	259.00	2024-04-22 21:54:37
2018	1667	97	3	34.00	102.00	2024-04-22 21:54:37
2019	1667	67	8	37.00	296.00	2024-04-22 21:54:37
2020	1667	82	5	12.00	60.00	2024-04-22 21:54:37
2021	1667	64	7	37.00	259.00	2024-04-22 21:54:37
2022	1668	93	1	48.00	48.00	2024-04-25 06:02:56
2023	1668	66	6	47.00	282.00	2024-04-25 06:02:56
2024	1668	94	2	23.00	46.00	2024-04-25 06:02:56
2025	1668	58	5	9.00	45.00	2024-04-25 06:02:56
2026	1669	104	5	37.00	185.00	2024-04-25 17:04:35
2027	1669	84	4	21.00	84.00	2024-04-25 17:04:35
2028	1669	101	1	4.00	4.00	2024-04-25 17:04:35
2029	1670	76	6	42.00	252.00	2024-04-26 06:30:21
2030	1670	59	6	2.00	12.00	2024-04-26 06:30:21
2031	1670	95	5	13.00	65.00	2024-04-26 06:30:21
2032	1671	80	1	15.00	15.00	2024-04-28 01:19:49
2033	1671	103	8	19.00	152.00	2024-04-28 01:19:49
2034	1671	78	5	19.00	95.00	2024-04-28 01:19:49
2035	1671	61	7	10.00	70.00	2024-04-28 01:19:49
2036	1672	92	2	33.00	66.00	2024-05-01 20:43:42
2037	1672	98	3	46.00	138.00	2024-05-01 20:43:42
2038	1672	81	2	35.00	70.00	2024-05-01 20:43:42
2039	1672	73	8	23.00	184.00	2024-05-01 20:43:42
2040	1673	58	6	9.00	54.00	2024-05-02 16:47:28
2041	1674	67	1	37.00	37.00	2024-05-02 23:26:49
2042	1674	69	7	41.00	287.00	2024-05-02 23:26:49
2043	1675	91	4	10.00	40.00	2024-05-03 11:01:39
2044	1675	54	2	47.00	94.00	2024-05-03 11:01:39
2045	1675	64	1	37.00	37.00	2024-05-03 11:01:39
2046	1675	106	4	11.00	44.00	2024-05-03 11:01:39
2047	1675	73	4	23.00	92.00	2024-05-03 11:01:39
2048	1676	100	6	35.00	210.00	2024-05-03 15:58:03
2049	1676	93	1	48.00	48.00	2024-05-03 15:58:03
2050	1676	79	7	32.00	224.00	2024-05-03 15:58:03
2051	1676	63	5	10.00	50.00	2024-05-03 15:58:03
2052	1677	58	4	9.00	36.00	2024-05-04 11:18:39
2053	1677	98	6	46.00	276.00	2024-05-04 11:18:39
2054	1677	95	6	13.00	78.00	2024-05-04 11:18:39
2055	1678	71	8	29.00	232.00	2024-05-05 22:45:00
2056	1678	105	7	15.00	105.00	2024-05-05 22:45:00
2057	1678	88	1	21.00	21.00	2024-05-05 22:45:00
2058	1678	68	4	33.00	132.00	2024-05-05 22:45:00
2059	1678	85	1	34.00	34.00	2024-05-05 22:45:00
2060	1679	66	3	47.00	141.00	2024-05-06 10:38:03
2061	1679	75	6	39.00	234.00	2024-05-06 10:38:03
2062	1680	82	4	12.00	48.00	2024-05-07 18:54:42
2063	1680	95	4	13.00	52.00	2024-05-07 18:54:42
2064	1680	99	5	20.00	100.00	2024-05-07 18:54:42
2065	1680	81	2	35.00	70.00	2024-05-07 18:54:42
2066	1680	58	5	9.00	45.00	2024-05-07 18:54:42
2067	1681	72	6	11.00	66.00	2024-05-07 20:13:47
2068	1682	75	4	39.00	156.00	2024-05-08 08:06:44
2069	1682	60	2	48.00	96.00	2024-05-08 08:06:44
2070	1682	69	3	41.00	123.00	2024-05-08 08:06:44
2071	1682	80	3	15.00	45.00	2024-05-08 08:06:44
2072	1683	100	3	35.00	105.00	2024-05-08 15:56:30
2073	1684	57	2	43.00	86.00	2024-05-09 16:11:07
2074	1684	63	4	10.00	40.00	2024-05-09 16:11:07
2075	1685	97	5	34.00	170.00	2024-05-09 18:11:21
2076	1685	101	4	4.00	16.00	2024-05-09 18:11:21
2077	1685	72	6	11.00	66.00	2024-05-09 18:11:21
2078	1686	102	1	38.00	38.00	2024-05-12 04:20:25
2079	1686	98	2	46.00	92.00	2024-05-12 04:20:25
2080	1687	68	5	33.00	165.00	2024-05-13 02:10:15
2081	1687	88	8	21.00	168.00	2024-05-13 02:10:15
2082	1687	56	4	21.00	84.00	2024-05-13 02:10:15
2083	1688	61	4	10.00	40.00	2024-05-13 07:13:17
2084	1688	83	2	23.00	46.00	2024-05-13 07:13:17
2085	1688	104	2	37.00	74.00	2024-05-13 07:13:17
2086	1689	81	3	35.00	105.00	2024-05-13 11:23:42
2087	1689	106	8	11.00	88.00	2024-05-13 11:23:42
2088	1689	84	6	21.00	126.00	2024-05-13 11:23:42
2089	1690	59	8	2.00	16.00	2024-05-13 15:42:47
2090	1690	85	1	34.00	34.00	2024-05-13 15:42:47
2091	1690	80	8	15.00	120.00	2024-05-13 15:42:47
2092	1691	83	3	23.00	69.00	2024-05-15 05:40:38
2093	1692	69	8	41.00	328.00	2024-05-15 19:32:36
2094	1693	99	3	20.00	60.00	2024-05-16 19:05:16
2095	1693	76	5	42.00	210.00	2024-05-16 19:05:16
2096	1693	66	3	47.00	141.00	2024-05-16 19:05:16
2097	1693	77	8	32.00	256.00	2024-05-16 19:05:16
2098	1693	98	5	46.00	230.00	2024-05-16 19:05:16
2099	1694	63	2	10.00	20.00	2024-05-17 11:13:39
2100	1694	65	3	18.00	54.00	2024-05-17 11:13:39
2101	1694	68	3	33.00	99.00	2024-05-17 11:13:39
2102	1694	95	3	13.00	39.00	2024-05-17 11:13:39
2103	1695	97	8	34.00	272.00	2024-05-20 19:27:59
2104	1695	104	3	37.00	111.00	2024-05-20 19:27:59
2105	1696	65	1	18.00	18.00	2024-05-21 14:51:33
2106	1696	98	6	46.00	276.00	2024-05-21 14:51:33
2107	1696	102	3	38.00	114.00	2024-05-21 14:51:33
2108	1696	85	4	34.00	136.00	2024-05-21 14:51:33
2109	1697	99	6	20.00	120.00	2024-05-22 04:09:41
2110	1697	97	8	34.00	272.00	2024-05-22 04:09:41
2111	1697	74	2	37.00	74.00	2024-05-22 04:09:41
2112	1698	104	7	37.00	259.00	2024-05-23 03:52:29
2113	1699	98	6	46.00	276.00	2024-05-23 05:56:12
2114	1700	65	5	18.00	90.00	2024-05-23 06:24:03
2115	1700	97	3	34.00	102.00	2024-05-23 06:24:03
2116	1700	65	1	18.00	18.00	2024-05-23 06:24:03
2117	1700	67	2	37.00	74.00	2024-05-23 06:24:03
2118	1701	84	3	21.00	63.00	2024-05-23 17:09:32
2119	1701	90	6	20.00	120.00	2024-05-23 17:09:32
2120	1702	96	3	7.00	21.00	2024-05-24 02:25:56
2121	1703	80	5	15.00	75.00	2024-05-24 21:47:54
2122	1703	67	1	37.00	37.00	2024-05-24 21:47:54
2123	1703	63	1	10.00	10.00	2024-05-24 21:47:54
2124	1703	88	8	21.00	168.00	2024-05-24 21:47:54
2125	1703	66	3	47.00	141.00	2024-05-24 21:47:54
2126	1704	58	7	9.00	63.00	2024-05-25 05:45:32
2127	1704	99	7	20.00	140.00	2024-05-25 05:45:32
2128	1704	65	3	18.00	54.00	2024-05-25 05:45:32
2129	1704	99	8	20.00	160.00	2024-05-25 05:45:32
2130	1705	106	3	11.00	33.00	2024-05-26 09:59:43
2131	1705	86	7	44.00	308.00	2024-05-26 09:59:43
2132	1706	81	6	35.00	210.00	2024-05-29 01:49:35
2133	1706	69	5	41.00	205.00	2024-05-29 01:49:35
2134	1706	61	8	10.00	80.00	2024-05-29 01:49:35
2135	1707	88	7	21.00	147.00	2024-05-29 03:29:06
2136	1707	62	7	13.00	91.00	2024-05-29 03:29:06
2137	1708	63	4	10.00	40.00	2024-05-29 05:39:11
2138	1708	74	7	37.00	259.00	2024-05-29 05:39:11
2139	1708	95	1	13.00	13.00	2024-05-29 05:39:11
2140	1708	82	1	12.00	12.00	2024-05-29 05:39:11
2141	1708	67	4	37.00	148.00	2024-05-29 05:39:11
2142	1709	57	3	43.00	129.00	2024-05-29 15:59:58
2143	1709	66	4	47.00	188.00	2024-05-29 15:59:58
2144	1709	87	5	7.00	35.00	2024-05-29 15:59:58
2145	1710	75	8	39.00	312.00	2024-05-30 16:49:11
2146	1710	79	7	32.00	224.00	2024-05-30 16:49:11
2147	1710	65	5	18.00	90.00	2024-05-30 16:49:11
2148	1711	67	3	37.00	111.00	2024-05-30 21:38:39
2149	1712	83	1	23.00	23.00	2024-05-31 04:49:41
2150	1712	75	4	39.00	156.00	2024-05-31 04:49:41
2151	1712	105	5	15.00	75.00	2024-05-31 04:49:41
2152	1712	69	4	41.00	164.00	2024-05-31 04:49:41
2153	1712	54	3	47.00	141.00	2024-05-31 04:49:41
2154	1713	62	5	13.00	65.00	2024-06-03 02:24:49
2155	1714	54	8	47.00	376.00	2024-06-05 20:43:05
2156	1715	98	7	46.00	322.00	2024-06-09 04:22:49
2157	1715	71	7	29.00	203.00	2024-06-09 04:22:49
2158	1715	93	5	48.00	240.00	2024-06-09 04:22:49
2159	1715	68	2	33.00	66.00	2024-06-09 04:22:49
2160	1716	61	6	10.00	60.00	2024-06-10 05:54:09
2161	1716	66	4	47.00	188.00	2024-06-10 05:54:09
2162	1717	105	3	15.00	45.00	2024-06-11 18:20:48
2163	1717	55	1	17.00	17.00	2024-06-11 18:20:48
2164	1717	86	7	44.00	308.00	2024-06-11 18:20:48
2165	1717	53	8	47.00	376.00	2024-06-11 18:20:48
2166	1717	55	3	17.00	51.00	2024-06-11 18:20:48
2167	1718	80	3	15.00	45.00	2024-06-11 22:59:52
2168	1718	77	6	32.00	192.00	2024-06-11 22:59:52
2169	1718	74	4	37.00	148.00	2024-06-11 22:59:52
2170	1719	75	2	39.00	78.00	2024-06-12 17:34:30
2171	1719	73	4	23.00	92.00	2024-06-12 17:34:30
2172	1720	61	2	10.00	20.00	2024-06-12 19:25:05
2173	1720	79	2	32.00	64.00	2024-06-12 19:25:05
2174	1720	95	1	13.00	13.00	2024-06-12 19:25:05
2175	1720	63	8	10.00	80.00	2024-06-12 19:25:05
2176	1720	87	7	7.00	49.00	2024-06-12 19:25:05
2177	1721	95	2	13.00	26.00	2024-06-13 20:08:47
2178	1721	70	3	23.00	69.00	2024-06-13 20:08:47
2179	1722	105	6	15.00	90.00	2024-06-15 07:07:54
2180	1722	57	6	43.00	258.00	2024-06-15 07:07:54
2181	1722	105	7	15.00	105.00	2024-06-15 07:07:54
2182	1723	101	8	4.00	32.00	2024-06-15 13:16:27
2183	1723	87	1	7.00	7.00	2024-06-15 13:16:27
2184	1723	106	3	11.00	33.00	2024-06-15 13:16:27
2185	1723	95	1	13.00	13.00	2024-06-15 13:16:27
2186	1723	71	3	29.00	87.00	2024-06-15 13:16:27
2187	1724	105	2	15.00	30.00	2024-06-16 00:26:24
2188	1724	59	4	2.00	8.00	2024-06-16 00:26:24
2189	1724	55	2	17.00	34.00	2024-06-16 00:26:24
2190	1724	64	7	37.00	259.00	2024-06-16 00:26:24
2191	1724	77	6	32.00	192.00	2024-06-16 00:26:24
2192	1725	91	2	10.00	20.00	2024-06-16 01:32:24
2193	1725	75	3	39.00	117.00	2024-06-16 01:32:24
2194	1725	85	6	34.00	204.00	2024-06-16 01:32:24
2195	1726	105	7	15.00	105.00	2024-06-16 07:15:03
2196	1727	105	3	15.00	45.00	2024-06-18 01:34:48
2197	1727	54	8	47.00	376.00	2024-06-18 01:34:48
2198	1728	72	1	11.00	11.00	2024-06-18 16:02:32
2199	1728	62	4	13.00	52.00	2024-06-18 16:02:32
2200	1729	67	8	37.00	296.00	2024-06-18 19:41:52
2201	1729	59	5	2.00	10.00	2024-06-18 19:41:52
2202	1729	67	4	37.00	148.00	2024-06-18 19:41:52
2203	1730	59	4	2.00	8.00	2024-06-19 18:27:28
2204	1730	86	6	44.00	264.00	2024-06-19 18:27:28
2205	1730	53	5	47.00	235.00	2024-06-19 18:27:28
2206	1731	74	5	37.00	185.00	2024-06-20 00:32:37
2207	1732	85	1	34.00	34.00	2024-06-22 02:36:54
2208	1732	102	8	38.00	304.00	2024-06-22 02:36:54
2209	1732	74	3	37.00	111.00	2024-06-22 02:36:54
2210	1732	100	6	35.00	210.00	2024-06-22 02:36:54
2211	1733	97	4	34.00	136.00	2024-06-22 05:10:24
2212	1734	58	8	9.00	72.00	2024-06-22 19:13:53
2213	1734	53	8	47.00	376.00	2024-06-22 19:13:53
2214	1734	56	5	21.00	105.00	2024-06-22 19:13:53
2215	1734	96	1	7.00	7.00	2024-06-22 19:13:53
2216	1735	84	7	21.00	147.00	2024-06-22 21:32:56
2217	1735	100	3	35.00	105.00	2024-06-22 21:32:56
2218	1735	69	8	41.00	328.00	2024-06-22 21:32:56
2219	1736	74	2	37.00	74.00	2024-06-24 21:58:25
2220	1737	102	8	38.00	304.00	2024-06-25 03:48:23
2221	1737	60	8	48.00	384.00	2024-06-25 03:48:23
2222	1737	58	4	9.00	36.00	2024-06-25 03:48:23
2223	1737	97	6	34.00	204.00	2024-06-25 03:48:23
2224	1737	55	8	17.00	136.00	2024-06-25 03:48:23
2225	1738	73	5	23.00	115.00	2024-06-25 18:07:14
2226	1738	92	2	33.00	66.00	2024-06-25 18:07:14
2227	1738	105	4	15.00	60.00	2024-06-25 18:07:14
2228	1738	89	5	6.00	30.00	2024-06-25 18:07:14
2229	1738	66	6	47.00	282.00	2024-06-25 18:07:14
2230	1739	94	2	23.00	46.00	2024-06-26 18:13:56
2231	1739	69	2	41.00	82.00	2024-06-26 18:13:56
2232	1739	82	4	12.00	48.00	2024-06-26 18:13:56
2233	1739	53	7	47.00	329.00	2024-06-26 18:13:56
2234	1740	74	2	37.00	74.00	2024-06-26 20:36:46
2235	1740	89	5	6.00	30.00	2024-06-26 20:36:46
2236	1740	57	6	43.00	258.00	2024-06-26 20:36:46
2237	1741	72	3	11.00	33.00	2024-06-27 05:57:48
2238	1741	97	6	34.00	204.00	2024-06-27 05:57:48
2239	1741	72	6	11.00	66.00	2024-06-27 05:57:48
2240	1742	72	5	11.00	55.00	2024-06-27 10:27:58
2241	1742	70	8	23.00	184.00	2024-06-27 10:27:58
2242	1742	106	7	11.00	77.00	2024-06-27 10:27:58
2243	1743	70	5	23.00	115.00	2024-06-29 02:34:54
2244	1743	65	8	18.00	144.00	2024-06-29 02:34:54
2245	1743	61	5	10.00	50.00	2024-06-29 02:34:54
2246	1744	70	3	23.00	69.00	2024-06-30 21:00:09
2247	1745	71	5	29.00	145.00	2024-06-30 21:22:41
2248	1746	53	8	47.00	376.00	2024-07-01 17:10:31
2249	1747	105	8	15.00	120.00	2024-07-01 17:39:54
2250	1747	70	8	23.00	184.00	2024-07-01 17:39:54
2251	1748	68	2	33.00	66.00	2024-07-02 02:13:25
2252	1749	95	7	13.00	91.00	2024-07-02 03:56:23
2253	1750	94	8	23.00	184.00	2024-07-04 05:40:23
2254	1751	79	5	32.00	160.00	2024-07-05 05:10:54
2255	1752	105	8	15.00	120.00	2024-07-05 18:19:04
2256	1752	94	6	23.00	138.00	2024-07-05 18:19:04
2257	1753	105	5	15.00	75.00	2024-07-05 20:41:58
2258	1753	63	4	10.00	40.00	2024-07-05 20:41:58
2259	1753	99	5	20.00	100.00	2024-07-05 20:41:58
2260	1754	73	2	23.00	46.00	2024-07-07 21:29:41
2261	1754	91	6	10.00	60.00	2024-07-07 21:29:41
2262	1754	100	1	35.00	35.00	2024-07-07 21:29:41
2263	1754	80	2	15.00	30.00	2024-07-07 21:29:41
2264	1755	61	2	10.00	20.00	2024-07-09 22:38:38
2265	1755	61	1	10.00	10.00	2024-07-09 22:38:38
2266	1755	71	2	29.00	58.00	2024-07-09 22:38:38
2267	1756	91	8	10.00	80.00	2024-07-10 04:02:38
2268	1756	69	1	41.00	41.00	2024-07-10 04:02:38
2269	1756	106	2	11.00	22.00	2024-07-10 04:02:38
2270	1757	94	2	23.00	46.00	2024-07-11 01:03:00
2271	1757	96	2	7.00	14.00	2024-07-11 01:03:00
2272	1757	85	6	34.00	204.00	2024-07-11 01:03:00
2273	1757	101	7	4.00	28.00	2024-07-11 01:03:00
2274	1758	103	2	19.00	38.00	2024-07-15 00:04:55
2275	1759	78	5	19.00	95.00	2024-07-15 19:05:25
2276	1759	93	5	48.00	240.00	2024-07-15 19:05:25
2277	1760	87	5	7.00	35.00	2024-07-15 20:11:26
2278	1760	71	4	29.00	116.00	2024-07-15 20:11:26
2279	1761	102	3	38.00	114.00	2024-07-16 00:02:39
2280	1761	70	5	23.00	115.00	2024-07-16 00:02:39
2281	1762	57	8	43.00	344.00	2024-07-16 05:40:21
2282	1762	55	4	17.00	68.00	2024-07-16 05:40:21
2283	1762	70	7	23.00	161.00	2024-07-16 05:40:21
2284	1762	91	3	10.00	30.00	2024-07-16 05:40:21
2285	1763	100	4	35.00	140.00	2024-07-16 09:52:55
2286	1763	87	8	7.00	56.00	2024-07-16 09:52:55
2287	1763	64	6	37.00	222.00	2024-07-16 09:52:55
2288	1763	67	5	37.00	185.00	2024-07-16 09:52:55
2289	1763	102	6	38.00	228.00	2024-07-16 09:52:55
2290	1764	90	4	20.00	80.00	2024-07-16 21:41:33
2291	1765	98	2	46.00	92.00	2024-07-17 23:31:04
2292	1766	100	4	35.00	140.00	2024-07-19 02:33:51
2293	1766	81	2	35.00	70.00	2024-07-19 02:33:51
2294	1766	65	1	18.00	18.00	2024-07-19 02:33:51
2295	1766	80	2	15.00	30.00	2024-07-19 02:33:51
2296	1766	77	2	32.00	64.00	2024-07-19 02:33:51
2297	1767	77	5	32.00	160.00	2024-07-19 11:31:47
2298	1767	96	7	7.00	49.00	2024-07-19 11:31:47
2299	1767	100	6	35.00	210.00	2024-07-19 11:31:47
2300	1767	66	7	47.00	329.00	2024-07-19 11:31:47
2301	1768	55	4	17.00	68.00	2024-07-19 12:02:02
2302	1768	57	5	43.00	215.00	2024-07-19 12:02:02
2303	1769	72	7	11.00	77.00	2024-07-19 17:11:15
2304	1769	87	4	7.00	28.00	2024-07-19 17:11:15
2305	1769	79	3	32.00	96.00	2024-07-19 17:11:15
2306	1769	84	3	21.00	63.00	2024-07-19 17:11:15
2307	1769	72	2	11.00	22.00	2024-07-19 17:11:15
2308	1770	94	7	23.00	161.00	2024-07-19 19:44:43
2309	1770	86	3	44.00	132.00	2024-07-19 19:44:43
2310	1770	96	2	7.00	14.00	2024-07-19 19:44:43
2311	1770	103	4	19.00	76.00	2024-07-19 19:44:43
2312	1771	65	2	18.00	36.00	2024-07-19 20:14:56
2313	1772	96	7	7.00	49.00	2024-07-20 01:37:47
2314	1772	74	2	37.00	74.00	2024-07-20 01:37:47
2315	1772	70	1	23.00	23.00	2024-07-20 01:37:47
2316	1773	93	5	48.00	240.00	2024-07-20 07:57:23
2317	1774	103	7	19.00	133.00	2024-07-22 18:10:01
2318	1774	55	8	17.00	136.00	2024-07-22 18:10:01
2319	1774	104	5	37.00	185.00	2024-07-22 18:10:01
2320	1775	83	1	23.00	23.00	2024-07-23 13:00:05
2321	1775	77	8	32.00	256.00	2024-07-23 13:00:05
2322	1775	55	3	17.00	51.00	2024-07-23 13:00:05
2323	1776	59	4	2.00	8.00	2024-07-24 02:16:24
2324	1776	87	7	7.00	49.00	2024-07-24 02:16:24
2325	1776	66	7	47.00	329.00	2024-07-24 02:16:24
2326	1776	90	4	20.00	80.00	2024-07-24 02:16:24
2327	1776	100	8	35.00	280.00	2024-07-24 02:16:24
2328	1777	87	8	7.00	56.00	2024-07-24 04:59:50
2329	1777	56	1	21.00	21.00	2024-07-24 04:59:50
2330	1777	80	4	15.00	60.00	2024-07-24 04:59:50
2331	1777	67	7	37.00	259.00	2024-07-24 04:59:50
2332	1777	62	8	13.00	104.00	2024-07-24 04:59:50
2333	1778	60	7	48.00	336.00	2024-07-24 11:57:25
2334	1778	70	3	23.00	69.00	2024-07-24 11:57:25
2335	1779	61	3	10.00	30.00	2024-07-24 22:23:34
2336	1779	91	4	10.00	40.00	2024-07-24 22:23:34
2337	1779	56	3	21.00	63.00	2024-07-24 22:23:34
2338	1779	97	4	34.00	136.00	2024-07-24 22:23:34
2339	1780	80	1	15.00	15.00	2024-07-25 15:03:12
2340	1780	99	6	20.00	120.00	2024-07-25 15:03:12
2341	1780	87	7	7.00	49.00	2024-07-25 15:03:12
2342	1780	81	2	35.00	70.00	2024-07-25 15:03:12
2343	1780	102	1	38.00	38.00	2024-07-25 15:03:12
2344	1781	96	4	7.00	28.00	2024-07-26 04:07:21
2345	1781	83	6	23.00	138.00	2024-07-26 04:07:21
2346	1781	99	8	20.00	160.00	2024-07-26 04:07:21
2347	1781	73	3	23.00	69.00	2024-07-26 04:07:21
2348	1781	95	1	13.00	13.00	2024-07-26 04:07:21
2349	1782	92	1	33.00	33.00	2024-07-26 04:20:13
2350	1782	100	1	35.00	35.00	2024-07-26 04:20:13
2351	1783	73	5	23.00	115.00	2024-07-26 11:47:40
2352	1783	68	8	33.00	264.00	2024-07-26 11:47:40
2353	1783	59	8	2.00	16.00	2024-07-26 11:47:40
2354	1784	78	3	19.00	57.00	2024-07-26 18:58:59
2355	1784	97	3	34.00	102.00	2024-07-26 18:58:59
2356	1785	92	6	33.00	198.00	2024-07-27 16:53:05
2357	1785	100	2	35.00	70.00	2024-07-27 16:53:05
2358	1785	102	4	38.00	152.00	2024-07-27 16:53:05
2359	1785	84	1	21.00	21.00	2024-07-27 16:53:05
2360	1785	65	1	18.00	18.00	2024-07-27 16:53:05
2361	1786	87	1	7.00	7.00	2024-07-27 17:54:06
2362	1786	76	4	42.00	168.00	2024-07-27 17:54:06
2363	1787	76	2	42.00	84.00	2024-07-27 20:30:07
2364	1787	101	7	4.00	28.00	2024-07-27 20:30:07
2365	1788	78	1	19.00	19.00	2024-07-29 04:45:21
2366	1789	53	1	47.00	47.00	2024-07-29 23:20:49
2367	1789	87	2	7.00	14.00	2024-07-29 23:20:49
2368	1789	71	4	29.00	116.00	2024-07-29 23:20:49
2369	1789	80	6	15.00	90.00	2024-07-29 23:20:49
2370	1790	85	7	34.00	238.00	2024-07-30 17:06:09
2371	1791	69	4	41.00	164.00	2024-07-30 17:20:21
2372	1791	85	7	34.00	238.00	2024-07-30 17:20:21
2373	1791	99	4	20.00	80.00	2024-07-30 17:20:21
2374	1792	81	7	35.00	245.00	2024-07-31 06:53:46
2375	1792	65	5	18.00	90.00	2024-07-31 06:53:46
2376	1793	80	5	15.00	75.00	2024-07-31 23:42:29
2377	1793	68	7	33.00	231.00	2024-07-31 23:42:29
2378	1793	58	5	9.00	45.00	2024-07-31 23:42:29
2379	1793	74	8	37.00	296.00	2024-07-31 23:42:29
2380	1793	76	4	42.00	168.00	2024-07-31 23:42:29
2381	1794	56	8	21.00	168.00	2024-08-01 21:19:33
2382	1794	87	7	7.00	49.00	2024-08-01 21:19:33
2383	1795	58	5	9.00	45.00	2024-08-03 00:44:03
2384	1795	53	8	47.00	376.00	2024-08-03 00:44:03
2385	1795	88	3	21.00	63.00	2024-08-03 00:44:03
2386	1795	73	3	23.00	69.00	2024-08-03 00:44:03
2387	1796	92	7	33.00	231.00	2024-08-03 01:06:15
2388	1796	106	1	11.00	11.00	2024-08-03 01:06:15
2389	1796	74	1	37.00	37.00	2024-08-03 01:06:15
2390	1796	86	7	44.00	308.00	2024-08-03 01:06:15
2391	1796	80	7	15.00	105.00	2024-08-03 01:06:15
2392	1797	84	3	21.00	63.00	2024-08-03 05:18:26
2393	1797	78	5	19.00	95.00	2024-08-03 05:18:26
2394	1797	101	1	4.00	4.00	2024-08-03 05:18:26
2395	1797	102	6	38.00	228.00	2024-08-03 05:18:26
2396	1797	96	3	7.00	21.00	2024-08-03 05:18:26
2397	1798	59	2	2.00	4.00	2024-08-03 10:59:12
2398	1798	104	8	37.00	296.00	2024-08-03 10:59:12
2399	1798	106	4	11.00	44.00	2024-08-03 10:59:12
2400	1799	106	4	11.00	44.00	2024-08-03 16:24:26
2401	1799	61	4	10.00	40.00	2024-08-03 16:24:26
2402	1799	71	5	29.00	145.00	2024-08-03 16:24:26
2403	1800	100	1	35.00	35.00	2024-08-03 21:13:14
2404	1801	84	2	21.00	42.00	2024-08-04 03:13:54
2405	1801	65	4	18.00	72.00	2024-08-04 03:13:54
2406	1801	72	5	11.00	55.00	2024-08-04 03:13:54
2407	1802	75	7	39.00	273.00	2024-08-04 09:05:30
2408	1802	102	3	38.00	114.00	2024-08-04 09:05:30
2409	1802	55	3	17.00	51.00	2024-08-04 09:05:30
2410	1802	73	7	23.00	161.00	2024-08-04 09:05:30
2411	1802	106	1	11.00	11.00	2024-08-04 09:05:30
2412	1803	72	7	11.00	77.00	2024-08-08 02:36:26
2413	1804	100	8	35.00	280.00	2024-08-08 07:32:26
2414	1805	92	7	33.00	231.00	2024-08-08 12:25:06
2415	1805	104	3	37.00	111.00	2024-08-08 12:25:06
2416	1805	87	1	7.00	7.00	2024-08-08 12:25:06
2417	1805	72	7	11.00	77.00	2024-08-08 12:25:06
2418	1806	88	5	21.00	105.00	2024-08-08 14:58:46
2419	1806	62	6	13.00	78.00	2024-08-08 14:58:46
2420	1806	83	6	23.00	138.00	2024-08-08 14:58:46
2421	1807	59	1	2.00	2.00	2024-08-09 22:41:27
2422	1807	54	2	47.00	94.00	2024-08-09 22:41:27
2423	1807	96	4	7.00	28.00	2024-08-09 22:41:27
2424	1807	68	3	33.00	99.00	2024-08-09 22:41:27
2425	1807	76	5	42.00	210.00	2024-08-09 22:41:27
2426	1808	74	4	37.00	148.00	2024-08-10 13:11:57
2427	1808	92	8	33.00	264.00	2024-08-10 13:11:57
2428	1808	95	2	13.00	26.00	2024-08-10 13:11:57
2429	1809	72	6	11.00	66.00	2024-08-10 19:09:14
2430	1810	103	6	19.00	114.00	2024-08-11 05:01:12
2431	1810	80	4	15.00	60.00	2024-08-11 05:01:12
2432	1810	79	1	32.00	32.00	2024-08-11 05:01:12
2433	1811	88	1	21.00	21.00	2024-08-11 09:53:33
2434	1812	105	4	15.00	60.00	2024-08-12 02:16:22
2435	1812	55	7	17.00	119.00	2024-08-12 02:16:22
2436	1813	55	2	17.00	34.00	2024-08-12 03:52:34
2437	1813	82	3	12.00	36.00	2024-08-12 03:52:34
2438	1813	54	7	47.00	329.00	2024-08-12 03:52:34
2439	1814	80	4	15.00	60.00	2024-08-13 11:17:08
2440	1814	73	7	23.00	161.00	2024-08-13 11:17:08
2441	1814	75	1	39.00	39.00	2024-08-13 11:17:08
2442	1814	79	7	32.00	224.00	2024-08-13 11:17:08
2443	1814	84	8	21.00	168.00	2024-08-13 11:17:08
2444	1815	83	7	23.00	161.00	2024-08-13 15:51:53
2445	1815	94	8	23.00	184.00	2024-08-13 15:51:53
2446	1815	95	1	13.00	13.00	2024-08-13 15:51:53
2447	1815	79	6	32.00	192.00	2024-08-13 15:51:53
2448	1815	78	3	19.00	57.00	2024-08-13 15:51:53
2449	1816	96	8	7.00	56.00	2024-08-16 07:43:23
2450	1816	71	6	29.00	174.00	2024-08-16 07:43:23
2451	1816	92	2	33.00	66.00	2024-08-16 07:43:23
2452	1816	69	4	41.00	164.00	2024-08-16 07:43:23
2453	1817	86	5	44.00	220.00	2024-08-18 04:38:04
2454	1817	63	6	10.00	60.00	2024-08-18 04:38:04
2455	1817	87	5	7.00	35.00	2024-08-18 04:38:04
2456	1817	66	4	47.00	188.00	2024-08-18 04:38:04
2457	1818	56	2	21.00	42.00	2024-08-18 14:02:24
2458	1818	94	4	23.00	92.00	2024-08-18 14:02:24
2459	1818	69	5	41.00	205.00	2024-08-18 14:02:24
2460	1819	82	3	12.00	36.00	2024-08-19 11:21:53
2461	1820	85	7	34.00	238.00	2024-08-19 18:28:20
2462	1820	65	6	18.00	108.00	2024-08-19 18:28:20
2463	1820	66	7	47.00	329.00	2024-08-19 18:28:20
2464	1820	92	2	33.00	66.00	2024-08-19 18:28:20
2465	1821	54	7	47.00	329.00	2024-08-21 02:33:58
2466	1821	100	5	35.00	175.00	2024-08-21 02:33:58
2467	1821	95	7	13.00	91.00	2024-08-21 02:33:58
2468	1821	105	5	15.00	75.00	2024-08-21 02:33:58
2469	1821	102	3	38.00	114.00	2024-08-21 02:33:58
2470	1822	96	3	7.00	21.00	2024-08-21 09:27:55
2471	1822	63	7	10.00	70.00	2024-08-21 09:27:55
2472	1822	65	1	18.00	18.00	2024-08-21 09:27:55
2473	1823	88	3	21.00	63.00	2024-08-21 19:46:10
2474	1823	81	8	35.00	280.00	2024-08-21 19:46:10
2475	1823	64	1	37.00	37.00	2024-08-21 19:46:10
2476	1823	54	4	47.00	188.00	2024-08-21 19:46:10
2477	1823	81	3	35.00	105.00	2024-08-21 19:46:10
2478	1824	69	8	41.00	328.00	2024-08-22 08:12:08
2479	1824	57	8	43.00	344.00	2024-08-22 08:12:08
2480	1825	63	5	10.00	50.00	2024-08-22 18:59:16
2481	1825	87	8	7.00	56.00	2024-08-22 18:59:16
2482	1825	53	7	47.00	329.00	2024-08-22 18:59:16
2483	1825	67	2	37.00	74.00	2024-08-22 18:59:16
2484	1826	68	2	33.00	66.00	2024-08-22 20:52:50
2485	1826	87	4	7.00	28.00	2024-08-22 20:52:50
2486	1826	53	1	47.00	47.00	2024-08-22 20:52:50
2487	1826	83	6	23.00	138.00	2024-08-22 20:52:50
2488	1827	100	8	35.00	280.00	2024-08-23 06:16:36
2489	1827	84	4	21.00	84.00	2024-08-23 06:16:36
2490	1827	61	1	10.00	10.00	2024-08-23 06:16:36
2491	1827	101	1	4.00	4.00	2024-08-23 06:16:36
2492	1827	72	5	11.00	55.00	2024-08-23 06:16:36
2493	1828	94	7	23.00	161.00	2024-08-23 09:42:53
2494	1828	68	1	33.00	33.00	2024-08-23 09:42:53
2495	1828	62	6	13.00	78.00	2024-08-23 09:42:53
2496	1829	93	1	48.00	48.00	2024-08-24 09:07:01
2497	1830	67	5	37.00	185.00	2024-08-25 23:10:30
2498	1830	106	2	11.00	22.00	2024-08-25 23:10:30
2499	1830	93	5	48.00	240.00	2024-08-25 23:10:30
2500	1831	77	8	32.00	256.00	2024-08-26 05:23:14
2501	1831	67	6	37.00	222.00	2024-08-26 05:23:14
2502	1831	90	3	20.00	60.00	2024-08-26 05:23:14
2503	1831	90	3	20.00	60.00	2024-08-26 05:23:14
2504	1832	69	8	41.00	328.00	2024-08-26 14:47:19
2505	1832	84	7	21.00	147.00	2024-08-26 14:47:19
2506	1832	81	4	35.00	140.00	2024-08-26 14:47:19
2507	1832	91	8	10.00	80.00	2024-08-26 14:47:19
2508	1832	76	1	42.00	42.00	2024-08-26 14:47:19
2509	1833	102	1	38.00	38.00	2024-08-28 20:47:07
2510	1833	64	3	37.00	111.00	2024-08-28 20:47:07
2511	1834	75	3	39.00	117.00	2024-08-29 02:30:08
2512	1834	67	2	37.00	74.00	2024-08-29 02:30:08
2513	1835	64	4	37.00	148.00	2024-08-31 07:57:34
2514	1836	104	6	37.00	222.00	2024-08-31 08:58:05
2515	1836	98	6	46.00	276.00	2024-08-31 08:58:05
2516	1837	84	5	21.00	105.00	2024-08-31 11:10:57
2517	1837	97	4	34.00	136.00	2024-08-31 11:10:57
2518	1837	71	8	29.00	232.00	2024-08-31 11:10:57
2519	1837	99	5	20.00	100.00	2024-08-31 11:10:57
2520	1838	80	1	15.00	15.00	2024-08-31 22:56:03
2521	1838	77	7	32.00	224.00	2024-08-31 22:56:03
2522	1839	69	8	41.00	328.00	2024-09-02 04:50:06
2523	1839	61	2	10.00	20.00	2024-09-02 04:50:06
2524	1839	93	2	48.00	96.00	2024-09-02 04:50:06
2525	1840	105	7	15.00	105.00	2024-09-04 05:55:45
2526	1840	99	6	20.00	120.00	2024-09-04 05:55:45
2527	1840	80	4	15.00	60.00	2024-09-04 05:55:45
2528	1841	95	4	13.00	52.00	2024-09-04 18:46:47
2529	1841	80	1	15.00	15.00	2024-09-04 18:46:47
2530	1842	74	8	37.00	296.00	2024-09-05 00:50:59
2531	1843	74	2	37.00	74.00	2024-09-05 06:16:14
2532	1844	106	6	11.00	66.00	2024-09-05 18:54:36
2533	1844	78	5	19.00	95.00	2024-09-05 18:54:36
2534	1844	77	5	32.00	160.00	2024-09-05 18:54:36
2535	1844	54	5	47.00	235.00	2024-09-05 18:54:36
2536	1845	93	5	48.00	240.00	2024-09-05 21:00:42
2537	1845	64	6	37.00	222.00	2024-09-05 21:00:42
2538	1846	72	3	11.00	33.00	2024-09-05 21:54:45
2539	1847	63	1	10.00	10.00	2024-09-06 07:52:41
2540	1848	55	7	17.00	119.00	2024-09-06 19:18:44
2541	1848	55	5	17.00	85.00	2024-09-06 19:18:44
2542	1848	64	1	37.00	37.00	2024-09-06 19:18:44
2543	1849	79	8	32.00	256.00	2024-09-06 23:58:03
2544	1849	79	5	32.00	160.00	2024-09-06 23:58:03
2545	1850	79	2	32.00	64.00	2024-09-08 06:01:49
2546	1850	81	3	35.00	105.00	2024-09-08 06:01:49
2547	1850	68	3	33.00	99.00	2024-09-08 06:01:49
2548	1850	61	2	10.00	20.00	2024-09-08 06:01:49
2549	1850	56	1	21.00	21.00	2024-09-08 06:01:49
2550	1851	92	5	33.00	165.00	2024-09-08 09:31:25
2551	1852	53	1	47.00	47.00	2024-09-10 07:10:04
2552	1853	96	1	7.00	7.00	2024-09-10 22:05:01
2553	1854	96	3	7.00	21.00	2024-09-12 11:25:39
2554	1854	73	2	23.00	46.00	2024-09-12 11:25:39
2555	1855	85	3	34.00	102.00	2024-09-13 14:15:18
2556	1855	106	1	11.00	11.00	2024-09-13 14:15:18
2557	1856	104	1	37.00	37.00	2024-09-14 18:16:08
2558	1856	88	6	21.00	126.00	2024-09-14 18:16:08
2559	1856	97	4	34.00	136.00	2024-09-14 18:16:08
2560	1856	83	1	23.00	23.00	2024-09-14 18:16:08
2561	1857	77	6	32.00	192.00	2024-09-14 23:55:12
2562	1857	87	3	7.00	21.00	2024-09-14 23:55:12
2563	1857	53	4	47.00	188.00	2024-09-14 23:55:12
2564	1858	87	1	7.00	7.00	2024-09-15 19:54:37
2565	1858	85	8	34.00	272.00	2024-09-15 19:54:37
2566	1858	99	2	20.00	40.00	2024-09-15 19:54:37
2567	1859	102	7	38.00	266.00	2024-09-18 18:04:01
2568	1859	55	6	17.00	102.00	2024-09-18 18:04:01
2569	1859	54	7	47.00	329.00	2024-09-18 18:04:01
2570	1859	88	3	21.00	63.00	2024-09-18 18:04:01
2571	1859	93	8	48.00	384.00	2024-09-18 18:04:01
2572	1860	83	8	23.00	184.00	2024-09-18 22:44:08
2573	1860	61	5	10.00	50.00	2024-09-18 22:44:08
2574	1861	69	1	41.00	41.00	2024-09-18 23:48:06
2575	1861	105	8	15.00	120.00	2024-09-18 23:48:06
2576	1861	77	4	32.00	128.00	2024-09-18 23:48:06
2577	1862	102	8	38.00	304.00	2024-09-19 07:14:17
2578	1862	95	4	13.00	52.00	2024-09-19 07:14:17
2579	1863	91	2	10.00	20.00	2024-09-21 01:04:20
2580	1863	81	3	35.00	105.00	2024-09-21 01:04:20
2581	1863	72	2	11.00	22.00	2024-09-21 01:04:20
2582	1863	60	1	48.00	48.00	2024-09-21 01:04:20
2583	1863	71	6	29.00	174.00	2024-09-21 01:04:20
2584	1864	72	1	11.00	11.00	2024-09-21 13:19:02
2585	1864	84	3	21.00	63.00	2024-09-21 13:19:02
2586	1865	67	4	37.00	148.00	2024-09-23 04:16:32
2587	1865	66	6	47.00	282.00	2024-09-23 04:16:32
2588	1865	106	6	11.00	66.00	2024-09-23 04:16:32
2589	1865	97	1	34.00	34.00	2024-09-23 04:16:32
2590	1866	71	4	29.00	116.00	2024-09-23 14:20:13
2591	1866	69	6	41.00	246.00	2024-09-23 14:20:13
2592	1866	85	1	34.00	34.00	2024-09-23 14:20:13
2593	1866	79	1	32.00	32.00	2024-09-23 14:20:13
2594	1866	87	1	7.00	7.00	2024-09-23 14:20:13
2595	1867	71	2	29.00	58.00	2024-09-23 14:45:52
2596	1867	74	3	37.00	111.00	2024-09-23 14:45:52
2597	1867	102	5	38.00	190.00	2024-09-23 14:45:52
2598	1868	93	6	48.00	288.00	2024-09-23 21:52:28
2599	1868	80	1	15.00	15.00	2024-09-23 21:52:28
2600	1868	96	4	7.00	28.00	2024-09-23 21:52:28
2601	1869	106	6	11.00	66.00	2024-09-24 00:16:03
2602	1869	55	3	17.00	51.00	2024-09-24 00:16:03
2603	1870	62	8	13.00	104.00	2024-09-24 16:08:24
2604	1870	54	5	47.00	235.00	2024-09-24 16:08:24
2605	1870	106	3	11.00	33.00	2024-09-24 16:08:24
2606	1871	62	1	13.00	13.00	2024-09-25 11:54:45
2607	1872	72	6	11.00	66.00	2024-09-26 02:59:16
2608	1872	85	1	34.00	34.00	2024-09-26 02:59:16
2609	1873	80	8	15.00	120.00	2024-09-26 07:28:01
2610	1873	88	7	21.00	147.00	2024-09-26 07:28:01
2611	1874	57	5	43.00	215.00	2024-09-26 15:55:55
2612	1874	93	5	48.00	240.00	2024-09-26 15:55:55
2613	1874	91	2	10.00	20.00	2024-09-26 15:55:55
2614	1874	71	4	29.00	116.00	2024-09-26 15:55:55
2615	1874	91	8	10.00	80.00	2024-09-26 15:55:55
2616	1875	71	5	29.00	145.00	2024-09-28 08:11:35
2617	1875	91	4	10.00	40.00	2024-09-28 08:11:35
2618	1875	59	7	2.00	14.00	2024-09-28 08:11:35
2619	1876	95	1	13.00	13.00	2024-09-28 17:04:18
2620	1876	58	3	9.00	27.00	2024-09-28 17:04:18
2621	1876	53	4	47.00	188.00	2024-09-28 17:04:18
2622	1877	82	5	12.00	60.00	2024-09-29 05:04:18
2623	1877	93	6	48.00	288.00	2024-09-29 05:04:18
2624	1877	79	8	32.00	256.00	2024-09-29 05:04:18
2625	1877	84	7	21.00	147.00	2024-09-29 05:04:18
2626	1877	103	3	19.00	57.00	2024-09-29 05:04:18
2627	1878	56	3	21.00	63.00	2024-09-29 05:15:43
2628	1879	90	2	20.00	40.00	2024-09-30 07:41:04
2629	1879	53	3	47.00	141.00	2024-09-30 07:41:04
2630	1879	58	2	9.00	18.00	2024-09-30 07:41:04
2631	1879	105	3	15.00	45.00	2024-09-30 07:41:04
2632	1879	57	3	43.00	129.00	2024-09-30 07:41:04
2633	1880	73	4	23.00	92.00	2024-09-30 08:49:32
2634	1880	56	6	21.00	126.00	2024-09-30 08:49:32
2635	1880	95	6	13.00	78.00	2024-09-30 08:49:32
2636	1881	99	5	20.00	100.00	2024-10-01 06:13:31
2637	1882	73	6	23.00	138.00	2024-10-02 02:16:10
2638	1883	56	5	21.00	105.00	2024-10-02 18:00:16
2639	1883	70	1	23.00	23.00	2024-10-02 18:00:16
2640	1883	82	5	12.00	60.00	2024-10-02 18:00:16
2641	1883	100	2	35.00	70.00	2024-10-02 18:00:16
2642	1884	73	7	23.00	161.00	2024-10-02 21:25:03
2643	1884	53	1	47.00	47.00	2024-10-02 21:25:03
2644	1885	62	8	13.00	104.00	2024-10-04 05:50:06
2645	1885	65	3	18.00	54.00	2024-10-04 05:50:06
2646	1885	70	2	23.00	46.00	2024-10-04 05:50:06
2647	1885	94	4	23.00	92.00	2024-10-04 05:50:06
2648	1886	104	6	37.00	222.00	2024-10-05 13:43:34
2649	1886	97	6	34.00	204.00	2024-10-05 13:43:34
2650	1887	81	3	35.00	105.00	2024-10-06 05:17:00
2651	1887	90	6	20.00	120.00	2024-10-06 05:17:00
2652	1887	53	2	47.00	94.00	2024-10-06 05:17:00
2653	1887	104	4	37.00	148.00	2024-10-06 05:17:00
2654	1887	93	2	48.00	96.00	2024-10-06 05:17:00
2655	1888	92	7	33.00	231.00	2024-10-06 12:36:10
2656	1888	81	6	35.00	210.00	2024-10-06 12:36:10
2657	1888	71	6	29.00	174.00	2024-10-06 12:36:10
2658	1889	105	4	15.00	60.00	2024-10-06 17:04:06
2659	1889	76	6	42.00	252.00	2024-10-06 17:04:06
2660	1889	64	1	37.00	37.00	2024-10-06 17:04:06
2661	1890	69	3	41.00	123.00	2024-10-07 04:43:13
2662	1891	73	8	23.00	184.00	2024-10-07 13:39:12
2663	1891	96	8	7.00	56.00	2024-10-07 13:39:12
2664	1891	62	3	13.00	39.00	2024-10-07 13:39:12
2665	1892	55	7	17.00	119.00	2024-10-07 14:20:03
2666	1892	58	3	9.00	27.00	2024-10-07 14:20:03
2667	1893	86	8	44.00	352.00	2024-10-08 01:28:57
2668	1893	66	4	47.00	188.00	2024-10-08 01:28:57
2669	1893	94	1	23.00	23.00	2024-10-08 01:28:57
2670	1893	77	5	32.00	160.00	2024-10-08 01:28:57
2671	1894	82	5	12.00	60.00	2024-10-08 07:53:13
2672	1894	90	3	20.00	60.00	2024-10-08 07:53:13
2673	1894	56	2	21.00	42.00	2024-10-08 07:53:13
2674	1895	57	6	43.00	258.00	2024-10-09 10:43:07
2675	1895	94	5	23.00	115.00	2024-10-09 10:43:07
2676	1895	99	8	20.00	160.00	2024-10-09 10:43:07
2677	1896	86	4	44.00	176.00	2024-10-10 23:10:50
2678	1897	74	7	37.00	259.00	2024-10-11 06:54:54
2679	1898	71	7	29.00	203.00	2024-10-11 17:40:02
2680	1898	64	7	37.00	259.00	2024-10-11 17:40:02
2681	1898	69	6	41.00	246.00	2024-10-11 17:40:02
2682	1898	97	8	34.00	272.00	2024-10-11 17:40:02
2683	1899	67	7	37.00	259.00	2024-10-12 02:22:43
2684	1900	91	4	10.00	40.00	2024-10-12 03:44:23
2685	1900	98	2	46.00	92.00	2024-10-12 03:44:23
2686	1900	82	1	12.00	12.00	2024-10-12 03:44:23
2687	1900	94	2	23.00	46.00	2024-10-12 03:44:23
2688	1900	95	6	13.00	78.00	2024-10-12 03:44:23
2689	1901	106	6	11.00	66.00	2024-10-12 08:56:53
2690	1901	60	1	48.00	48.00	2024-10-12 08:56:53
2691	1902	66	3	47.00	141.00	2024-10-12 10:24:53
2692	1902	60	5	48.00	240.00	2024-10-12 10:24:53
2693	1903	73	2	23.00	46.00	2024-10-12 19:05:34
2694	1903	104	7	37.00	259.00	2024-10-12 19:05:34
2695	1904	75	7	39.00	273.00	2024-10-14 02:19:28
2696	1904	97	2	34.00	68.00	2024-10-14 02:19:28
2697	1905	55	6	17.00	102.00	2024-10-14 16:34:19
2698	1905	56	3	21.00	63.00	2024-10-14 16:34:19
2699	1906	85	4	34.00	136.00	2024-10-15 03:33:54
2700	1906	59	8	2.00	16.00	2024-10-15 03:33:54
2701	1906	73	5	23.00	115.00	2024-10-15 03:33:54
2702	1906	76	4	42.00	168.00	2024-10-15 03:33:54
2703	1906	61	5	10.00	50.00	2024-10-15 03:33:54
2704	1907	102	7	38.00	266.00	2024-10-15 05:13:20
2705	1907	84	8	21.00	168.00	2024-10-15 05:13:20
2706	1908	70	6	23.00	138.00	2024-10-16 23:38:11
2707	1908	57	4	43.00	172.00	2024-10-16 23:38:11
2708	1908	53	4	47.00	188.00	2024-10-16 23:38:11
2709	1908	80	2	15.00	30.00	2024-10-16 23:38:11
2710	1909	77	3	32.00	96.00	2024-10-19 02:05:10
2711	1909	77	6	32.00	192.00	2024-10-19 02:05:10
2712	1910	60	2	48.00	96.00	2024-10-19 11:05:05
2713	1910	55	2	17.00	34.00	2024-10-19 11:05:05
2714	1910	82	4	12.00	48.00	2024-10-19 11:05:05
2715	1910	101	7	4.00	28.00	2024-10-19 11:05:05
2716	1911	91	7	10.00	70.00	2024-10-20 00:00:56
2717	1911	54	4	47.00	188.00	2024-10-20 00:00:56
2718	1911	82	7	12.00	84.00	2024-10-20 00:00:56
2719	1912	106	3	11.00	33.00	2024-10-20 07:43:53
2720	1912	71	1	29.00	29.00	2024-10-20 07:43:53
2721	1912	77	8	32.00	256.00	2024-10-20 07:43:53
2722	1912	104	1	37.00	37.00	2024-10-20 07:43:53
2723	1912	73	8	23.00	184.00	2024-10-20 07:43:53
2724	1913	61	7	10.00	70.00	2024-10-20 08:38:33
2725	1914	90	5	20.00	100.00	2024-10-20 20:39:55
2726	1914	84	7	21.00	147.00	2024-10-20 20:39:55
2727	1914	85	7	34.00	238.00	2024-10-20 20:39:55
2728	1915	95	4	13.00	52.00	2024-10-20 22:08:47
2729	1915	78	5	19.00	95.00	2024-10-20 22:08:47
2730	1915	78	5	19.00	95.00	2024-10-20 22:08:47
2731	1915	58	5	9.00	45.00	2024-10-20 22:08:47
2732	1915	61	4	10.00	40.00	2024-10-20 22:08:47
2733	1916	91	4	10.00	40.00	2024-10-22 10:32:11
2734	1917	92	7	33.00	231.00	2024-10-23 00:49:05
2735	1917	88	3	21.00	63.00	2024-10-23 00:49:05
2736	1917	62	5	13.00	65.00	2024-10-23 00:49:05
2737	1917	93	6	48.00	288.00	2024-10-23 00:49:05
2738	1917	66	7	47.00	329.00	2024-10-23 00:49:05
2739	1918	60	1	48.00	48.00	2024-10-23 11:33:33
2740	1918	96	2	7.00	14.00	2024-10-23 11:33:33
2741	1918	77	3	32.00	96.00	2024-10-23 11:33:33
2742	1918	92	8	33.00	264.00	2024-10-23 11:33:33
2743	1919	54	6	47.00	282.00	2024-10-25 10:13:48
2744	1919	76	5	42.00	210.00	2024-10-25 10:13:48
2745	1920	98	5	46.00	230.00	2024-10-26 16:02:42
2746	1920	102	4	38.00	152.00	2024-10-26 16:02:42
2747	1920	79	7	32.00	224.00	2024-10-26 16:02:42
2748	1920	84	1	21.00	21.00	2024-10-26 16:02:42
2749	1920	100	8	35.00	280.00	2024-10-26 16:02:42
2750	1921	82	2	12.00	24.00	2024-10-27 14:43:22
2751	1921	55	4	17.00	68.00	2024-10-27 14:43:22
2752	1922	92	5	33.00	165.00	2024-10-27 15:48:24
2753	1923	60	2	48.00	96.00	2024-10-27 18:09:56
2754	1923	79	6	32.00	192.00	2024-10-27 18:09:56
2755	1924	76	5	42.00	210.00	2024-10-28 00:24:03
2756	1924	55	5	17.00	85.00	2024-10-28 00:24:03
2757	1924	71	1	29.00	29.00	2024-10-28 00:24:03
2758	1924	99	6	20.00	120.00	2024-10-28 00:24:03
2759	1925	64	5	37.00	185.00	2024-10-28 01:01:38
2760	1925	64	7	37.00	259.00	2024-10-28 01:01:38
2761	1925	70	7	23.00	161.00	2024-10-28 01:01:38
2762	1926	87	4	7.00	28.00	2024-10-28 19:46:52
2763	1926	79	1	32.00	32.00	2024-10-28 19:46:52
2764	1926	82	3	12.00	36.00	2024-10-28 19:46:52
2765	1926	79	7	32.00	224.00	2024-10-28 19:46:52
2766	1926	62	6	13.00	78.00	2024-10-28 19:46:52
2767	1927	92	4	33.00	132.00	2024-10-30 09:32:44
2768	1927	55	7	17.00	119.00	2024-10-30 09:32:44
2769	1927	98	1	46.00	46.00	2024-10-30 09:32:44
2770	1927	83	8	23.00	184.00	2024-10-30 09:32:44
2771	1928	102	5	38.00	190.00	2024-10-30 16:07:28
2772	1928	96	1	7.00	7.00	2024-10-30 16:07:28
2773	1928	101	6	4.00	24.00	2024-10-30 16:07:28
2774	1928	79	4	32.00	128.00	2024-10-30 16:07:28
2775	1928	101	3	4.00	12.00	2024-10-30 16:07:28
2776	1929	94	6	23.00	138.00	2024-10-30 21:22:21
2777	1929	61	1	10.00	10.00	2024-10-30 21:22:21
2778	1929	59	7	2.00	14.00	2024-10-30 21:22:21
2779	1930	101	2	4.00	8.00	2024-10-31 09:11:25
2780	1930	99	5	20.00	100.00	2024-10-31 09:11:25
2781	1931	75	3	39.00	117.00	2024-10-31 21:56:26
2782	1931	72	1	11.00	11.00	2024-10-31 21:56:26
2783	1932	56	5	21.00	105.00	2024-11-02 09:48:22
2784	1932	53	2	47.00	94.00	2024-11-02 09:48:22
2785	1932	65	8	18.00	144.00	2024-11-02 09:48:22
2786	1932	106	6	11.00	66.00	2024-11-02 09:48:22
2787	1932	96	1	7.00	7.00	2024-11-02 09:48:22
2788	1933	89	1	6.00	6.00	2024-11-03 19:38:11
2789	1933	80	1	15.00	15.00	2024-11-03 19:38:11
2790	1933	78	8	19.00	152.00	2024-11-03 19:38:11
2791	1934	104	2	37.00	74.00	2024-11-05 22:45:28
2792	1934	70	3	23.00	69.00	2024-11-05 22:45:28
2793	1934	63	6	10.00	60.00	2024-11-05 22:45:28
2794	1935	74	6	37.00	222.00	2024-11-06 16:31:20
2795	1935	83	1	23.00	23.00	2024-11-06 16:31:20
2796	1935	96	6	7.00	42.00	2024-11-06 16:31:20
2797	1935	61	5	10.00	50.00	2024-11-06 16:31:20
2798	1935	63	3	10.00	30.00	2024-11-06 16:31:20
2799	1936	101	2	4.00	8.00	2024-11-08 12:42:11
2800	1936	65	3	18.00	54.00	2024-11-08 12:42:11
2801	1936	94	3	23.00	69.00	2024-11-08 12:42:11
2802	1937	75	3	39.00	117.00	2024-11-09 02:00:52
2803	1937	77	4	32.00	128.00	2024-11-09 02:00:52
2804	1937	72	8	11.00	88.00	2024-11-09 02:00:52
2805	1937	98	6	46.00	276.00	2024-11-09 02:00:52
2806	1937	101	3	4.00	12.00	2024-11-09 02:00:52
2807	1938	81	4	35.00	140.00	2024-11-10 08:53:39
2808	1938	60	3	48.00	144.00	2024-11-10 08:53:39
2809	1938	76	7	42.00	294.00	2024-11-10 08:53:39
2810	1938	56	2	21.00	42.00	2024-11-10 08:53:39
2811	1938	83	4	23.00	92.00	2024-11-10 08:53:39
2812	1939	77	8	32.00	256.00	2024-11-10 20:26:51
2813	1939	89	4	6.00	24.00	2024-11-10 20:26:51
2814	1939	58	8	9.00	72.00	2024-11-10 20:26:51
2815	1939	95	8	13.00	104.00	2024-11-10 20:26:51
2816	1939	53	1	47.00	47.00	2024-11-10 20:26:51
2817	1940	72	8	11.00	88.00	2024-11-11 00:18:51
2818	1940	65	7	18.00	126.00	2024-11-11 00:18:51
2819	1941	54	4	47.00	188.00	2024-11-11 01:33:38
2820	1941	72	6	11.00	66.00	2024-11-11 01:33:38
2821	1941	85	7	34.00	238.00	2024-11-11 01:33:38
2822	1941	68	2	33.00	66.00	2024-11-11 01:33:38
2823	1942	69	8	41.00	328.00	2024-11-11 11:40:20
2824	1942	89	1	6.00	6.00	2024-11-11 11:40:20
2825	1943	104	8	37.00	296.00	2024-11-11 20:07:44
2826	1943	78	1	19.00	19.00	2024-11-11 20:07:44
2827	1943	76	8	42.00	336.00	2024-11-11 20:07:44
2828	1943	91	3	10.00	30.00	2024-11-11 20:07:44
2829	1943	91	2	10.00	20.00	2024-11-11 20:07:44
2830	1944	101	6	4.00	24.00	2024-11-11 21:56:41
2831	1944	79	2	32.00	64.00	2024-11-11 21:56:41
2832	1944	74	5	37.00	185.00	2024-11-11 21:56:41
2833	1944	75	8	39.00	312.00	2024-11-11 21:56:41
2834	1945	76	8	42.00	336.00	2024-11-12 21:23:46
2835	1946	91	3	10.00	30.00	2024-11-13 16:25:39
2836	1946	90	3	20.00	60.00	2024-11-13 16:25:39
2837	1946	66	7	47.00	329.00	2024-11-13 16:25:39
2838	1946	68	5	33.00	165.00	2024-11-13 16:25:39
2839	1946	74	6	37.00	222.00	2024-11-13 16:25:39
2840	1947	80	6	15.00	90.00	2024-11-15 12:01:51
2841	1947	88	5	21.00	105.00	2024-11-15 12:01:51
2842	1947	87	7	7.00	49.00	2024-11-15 12:01:51
2843	1947	99	1	20.00	20.00	2024-11-15 12:01:51
2844	1947	104	1	37.00	37.00	2024-11-15 12:01:51
2845	1948	105	1	15.00	15.00	2024-11-16 01:24:51
2846	1948	63	8	10.00	80.00	2024-11-16 01:24:51
2847	1949	65	7	18.00	126.00	2024-11-16 03:14:23
2848	1949	77	1	32.00	32.00	2024-11-16 03:14:23
2849	1950	100	5	35.00	175.00	2024-11-16 03:37:03
2850	1950	69	2	41.00	82.00	2024-11-16 03:37:03
2851	1950	62	2	13.00	26.00	2024-11-16 03:37:03
2852	1951	56	5	21.00	105.00	2024-11-17 15:08:34
2853	1951	63	5	10.00	50.00	2024-11-17 15:08:34
2854	1951	80	5	15.00	75.00	2024-11-17 15:08:34
2855	1952	84	2	21.00	42.00	2024-11-18 21:10:33
2856	1952	93	6	48.00	288.00	2024-11-18 21:10:33
2857	1952	99	3	20.00	60.00	2024-11-18 21:10:33
2858	1953	85	6	34.00	204.00	2024-11-21 03:11:21
2859	1953	101	6	4.00	24.00	2024-11-21 03:11:21
2860	1953	95	8	13.00	104.00	2024-11-21 03:11:21
2861	1953	82	1	12.00	12.00	2024-11-21 03:11:21
2862	1953	54	7	47.00	329.00	2024-11-21 03:11:21
2863	1954	94	8	23.00	184.00	2024-11-22 04:05:32
2864	1954	77	5	32.00	160.00	2024-11-22 04:05:32
2865	1954	74	5	37.00	185.00	2024-11-22 04:05:32
2866	1955	92	4	33.00	132.00	2024-11-22 05:42:02
2867	1956	82	7	12.00	84.00	2024-11-22 14:21:55
2868	1956	87	5	7.00	35.00	2024-11-22 14:21:55
2869	1956	63	1	10.00	10.00	2024-11-22 14:21:55
2870	1956	84	3	21.00	63.00	2024-11-22 14:21:55
2871	1957	84	1	21.00	21.00	2024-11-23 01:30:34
2872	1957	72	6	11.00	66.00	2024-11-23 01:30:34
2873	1957	69	4	41.00	164.00	2024-11-23 01:30:34
2874	1957	76	6	42.00	252.00	2024-11-23 01:30:34
2875	1957	68	6	33.00	198.00	2024-11-23 01:30:34
2876	1958	86	1	44.00	44.00	2024-11-23 04:24:36
2877	1958	105	7	15.00	105.00	2024-11-23 04:24:36
2878	1959	99	3	20.00	60.00	2024-11-25 03:34:46
2879	1959	85	1	34.00	34.00	2024-11-25 03:34:46
2880	1960	76	2	42.00	84.00	2024-11-26 22:48:40
2881	1960	80	8	15.00	120.00	2024-11-26 22:48:40
2882	1961	69	5	41.00	205.00	2024-11-28 15:07:51
2883	1961	83	5	23.00	115.00	2024-11-28 15:07:51
2884	1961	94	8	23.00	184.00	2024-11-28 15:07:51
2885	1961	57	5	43.00	215.00	2024-11-28 15:07:51
2886	1961	83	7	23.00	161.00	2024-11-28 15:07:51
2887	1962	76	8	42.00	336.00	2024-11-29 18:59:46
2888	1962	61	8	10.00	80.00	2024-11-29 18:59:46
2889	1962	62	4	13.00	52.00	2024-11-29 18:59:46
2890	1963	99	5	20.00	100.00	2024-11-30 05:59:39
2891	1963	79	2	32.00	64.00	2024-11-30 05:59:39
2892	1964	95	3	13.00	39.00	2024-11-30 06:25:46
2893	1965	69	6	41.00	246.00	2024-12-01 09:23:06
2894	1965	62	2	13.00	26.00	2024-12-01 09:23:06
2895	1965	94	5	23.00	115.00	2024-12-01 09:23:06
2896	1965	100	6	35.00	210.00	2024-12-01 09:23:06
2897	1966	92	6	33.00	198.00	2024-12-02 06:57:33
2898	1967	90	4	20.00	80.00	2024-12-02 08:42:23
2899	1967	71	2	29.00	58.00	2024-12-02 08:42:23
2900	1967	85	6	34.00	204.00	2024-12-02 08:42:23
2901	1967	58	7	9.00	63.00	2024-12-02 08:42:23
2902	1967	55	5	17.00	85.00	2024-12-02 08:42:23
2903	1968	78	3	19.00	57.00	2024-12-02 10:48:18
2904	1969	88	3	21.00	63.00	2024-12-04 02:46:52
2905	1969	94	3	23.00	69.00	2024-12-04 02:46:52
2906	1969	73	4	23.00	92.00	2024-12-04 02:46:52
2907	1970	58	7	9.00	63.00	2024-12-04 11:50:21
2908	1970	83	3	23.00	69.00	2024-12-04 11:50:21
2909	1970	84	4	21.00	84.00	2024-12-04 11:50:21
2910	1970	88	4	21.00	84.00	2024-12-04 11:50:21
2911	1970	53	2	47.00	94.00	2024-12-04 11:50:21
2912	1971	91	6	10.00	60.00	2024-12-04 16:59:57
2913	1971	67	3	37.00	111.00	2024-12-04 16:59:57
2914	1971	105	2	15.00	30.00	2024-12-04 16:59:57
2915	1972	106	5	11.00	55.00	2024-12-05 01:23:29
2916	1973	82	8	12.00	96.00	2024-12-05 21:41:20
2917	1974	88	2	21.00	42.00	2024-12-06 08:03:06
2918	1975	70	3	23.00	69.00	2024-12-07 11:29:32
2919	1975	106	1	11.00	11.00	2024-12-07 11:29:32
2920	1975	71	1	29.00	29.00	2024-12-07 11:29:32
2921	1975	69	4	41.00	164.00	2024-12-07 11:29:32
2922	1976	98	4	46.00	184.00	2024-12-07 18:15:55
2923	1976	104	6	37.00	222.00	2024-12-07 18:15:55
2924	1977	83	3	23.00	69.00	2024-12-08 14:21:06
2925	1978	71	2	29.00	58.00	2024-12-09 04:20:32
2926	1979	100	3	35.00	105.00	2024-12-10 08:26:53
2927	1979	71	2	29.00	58.00	2024-12-10 08:26:53
2928	1979	54	7	47.00	329.00	2024-12-10 08:26:53
2929	1979	96	3	7.00	21.00	2024-12-10 08:26:53
2930	1980	95	2	13.00	26.00	2024-12-10 08:41:32
2931	1981	105	5	15.00	75.00	2024-12-11 06:08:10
2932	1981	59	1	2.00	2.00	2024-12-11 06:08:10
2933	1981	92	6	33.00	198.00	2024-12-11 06:08:10
2934	1981	89	7	6.00	42.00	2024-12-11 06:08:10
2935	1981	72	1	11.00	11.00	2024-12-11 06:08:10
2936	1982	87	2	7.00	14.00	2024-12-11 10:00:41
2937	1982	74	5	37.00	185.00	2024-12-11 10:00:41
2938	1983	78	6	19.00	114.00	2024-12-12 20:25:41
2939	1983	62	1	13.00	13.00	2024-12-12 20:25:41
2940	1983	96	4	7.00	28.00	2024-12-12 20:25:41
2941	1983	78	7	19.00	133.00	2024-12-12 20:25:41
2942	1984	76	7	42.00	294.00	2024-12-13 09:13:52
2943	1984	73	8	23.00	184.00	2024-12-13 09:13:52
2944	1984	100	4	35.00	140.00	2024-12-13 09:13:52
2945	1985	104	2	37.00	74.00	2024-12-14 02:57:27
2946	1985	71	5	29.00	145.00	2024-12-14 02:57:27
2947	1986	80	5	15.00	75.00	2024-12-18 15:19:47
2948	1986	77	7	32.00	224.00	2024-12-18 15:19:47
2949	1986	92	8	33.00	264.00	2024-12-18 15:19:47
2950	1986	86	6	44.00	264.00	2024-12-18 15:19:47
2951	1987	92	7	33.00	231.00	2024-12-19 12:45:19
2952	1987	70	6	23.00	138.00	2024-12-19 12:45:19
2953	1987	81	2	35.00	70.00	2024-12-19 12:45:19
2954	1987	82	4	12.00	48.00	2024-12-19 12:45:19
2955	1988	60	6	48.00	288.00	2024-12-21 09:42:03
2956	1988	53	2	47.00	94.00	2024-12-21 09:42:03
2957	1988	62	5	13.00	65.00	2024-12-21 09:42:03
2958	1988	76	5	42.00	210.00	2024-12-21 09:42:03
2959	1988	53	7	47.00	329.00	2024-12-21 09:42:03
2960	1989	81	1	35.00	35.00	2024-12-21 10:33:32
2961	1990	59	8	2.00	16.00	2024-12-21 15:14:27
2962	1990	87	5	7.00	35.00	2024-12-21 15:14:27
2963	1991	78	1	19.00	19.00	2024-12-21 15:59:51
2964	1991	56	1	21.00	21.00	2024-12-21 15:59:51
2965	1992	85	5	34.00	170.00	2024-12-21 17:55:01
2966	1992	90	4	20.00	80.00	2024-12-21 17:55:01
2967	1992	105	3	15.00	45.00	2024-12-21 17:55:01
2968	1992	68	4	33.00	132.00	2024-12-21 17:55:01
2969	1993	98	5	46.00	230.00	2024-12-22 06:58:31
2970	1993	55	7	17.00	119.00	2024-12-22 06:58:31
2971	1993	90	8	20.00	160.00	2024-12-22 06:58:31
2972	1993	102	3	38.00	114.00	2024-12-22 06:58:31
2973	1993	66	6	47.00	282.00	2024-12-22 06:58:31
2974	1994	68	4	33.00	132.00	2024-12-22 14:43:16
2975	1994	90	6	20.00	120.00	2024-12-22 14:43:16
2976	1994	99	8	20.00	160.00	2024-12-22 14:43:16
2977	1994	79	6	32.00	192.00	2024-12-22 14:43:16
2978	1994	81	8	35.00	280.00	2024-12-22 14:43:16
2979	1995	106	2	11.00	22.00	2024-12-22 18:38:13
2980	1995	80	3	15.00	45.00	2024-12-22 18:38:13
2981	1996	71	6	29.00	174.00	2024-12-23 06:56:06
2982	1996	88	2	21.00	42.00	2024-12-23 06:56:06
2983	1996	105	4	15.00	60.00	2024-12-23 06:56:06
2984	1997	61	1	10.00	10.00	2024-12-24 01:56:56
2985	1997	56	5	21.00	105.00	2024-12-24 01:56:56
2986	1997	73	5	23.00	115.00	2024-12-24 01:56:56
2987	1997	77	7	32.00	224.00	2024-12-24 01:56:56
2988	1997	103	4	19.00	76.00	2024-12-24 01:56:56
2989	1998	95	6	13.00	78.00	2024-12-25 02:44:13
2990	1998	96	5	7.00	35.00	2024-12-25 02:44:13
2991	1998	105	4	15.00	60.00	2024-12-25 02:44:13
2992	1998	81	4	35.00	140.00	2024-12-25 02:44:13
2993	1999	88	4	21.00	84.00	2024-12-25 11:30:53
2994	1999	56	2	21.00	42.00	2024-12-25 11:30:53
2995	1999	72	6	11.00	66.00	2024-12-25 11:30:53
2996	1999	76	8	42.00	336.00	2024-12-25 11:30:53
2997	1999	64	4	37.00	148.00	2024-12-25 11:30:53
2998	2000	68	5	33.00	165.00	2024-12-25 21:59:47
2999	2001	69	7	41.00	287.00	2024-12-25 22:00:58
3000	2002	62	2	13.00	26.00	2024-12-25 22:57:27
3001	2002	101	1	4.00	4.00	2024-12-25 22:57:27
3002	2003	56	7	21.00	147.00	2024-12-27 21:29:08
3003	2003	69	2	41.00	82.00	2024-12-27 21:29:08
3004	2003	98	6	46.00	276.00	2024-12-27 21:29:08
3005	2004	106	1	11.00	11.00	2024-12-28 05:23:37
3006	2005	80	6	15.00	90.00	2024-12-28 10:25:58
3007	2005	97	1	34.00	34.00	2024-12-28 10:25:58
3008	2006	54	1	47.00	47.00	2024-12-28 18:07:26
3009	2006	91	6	10.00	60.00	2024-12-28 18:07:26
3010	2006	59	7	2.00	14.00	2024-12-28 18:07:26
3011	2006	94	1	23.00	23.00	2024-12-28 18:07:26
3012	2006	74	4	37.00	148.00	2024-12-28 18:07:26
3013	2007	64	3	37.00	111.00	2024-12-29 02:28:20
3014	2008	70	3	23.00	69.00	2024-12-29 05:01:09
3015	2008	89	8	6.00	48.00	2024-12-29 05:01:09
3016	2008	69	4	41.00	164.00	2024-12-29 05:01:09
3017	2008	92	1	33.00	33.00	2024-12-29 05:01:09
3018	2009	83	8	23.00	184.00	2024-12-29 23:31:58
3019	2009	77	1	32.00	32.00	2024-12-29 23:31:58
3020	2009	100	3	35.00	105.00	2024-12-29 23:31:58
3021	2009	57	3	43.00	129.00	2024-12-29 23:31:58
3022	2010	93	4	48.00	192.00	2024-12-30 17:39:49
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, employee_id, customer_id, order_date, total_amount, payment_method, order_status, created_at) FROM stdin;
1484	29	\N	2023-12-04 15:41:20	442.00	Cash	Completed	2023-12-04 02:28:08
1798	66	542	2024-08-03 10:59:12	344.00	Cash	Completed	2024-08-03 15:33:09
1489	71	571	2023-12-13 12:11:13	465.00	Credit Card	Completed	2023-12-13 08:26:34
1269	71	\N	2023-07-14 23:06:02	292.00	Debit Card	Completed	2023-07-14 02:20:42
1989	57	680	2024-12-21 10:33:32	35.00	Cash	Completed	2024-12-21 14:49:27
1560	85	\N	2024-01-29 22:26:46	52.00	Credit Card	Completed	2024-01-29 07:33:15
1587	71	597	2024-02-19 09:39:22	192.00	ERROR	Completed	2024-02-19 22:37:28
1091	21	\N	2023-03-13 07:02:39	652.00	Debit Card	Completed	2023-03-13 07:45:12
1898	66	503	2024-10-11 17:40:02	980.00	Debit Card	Completed	2024-10-11 16:38:16
1075	52	\N	2023-02-27 11:43:50	73.00	Cash	Completed	2023-02-27 08:33:48
1108	13	\N	2023-03-25 18:17:31	304.00	ERROR	Completed	2023-03-25 03:28:33
1128	21	\N	2023-04-12 23:00:49	480.00	ERROR	Completed	2023-04-12 13:21:14
1284	32	551	2023-07-22 09:51:08	21.00	Debit Card	Completed	2023-07-22 11:16:08
1899	4	\N	2024-10-12 02:22:43	259.00	ERROR	Completed	2024-10-12 07:28:49
1691	71	660	2024-05-15 05:40:38	69.00	ERROR	Completed	2024-05-15 02:49:59
2009	71	559	2024-12-29 23:31:58	450.00	Debit Card	Completed	2024-12-29 19:02:28
1750	91	\N	2024-07-04 05:40:23	184.00	Debit Card	Completed	2024-07-04 04:59:16
1136	96	690	2023-04-20 05:12:45	646.00	ERROR	Completed	2023-04-20 05:30:06
1494	85	496	2023-12-17 01:02:52	14.00	Credit Card	Completed	2023-12-17 10:01:36
1831	50	\N	2024-08-26 05:23:14	598.00	Cash	Completed	2024-08-26 10:32:58
1003	4	640	2023-01-04 15:57:02	659.00	Debit Card	Completed	2023-01-04 03:30:54
1045	85	635	2023-01-27 22:01:19	376.00	ERROR	Completed	2023-01-27 02:35:35
1331	4	535	2023-08-28 01:06:13	247.00	Debit Card	Completed	2023-08-28 13:59:56
1307	50	600	2023-08-11 22:05:16	152.00	ERROR	Completed	2023-08-11 06:14:01
1552	4	536	2024-01-26 11:19:50	321.00	Credit Card	Completed	2024-01-26 03:45:18
1589	93	580	2024-02-20 01:24:23	342.00	Credit Card	Completed	2024-02-20 18:02:12
1883	6	580	2024-10-02 18:00:16	258.00	ERROR	Completed	2024-10-02 22:25:48
1558	66	666	2024-01-29 10:02:17	448.00	Cash	Completed	2024-01-29 05:49:01
1493	96	510	2023-12-16 14:08:25	137.00	Credit Card	Completed	2023-12-16 16:31:42
1811	13	\N	2024-08-11 09:53:33	21.00	ERROR	Completed	2024-08-11 05:03:00
1373	71	542	2023-09-20 19:48:41	92.00	Credit Card	Completed	2023-09-20 12:19:38
1175	38	659	2023-05-13 19:53:04	467.00	ERROR	Completed	2023-05-13 17:16:25
1268	97	520	2023-07-14 16:50:44	641.00	Debit Card	Completed	2023-07-14 00:37:44
1830	66	\N	2024-08-25 23:10:30	447.00	Cash	Completed	2024-08-25 13:33:09
1963	71	615	2024-11-30 05:59:39	164.00	Debit Card	Completed	2024-11-30 01:02:28
1018	91	653	2023-01-13 11:29:27	321.00	Debit Card	Completed	2023-01-13 09:37:59
1833	66	627	2024-08-28 20:47:07	149.00	Credit Card	Completed	2024-08-28 23:47:14
1263	66	632	2023-07-12 06:24:41	182.00	Credit Card	Completed	2023-07-12 21:28:18
1742	23	640	2024-06-27 10:27:58	316.00	Credit Card	Completed	2024-06-27 11:57:47
1682	97	\N	2024-05-08 08:06:44	420.00	Credit Card	Completed	2024-05-08 01:52:50
1431	50	\N	2023-10-22 16:06:18	427.00	Cash	Completed	2023-10-22 11:42:00
1595	52	659	2024-02-24 01:57:56	560.00	Debit Card	Completed	2024-02-24 17:48:51
1372	38	560	2023-09-19 01:48:57	389.00	Debit Card	Completed	2023-09-19 00:47:11
1289	73	\N	2023-07-25 15:12:53	152.00	Cash	Completed	2023-07-25 00:58:56
1422	73	\N	2023-10-16 22:33:04	390.00	Debit Card	Completed	2023-10-16 10:04:40
1415	85	503	2023-10-14 01:21:40	396.00	Credit Card	Completed	2023-10-14 18:40:55
1004	93	568	2023-01-04 18:34:18	68.00	Debit Card	Completed	2023-01-04 21:09:32
1313	52	693	2023-08-15 06:05:17	267.00	Debit Card	Completed	2023-08-15 11:53:09
1510	93	631	2023-12-28 23:07:48	112.00	Cash	Completed	2023-12-28 02:36:10
1749	23	\N	2024-07-02 03:56:23	91.00	Credit Card	Completed	2024-07-02 13:38:05
1368	66	607	2023-09-17 06:48:15	572.00	Credit Card	Completed	2023-09-17 13:29:18
2006	6	662	2024-12-28 18:07:26	292.00	ERROR	Completed	2024-12-28 15:41:01
1857	96	509	2024-09-14 23:55:12	401.00	Credit Card	Completed	2024-09-14 03:56:52
1262	32	539	2023-07-12 04:01:21	374.00	ERROR	Completed	2023-07-12 13:16:28
1692	29	580	2024-05-15 19:32:36	328.00	Debit Card	Completed	2024-05-15 03:37:18
1194	32	566	2023-05-22 20:11:42	364.00	ERROR	Completed	2023-05-22 00:49:29
1143	66	679	2023-04-23 18:20:47	421.00	ERROR	Completed	2023-04-23 12:09:24
1705	96	508	2024-05-26 09:59:43	341.00	ERROR	Completed	2024-05-26 18:14:18
1782	13	660	2024-07-26 04:20:13	68.00	Cash	Completed	2024-07-26 03:48:33
1463	93	631	2023-11-13 10:00:08	335.00	Debit Card	Completed	2023-11-13 20:53:58
1829	71	544	2024-08-24 09:07:01	48.00	Credit Card	Completed	2024-08-24 09:46:04
1550	38	645	2024-01-25 16:45:43	85.00	ERROR	Completed	2024-01-25 06:32:33
1287	71	514	2023-07-25 09:31:21	276.00	ERROR	Completed	2023-07-25 17:21:45
1162	38	522	2023-05-06 20:25:36	801.00	Cash	Completed	2023-05-06 18:59:53
1644	4	540	2024-04-04 17:13:40	472.00	Credit Card	Completed	2024-04-04 00:53:50
1841	91	\N	2024-09-04 18:46:47	67.00	ERROR	Completed	2024-09-04 16:30:53
1030	32	636	2023-01-19 03:01:46	215.00	Credit Card	Completed	2023-01-19 07:31:01
1694	4	594	2024-05-17 11:13:39	212.00	Credit Card	Completed	2024-05-17 16:08:43
1614	66	609	2024-03-12 12:19:47	536.00	Cash	Completed	2024-03-12 14:29:31
1239	4	507	2023-06-21 22:16:46	334.00	Cash	Completed	2023-06-21 02:36:10
1606	32	546	2024-03-05 16:17:48	713.00	Credit Card	Completed	2024-03-05 15:58:21
1312	50	492	2023-08-14 18:36:14	60.00	Cash	Completed	2023-08-14 06:10:31
1940	1	499	2024-11-11 00:18:51	214.00	Debit Card	Completed	2024-11-11 05:45:46
1984	4	593	2024-12-13 09:13:52	618.00	Debit Card	Completed	2024-12-13 14:28:20
1755	29	631	2024-07-09 22:38:38	88.00	Debit Card	Completed	2024-07-09 06:58:17
1913	57	\N	2024-10-20 08:38:33	70.00	Cash	Completed	2024-10-20 02:49:01
1602	81	\N	2024-03-03 12:29:37	519.00	Credit Card	Completed	2024-03-03 03:02:17
1278	23	\N	2023-07-20 07:45:46	462.00	Debit Card	Completed	2023-07-20 00:20:57
1662	81	605	2024-04-17 17:18:42	600.00	Credit Card	Completed	2024-04-17 00:54:24
1118	71	572	2023-04-05 23:03:59	606.00	Cash	Completed	2023-04-05 22:36:29
1990	50	672	2024-12-21 15:14:27	51.00	Credit Card	Completed	2024-12-21 05:50:06
1025	38	675	2023-01-17 09:58:35	814.00	Debit Card	Completed	2023-01-17 14:00:29
1007	19	601	2023-01-05 06:05:41	173.00	Debit Card	Completed	2023-01-05 16:17:34
1880	91	\N	2024-09-30 08:49:32	296.00	Debit Card	Completed	2024-09-30 05:49:24
1319	1	647	2023-08-18 11:00:13	139.00	ERROR	Completed	2023-08-18 03:54:54
1776	38	591	2024-07-24 02:16:24	746.00	ERROR	Completed	2024-07-24 05:24:24
1266	73	672	2023-07-14 07:10:35	60.00	Cash	Completed	2023-07-14 03:24:38
1104	96	\N	2023-03-21 21:15:55	264.00	Cash	Completed	2023-03-21 17:08:12
1922	52	\N	2024-10-27 15:48:24	165.00	ERROR	Completed	2024-10-27 23:44:07
1975	1	655	2024-12-07 11:29:32	273.00	Credit Card	Completed	2024-12-07 20:07:12
1936	57	632	2024-11-08 12:42:11	131.00	Debit Card	Completed	2024-11-08 14:41:19
1718	66	597	2024-06-11 22:59:52	385.00	Credit Card	Completed	2024-06-11 08:53:09
1603	81	597	2024-03-03 18:10:57	347.00	Debit Card	Completed	2024-03-03 09:46:49
1664	13	\N	2024-04-21 01:21:36	399.00	Debit Card	Completed	2024-04-21 20:29:38
1190	81	688	2023-05-21 14:47:28	133.00	ERROR	Completed	2023-05-21 23:12:19
1942	1	\N	2024-11-11 11:40:20	334.00	ERROR	Completed	2024-11-11 04:41:22
1992	52	682	2024-12-21 17:55:01	427.00	ERROR	Completed	2024-12-21 14:13:01
1920	29	506	2024-10-26 16:02:42	907.00	Debit Card	Completed	2024-10-26 21:50:04
1321	52	529	2023-08-20 20:27:14	546.00	Cash	Completed	2023-08-20 18:47:20
1078	4	615	2023-03-03 00:11:23	316.00	Debit Card	Cancelled	2023-03-03 19:55:59
1522	21	551	2024-01-06 16:56:29	509.00	ERROR	Completed	2024-01-06 18:50:47
1216	4	669	2023-06-08 11:31:09	270.00	ERROR	Completed	2023-06-08 03:37:16
1685	50	559	2024-05-09 18:11:21	252.00	Debit Card	Completed	2024-05-09 05:57:59
1049	13	\N	2023-02-05 16:26:34	699.00	ERROR	Completed	2023-02-05 14:25:34
1967	97	\N	2024-12-02 08:42:23	490.00	ERROR	Completed	2024-12-02 02:37:37
1279	29	586	2023-07-20 11:51:22	451.00	ERROR	Completed	2023-07-20 14:42:05
1786	85	676	2024-07-27 17:54:06	175.00	Credit Card	Completed	2024-07-27 11:12:52
1403	32	664	2023-10-10 09:46:31	95.00	Debit Card	Completed	2023-10-10 18:12:23
1006	13	649	2023-01-05 04:44:08	60.00	Cash	Completed	2023-01-05 20:45:45
1324	93	612	2023-08-26 04:54:49	69.00	Debit Card	Completed	2023-08-26 11:18:43
1008	38	\N	2023-01-07 05:36:03	138.00	Debit Card	Completed	2023-01-07 07:37:49
1098	38	562	2023-03-18 00:00:10	783.00	Credit Card	Completed	2023-03-18 15:41:26
1325	13	556	2023-08-26 19:31:32	36.00	ERROR	Completed	2023-08-26 20:26:31
1929	57	661	2024-10-30 21:22:21	162.00	Credit Card	Completed	2024-10-30 20:46:59
1548	52	597	2024-01-24 22:01:07	520.00	Cash	Completed	2024-01-24 13:13:11
1952	1	558	2024-11-18 21:10:33	390.00	Cash	Completed	2024-11-18 14:23:10
1679	6	499	2024-05-06 10:38:03	375.00	Cash	Completed	2024-05-06 07:31:14
1950	38	597	2024-11-16 03:37:03	283.00	Cash	Completed	2024-11-16 21:37:56
1507	97	597	2023-12-25 03:49:05	260.00	Credit Card	Completed	2023-12-25 16:11:24
1900	50	\N	2024-10-12 03:44:23	268.00	Cash	Completed	2024-10-12 12:31:21
1959	93	\N	2024-11-25 03:34:46	94.00	Credit Card	Completed	2024-11-25 16:37:45
1549	85	547	2024-01-25 04:27:09	77.00	Cash	Completed	2024-01-25 07:18:36
1907	13	538	2024-10-15 05:13:20	434.00	ERROR	Completed	2024-10-15 09:09:16
1762	71	\N	2024-07-16 05:40:21	603.00	ERROR	Completed	2024-07-16 06:30:06
1474	50	644	2023-11-20 10:46:02	259.00	Cash	Completed	2023-11-20 07:23:37
1616	19	658	2024-03-13 08:05:10	75.00	ERROR	Completed	2024-03-13 03:34:08
1613	1	\N	2024-03-11 17:58:42	185.00	ERROR	Completed	2024-03-11 06:30:34
1845	52	690	2024-09-05 21:00:42	462.00	Cash	Completed	2024-09-05 10:49:46
1800	66	518	2024-08-03 21:13:14	35.00	Credit Card	Completed	2024-08-03 15:30:15
1629	96	541	2024-03-26 01:58:08	72.00	Debit Card	Completed	2024-03-26 13:44:43
1828	32	\N	2024-08-23 09:42:53	272.00	Cash	Completed	2024-08-23 05:48:44
1779	38	\N	2024-07-24 22:23:34	269.00	Cash	Completed	2024-07-24 14:13:48
1009	6	535	2023-01-07 11:26:34	474.00	Cash	Completed	2023-01-07 05:05:23
1460	29	553	2023-11-12 07:48:02	969.00	ERROR	Completed	2023-11-12 19:38:29
1804	19	558	2024-08-08 07:32:26	280.00	Cash	Completed	2024-08-08 15:56:56
1546	57	\N	2024-01-23 01:46:55	206.00	ERROR	Completed	2024-01-23 12:18:16
1816	32	564	2024-08-16 07:43:23	460.00	Credit Card	Completed	2024-08-16 19:09:23
1349	1	\N	2023-09-06 04:20:47	282.00	ERROR	Completed	2023-09-06 06:50:24
1050	21	\N	2023-02-05 19:21:59	617.00	ERROR	Completed	2023-02-05 04:39:30
1708	81	660	2024-05-29 05:39:11	472.00	Debit Card	Completed	2024-05-29 11:25:15
1619	57	500	2024-03-17 05:05:57	224.00	Debit Card	Completed	2024-03-17 01:49:28
1836	96	637	2024-08-31 08:58:05	498.00	Debit Card	Completed	2024-08-31 00:36:20
1788	52	\N	2024-07-29 04:45:21	19.00	Credit Card	Completed	2024-07-29 20:46:28
1523	32	644	2024-01-08 10:16:09	147.00	Credit Card	Completed	2024-01-08 06:44:25
1877	21	560	2024-09-29 05:04:18	808.00	ERROR	Completed	2024-09-29 23:49:09
1815	23	661	2024-08-13 15:51:53	607.00	Cash	Completed	2024-08-13 17:03:51
1259	29	582	2023-07-11 13:38:38	2.00	Debit Card	Completed	2023-07-11 10:10:08
1044	73	\N	2023-01-27 11:16:51	666.00	Cash	Completed	2023-01-27 00:10:17
1062	6	647	2023-02-13 20:49:25	412.00	ERROR	Completed	2023-02-13 00:35:23
1458	73	587	2023-11-11 20:30:24	473.00	ERROR	Completed	2023-11-11 20:16:28
1823	85	645	2024-08-21 19:46:10	673.00	Debit Card	Completed	2024-08-21 16:36:47
1848	21	554	2024-09-06 19:18:44	241.00	ERROR	Completed	2024-09-06 11:03:13
1862	52	\N	2024-09-19 07:14:17	356.00	ERROR	Completed	2024-09-19 07:56:48
1535	52	613	2024-01-15 23:44:41	150.00	ERROR	Completed	2024-01-15 04:00:44
1697	71	\N	2024-05-22 04:09:41	466.00	Debit Card	Completed	2024-05-22 20:43:22
1285	66	556	2023-07-23 22:16:13	37.00	Credit Card	Completed	2023-07-23 01:57:13
1167	29	589	2023-05-08 12:02:26	723.00	Credit Card	Completed	2023-05-08 14:43:12
1583	29	668	2024-02-16 12:03:14	18.00	Debit Card	Completed	2024-02-16 05:48:19
1144	6	579	2023-04-24 00:02:01	365.00	Debit Card	Completed	2023-04-24 10:13:00
1924	96	585	2024-10-28 00:24:03	444.00	ERROR	Completed	2024-10-28 23:13:13
1585	19	\N	2024-02-17 18:21:23	308.00	ERROR	Completed	2024-02-17 13:44:53
1646	81	\N	2024-04-04 23:37:11	559.00	Debit Card	Completed	2024-04-04 00:04:35
1447	81	550	2023-11-05 11:18:22	1027.00	Credit Card	Completed	2023-11-05 14:25:36
1398	96	544	2023-10-08 03:42:04	386.00	ERROR	Completed	2023-10-08 03:14:24
1987	6	\N	2024-12-19 12:45:19	487.00	Cash	Completed	2024-12-19 14:51:06
1866	96	494	2024-09-23 14:20:13	435.00	Credit Card	Completed	2024-09-23 13:57:29
1022	23	\N	2023-01-16 08:12:19	308.00	Debit Card	Completed	2023-01-16 15:41:40
1336	13	640	2023-08-31 11:28:37	738.00	Cash	Completed	2023-08-31 22:43:57
1753	96	644	2024-07-05 20:41:58	215.00	ERROR	Completed	2024-07-05 14:40:13
1170	1	625	2023-05-10 05:24:03	178.00	Cash	Completed	2023-05-10 18:19:03
1371	57	537	2023-09-19 00:45:37	78.00	Credit Card	Completed	2023-09-19 05:22:18
1540	52	\N	2024-01-19 19:59:37	127.00	Cash	Completed	2024-01-19 19:19:41
1951	97	\N	2024-11-17 15:08:34	230.00	Cash	Completed	2024-11-17 05:47:12
1434	50	\N	2023-10-27 18:02:28	190.00	Credit Card	Completed	2023-10-27 23:34:05
1203	19	597	2023-05-28 13:05:06	646.00	ERROR	Completed	2023-05-28 05:15:55
1915	38	628	2024-10-20 22:08:47	327.00	Credit Card	Completed	2024-10-20 07:11:23
1250	85	660	2023-07-05 20:46:56	337.00	ERROR	Completed	2023-07-05 07:23:14
1966	4	\N	2024-12-02 06:57:33	198.00	Debit Card	Completed	2024-12-02 05:55:31
1378	57	587	2023-09-22 05:51:55	583.00	Debit Card	Completed	2023-09-22 00:07:56
1038	66	\N	2023-01-24 03:20:30	187.00	Credit Card	Completed	2023-01-24 00:46:23
1561	97	\N	2024-01-30 22:08:19	115.00	Debit Card	Completed	2024-01-30 00:01:00
1334	6	685	2023-08-30 08:12:09	406.00	ERROR	Completed	2023-08-30 14:20:18
1221	85	572	2023-06-10 11:12:18	843.00	Debit Card	Completed	2023-06-10 01:20:00
1227	21	\N	2023-06-15 04:58:00	287.00	Debit Card	Completed	2023-06-15 13:03:42
1923	50	\N	2024-10-27 18:09:56	288.00	Cash	Completed	2024-10-27 11:12:26
1780	57	521	2024-07-25 15:03:12	292.00	Cash	Completed	2024-07-25 22:18:00
1295	81	499	2023-07-30 16:24:16	296.00	Debit Card	Completed	2023-07-30 19:05:56
1126	71	\N	2023-04-12 03:48:16	353.00	ERROR	Completed	2023-04-12 17:57:34
1678	19	534	2024-05-05 22:45:00	524.00	Credit Card	Completed	2024-05-05 12:45:43
1217	23	\N	2023-06-08 19:03:57	342.00	Debit Card	Completed	2023-06-08 14:21:31
1249	91	675	2023-07-03 22:06:50	80.00	Cash	Completed	2023-07-03 01:22:17
1870	38	521	2024-09-24 16:08:24	372.00	Cash	Completed	2024-09-24 22:32:13
1774	19	636	2024-07-22 18:10:01	454.00	ERROR	Completed	2024-07-22 04:06:27
1747	73	641	2024-07-01 17:39:54	304.00	Credit Card	Completed	2024-07-01 02:56:07
1748	57	496	2024-07-02 02:13:25	66.00	ERROR	Completed	2024-07-02 03:11:11
1524	93	558	2024-01-08 14:28:03	60.00	Debit Card	Completed	2024-01-08 12:41:05
1411	50	524	2023-10-12 15:43:25	460.00	ERROR	Completed	2023-10-12 15:00:38
1229	73	652	2023-06-17 15:26:01	159.00	Credit Card	Completed	2023-06-17 04:49:46
1084	38	572	2023-03-08 19:56:26	356.00	Debit Card	Completed	2023-03-08 22:10:35
1681	50	\N	2024-05-07 20:13:47	66.00	Debit Card	Completed	2024-05-07 07:38:49
1956	29	\N	2024-11-22 14:21:55	192.00	ERROR	Completed	2024-11-22 12:34:08
2005	32	\N	2024-12-28 10:25:58	124.00	Debit Card	Completed	2024-12-28 21:16:14
1337	13	\N	2023-09-01 02:35:50	437.00	Credit Card	Completed	2023-09-01 13:29:22
1477	97	617	2023-11-28 01:09:54	522.00	ERROR	Completed	2023-11-28 03:17:35
1209	97	668	2023-06-02 05:47:09	450.00	ERROR	Completed	2023-06-02 02:33:00
1428	66	676	2023-10-21 09:35:35	194.00	Debit Card	Completed	2023-10-21 00:53:50
1151	57	508	2023-04-28 20:24:44	548.00	Cash	Completed	2023-04-28 20:11:24
1837	96	\N	2024-08-31 11:10:57	573.00	Debit Card	Completed	2024-08-31 16:06:11
1569	13	526	2024-02-08 12:50:28	146.00	ERROR	Completed	2024-02-08 20:38:53
1185	13	610	2023-05-20 02:07:04	335.00	ERROR	Completed	2023-05-20 18:28:38
1674	91	570	2024-05-02 23:26:49	324.00	Credit Card	Completed	2024-05-02 08:27:20
1265	91	691	2023-07-13 03:21:52	806.00	Credit Card	Completed	2023-07-13 02:50:46
1793	23	633	2024-07-31 23:42:29	815.00	Credit Card	Completed	2024-07-31 13:43:47
1986	13	562	2024-12-18 15:19:47	827.00	ERROR	Completed	2024-12-18 09:47:19
1101	57	638	2023-03-21 13:15:54	148.00	Debit Card	Completed	2023-03-21 17:03:24
1048	93	675	2023-02-01 08:40:09	797.00	Credit Card	Completed	2023-02-01 18:33:39
1995	29	520	2024-12-22 18:38:13	67.00	Credit Card	Cancelled	2024-12-22 14:07:48
1620	32	537	2024-03-21 18:02:33	396.00	Debit Card	Completed	2024-03-21 10:24:05
1770	19	506	2024-07-19 19:44:43	383.00	Debit Card	Completed	2024-07-19 06:32:01
1570	57	\N	2024-02-09 00:02:18	217.00	Credit Card	Completed	2024-02-09 17:00:12
1887	97	619	2024-10-06 05:17:00	563.00	Cash	Completed	2024-10-06 17:36:26
1146	57	625	2023-04-24 18:27:02	300.00	Debit Card	Completed	2023-04-24 12:21:58
1544	91	524	2024-01-22 04:49:11	207.00	Credit Card	Completed	2024-01-22 20:25:31
1215	85	669	2023-06-07 17:31:31	242.00	Debit Card	Completed	2023-06-07 17:57:31
1632	52	655	2024-03-28 22:21:04	95.00	Debit Card	Completed	2024-03-28 07:31:41
1210	6	\N	2023-06-02 08:45:51	252.00	Cash	Completed	2023-06-02 08:10:06
1665	71	615	2024-04-21 04:25:48	221.00	Cash	Completed	2024-04-21 10:21:46
1476	97	653	2023-11-28 00:02:07	506.00	ERROR	Completed	2023-11-28 02:06:52
1727	81	\N	2024-06-18 01:34:48	421.00	Cash	Completed	2024-06-18 08:41:32
1296	1	611	2023-07-30 17:44:33	168.00	ERROR	Completed	2023-07-30 14:45:55
1238	29	645	2023-06-21 13:08:58	288.00	ERROR	Completed	2023-06-21 08:10:21
1792	4	630	2024-07-31 06:53:46	335.00	ERROR	Completed	2024-07-31 11:15:45
1354	93	681	2023-09-09 10:03:51	241.00	Debit Card	Completed	2023-09-09 19:52:57
1808	1	625	2024-08-10 13:11:57	438.00	Debit Card	Completed	2024-08-10 01:01:02
1120	91	675	2023-04-08 13:02:45	306.00	Debit Card	Completed	2023-04-08 05:25:23
1976	4	543	2024-12-07 18:15:55	406.00	Debit Card	Completed	2024-12-07 20:11:02
1574	85	564	2024-02-10 13:57:35	373.00	Cash	Completed	2024-02-10 04:39:02
1257	38	509	2023-07-10 22:40:25	707.00	ERROR	Completed	2023-07-10 00:58:33
1283	6	572	2023-07-22 03:43:00	211.00	Credit Card	Completed	2023-07-22 09:01:04
1503	91	646	2023-12-23 14:51:50	292.00	Credit Card	Completed	2023-12-23 22:31:49
1645	32	517	2024-04-04 18:10:38	564.00	ERROR	Completed	2024-04-04 23:46:14
1306	52	650	2023-08-11 13:45:36	532.00	Debit Card	Completed	2023-08-11 12:46:10
1961	38	500	2024-11-28 15:07:51	880.00	Credit Card	Completed	2024-11-28 21:22:45
1666	52	671	2024-04-21 19:21:53	559.00	ERROR	Completed	2024-04-21 06:19:02
1910	93	531	2024-10-19 11:05:05	206.00	Cash	Completed	2024-10-19 05:42:17
1179	50	610	2023-05-15 17:39:43	511.00	ERROR	Completed	2023-05-15 11:15:52
1847	66	639	2024-09-06 07:52:41	10.00	Debit Card	Completed	2024-09-06 23:19:46
1253	93	\N	2023-07-07 20:30:46	69.00	Credit Card	Completed	2023-07-07 01:23:28
1700	66	526	2024-05-23 06:24:03	284.00	Debit Card	Completed	2024-05-23 11:22:50
1713	97	\N	2024-06-03 02:24:49	65.00	ERROR	Completed	2024-06-03 19:05:20
1145	50	631	2023-04-24 01:42:07	229.00	Credit Card	Completed	2023-04-24 02:13:24
1791	57	581	2024-07-30 17:20:21	482.00	ERROR	Completed	2024-07-30 10:04:59
1810	13	574	2024-08-11 05:01:12	206.00	Cash	Completed	2024-08-11 09:20:35
1733	81	\N	2024-06-22 05:10:24	136.00	Cash	Completed	2024-06-22 05:52:51
1974	4	542	2024-12-06 08:03:06	42.00	Debit Card	Completed	2024-12-06 12:34:11
1977	57	509	2024-12-08 14:21:06	69.00	Debit Card	Completed	2024-12-08 11:52:15
1711	73	\N	2024-05-30 21:38:39	111.00	Debit Card	Completed	2024-05-30 02:25:19
1856	71	601	2024-09-14 18:16:08	322.00	Credit Card	Completed	2024-09-14 19:08:50
1627	1	679	2024-03-25 12:52:37	193.00	Debit Card	Completed	2024-03-25 00:52:44
1226	52	\N	2023-06-13 04:38:28	4.00	Credit Card	Completed	2023-06-13 07:14:43
1767	32	523	2024-07-19 11:31:47	748.00	Cash	Completed	2024-07-19 03:18:28
1615	29	\N	2024-03-13 01:53:54	352.00	Debit Card	Completed	2024-03-13 23:00:57
1272	73	\N	2023-07-17 11:36:32	261.00	ERROR	Completed	2023-07-17 22:40:28
1563	21	660	2024-02-01 10:32:44	288.00	Cash	Completed	2024-02-01 15:29:54
1248	23	\N	2023-07-03 06:13:43	57.00	Cash	Completed	2023-07-03 07:11:23
1567	73	652	2024-02-08 09:11:56	26.00	ERROR	Completed	2024-02-08 05:33:53
1219	50	\N	2023-06-10 06:05:43	287.00	Credit Card	Completed	2023-06-10 21:23:38
1564	13	\N	2024-02-03 16:05:07	393.00	Debit Card	Completed	2024-02-03 01:23:26
1397	57	618	2023-10-07 06:56:26	708.00	ERROR	Completed	2023-10-07 00:52:28
1827	93	503	2024-08-23 06:16:36	433.00	ERROR	Completed	2024-08-23 12:57:17
1844	71	573	2024-09-05 18:54:36	556.00	Cash	Completed	2024-09-05 21:49:06
1579	29	682	2024-02-13 07:35:58	364.00	Debit Card	Completed	2024-02-13 09:13:44
1571	73	525	2024-02-09 00:58:13	60.00	Cash	Completed	2024-02-09 21:45:10
1565	85	516	2024-02-04 03:48:41	198.00	Debit Card	Completed	2024-02-04 05:42:58
1668	96	530	2024-04-25 06:02:56	421.00	ERROR	Completed	2024-04-25 10:34:51
1036	66	\N	2023-01-22 08:43:34	854.00	Cash	Completed	2023-01-22 00:56:37
1301	38	608	2023-08-04 23:31:47	314.00	Credit Card	Completed	2023-08-04 23:25:43
1928	66	\N	2024-10-30 16:07:28	361.00	Credit Card	Completed	2024-10-30 11:51:17
1878	32	638	2024-09-29 05:15:43	63.00	Cash	Completed	2024-09-29 18:05:45
1057	23	558	2023-02-10 02:29:32	336.00	Credit Card	Completed	2023-02-10 17:13:50
1467	91	493	2023-11-16 06:46:01	384.00	Cash	Completed	2023-11-16 14:10:11
1046	1	652	2023-01-30 07:24:55	77.00	Cash	Completed	2023-01-30 16:18:24
1328	81	553	2023-08-27 06:03:09	127.00	Credit Card	Completed	2023-08-27 09:35:29
1932	6	579	2024-11-02 09:48:22	416.00	Credit Card	Completed	2024-11-02 05:21:37
1771	96	653	2024-07-19 20:14:56	36.00	Debit Card	Completed	2024-07-19 05:05:33
1938	71	542	2024-11-10 08:53:39	712.00	Cash	Completed	2024-11-10 06:55:14
1161	71	678	2023-05-06 16:13:29	223.00	ERROR	Completed	2023-05-06 10:36:13
1016	96	622	2023-01-10 15:36:46	275.00	Cash	Completed	2023-01-10 16:00:51
1911	96	\N	2024-10-20 00:00:56	342.00	Debit Card	Completed	2024-10-20 22:35:45
1647	1	616	2024-04-05 15:35:11	267.00	Credit Card	Completed	2024-04-05 01:32:57
1684	19	\N	2024-05-09 16:11:07	126.00	Debit Card	Completed	2024-05-09 04:37:48
1015	71	627	2023-01-09 11:37:45	308.00	ERROR	Completed	2023-01-09 12:11:28
1661	85	506	2024-04-17 15:38:22	338.00	Cash	Completed	2024-04-17 01:50:45
1944	38	582	2024-11-11 21:56:41	585.00	Debit Card	Completed	2024-11-11 12:08:17
1218	91	509	2023-06-10 01:47:24	41.00	Credit Card	Completed	2023-06-10 18:31:10
1639	97	522	2024-04-02 11:33:12	611.00	Credit Card	Completed	2024-04-02 19:39:19
1495	32	502	2023-12-17 07:19:21	139.00	Debit Card	Completed	2023-12-17 19:52:24
1021	4	565	2023-01-15 18:16:34	201.00	ERROR	Completed	2023-01-15 11:47:58
1165	32	672	2023-05-07 16:31:19	63.00	Debit Card	Completed	2023-05-07 15:44:28
1077	32	\N	2023-03-01 03:39:10	549.00	Cash	Completed	2023-03-01 11:49:36
1608	66	530	2024-03-06 11:47:54	69.00	Credit Card	Completed	2024-03-06 19:25:01
1896	50	677	2024-10-10 23:10:50	176.00	ERROR	Completed	2024-10-10 17:30:32
1281	73	524	2023-07-21 14:56:26	492.00	ERROR	Completed	2023-07-21 09:24:41
1247	21	546	2023-07-02 14:33:10	196.00	Credit Card	Completed	2023-07-02 20:29:24
1429	1	514	2023-10-21 16:10:38	684.00	ERROR	Completed	2023-10-21 05:59:29
1409	66	\N	2023-10-12 11:14:44	107.00	Cash	Completed	2023-10-12 06:17:08
1427	6	557	2023-10-21 02:37:03	24.00	Cash	Completed	2023-10-21 02:50:22
1658	29	500	2024-04-15 05:51:14	282.00	Cash	Completed	2024-04-15 17:57:51
1173	4	608	2023-05-12 11:06:51	661.00	Credit Card	Completed	2023-05-12 23:51:41
1622	1	655	2024-03-23 04:57:04	63.00	Debit Card	Completed	2024-03-23 18:58:22
1261	4	550	2023-07-12 00:33:16	644.00	Debit Card	Completed	2023-07-12 21:59:40
1508	66	\N	2023-12-25 12:35:24	224.00	Cash	Completed	2023-12-25 10:36:55
1557	52	627	2024-01-29 01:17:34	4.00	Cash	Completed	2024-01-29 20:25:53
1406	93	494	2023-10-11 03:13:48	574.00	Credit Card	Completed	2023-10-11 02:17:03
1741	1	\N	2024-06-27 05:57:48	303.00	Cash	Completed	2024-06-27 16:50:53
1849	38	616	2024-09-06 23:58:03	416.00	Cash	Completed	2024-09-06 00:56:25
1149	96	533	2023-04-26 11:21:03	9.00	Cash	Completed	2023-04-26 01:38:53
1370	52	681	2023-09-18 15:39:06	380.00	Debit Card	Completed	2023-09-18 04:11:57
1914	73	608	2024-10-20 20:39:55	485.00	ERROR	Completed	2024-10-20 00:50:29
1115	50	634	2023-04-04 07:29:26	556.00	Credit Card	Completed	2023-04-04 13:06:28
1993	1	546	2024-12-22 06:58:31	905.00	ERROR	Completed	2024-12-22 21:42:35
1401	21	559	2023-10-08 18:18:21	631.00	ERROR	Completed	2023-10-08 17:54:59
1383	93	603	2023-09-26 15:04:31	374.00	Cash	Completed	2023-09-26 21:04:14
1199	19	650	2023-05-25 09:48:30	384.00	Cash	Completed	2023-05-25 11:41:48
1345	19	\N	2023-09-04 21:09:45	415.00	Cash	Completed	2023-09-04 08:39:24
1316	85	633	2023-08-15 17:17:19	108.00	ERROR	Completed	2023-08-15 03:26:10
1086	21	597	2023-03-09 21:59:32	520.00	Debit Card	Completed	2023-03-09 23:38:26
1513	6	639	2024-01-02 02:12:36	265.00	Credit Card	Completed	2024-01-02 08:27:37
1871	81	616	2024-09-25 11:54:45	13.00	ERROR	Completed	2024-09-25 21:08:40
1286	23	602	2023-07-24 01:50:24	239.00	Cash	Completed	2023-07-24 01:32:28
1757	38	603	2024-07-11 01:03:00	292.00	Cash	Completed	2024-07-11 06:41:32
1529	96	\N	2024-01-10 08:32:46	33.00	ERROR	Completed	2024-01-10 17:22:30
1153	4	\N	2023-04-30 16:30:25	681.00	ERROR	Completed	2023-04-30 14:08:42
1137	1	\N	2023-04-20 09:06:23	382.00	Cash	Completed	2023-04-20 11:31:09
1097	57	542	2023-03-16 17:07:02	407.00	Debit Card	Completed	2023-03-16 13:19:08
1374	19	510	2023-09-21 04:25:10	390.00	ERROR	Completed	2023-09-21 18:07:53
1744	85	600	2024-06-30 21:00:09	69.00	ERROR	Completed	2024-06-30 03:11:48
1264	52	573	2023-07-12 17:58:43	228.00	Debit Card	Completed	2023-07-12 01:01:54
2010	57	534	2024-12-30 17:39:49	192.00	ERROR	Completed	2024-12-30 03:16:41
1309	50	547	2023-08-12 12:42:17	551.00	Debit Card	Completed	2023-08-12 04:54:27
1142	50	664	2023-04-23 18:13:17	872.00	Cash	Completed	2023-04-23 03:31:21
1047	13	498	2023-02-01 01:42:21	33.00	Cash	Completed	2023-02-01 22:40:36
1178	96	626	2023-05-14 22:03:46	65.00	ERROR	Completed	2023-05-14 04:14:23
1083	38	523	2023-03-08 15:11:35	303.00	ERROR	Completed	2023-03-08 12:45:24
1949	71	\N	2024-11-16 03:14:23	158.00	Credit Card	Completed	2024-11-16 02:03:24
1675	73	642	2024-05-03 11:01:39	307.00	ERROR	Completed	2024-05-03 06:50:46
1864	81	\N	2024-09-21 13:19:02	74.00	Cash	Completed	2024-09-21 20:13:50
1154	96	\N	2023-05-01 14:19:48	56.00	Credit Card	Completed	2023-05-01 15:41:13
1888	97	\N	2024-10-06 12:36:10	615.00	ERROR	Completed	2024-10-06 22:41:57
1917	19	692	2024-10-23 00:49:05	976.00	Debit Card	Completed	2024-10-23 21:19:01
1663	21	589	2024-04-19 22:22:17	68.00	Debit Card	Completed	2024-04-19 13:15:00
1998	32	586	2024-12-25 02:44:13	313.00	Debit Card	Completed	2024-12-25 10:17:49
1356	13	666	2023-09-09 15:14:24	918.00	Debit Card	Completed	2023-09-09 06:15:07
1451	93	\N	2023-11-07 03:15:40	444.00	ERROR	Completed	2023-11-07 01:02:35
2007	52	584	2024-12-29 02:28:20	111.00	Cash	Completed	2024-12-29 11:45:55
1099	91	528	2023-03-18 00:40:29	105.00	Cash	Completed	2023-03-18 14:56:18
1927	96	\N	2024-10-30 09:32:44	481.00	ERROR	Completed	2024-10-30 12:07:50
1246	85	554	2023-07-01 09:26:22	171.00	ERROR	Completed	2023-07-01 06:09:47
1382	52	\N	2023-09-26 06:26:18	516.00	Debit Card	Completed	2023-09-26 22:11:20
1893	71	500	2024-10-08 01:28:57	723.00	Cash	Completed	2024-10-08 04:46:49
1206	4	588	2023-06-01 01:52:53	307.00	Cash	Completed	2023-06-01 16:02:56
1852	73	538	2024-09-10 07:10:04	47.00	Debit Card	Completed	2024-09-10 11:21:34
1200	85	\N	2023-05-25 19:44:21	568.00	Cash	Completed	2023-05-25 23:18:21
1937	21	596	2024-11-09 02:00:52	621.00	Cash	Completed	2024-11-09 14:53:04
1010	13	594	2023-01-07 13:52:53	565.00	Credit Card	Completed	2023-01-07 19:19:06
1775	50	620	2024-07-23 13:00:05	330.00	Cash	Completed	2024-07-23 01:10:03
1690	52	501	2024-05-13 15:42:47	170.00	Credit Card	Completed	2024-05-13 02:36:23
1556	91	\N	2024-01-28 10:48:16	245.00	Cash	Completed	2024-01-28 10:38:19
1310	52	524	2023-08-13 18:27:07	784.00	Cash	Completed	2023-08-13 14:26:48
1630	29	\N	2024-03-26 13:56:18	77.00	Debit Card	Completed	2024-03-26 20:36:30
1693	52	566	2024-05-16 19:05:16	897.00	Debit Card	Completed	2024-05-16 18:03:29
1592	19	679	2024-02-21 06:37:17	258.00	Debit Card	Completed	2024-02-21 08:59:39
1135	23	680	2023-04-18 20:19:51	684.00	Cash	Completed	2023-04-18 23:51:46
1205	85	\N	2023-05-31 00:11:48	451.00	ERROR	Completed	2023-05-31 13:07:40
1156	97	537	2023-05-01 16:54:43	191.00	Credit Card	Completed	2023-05-01 12:58:57
1935	1	512	2024-11-06 16:31:20	367.00	ERROR	Completed	2024-11-06 09:15:03
1395	57	578	2023-10-05 06:08:57	262.00	Credit Card	Completed	2023-10-05 11:42:46
1861	32	\N	2024-09-18 23:48:06	289.00	Credit Card	Completed	2024-09-18 01:16:04
1092	32	573	2023-03-13 14:31:27	352.00	Cash	Completed	2023-03-13 14:33:43
1472	73	551	2023-11-19 08:05:34	226.00	Debit Card	Completed	2023-11-19 21:33:08
1414	97	647	2023-10-13 10:56:43	658.00	ERROR	Completed	2023-10-13 06:56:05
1234	81	656	2023-06-19 04:30:03	20.00	Debit Card	Completed	2023-06-19 05:05:37
1056	81	525	2023-02-09 01:42:16	208.00	Debit Card	Completed	2023-02-09 15:55:08
1953	96	654	2024-11-21 03:11:21	673.00	ERROR	Completed	2024-11-21 21:11:54
1471	29	611	2023-11-19 03:07:05	287.00	Cash	Completed	2023-11-19 18:26:16
1106	73	570	2023-03-24 10:37:09	520.00	Credit Card	Completed	2023-03-24 15:23:05
1886	96	533	2024-10-05 13:43:34	426.00	ERROR	Completed	2024-10-05 20:53:14
1052	96	551	2023-02-07 18:22:14	607.00	Cash	Completed	2023-02-07 15:03:10
1413	57	505	2023-10-12 23:33:47	559.00	Cash	Completed	2023-10-12 08:43:03
1299	52	525	2023-08-02 20:42:18	419.00	Credit Card	Completed	2023-08-02 18:01:40
1202	21	\N	2023-05-26 15:47:58	1040.00	Cash	Completed	2023-05-26 09:57:44
1400	57	606	2023-10-08 12:59:54	280.00	Cash	Completed	2023-10-08 05:56:06
1488	73	500	2023-12-11 03:54:14	151.00	ERROR	Completed	2023-12-11 11:32:23
1462	1	\N	2023-11-13 01:23:37	100.00	Cash	Completed	2023-11-13 05:12:01
1132	71	507	2023-04-16 14:26:07	594.00	Cash	Completed	2023-04-16 10:37:14
1809	32	594	2024-08-10 19:09:14	66.00	Debit Card	Completed	2024-08-10 11:21:28
1834	6	\N	2024-08-29 02:30:08	191.00	ERROR	Completed	2024-08-29 15:41:38
1066	96	663	2023-02-17 07:32:58	443.00	Debit Card	Completed	2023-02-17 17:28:33
1941	81	553	2024-11-11 01:33:38	558.00	ERROR	Completed	2024-11-11 10:37:46
1470	52	651	2023-11-18 16:09:25	35.00	Cash	Completed	2023-11-18 14:31:35
1168	32	626	2023-05-09 21:46:44	119.00	Credit Card	Completed	2023-05-09 00:33:26
1159	71	623	2023-05-05 16:55:13	70.00	Credit Card	Completed	2023-05-05 18:24:14
1960	1	\N	2024-11-26 22:48:40	204.00	Debit Card	Completed	2024-11-26 15:48:12
1527	85	519	2024-01-09 19:23:27	114.00	Cash	Completed	2024-01-09 00:48:23
1260	19	596	2023-07-11 20:49:15	560.00	ERROR	Completed	2023-07-11 11:39:04
1916	32	682	2024-10-22 10:32:11	40.00	Cash	Completed	2024-10-22 13:36:01
1962	85	664	2024-11-29 18:59:46	468.00	Cash	Completed	2024-11-29 15:53:12
1784	96	662	2024-07-26 18:58:59	159.00	Debit Card	Completed	2024-07-26 19:00:41
1766	32	\N	2024-07-19 02:33:51	322.00	ERROR	Completed	2024-07-19 08:11:00
1624	1	\N	2024-03-24 00:53:29	456.00	Debit Card	Completed	2024-03-24 01:37:13
1001	93	582	2023-01-03 10:42:46	159.00	ERROR	Completed	2023-01-03 10:01:17
1821	73	576	2024-08-21 02:33:58	784.00	ERROR	Completed	2024-08-21 22:37:12
1469	81	532	2023-11-18 04:08:47	479.00	Credit Card	Completed	2023-11-18 04:26:21
1609	1	604	2024-03-06 21:21:19	24.00	Credit Card	Completed	2024-03-06 09:50:34
1820	32	507	2024-08-19 18:28:20	741.00	Debit Card	Completed	2024-08-19 14:17:14
1863	1	638	2024-09-21 01:04:20	369.00	Debit Card	Completed	2024-09-21 02:54:17
1164	66	596	2023-05-07 05:49:33	474.00	ERROR	Completed	2023-05-07 05:20:11
1764	32	564	2024-07-16 21:41:33	80.00	Debit Card	Completed	2024-07-16 10:53:03
1298	97	608	2023-07-31 04:00:14	259.00	Credit Card	Completed	2023-07-31 16:57:24
1335	23	618	2023-08-30 11:57:33	299.00	Credit Card	Completed	2023-08-30 05:33:56
1443	29	532	2023-10-31 01:22:59	561.00	ERROR	Completed	2023-10-31 09:33:30
1305	71	683	2023-08-07 14:59:37	718.00	Credit Card	Completed	2023-08-07 00:06:56
1943	13	550	2024-11-11 20:07:44	701.00	Debit Card	Completed	2024-11-11 19:09:53
1344	38	641	2023-09-03 06:48:43	86.00	ERROR	Completed	2023-09-03 07:39:35
1568	96	\N	2024-02-08 09:15:43	310.00	ERROR	Completed	2024-02-08 15:17:00
1496	57	621	2023-12-18 08:34:14	561.00	Debit Card	Completed	2023-12-18 00:00:33
1446	52	597	2023-11-03 10:17:17	478.00	Credit Card	Completed	2023-11-03 00:19:43
1375	93	515	2023-09-21 08:27:54	273.00	Cash	Completed	2023-09-21 13:19:39
1430	52	\N	2023-10-21 18:31:04	14.00	Credit Card	Completed	2023-10-21 18:10:18
1297	57	\N	2023-07-30 22:39:05	713.00	Debit Card	Completed	2023-07-30 14:14:46
1419	71	638	2023-10-16 02:08:27	2.00	Cash	Completed	2023-10-16 08:59:49
1869	81	\N	2024-09-24 00:16:03	117.00	ERROR	Completed	2024-09-24 09:12:11
1241	38	623	2023-06-24 05:05:28	69.00	Credit Card	Completed	2023-06-24 06:38:05
1790	93	630	2024-07-30 17:06:09	238.00	Cash	Completed	2024-07-30 12:06:54
1293	1	533	2023-07-29 06:23:24	508.00	ERROR	Completed	2023-07-29 10:30:11
1577	71	509	2024-02-11 10:09:00	403.00	Credit Card	Completed	2024-02-11 08:28:23
1802	50	523	2024-08-04 09:05:30	610.00	Cash	Completed	2024-08-04 01:12:33
1303	32	506	2023-08-06 00:13:46	161.00	Debit Card	Completed	2023-08-06 23:56:23
1292	50	\N	2023-07-29 03:39:17	377.00	Debit Card	Completed	2023-07-29 21:35:21
1703	23	647	2024-05-24 21:47:54	431.00	Cash	Completed	2024-05-24 21:21:03
1677	97	679	2024-05-04 11:18:39	390.00	Cash	Completed	2024-05-04 01:08:23
1783	23	493	2024-07-26 11:47:40	395.00	Debit Card	Completed	2024-07-26 19:54:19
1588	85	\N	2024-02-19 23:24:11	378.00	ERROR	Completed	2024-02-19 05:15:29
1901	1	685	2024-10-12 08:56:53	114.00	ERROR	Completed	2024-10-12 02:59:26
1884	38	660	2024-10-02 21:25:03	208.00	ERROR	Completed	2024-10-02 21:02:56
1418	32	511	2023-10-15 00:34:09	236.00	ERROR	Completed	2023-10-15 06:34:56
1180	73	523	2023-05-17 00:16:03	260.00	Cash	Completed	2023-05-17 23:36:11
1410	38	535	2023-10-12 11:34:30	45.00	Cash	Completed	2023-10-12 22:02:50
1758	29	\N	2024-07-15 00:04:55	38.00	Credit Card	Completed	2024-07-15 03:10:23
1996	50	\N	2024-12-23 06:56:06	276.00	Credit Card	Completed	2024-12-23 19:40:04
1631	23	546	2024-03-27 00:09:48	248.00	Credit Card	Completed	2024-03-27 05:16:53
1442	6	602	2023-10-31 00:42:15	535.00	ERROR	Completed	2023-10-31 07:54:13
1559	52	\N	2024-01-29 11:32:52	473.00	Credit Card	Completed	2024-01-29 12:10:44
1680	91	679	2024-05-07 18:54:42	315.00	Cash	Completed	2024-05-07 23:55:06
1667	71	\N	2024-04-22 21:54:37	976.00	ERROR	Completed	2024-04-22 16:25:11
1909	13	511	2024-10-19 02:05:10	288.00	Debit Card	Completed	2024-10-19 16:07:20
1851	96	582	2024-09-08 09:31:25	165.00	Credit Card	Completed	2024-09-08 00:07:26
1072	52	672	2023-02-25 08:38:22	63.00	Cash	Completed	2023-02-25 03:33:37
1586	50	609	2024-02-18 04:24:11	321.00	Debit Card	Completed	2024-02-18 13:05:09
1080	52	\N	2023-03-04 14:27:03	494.00	ERROR	Completed	2023-03-04 00:43:07
1918	38	522	2024-10-23 11:33:33	422.00	Cash	Completed	2024-10-23 03:58:56
1972	93	644	2024-12-05 01:23:29	55.00	ERROR	Completed	2024-12-05 18:35:16
1607	96	630	2024-03-06 00:00:07	319.00	Credit Card	Completed	2024-03-06 15:17:48
1055	6	612	2023-02-08 21:18:08	204.00	Cash	Completed	2023-02-08 18:03:20
1539	71	668	2024-01-18 17:10:21	111.00	Debit Card	Completed	2024-01-18 04:45:03
1188	66	621	2023-05-20 22:43:02	409.00	Cash	Completed	2023-05-20 05:55:17
1515	21	\N	2024-01-02 10:04:13	404.00	Cash	Completed	2024-01-02 06:03:56
1500	29	\N	2023-12-20 11:21:27	749.00	ERROR	Completed	2023-12-20 14:27:57
1736	91	632	2024-06-24 21:58:25	74.00	Credit Card	Completed	2024-06-24 11:43:49
1131	1	524	2023-04-16 11:43:37	741.00	ERROR	Completed	2023-04-16 18:35:43
1625	6	557	2024-03-25 00:49:05	150.00	Credit Card	Cancelled	2024-03-25 08:50:44
1955	13	\N	2024-11-22 05:42:02	132.00	ERROR	Completed	2024-11-22 13:46:17
1502	1	688	2023-12-22 23:37:31	342.00	Credit Card	Completed	2023-12-22 16:58:14
1752	38	588	2024-07-05 18:19:04	258.00	Debit Card	Completed	2024-07-05 18:23:10
1478	1	665	2023-11-28 17:39:41	100.00	ERROR	Completed	2023-11-28 16:45:48
1964	71	493	2024-11-30 06:25:46	39.00	ERROR	Completed	2024-11-30 12:03:39
1969	73	514	2024-12-04 02:46:52	224.00	Debit Card	Completed	2024-12-04 12:06:07
1642	13	\N	2024-04-04 10:49:15	259.00	ERROR	Completed	2024-04-04 08:38:58
1158	6	\N	2023-05-03 20:40:57	6.00	ERROR	Completed	2023-05-03 00:02:55
1037	71	535	2023-01-23 02:58:13	117.00	ERROR	Completed	2023-01-23 19:43:08
1580	93	\N	2024-02-14 21:05:08	313.00	Credit Card	Completed	2024-02-14 02:13:46
1300	23	682	2023-08-04 19:14:23	117.00	ERROR	Completed	2023-08-04 22:51:55
1554	66	665	2024-01-27 20:20:31	260.00	Cash	Completed	2024-01-27 10:47:45
1437	93	641	2023-10-28 03:38:00	136.00	Credit Card	Completed	2023-10-28 04:39:49
1362	85	657	2023-09-13 02:01:47	392.00	Cash	Completed	2023-09-13 17:53:17
1799	97	\N	2024-08-03 16:24:26	229.00	ERROR	Completed	2024-08-03 11:04:15
1509	52	592	2023-12-27 01:50:44	21.00	Credit Card	Completed	2023-12-27 19:55:12
1683	21	685	2024-05-08 15:56:30	105.00	Credit Card	Completed	2024-05-08 08:36:43
1933	1	504	2024-11-03 19:38:11	173.00	Debit Card	Completed	2024-11-03 23:00:29
1612	50	616	2024-03-11 15:21:46	797.00	Debit Card	Completed	2024-03-11 18:29:44
1686	57	497	2024-05-12 04:20:25	130.00	Debit Card	Completed	2024-05-12 12:27:58
1854	23	629	2024-09-12 11:25:39	67.00	Debit Card	Completed	2024-09-12 09:40:23
1573	71	\N	2024-02-10 04:58:09	115.00	ERROR	Completed	2024-02-10 00:30:33
1905	73	533	2024-10-14 16:34:19	165.00	Debit Card	Completed	2024-10-14 14:50:50
1366	91	534	2023-09-16 21:47:02	197.00	ERROR	Completed	2023-09-16 19:51:22
1698	13	649	2024-05-23 03:52:29	259.00	Debit Card	Completed	2024-05-23 22:03:49
1348	71	630	2023-09-05 22:32:39	131.00	Cash	Cancelled	2023-09-05 03:13:14
1067	6	686	2023-02-18 18:12:09	406.00	ERROR	Completed	2023-02-18 17:47:52
1599	85	\N	2024-02-26 16:11:03	126.00	Cash	Completed	2024-02-26 05:03:06
1894	91	688	2024-10-08 07:53:13	162.00	Cash	Completed	2024-10-08 00:14:37
1096	85	498	2023-03-16 07:00:14	619.00	Credit Card	Completed	2023-03-16 17:35:03
1273	73	647	2023-07-17 12:32:26	23.00	Credit Card	Completed	2023-07-17 12:19:47
1408	38	\N	2023-10-11 13:12:52	140.00	Credit Card	Completed	2023-10-11 06:42:35
1673	81	559	2024-05-02 16:47:28	54.00	Cash	Completed	2024-05-02 04:24:01
1475	57	\N	2023-11-23 19:03:25	32.00	ERROR	Completed	2023-11-23 19:51:20
1433	4	652	2023-10-23 14:26:14	646.00	ERROR	Completed	2023-10-23 12:31:44
1235	66	589	2023-06-19 09:38:36	324.00	Cash	Completed	2023-06-19 13:08:17
1604	32	\N	2024-03-03 20:55:39	282.00	Credit Card	Completed	2024-03-03 11:01:44
1781	6	682	2024-07-26 04:07:21	408.00	Debit Card	Completed	2024-07-26 21:49:13
1728	66	\N	2024-06-18 16:02:32	63.00	Cash	Completed	2024-06-18 01:40:47
1594	21	518	2024-02-22 05:06:36	437.00	ERROR	Completed	2024-02-22 12:04:44
1872	66	640	2024-09-26 02:59:16	100.00	Cash	Completed	2024-09-26 13:49:26
1122	57	571	2023-04-09 18:51:24	349.00	ERROR	Completed	2023-04-09 01:58:21
1426	93	\N	2023-10-20 20:16:20	393.00	ERROR	Completed	2023-10-20 10:40:27
1485	81	662	2023-12-05 19:50:00	535.00	Cash	Completed	2023-12-05 15:05:08
1308	23	600	2023-08-11 22:24:21	175.00	Cash	Completed	2023-08-11 04:02:45
1258	23	620	2023-07-11 09:56:37	553.00	Debit Card	Completed	2023-07-11 13:26:12
1166	50	501	2023-05-07 20:32:49	550.00	Debit Card	Completed	2023-05-07 06:27:36
1637	91	513	2024-03-31 16:41:27	296.00	Credit Card	Completed	2024-03-31 19:00:28
1908	13	504	2024-10-16 23:38:11	528.00	Credit Card	Completed	2024-10-16 10:17:35
1649	4	543	2024-04-09 14:20:30	265.00	ERROR	Completed	2024-04-09 04:49:29
1444	73	618	2023-10-31 19:57:48	241.00	Credit Card	Completed	2023-10-31 08:20:52
1090	66	\N	2023-03-12 20:36:10	641.00	Cash	Completed	2023-03-12 09:23:53
1687	50	\N	2024-05-13 02:10:15	417.00	ERROR	Completed	2024-05-13 06:04:55
1519	52	565	2024-01-05 00:27:07	172.00	Debit Card	Completed	2024-01-05 21:12:57
1533	23	634	2024-01-14 10:52:12	122.00	ERROR	Completed	2024-01-14 04:35:07
1150	21	511	2023-04-27 05:35:25	462.00	Credit Card	Completed	2023-04-27 07:38:57
1978	1	614	2024-12-09 04:20:32	58.00	Credit Card	Completed	2024-12-09 15:35:06
1789	32	498	2024-07-29 23:20:49	267.00	Debit Card	Completed	2024-07-29 04:31:09
1119	71	537	2023-04-07 02:30:42	837.00	Credit Card	Completed	2023-04-07 14:08:50
1416	6	\N	2023-10-14 17:10:16	185.00	Debit Card	Completed	2023-10-14 08:22:43
1501	23	\N	2023-12-21 20:49:32	374.00	Cash	Completed	2023-12-21 03:21:45
1578	57	600	2024-02-13 04:10:47	158.00	Credit Card	Completed	2024-02-13 16:53:51
1024	96	582	2023-01-16 23:53:45	174.00	Cash	Completed	2023-01-16 23:53:03
1576	91	561	2024-02-11 02:32:24	517.00	Debit Card	Completed	2024-02-11 06:19:18
1468	96	\N	2023-11-16 19:55:07	478.00	Cash	Completed	2023-11-16 06:43:43
1954	85	\N	2024-11-22 04:05:32	529.00	ERROR	Completed	2024-11-22 12:03:30
1464	52	559	2023-11-14 04:05:35	372.00	ERROR	Completed	2023-11-14 23:22:31
1486	4	628	2023-12-08 11:55:39	607.00	ERROR	Completed	2023-12-08 05:53:32
1461	93	\N	2023-11-12 21:22:38	164.00	Debit Card	Completed	2023-11-12 04:20:04
1525	81	686	2024-01-09 00:08:23	389.00	Credit Card	Completed	2024-01-09 20:12:35
1232	71	564	2023-06-18 18:40:15	453.00	ERROR	Completed	2023-06-18 17:08:35
1543	66	\N	2024-01-21 09:33:30	564.00	Debit Card	Completed	2024-01-21 09:19:32
1028	96	554	2023-01-17 18:07:20	80.00	Debit Card	Completed	2023-01-17 03:50:47
1617	23	565	2024-03-13 18:47:52	63.00	ERROR	Completed	2024-03-13 10:16:04
1890	71	550	2024-10-07 04:43:13	123.00	Credit Card	Completed	2024-10-07 07:37:56
1787	66	680	2024-07-27 20:30:07	112.00	ERROR	Completed	2024-07-27 08:10:42
1039	6	693	2023-01-24 16:40:10	419.00	Debit Card	Completed	2023-01-24 09:00:56
1201	52	546	2023-05-25 22:34:50	488.00	Debit Card	Completed	2023-05-25 23:10:37
1778	21	595	2024-07-24 11:57:25	405.00	ERROR	Completed	2024-07-24 11:27:31
1314	19	611	2023-08-15 07:56:21	114.00	Cash	Completed	2023-08-15 17:31:06
1196	85	513	2023-05-23 11:27:51	409.00	Credit Card	Completed	2023-05-23 02:23:53
1551	96	673	2024-01-26 09:34:07	56.00	Debit Card	Completed	2024-01-26 21:02:16
1163	93	582	2023-05-07 01:33:34	504.00	Debit Card	Completed	2023-05-07 15:54:34
1148	97	585	2023-04-25 20:46:42	951.00	Credit Card	Completed	2023-04-25 18:38:10
1641	1	624	2024-04-03 23:25:46	424.00	ERROR	Completed	2024-04-03 18:04:30
1843	38	\N	2024-09-05 06:16:14	74.00	Cash	Completed	2024-09-05 03:53:44
1058	66	614	2023-02-10 03:44:42	24.00	Cash	Completed	2023-02-10 21:56:42
1628	1	\N	2024-03-25 20:05:39	357.00	Cash	Completed	2024-03-25 08:23:18
1979	81	\N	2024-12-10 08:26:53	513.00	Cash	Completed	2024-12-10 07:07:51
1432	91	\N	2023-10-22 21:11:29	716.00	Debit Card	Completed	2023-10-22 09:39:28
1650	32	\N	2024-04-10 14:03:40	19.00	Cash	Completed	2024-04-10 15:18:04
1653	52	\N	2024-04-13 03:48:13	564.00	ERROR	Completed	2024-04-13 15:00:47
1213	71	614	2023-06-05 08:48:40	547.00	Cash	Completed	2023-06-05 18:19:55
1919	32	649	2024-10-25 10:13:48	492.00	Cash	Completed	2024-10-25 04:55:18
1803	1	\N	2024-08-08 02:36:26	77.00	ERROR	Completed	2024-08-08 05:19:40
1505	91	\N	2023-12-24 06:15:44	337.00	ERROR	Completed	2023-12-24 11:59:57
1311	93	600	2023-08-14 02:36:26	72.00	Cash	Completed	2023-08-14 07:04:30
1970	73	620	2024-12-04 11:50:21	394.00	Credit Card	Completed	2024-12-04 19:01:35
1572	29	607	2024-02-10 02:28:38	292.00	ERROR	Completed	2024-02-10 16:19:07
1053	32	640	2023-02-08 10:21:10	112.00	Cash	Completed	2023-02-08 11:19:01
1982	97	666	2024-12-11 10:00:41	199.00	ERROR	Cancelled	2024-12-11 09:31:02
1452	32	592	2023-11-07 05:16:29	168.00	ERROR	Completed	2023-11-07 13:22:53
1850	97	590	2024-09-08 06:01:49	309.00	ERROR	Completed	2024-09-08 05:46:24
1813	29	596	2024-08-12 03:52:34	399.00	Credit Card	Completed	2024-08-12 07:35:46
1846	97	511	2024-09-05 21:54:45	33.00	Credit Card	Completed	2024-09-05 04:21:55
1648	52	505	2024-04-06 16:51:56	379.00	Cash	Completed	2024-04-06 14:57:14
1140	81	\N	2023-04-23 05:32:49	470.00	ERROR	Completed	2023-04-23 20:20:10
1054	71	511	2023-02-08 11:49:52	855.00	Credit Card	Completed	2023-02-08 17:00:41
1965	32	\N	2024-12-01 09:23:06	597.00	Cash	Completed	2024-12-01 00:14:53
1381	19	691	2023-09-26 06:25:42	421.00	Credit Card	Completed	2023-09-26 12:00:55
1005	4	\N	2023-01-04 21:41:43	492.00	ERROR	Completed	2023-01-04 19:06:59
1291	81	584	2023-07-27 02:27:37	370.00	ERROR	Completed	2023-07-27 14:57:45
1449	38	695	2023-11-06 17:28:53	848.00	Debit Card	Completed	2023-11-06 00:03:01
1435	4	\N	2023-10-27 18:44:45	105.00	Credit Card	Completed	2023-10-27 14:50:04
1012	57	520	2023-01-08 09:39:06	410.00	Cash	Completed	2023-01-08 18:06:29
1212	73	584	2023-06-03 01:31:48	699.00	Cash	Completed	2023-06-03 14:55:26
1087	52	568	2023-03-11 10:47:09	423.00	Debit Card	Completed	2023-03-11 21:16:36
1769	52	512	2024-07-19 17:11:15	286.00	Cash	Completed	2024-07-19 22:38:06
1457	57	\N	2023-11-09 06:14:32	608.00	Debit Card	Completed	2023-11-09 06:17:33
1902	97	555	2024-10-12 10:24:53	381.00	Cash	Completed	2024-10-12 15:08:38
1635	50	531	2024-03-30 07:25:31	432.00	Credit Card	Completed	2024-03-30 10:06:19
1105	29	531	2023-03-24 09:23:52	2.00	Debit Card	Completed	2023-03-24 14:00:19
1332	66	607	2023-08-29 16:15:15	114.00	Debit Card	Completed	2023-08-29 17:11:11
2001	66	557	2024-12-25 22:00:58	287.00	Debit Card	Completed	2024-12-25 04:57:10
1405	71	659	2023-10-10 15:27:47	312.00	ERROR	Completed	2023-10-10 17:57:17
1601	23	\N	2024-03-03 03:45:18	705.00	Credit Card	Completed	2024-03-03 16:26:05
1737	50	\N	2024-06-25 03:48:23	1064.00	Debit Card	Completed	2024-06-25 03:01:01
1231	66	651	2023-06-18 17:23:14	282.00	Debit Card	Completed	2023-06-18 23:32:27
1276	81	\N	2023-07-18 21:16:15	258.00	Credit Card	Completed	2023-07-18 11:18:39
1117	38	664	2023-04-05 22:55:09	552.00	ERROR	Completed	2023-04-05 01:44:01
1721	73	534	2024-06-13 20:08:47	95.00	Credit Card	Completed	2024-06-13 03:57:56
1710	81	521	2024-05-30 16:49:11	626.00	Credit Card	Completed	2024-05-30 03:47:13
1251	57	616	2023-07-06 01:21:41	23.00	Debit Card	Completed	2023-07-06 20:51:03
1706	73	564	2024-05-29 01:49:35	495.00	Credit Card	Completed	2024-05-29 02:11:34
1189	13	581	2023-05-21 13:50:52	326.00	ERROR	Completed	2023-05-21 07:36:25
1712	85	559	2024-05-31 04:49:41	559.00	ERROR	Completed	2024-05-31 16:11:35
1654	93	547	2024-04-13 11:52:09	190.00	Debit Card	Completed	2024-04-13 02:37:08
1364	32	492	2023-09-15 13:01:17	132.00	Debit Card	Completed	2023-09-15 03:48:11
1439	97	\N	2023-10-29 04:21:43	324.00	ERROR	Completed	2023-10-29 18:43:13
1991	73	642	2024-12-21 15:59:51	40.00	Cash	Completed	2024-12-21 10:08:25
1889	1	600	2024-10-06 17:04:06	349.00	Debit Card	Completed	2024-10-06 22:10:11
1388	97	642	2023-10-01 14:16:07	339.00	ERROR	Completed	2023-10-01 02:29:07
1081	66	\N	2023-03-05 08:26:29	24.00	Debit Card	Completed	2023-03-05 07:49:56
1112	52	\N	2023-04-01 22:41:25	4.00	ERROR	Completed	2023-04-01 09:36:14
1315	96	\N	2023-08-15 09:34:30	292.00	Credit Card	Completed	2023-08-15 22:21:45
1102	32	\N	2023-03-21 13:32:44	210.00	Debit Card	Completed	2023-03-21 03:56:25
1971	19	568	2024-12-04 16:59:57	201.00	Cash	Completed	2024-12-04 13:30:24
1453	38	597	2023-11-07 06:59:19	132.00	ERROR	Completed	2023-11-07 07:07:43
1198	13	620	2023-05-24 19:07:50	156.00	Cash	Completed	2023-05-24 10:24:09
1506	66	\N	2023-12-24 14:00:38	192.00	Cash	Completed	2023-12-24 17:24:50
1195	73	675	2023-05-23 06:36:07	582.00	Cash	Completed	2023-05-23 15:15:16
1696	97	\N	2024-05-21 14:51:33	544.00	ERROR	Completed	2024-05-21 01:01:10
1174	19	575	2023-05-12 13:46:34	264.00	Debit Card	Completed	2023-05-12 16:28:06
1740	1	693	2024-06-26 20:36:46	362.00	ERROR	Completed	2024-06-26 01:01:02
1197	93	\N	2023-05-23 21:46:42	314.00	Cash	Completed	2023-05-23 08:53:56
1063	13	499	2023-02-16 00:07:01	110.00	Credit Card	Completed	2023-02-16 05:45:30
1824	21	689	2024-08-22 08:12:08	672.00	ERROR	Completed	2024-08-22 01:53:41
1059	52	661	2023-02-10 06:24:43	451.00	Cash	Completed	2023-02-10 14:23:51
1575	73	624	2024-02-11 00:54:23	364.00	Debit Card	Completed	2024-02-11 05:53:39
1912	66	513	2024-10-20 07:43:53	539.00	Credit Card	Completed	2024-10-20 21:59:54
1835	91	605	2024-08-31 07:57:34	148.00	Credit Card	Completed	2024-08-31 13:54:51
1242	32	\N	2023-06-24 17:57:12	188.00	Debit Card	Completed	2023-06-24 15:25:49
1376	73	520	2023-09-21 16:06:27	632.00	Credit Card	Completed	2023-09-21 03:37:42
1365	13	\N	2023-09-16 03:20:17	65.00	Cash	Completed	2023-09-16 14:43:28
1897	73	683	2024-10-11 06:54:54	259.00	Credit Card	Completed	2024-10-11 18:43:54
1160	13	\N	2023-05-05 21:23:23	228.00	ERROR	Completed	2023-05-05 14:10:27
1514	6	667	2024-01-02 08:11:27	148.00	Debit Card	Completed	2024-01-02 11:44:15
1338	13	644	2023-09-01 02:47:53	224.00	Credit Card	Completed	2023-09-01 22:32:46
1359	19	\N	2023-09-10 14:41:44	222.00	ERROR	Completed	2023-09-10 14:16:16
1806	71	508	2024-08-08 14:58:46	321.00	Cash	Completed	2024-08-08 10:05:14
1079	96	591	2023-03-04 03:54:53	42.00	Debit Card	Completed	2023-03-04 19:01:59
1445	23	\N	2023-11-02 06:29:32	440.00	Debit Card	Completed	2023-11-02 11:40:15
1723	71	641	2024-06-15 13:16:27	172.00	Credit Card	Completed	2024-06-15 08:44:07
1704	57	659	2024-05-25 05:45:32	417.00	Cash	Completed	2024-05-25 00:16:47
1152	19	574	2023-04-30 13:04:59	678.00	Debit Card	Completed	2023-04-30 15:43:00
1384	97	\N	2023-09-26 22:21:58	842.00	Cash	Completed	2023-09-26 16:58:36
1330	4	672	2023-08-27 23:39:04	314.00	ERROR	Completed	2023-08-27 16:40:16
1826	29	\N	2024-08-22 20:52:50	279.00	Credit Card	Completed	2024-08-22 15:18:14
1492	19	587	2023-12-15 21:05:07	237.00	ERROR	Completed	2023-12-15 16:41:13
1701	1	669	2024-05-23 17:09:32	183.00	Credit Card	Completed	2024-05-23 11:06:12
1456	32	\N	2023-11-09 04:16:51	124.00	Credit Card	Completed	2023-11-09 00:59:14
1483	57	674	2023-12-03 21:11:24	36.00	Credit Card	Completed	2023-12-03 07:25:05
1141	52	572	2023-04-23 09:58:19	729.00	Cash	Completed	2023-04-23 01:07:15
1329	73	534	2023-08-27 23:08:35	266.00	Cash	Completed	2023-08-27 18:15:28
1094	93	\N	2023-03-15 02:56:29	279.00	Cash	Completed	2023-03-15 21:35:20
1481	32	611	2023-12-02 15:21:02	211.00	ERROR	Completed	2023-12-02 00:18:33
1480	1	607	2023-11-28 23:41:57	342.00	ERROR	Completed	2023-11-28 02:16:21
1948	97	513	2024-11-16 01:24:51	95.00	Cash	Completed	2024-11-16 15:02:09
1110	96	673	2023-03-28 05:53:41	240.00	Credit Card	Completed	2023-03-28 03:41:33
1743	13	543	2024-06-29 02:34:54	309.00	Cash	Completed	2024-06-29 05:34:46
1490	81	523	2023-12-13 14:20:32	105.00	Cash	Completed	2023-12-13 02:49:07
1562	91	498	2024-01-31 10:13:29	343.00	Debit Card	Completed	2024-01-31 22:27:35
1947	93	\N	2024-11-15 12:01:51	301.00	ERROR	Completed	2024-11-15 16:31:12
1473	50	\N	2023-11-19 22:05:43	247.00	ERROR	Completed	2023-11-19 05:48:48
1130	21	615	2023-04-13 06:16:59	704.00	ERROR	Completed	2023-04-13 09:22:46
1440	21	643	2023-10-29 19:44:41	683.00	Cash	Completed	2023-10-29 13:04:33
1041	4	\N	2023-01-25 21:43:48	238.00	Debit Card	Completed	2023-01-25 06:42:49
1640	73	663	2024-04-03 12:16:07	280.00	Credit Card	Completed	2024-04-03 18:20:01
1520	57	496	2024-01-05 05:55:39	440.00	Debit Card	Completed	2024-01-05 11:40:42
1968	13	533	2024-12-02 10:48:18	57.00	Credit Card	Completed	2024-12-02 06:07:15
1814	93	611	2024-08-13 11:17:08	652.00	Debit Card	Completed	2024-08-13 21:37:59
1765	50	498	2024-07-17 23:31:04	92.00	ERROR	Completed	2024-07-17 10:05:10
1027	52	610	2023-01-17 12:56:52	411.00	Debit Card	Completed	2023-01-17 15:33:32
1479	1	\N	2023-11-28 19:27:36	128.00	Debit Card	Completed	2023-11-28 03:05:31
1593	32	492	2024-02-21 18:06:10	670.00	Cash	Completed	2024-02-21 18:56:11
1926	85	572	2024-10-28 19:46:52	398.00	ERROR	Completed	2024-10-28 00:12:51
1385	1	577	2023-09-27 03:19:54	204.00	Credit Card	Completed	2023-09-27 21:32:08
1832	4	554	2024-08-26 14:47:19	737.00	Cash	Completed	2024-08-26 06:50:59
1726	91	637	2024-06-16 07:15:03	105.00	ERROR	Completed	2024-06-16 01:06:15
1672	71	\N	2024-05-01 20:43:42	458.00	ERROR	Completed	2024-05-01 17:21:58
1732	52	553	2024-06-22 02:36:54	659.00	ERROR	Cancelled	2024-06-22 08:02:11
1233	81	494	2023-06-19 01:28:57	327.00	Cash	Completed	2023-06-19 13:13:23
1346	29	562	2023-09-05 09:56:20	416.00	Cash	Completed	2023-09-05 18:37:17
1267	71	539	2023-07-14 15:29:47	509.00	ERROR	Completed	2023-07-14 21:15:31
1357	13	506	2023-09-09 21:11:42	551.00	Cash	Cancelled	2023-09-09 09:36:36
1326	23	602	2023-08-27 01:26:01	542.00	ERROR	Completed	2023-08-27 13:56:39
1020	85	558	2023-01-15 01:38:08	175.00	Credit Card	Completed	2023-01-15 20:40:37
1807	73	\N	2024-08-09 22:41:27	433.00	ERROR	Completed	2024-08-09 04:20:21
1377	91	587	2023-09-22 05:34:35	84.00	ERROR	Completed	2023-09-22 05:49:26
1127	50	559	2023-04-12 03:57:28	79.00	Cash	Completed	2023-04-12 00:36:21
1060	71	559	2023-02-10 10:58:15	838.00	ERROR	Completed	2023-02-10 23:33:20
1638	57	565	2024-04-02 08:51:10	586.00	ERROR	Completed	2024-04-02 07:22:54
1017	19	615	2023-01-11 02:09:58	256.00	Debit Card	Completed	2023-01-11 20:07:06
1794	93	573	2024-08-01 21:19:33	217.00	Cash	Completed	2024-08-01 22:13:55
1720	73	636	2024-06-12 19:25:05	226.00	Credit Card	Completed	2024-06-12 23:45:29
1071	66	\N	2023-02-22 16:27:03	515.00	Debit Card	Completed	2023-02-22 15:19:45
1885	23	568	2024-10-04 05:50:06	296.00	Cash	Completed	2024-10-04 04:21:54
1754	57	598	2024-07-07 21:29:41	171.00	Credit Card	Completed	2024-07-07 23:37:53
1538	97	616	2024-01-18 07:30:20	505.00	Cash	Completed	2024-01-18 01:33:55
1224	52	493	2023-06-12 23:42:14	750.00	Credit Card	Completed	2023-06-12 13:27:48
1930	23	543	2024-10-31 09:11:25	108.00	Credit Card	Completed	2024-10-31 08:14:44
1739	93	692	2024-06-26 18:13:56	505.00	ERROR	Completed	2024-06-26 12:08:21
1051	57	\N	2023-02-07 02:36:19	503.00	Credit Card	Completed	2023-02-07 19:31:18
1424	71	600	2023-10-18 12:59:49	141.00	Debit Card	Completed	2023-10-18 02:01:44
1109	85	586	2023-03-26 00:10:32	828.00	Debit Card	Completed	2023-03-26 11:34:32
1777	29	\N	2024-07-24 04:59:50	500.00	Debit Card	Completed	2024-07-24 23:42:35
1980	6	551	2024-12-10 08:41:32	26.00	Cash	Completed	2024-12-10 17:52:52
1842	19	548	2024-09-05 00:50:59	296.00	ERROR	Completed	2024-09-05 23:16:50
1716	91	586	2024-06-10 05:54:09	248.00	Credit Card	Completed	2024-06-10 16:19:18
1352	52	495	2023-09-07 17:10:49	492.00	ERROR	Completed	2023-09-07 09:02:16
1859	32	643	2024-09-18 18:04:01	1144.00	Credit Card	Completed	2024-09-18 22:36:46
1254	66	590	2023-07-07 22:09:06	328.00	Cash	Completed	2023-07-07 06:53:13
1133	19	638	2023-04-18 03:11:27	731.00	ERROR	Completed	2023-04-18 22:33:01
1441	52	683	2023-10-29 19:57:54	208.00	Credit Card	Completed	2023-10-29 19:46:09
1271	73	\N	2023-07-15 13:19:26	336.00	Credit Card	Completed	2023-07-15 04:01:55
1035	85	\N	2023-01-21 11:07:57	237.00	ERROR	Completed	2023-01-21 21:09:51
1073	23	497	2023-02-26 11:34:26	440.00	Debit Card	Completed	2023-02-26 12:29:26
1019	21	548	2023-01-14 12:52:32	245.00	Debit Card	Completed	2023-01-14 11:29:27
1773	91	518	2024-07-20 07:57:23	240.00	ERROR	Completed	2024-07-20 22:57:46
1389	4	509	2023-10-02 15:10:43	53.00	Debit Card	Completed	2023-10-02 15:39:14
1735	97	613	2024-06-22 21:32:56	580.00	Debit Card	Completed	2024-06-22 05:07:25
1801	29	\N	2024-08-04 03:13:54	169.00	Debit Card	Completed	2024-08-04 18:32:55
1412	57	531	2023-10-12 23:13:37	153.00	ERROR	Completed	2023-10-12 03:32:42
1240	6	524	2023-06-21 23:24:44	308.00	Debit Card	Completed	2023-06-21 19:46:04
1881	97	503	2024-10-01 06:13:31	100.00	Cash	Completed	2024-10-01 01:48:49
1459	73	587	2023-11-12 06:27:51	481.00	Cash	Completed	2023-11-12 03:04:57
1621	19	542	2024-03-22 18:31:24	98.00	Cash	Completed	2024-03-22 02:30:21
1182	13	585	2023-05-17 13:38:59	301.00	ERROR	Completed	2023-05-17 23:00:11
1946	13	517	2024-11-13 16:25:39	806.00	Credit Card	Completed	2024-11-13 16:43:34
1537	23	\N	2024-01-17 19:12:24	200.00	ERROR	Completed	2024-01-17 05:36:30
1033	85	598	2023-01-21 05:09:11	634.00	Cash	Completed	2023-01-21 16:19:30
1868	57	619	2024-09-23 21:52:28	331.00	Debit Card	Completed	2024-09-23 05:04:24
1499	91	588	2023-12-20 05:08:12	113.00	ERROR	Completed	2023-12-20 19:04:54
1734	96	585	2024-06-22 19:13:53	560.00	ERROR	Completed	2024-06-22 06:15:54
1584	93	543	2024-02-17 14:31:34	601.00	Credit Card	Completed	2024-02-17 09:35:53
1454	91	\N	2023-11-07 19:13:48	132.00	Debit Card	Completed	2023-11-07 13:59:43
1040	96	653	2023-01-24 19:03:49	326.00	Credit Card	Completed	2023-01-24 07:11:37
1282	19	\N	2023-07-21 23:47:12	672.00	Credit Card	Completed	2023-07-21 00:55:35
1597	50	587	2024-02-24 10:06:56	286.00	ERROR	Completed	2024-02-24 16:03:21
1350	85	644	2023-09-06 19:06:35	196.00	Cash	Completed	2023-09-06 11:52:00
1812	23	509	2024-08-12 02:16:22	179.00	Credit Card	Completed	2024-08-12 02:43:07
1860	6	680	2024-09-18 22:44:08	234.00	Debit Card	Completed	2024-09-18 07:45:49
1643	85	643	2024-04-04 12:16:26	357.00	ERROR	Completed	2024-04-04 03:59:57
1858	85	639	2024-09-15 19:54:37	319.00	ERROR	Completed	2024-09-15 07:29:34
1275	97	592	2023-07-17 19:33:13	168.00	Cash	Completed	2023-07-17 14:44:26
1107	97	\N	2023-03-25 18:16:08	210.00	ERROR	Completed	2023-03-25 10:15:56
1339	73	632	2023-09-01 08:36:35	35.00	Credit Card	Completed	2023-09-01 19:27:24
1465	38	\N	2023-11-15 01:41:57	380.00	ERROR	Completed	2023-11-15 04:40:18
1157	4	555	2023-05-02 15:29:56	569.00	Credit Card	Completed	2023-05-02 13:05:31
1155	97	\N	2023-05-01 14:40:52	387.00	ERROR	Completed	2023-05-01 21:55:29
1526	1	519	2024-01-09 00:19:18	833.00	Credit Card	Completed	2024-01-09 15:14:29
1521	57	\N	2024-01-05 22:25:51	283.00	ERROR	Completed	2024-01-05 18:42:03
1528	38	\N	2024-01-09 20:19:50	380.00	Cash	Completed	2024-01-09 20:26:13
1277	81	619	2023-07-19 12:11:48	237.00	Debit Card	Completed	2023-07-19 02:04:03
1855	81	\N	2024-09-13 14:15:18	113.00	ERROR	Completed	2024-09-13 09:50:13
1541	57	\N	2024-01-20 12:42:29	42.00	Cash	Completed	2024-01-20 12:55:00
1531	73	607	2024-01-11 20:20:04	302.00	Credit Card	Completed	2024-01-11 21:17:21
1772	19	684	2024-07-20 01:37:47	146.00	Cash	Completed	2024-07-20 08:11:07
1669	57	\N	2024-04-25 17:04:35	273.00	Cash	Completed	2024-04-25 19:28:42
1671	32	621	2024-04-28 01:19:49	332.00	Credit Card	Completed	2024-04-28 07:17:38
1983	13	594	2024-12-12 20:25:41	288.00	Cash	Completed	2024-12-12 18:35:17
1274	38	617	2023-07-17 15:32:40	250.00	Cash	Completed	2023-07-17 23:01:23
1891	29	\N	2024-10-07 13:39:12	279.00	Credit Card	Completed	2024-10-07 21:34:09
1797	21	555	2024-08-03 05:18:26	411.00	Cash	Cancelled	2024-08-03 19:17:40
1840	13	\N	2024-09-04 05:55:45	285.00	Cash	Completed	2024-09-04 11:10:54
1805	66	\N	2024-08-08 12:25:06	426.00	Debit Card	Completed	2024-08-08 07:09:20
1187	29	539	2023-05-20 17:05:49	61.00	ERROR	Completed	2023-05-20 15:57:20
1123	6	549	2023-04-11 08:36:06	295.00	Credit Card	Completed	2023-04-11 08:33:50
1113	50	\N	2023-04-02 13:10:35	287.00	Debit Card	Completed	2023-04-02 22:51:31
1317	38	685	2023-08-16 03:10:44	194.00	Debit Card	Completed	2023-08-16 11:49:39
1517	73	622	2024-01-03 05:05:58	634.00	Debit Card	Completed	2024-01-03 10:41:31
1702	4	682	2024-05-24 02:25:56	21.00	Credit Card	Completed	2024-05-24 03:00:20
1598	91	578	2024-02-24 14:31:51	684.00	ERROR	Completed	2024-02-24 06:58:32
1825	71	666	2024-08-22 18:59:16	509.00	Debit Card	Completed	2024-08-22 02:02:48
1759	13	511	2024-07-15 19:05:25	335.00	Debit Card	Completed	2024-07-15 14:05:14
1707	1	623	2024-05-29 03:29:06	238.00	ERROR	Completed	2024-05-29 20:39:48
1065	71	679	2023-02-17 02:20:48	525.00	ERROR	Completed	2023-02-17 11:37:32
1795	81	\N	2024-08-03 00:44:03	553.00	ERROR	Completed	2024-08-03 01:32:17
1719	1	\N	2024-06-12 17:34:30	170.00	ERROR	Completed	2024-06-12 10:19:57
1751	71	526	2024-07-05 05:10:54	160.00	ERROR	Completed	2024-07-05 07:53:16
1626	93	\N	2024-03-25 10:34:08	163.00	Credit Card	Completed	2024-03-25 12:25:17
1536	96	\N	2024-01-17 16:38:23	148.00	Credit Card	Completed	2024-01-17 08:45:24
1064	91	562	2023-02-16 10:38:25	284.00	Cash	Completed	2023-02-16 22:38:42
1193	38	\N	2023-05-22 17:37:52	464.00	Debit Card	Completed	2023-05-22 10:14:19
1547	66	552	2024-01-24 03:00:46	507.00	Credit Card	Completed	2024-01-24 23:40:49
1204	1	\N	2023-05-30 14:03:16	623.00	Cash	Completed	2023-05-30 22:39:58
1169	29	565	2023-05-09 22:34:49	187.00	ERROR	Completed	2023-05-09 11:07:29
1994	52	540	2024-12-22 14:43:16	884.00	Credit Card	Completed	2024-12-22 08:55:01
1874	1	557	2024-09-26 15:55:55	671.00	Credit Card	Completed	2024-09-26 01:58:26
1252	13	620	2023-07-07 00:04:46	444.00	ERROR	Completed	2023-07-07 12:19:59
1171	81	526	2023-05-12 00:47:50	56.00	ERROR	Completed	2023-05-12 18:17:29
1236	57	570	2023-06-20 20:10:05	503.00	Debit Card	Completed	2023-06-20 00:49:27
1138	73	508	2023-04-20 20:58:16	142.00	ERROR	Completed	2023-04-20 17:02:02
1085	6	601	2023-03-09 09:34:30	12.00	ERROR	Completed	2023-03-09 03:49:19
1353	19	505	2023-09-09 01:57:14	6.00	Debit Card	Completed	2023-09-09 02:24:34
1255	96	591	2023-07-09 03:33:17	39.00	Debit Card	Completed	2023-07-09 13:16:29
1651	19	526	2024-04-11 07:16:22	72.00	ERROR	Completed	2024-04-11 16:06:03
1438	13	615	2023-10-28 20:11:31	471.00	Credit Card	Completed	2023-10-28 15:10:52
1407	21	681	2023-10-11 07:36:49	515.00	Cash	Completed	2023-10-11 02:54:18
1722	6	664	2024-06-15 07:07:54	453.00	Credit Card	Completed	2024-06-15 01:15:46
1688	1	640	2024-05-13 07:13:17	160.00	Credit Card	Completed	2024-05-13 21:19:45
1322	73	530	2023-08-21 22:05:52	488.00	Cash	Completed	2023-08-21 04:26:05
1184	50	581	2023-05-19 10:20:35	218.00	Cash	Completed	2023-05-19 08:57:34
1031	97	506	2023-01-20 00:17:09	247.00	Cash	Completed	2023-01-20 13:44:41
1985	66	\N	2024-12-14 02:57:27	219.00	Debit Card	Completed	2024-12-14 18:46:36
1670	85	521	2024-04-26 06:30:21	329.00	Credit Card	Completed	2024-04-26 22:19:53
1761	38	\N	2024-07-16 00:02:39	229.00	ERROR	Completed	2024-07-16 11:22:17
1865	29	\N	2024-09-23 04:16:32	530.00	Debit Card	Completed	2024-09-23 05:53:37
1069	23	553	2023-02-20 12:15:09	139.00	Cash	Completed	2023-02-20 10:37:18
1361	97	515	2023-09-12 05:28:29	84.00	ERROR	Completed	2023-09-12 20:31:03
1129	52	\N	2023-04-13 05:32:40	531.00	Cash	Completed	2023-04-13 03:25:40
1367	4	547	2023-09-16 23:54:32	463.00	ERROR	Completed	2023-09-16 16:01:50
1043	29	509	2023-01-26 20:59:07	102.00	Debit Card	Completed	2023-01-26 03:15:57
1192	50	626	2023-05-22 06:11:11	715.00	Cash	Completed	2023-05-22 21:33:57
1088	71	693	2023-03-11 19:02:11	190.00	ERROR	Completed	2023-03-11 18:35:00
1124	19	512	2023-04-11 20:16:13	298.00	Credit Card	Completed	2023-04-11 17:04:52
1717	13	552	2024-06-11 18:20:48	797.00	ERROR	Completed	2024-06-11 23:32:18
1738	23	694	2024-06-25 18:07:14	553.00	Credit Card	Completed	2024-06-25 17:15:30
1725	32	650	2024-06-16 01:32:24	341.00	Credit Card	Completed	2024-06-16 07:42:00
1243	50	\N	2023-06-27 22:18:21	243.00	Debit Card	Completed	2023-06-27 05:27:17
1100	66	564	2023-03-21 07:50:40	521.00	Cash	Completed	2023-03-21 00:59:20
1270	32	\N	2023-07-15 04:56:04	568.00	Debit Card	Completed	2023-07-15 16:42:40
1436	91	673	2023-10-28 02:44:03	86.00	ERROR	Completed	2023-10-28 13:31:49
1032	66	535	2023-01-20 00:38:23	502.00	Cash	Completed	2023-01-20 15:23:54
1591	4	668	2024-02-20 12:21:22	534.00	ERROR	Completed	2024-02-20 02:26:15
1516	13	539	2024-01-03 01:08:40	479.00	Cash	Completed	2024-01-03 12:30:29
1729	96	\N	2024-06-18 19:41:52	454.00	ERROR	Completed	2024-06-18 01:44:25
1988	97	617	2024-12-21 09:42:03	986.00	Debit Card	Completed	2024-12-21 00:53:16
2008	29	510	2024-12-29 05:01:09	314.00	ERROR	Completed	2024-12-29 04:29:13
1945	57	\N	2024-11-12 21:23:46	336.00	ERROR	Completed	2024-11-12 13:00:12
1455	91	664	2023-11-09 02:06:32	41.00	Credit Card	Completed	2023-11-09 21:50:57
1228	4	498	2023-06-16 07:28:36	621.00	Cash	Completed	2023-06-16 12:51:02
1652	13	636	2024-04-12 16:13:49	445.00	ERROR	Completed	2024-04-12 18:09:04
1518	38	492	2024-01-04 05:57:07	69.00	ERROR	Completed	2024-01-04 08:12:35
1387	73	571	2023-10-01 13:25:50	24.00	Debit Card	Completed	2023-10-01 17:10:16
1819	97	680	2024-08-19 11:21:53	36.00	Debit Card	Completed	2024-08-19 11:39:50
1934	38	661	2024-11-05 22:45:28	203.00	ERROR	Completed	2024-11-05 20:12:23
1542	4	655	2024-01-20 17:45:43	116.00	Credit Card	Completed	2024-01-20 01:24:04
1487	29	661	2023-12-09 20:10:57	245.00	ERROR	Completed	2023-12-09 19:14:55
1611	13	502	2024-03-09 22:41:33	329.00	ERROR	Completed	2024-03-09 14:54:44
1391	23	\N	2023-10-03 09:08:15	706.00	Credit Card	Completed	2023-10-03 11:10:41
1724	29	623	2024-06-16 00:26:24	523.00	Credit Card	Completed	2024-06-16 08:41:44
1746	38	609	2024-07-01 17:10:31	376.00	Cash	Cancelled	2024-07-01 07:18:02
2004	66	555	2024-12-28 05:23:37	11.00	Credit Card	Completed	2024-12-28 12:56:42
1636	50	\N	2024-03-30 23:32:28	114.00	Debit Card	Completed	2024-03-30 20:19:00
1369	13	591	2023-09-17 17:08:54	163.00	Debit Card	Completed	2023-09-17 10:45:48
1177	52	493	2023-05-14 18:12:07	359.00	ERROR	Completed	2023-05-14 17:24:34
1121	97	627	2023-04-08 20:05:24	426.00	Credit Card	Completed	2023-04-08 00:03:39
1882	97	513	2024-10-02 02:16:10	138.00	Debit Card	Completed	2024-10-02 02:29:10
1566	29	511	2024-02-06 15:40:25	288.00	ERROR	Completed	2024-02-06 10:04:29
1343	13	\N	2023-09-02 20:34:14	513.00	Debit Card	Completed	2023-09-02 07:47:15
1134	32	529	2023-04-18 08:41:55	438.00	Cash	Completed	2023-04-18 20:49:22
1785	52	568	2024-07-27 16:53:05	459.00	Credit Card	Completed	2024-07-27 23:35:06
1323	29	572	2023-08-23 00:07:03	23.00	Cash	Completed	2023-08-23 14:09:43
1237	13	521	2023-06-20 23:39:42	224.00	ERROR	Completed	2023-06-20 02:05:27
1222	93	\N	2023-06-10 14:07:16	239.00	Cash	Completed	2023-06-10 15:17:14
1921	57	\N	2024-10-27 14:43:22	92.00	Debit Card	Completed	2024-10-27 12:25:07
1714	29	612	2024-06-05 20:43:05	376.00	Credit Card	Completed	2024-06-05 00:00:15
1358	71	627	2023-09-10 09:08:25	222.00	Cash	Completed	2023-09-10 03:11:13
1511	52	618	2023-12-31 19:11:02	608.00	Debit Card	Completed	2023-12-31 04:01:13
1596	66	\N	2024-02-24 02:49:04	93.00	Cash	Completed	2024-02-24 00:31:36
1931	38	657	2024-10-31 21:56:26	128.00	Credit Card	Completed	2024-10-31 22:03:50
1756	66	558	2024-07-10 04:02:38	143.00	Debit Card	Completed	2024-07-10 21:20:59
1818	13	666	2024-08-18 14:02:24	339.00	Cash	Completed	2024-08-18 01:11:42
1695	4	545	2024-05-20 19:27:59	383.00	Credit Card	Completed	2024-05-20 22:35:11
1011	52	662	2023-01-08 02:57:51	203.00	ERROR	Completed	2023-01-08 14:28:23
1768	6	\N	2024-07-19 12:02:02	283.00	Credit Card	Completed	2024-07-19 06:34:19
1600	85	639	2024-02-26 22:11:14	552.00	ERROR	Completed	2024-02-26 04:42:33
1360	50	537	2023-09-11 06:04:15	17.00	Credit Card	Cancelled	2023-09-11 01:46:17
1497	29	651	2023-12-19 04:27:24	275.00	ERROR	Completed	2023-12-19 03:10:57
1875	19	561	2024-09-28 08:11:35	199.00	Cash	Completed	2024-09-28 00:05:35
1618	19	\N	2024-03-14 20:53:41	20.00	Credit Card	Completed	2024-03-14 08:06:34
1402	38	522	2023-10-09 14:47:41	651.00	Cash	Completed	2023-10-09 12:03:57
1399	21	\N	2023-10-08 09:41:39	272.00	Debit Card	Completed	2023-10-08 20:21:31
1582	52	\N	2024-02-16 02:21:53	304.00	Credit Card	Completed	2024-02-16 12:53:46
1763	21	575	2024-07-16 09:52:55	831.00	Cash	Completed	2024-07-16 09:40:00
1214	21	518	2023-06-06 14:20:15	184.00	ERROR	Completed	2023-06-06 19:46:16
1394	4	589	2023-10-04 21:28:34	577.00	Cash	Completed	2023-10-04 23:03:53
1347	13	585	2023-09-05 18:22:24	678.00	Credit Card	Completed	2023-09-05 06:06:27
1341	38	\N	2023-09-02 04:33:12	286.00	Debit Card	Completed	2023-09-02 17:02:08
1061	23	635	2023-02-13 05:32:20	621.00	ERROR	Completed	2023-02-13 07:26:22
1417	32	543	2023-10-14 22:46:44	1037.00	Debit Card	Completed	2023-10-14 16:09:42
1074	81	678	2023-02-26 14:45:44	94.00	Cash	Completed	2023-02-26 21:04:37
1873	81	635	2024-09-26 07:28:01	267.00	ERROR	Completed	2024-09-26 10:50:48
1999	19	\N	2024-12-25 11:30:53	676.00	Cash	Completed	2024-12-25 08:14:28
1957	96	604	2024-11-23 01:30:34	701.00	Credit Card	Completed	2024-11-23 12:02:22
1111	38	519	2023-04-01 04:20:07	63.00	Cash	Completed	2023-04-01 05:40:15
1082	1	\N	2023-03-06 00:32:53	336.00	ERROR	Completed	2023-03-06 08:56:01
1392	1	664	2023-10-04 03:07:30	163.00	Cash	Completed	2023-10-04 22:16:23
1838	81	610	2024-08-31 22:56:03	239.00	ERROR	Completed	2024-08-31 10:41:03
1181	71	503	2023-05-17 03:05:14	402.00	Credit Card	Completed	2023-05-17 17:19:14
1002	32	\N	2023-01-03 15:25:52	565.00	Cash	Completed	2023-01-03 11:00:47
1491	29	\N	2023-12-14 10:38:37	244.00	Debit Card	Completed	2023-12-14 05:28:47
1023	73	661	2023-01-16 15:38:22	212.00	Cash	Completed	2023-01-16 08:39:59
1817	21	560	2024-08-18 04:38:04	503.00	Credit Card	Completed	2024-08-18 11:13:47
1172	1	570	2023-05-12 02:03:27	716.00	Credit Card	Completed	2023-05-12 04:58:20
1208	85	\N	2023-06-02 02:40:37	188.00	Debit Card	Completed	2023-06-02 00:55:01
1351	81	599	2023-09-07 03:24:23	343.00	ERROR	Completed	2023-09-07 22:57:37
1660	50	566	2024-04-16 20:40:08	440.00	Credit Card	Completed	2024-04-16 14:05:27
1183	38	\N	2023-05-19 05:26:04	1108.00	Credit Card	Completed	2023-05-19 01:44:42
1633	1	\N	2024-03-29 00:03:46	480.00	Debit Card	Completed	2024-03-29 16:02:15
1676	19	568	2024-05-03 15:58:03	532.00	Credit Card	Completed	2024-05-03 07:48:38
1333	38	621	2023-08-29 22:50:12	44.00	Credit Card	Completed	2023-08-29 10:53:53
1095	66	600	2023-03-16 01:46:42	128.00	Cash	Completed	2023-03-16 04:17:52
1610	57	500	2024-03-08 15:43:34	7.00	Cash	Completed	2024-03-08 11:36:19
1958	32	530	2024-11-23 04:24:36	149.00	ERROR	Completed	2024-11-23 00:55:58
1034	96	\N	2023-01-21 07:56:28	567.00	Credit Card	Completed	2023-01-21 00:14:27
1973	6	558	2024-12-05 21:41:20	96.00	Debit Card	Completed	2024-12-05 15:17:36
2003	6	\N	2024-12-27 21:29:08	505.00	Credit Card	Completed	2024-12-27 11:36:57
1386	52	635	2023-09-28 11:21:12	680.00	Credit Card	Completed	2023-09-28 14:41:59
1903	91	552	2024-10-12 19:05:34	305.00	ERROR	Completed	2024-10-12 22:22:05
1892	73	645	2024-10-07 14:20:03	146.00	Credit Card	Completed	2024-10-07 17:27:26
1220	38	671	2023-06-10 07:14:29	373.00	ERROR	Completed	2023-06-10 19:05:56
1466	29	548	2023-11-15 04:05:31	446.00	Debit Card	Completed	2023-11-15 18:05:04
1997	23	525	2024-12-24 01:56:56	530.00	ERROR	Completed	2024-12-24 09:39:41
1689	1	579	2024-05-13 11:23:42	319.00	ERROR	Completed	2024-05-13 10:13:55
1634	23	\N	2024-03-29 04:27:13	459.00	Cash	Completed	2024-03-29 11:19:38
1363	13	\N	2023-09-13 13:25:49	700.00	Credit Card	Completed	2023-09-13 22:44:08
1504	21	640	2023-12-23 21:18:25	151.00	ERROR	Completed	2023-12-23 19:17:35
1699	81	\N	2024-05-23 05:56:12	276.00	Debit Card	Completed	2024-05-23 04:07:36
1042	93	\N	2023-01-26 13:11:45	78.00	Debit Card	Completed	2023-01-26 06:40:25
1745	32	514	2024-06-30 21:22:41	145.00	ERROR	Completed	2024-06-30 09:17:12
1404	23	579	2023-10-10 13:45:41	449.00	Cash	Completed	2023-10-10 19:37:01
1545	71	544	2024-01-22 23:35:48	645.00	Cash	Completed	2024-01-22 15:35:40
1581	91	636	2024-02-15 13:09:38	829.00	Cash	Completed	2024-02-15 06:34:07
1482	32	638	2023-12-03 10:13:37	663.00	Cash	Completed	2023-12-03 20:47:46
1657	19	601	2024-04-14 23:13:07	375.00	Credit Card	Completed	2024-04-14 04:32:09
1340	13	568	2023-09-02 00:31:28	655.00	ERROR	Completed	2023-09-02 14:04:45
1623	21	652	2024-03-23 18:05:02	442.00	Cash	Completed	2024-03-23 21:08:52
2000	32	647	2024-12-25 21:59:47	165.00	ERROR	Completed	2024-12-25 02:29:14
1396	13	609	2023-10-05 09:38:18	51.00	ERROR	Completed	2023-10-05 06:13:05
1534	13	\N	2024-01-15 18:48:20	299.00	Credit Card	Completed	2024-01-15 12:41:41
1379	66	548	2023-09-24 06:07:26	37.00	ERROR	Completed	2023-09-24 23:16:53
1532	13	515	2024-01-14 01:45:19	310.00	Cash	Completed	2024-01-14 15:30:45
1425	29	595	2023-10-19 01:57:22	267.00	Cash	Completed	2023-10-19 06:28:21
1925	21	687	2024-10-28 01:01:38	605.00	Cash	Completed	2024-10-28 10:48:47
1895	1	685	2024-10-09 10:43:07	533.00	Debit Card	Completed	2024-10-09 09:13:01
1906	38	636	2024-10-15 03:33:54	485.00	Debit Card	Completed	2024-10-15 02:07:37
1390	93	658	2023-10-02 19:32:25	422.00	Cash	Completed	2023-10-02 08:05:52
1448	21	640	2023-11-06 12:25:35	721.00	ERROR	Completed	2023-11-06 08:12:37
1981	32	620	2024-12-11 06:08:10	328.00	ERROR	Completed	2024-12-11 18:51:36
1176	23	685	2023-05-13 23:07:59	123.00	ERROR	Completed	2023-05-13 20:03:25
1186	57	671	2023-05-20 06:50:29	508.00	ERROR	Completed	2023-05-20 01:04:25
1116	13	554	2023-04-05 17:52:14	750.00	Credit Card	Completed	2023-04-05 07:34:32
1796	93	686	2024-08-03 01:06:15	692.00	ERROR	Completed	2024-08-03 13:59:13
1290	57	608	2023-07-26 23:00:08	199.00	Debit Card	Completed	2023-07-26 10:26:40
1089	57	626	2023-03-12 12:40:08	11.00	Credit Card	Completed	2023-03-12 19:22:59
1380	1	694	2023-09-25 13:47:36	363.00	Cash	Completed	2023-09-25 10:59:02
1070	32	687	2023-02-20 12:34:41	89.00	Debit Card	Completed	2023-02-20 05:57:39
1656	21	680	2024-04-14 14:00:08	286.00	Cash	Completed	2024-04-14 05:41:18
1147	29	495	2023-04-25 19:42:21	70.00	ERROR	Completed	2023-04-25 22:21:56
1280	96	562	2023-07-21 01:00:46	192.00	Cash	Completed	2023-07-21 13:58:14
1029	6	560	2023-01-18 19:25:52	235.00	Credit Card	Completed	2023-01-18 12:10:52
1605	96	609	2024-03-05 05:24:58	481.00	Debit Card	Completed	2024-03-05 04:32:10
1555	66	\N	2024-01-28 05:25:21	233.00	ERROR	Completed	2024-01-28 09:07:11
1068	50	579	2023-02-19 14:00:39	521.00	Cash	Completed	2023-02-19 13:02:09
1256	73	540	2023-07-09 17:54:29	513.00	ERROR	Completed	2023-07-09 18:04:03
1245	96	692	2023-06-28 20:59:51	369.00	Credit Card	Completed	2023-06-28 07:05:08
1211	52	640	2023-06-02 14:46:03	129.00	ERROR	Completed	2023-06-02 06:43:47
1393	73	611	2023-10-04 09:51:47	228.00	Credit Card	Completed	2023-10-04 08:53:33
1230	71	580	2023-06-18 11:16:19	311.00	Credit Card	Completed	2023-06-18 18:12:34
1423	23	694	2023-10-18 07:25:24	685.00	Credit Card	Completed	2023-10-18 22:58:03
1294	52	\N	2023-07-30 13:39:21	218.00	Credit Card	Completed	2023-07-30 15:53:55
1730	50	\N	2024-06-19 18:27:28	507.00	Credit Card	Completed	2024-06-19 22:09:57
1655	97	519	2024-04-14 06:58:04	772.00	Cash	Completed	2024-04-14 01:45:31
1114	96	673	2023-04-03 06:14:04	260.00	ERROR	Completed	2023-04-03 23:06:39
1876	6	590	2024-09-28 17:04:18	228.00	Cash	Completed	2024-09-28 21:37:06
1304	29	665	2023-08-06 14:30:58	455.00	Cash	Completed	2023-08-06 21:17:04
1590	4	633	2024-02-20 01:25:17	473.00	Credit Card	Completed	2024-02-20 14:33:59
1904	19	\N	2024-10-14 02:19:28	341.00	ERROR	Completed	2024-10-14 03:16:31
1302	32	\N	2023-08-05 12:31:36	203.00	Credit Card	Completed	2023-08-05 23:22:45
1103	96	689	2023-03-21 14:57:56	770.00	Credit Card	Completed	2023-03-21 18:36:19
1244	81	568	2023-06-28 03:37:30	191.00	Cash	Completed	2023-06-28 01:39:47
1512	81	689	2024-01-01 13:43:42	470.00	Credit Card	Completed	2024-01-01 12:04:53
2002	71	\N	2024-12-25 22:57:27	30.00	Cash	Completed	2024-12-25 15:22:36
1013	38	\N	2023-01-08 23:32:06	929.00	Debit Card	Completed	2023-01-08 17:56:47
1760	97	576	2024-07-15 20:11:26	151.00	Credit Card	Completed	2024-07-15 20:44:35
1553	38	580	2024-01-27 11:54:25	712.00	Credit Card	Completed	2024-01-27 00:10:30
1288	29	674	2023-07-25 12:08:29	962.00	Debit Card	Completed	2023-07-25 00:33:49
1207	93	\N	2023-06-01 21:47:21	267.00	Debit Card	Completed	2023-06-01 16:38:37
1839	57	\N	2024-09-02 04:50:06	444.00	Cash	Completed	2024-09-02 15:29:13
1530	93	680	2024-01-11 03:01:22	157.00	Debit Card	Completed	2024-01-11 01:12:30
1093	38	573	2023-03-13 18:53:02	298.00	Cash	Completed	2023-03-13 23:38:39
1076	4	\N	2023-02-28 23:00:01	242.00	ERROR	Completed	2023-02-28 02:09:51
1709	71	555	2024-05-29 15:59:58	352.00	ERROR	Completed	2024-05-29 07:10:53
1659	50	608	2024-04-16 06:20:39	340.00	Debit Card	Completed	2024-04-16 20:50:05
1318	96	\N	2023-08-16 22:15:30	316.00	ERROR	Completed	2023-08-16 01:20:35
1879	96	571	2024-09-30 07:41:04	373.00	Debit Card	Completed	2024-09-30 09:50:01
1939	81	628	2024-11-10 20:26:51	503.00	Cash	Completed	2024-11-10 03:53:52
1822	29	675	2024-08-21 09:27:55	109.00	Cash	Completed	2024-08-21 19:15:48
1327	57	678	2023-08-27 04:23:25	105.00	Credit Card	Completed	2023-08-27 08:42:56
1139	57	516	2023-04-21 18:03:42	149.00	Credit Card	Completed	2023-04-21 13:03:37
1450	91	584	2023-11-07 01:40:28	258.00	ERROR	Completed	2023-11-07 00:24:11
1225	52	\N	2023-06-13 00:05:02	365.00	Debit Card	Completed	2023-06-13 02:51:18
1223	81	536	2023-06-12 13:41:51	12.00	Debit Card	Completed	2023-06-12 15:07:03
1342	32	502	2023-09-02 15:39:42	416.00	Debit Card	Completed	2023-09-02 08:52:36
1731	4	536	2024-06-20 00:32:37	185.00	Credit Card	Completed	2024-06-20 02:51:49
1498	81	\N	2023-12-19 05:22:53	184.00	Credit Card	Completed	2023-12-19 08:43:42
1355	93	\N	2023-09-09 11:17:03	540.00	ERROR	Completed	2023-09-09 06:00:02
1026	97	532	2023-01-17 11:52:28	131.00	Debit Card	Completed	2023-01-17 12:01:52
1420	57	507	2023-10-16 06:18:48	138.00	Debit Card	Completed	2023-10-16 16:15:53
1320	1	672	2023-08-20 17:10:47	903.00	Cash	Completed	2023-08-20 14:31:07
1191	1	611	2023-05-22 04:35:55	235.00	Debit Card	Completed	2023-05-22 06:48:11
1867	1	689	2024-09-23 14:45:52	359.00	Cash	Completed	2024-09-23 00:40:53
1014	66	618	2023-01-09 07:39:36	329.00	Credit Card	Completed	2023-01-09 09:07:06
1125	96	599	2023-04-11 22:04:23	710.00	Credit Card	Completed	2023-04-11 07:44:09
1853	97	492	2024-09-10 22:05:01	7.00	Credit Card	Completed	2024-09-10 05:25:13
1715	52	531	2024-06-09 04:22:49	831.00	Debit Card	Completed	2024-06-09 03:47:30
1421	29	639	2023-10-16 13:08:57	645.00	Debit Card	Completed	2023-10-16 01:29:31
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, category, unit_price, cost_price, in_stock, created_at) FROM stdin;
53	Pastry situation	Pastry	$47.00	$43.00	t	2024-09-21 00:00:00
54	Pastry sure	Pastry	$47.00	$43.00	t	2022-10-20 00:00:00
55	Pastry statement	Pastry	$17.00	$14.00	t	2024-01-17 00:00:00
56	Salad on	Salad	$21.00	$20.00	t	2020-08-27 00:00:00
57	Salad really	Salad	$43.00	$40.00	t	2020-05-08 00:00:00
58	Salad bag	Salad	$9.00	$1.00	t	2023-09-25 00:00:00
59	Pastry security	Pastry	$2.00	$-3.00	f	2023-10-01 00:00:00
60	Smoothie lead	Smoothie	$48.00	$45.00	t	2021-08-06 00:00:00
61	Salad people	Salad	$10.00	$6.00	t	2024-08-29 00:00:00
62	Sandwich role	Sandwich	$13.00	$9.00	t	2024-10-20 00:00:00
63	Pastry plan	Pastry	$10.00	$2.00	t	2021-03-18 00:00:00
64	Salad bag	Salad	$37.00	$34.00	t	2023-07-22 00:00:00
65	Sandwich international	Sandwich	$18.00	$11.00	t	2021-10-19 00:00:00
66	Coffee commercial	Coffee	$47.00	$38.00	t	2020-12-04 00:00:00
67	Sandwich society	Sandwich	$37.00	$35.00	t	2021-03-20 00:00:00
68	Smoothie TV	Smoothie	$33.00	$27.00	t	2022-04-29 00:00:00
69	Sandwich room	Sandwich	$41.00	$35.00	f	2020-01-14 00:00:00
70	Salad ahead	Salad	$23.00	$17.00	t	2022-02-04 00:00:00
71	Salad east	Salad	$29.00	$26.00	t	2021-03-30 00:00:00
72	Pastry raise	Pastry	$11.00	$6.00	t	2021-03-03 00:00:00
73	Pastry put	Pastry	$23.00	$20.00	t	2024-10-26 00:00:00
74	Smoothie around	Smoothie	$37.00	$28.00	t	2022-02-27 00:00:00
75	Salad land	Salad	$39.00	$38.00	t	2023-09-01 00:00:00
76	Coffee group	Coffee	$42.00	$36.00	f	2024-03-23 00:00:00
77	Salad truth	Salad	$32.00	$27.00	t	2020-01-26 00:00:00
78	Sandwich although	Sandwich	$19.00	$16.00	t	2024-02-10 00:00:00
79	Tea budget	Tea	$32.00	$29.00	t	2022-12-11 00:00:00
80	Pastry subject	Pastry	$15.00	$12.00	t	2020-06-12 00:00:00
81	Sandwich sit	Sandwich	$35.00	$27.00	t	2024-04-19 00:00:00
82	Pastry small	Pastry	$12.00	$6.00	t	2021-08-28 00:00:00
83	Pastry dream	Pastry	$23.00	$14.00	t	2024-07-20 00:00:00
84	Sandwich begin	Sandwich	$21.00	$14.00	t	2023-02-10 00:00:00
85	Pastry how	Pastry	$34.00	$32.00	t	2020-05-31 00:00:00
86	Pastry glass	Pastry	$44.00	$40.00	t	2024-02-23 00:00:00
87	Coffee administration	Coffee	$7.00	$-3.00	t	2024-03-15 00:00:00
88	Coffee ground	Coffee	$21.00	$16.00	t	2020-04-30 00:00:00
89	Salad American	Salad	$6.00	$-2.00	t	2020-01-03 00:00:00
90	Coffee citizen	Coffee	$20.00	$12.00	t	2021-12-05 00:00:00
91	Salad push	Salad	$10.00	$2.00	t	2022-04-03 00:00:00
92	Sandwich bit	Sandwich	$33.00	$28.00	t	2023-11-11 00:00:00
93	Pastry with	Pastry	$48.00	$44.00	t	2023-10-03 00:00:00
94	Smoothie product	Smoothie	$23.00	$21.00	t	2021-01-02 00:00:00
95	Pastry kid	Pastry	$13.00	$8.00	t	2021-06-24 00:00:00
96	Sandwich foreign	Sandwich	$7.00	$0.00	t	2024-02-20 00:00:00
97	Smoothie participant	Smoothie	$34.00	$24.00	t	2022-02-22 00:00:00
98	Tea often	Tea	$46.00	$37.00	f	2023-10-12 00:00:00
99	Smoothie true	Smoothie	$20.00	$18.00	t	2024-07-05 00:00:00
100	Salad board	Salad	$35.00	$32.00	t	2024-01-28 00:00:00
101	Salad hotel	Salad	$4.00	$1.00	t	2022-04-15 00:00:00
102	Sandwich information	Sandwich	$38.00	$32.00	t	2021-11-20 00:00:00
103	Sandwich about	Sandwich	$19.00	$27.00	t	2021-11-20 00:00:00
104	Smoothie happy	Smoothie	$37.00	$43.00	t	2021-11-20 00:00:00
105	Pastry news	Pastry	$-15.00	$18.00	f	2021-11-20 00:00:00
106	Salad clearly	Salad	$-11.00	$14.00	t	2021-11-20 00:00:00
\.


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 695, true);


--
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 103, true);


--
-- Name: inventory_tracking_tracking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_tracking_tracking_id_seq', 162, true);


--
-- Name: order_details_order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_order_detail_id_seq', 3022, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 2010, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 106, true);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: inventory_tracking inventory_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_tracking
    ADD CONSTRAINT inventory_tracking_pkey PRIMARY KEY (tracking_id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (order_detail_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: idx_order_details_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_details_order ON public.order_details USING btree (order_id);


--
-- Name: idx_order_details_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_details_product ON public.order_details USING btree (product_id);


--
-- Name: idx_orders_customer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_customer ON public.orders USING btree (customer_id);


--
-- Name: idx_orders_employee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_employee ON public.orders USING btree (employee_id);


--
-- Name: inventory_tracking inventory_tracking_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_tracking
    ADD CONSTRAINT inventory_tracking_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: order_details order_details_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_details order_details_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: orders orders_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- PostgreSQL database dump complete
--

