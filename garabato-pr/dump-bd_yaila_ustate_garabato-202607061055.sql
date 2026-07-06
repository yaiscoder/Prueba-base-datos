--
-- PostgreSQL database dump
--

\restrict WK3XfQMgctlkX3y7klMSDpQSfX93k4QbkotHM3baZNXfDHSS4xzhrqKndNgvpcZ

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

-- Started on 2026-07-06 10:55:51 -05

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
-- TOC entry 223 (class 1259 OID 16756)
-- Name: riwi_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_category (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 16755)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 222
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.riwi_category.id;


--
-- TOC entry 217 (class 1259 OID 16701)
-- Name: riwi_city; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_city (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 16700)
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 216
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.riwi_city.id;


--
-- TOC entry 215 (class 1259 OID 16697)
-- Name: dataset_riwisupply; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_riwisupply (
    "MovementDate" character varying(50),
    "SupplierName" character varying(50),
    "SupplierCity" character varying(50),
    "Warehouse" character varying(50),
    "WarehouseCity" character varying(50),
    "ProductName" character varying(50),
    "Category" character varying(50),
    "Quantity" integer,
    "UnitPrice" integer,
    "MovementType" character varying(50),
    "PurchaseOrder" character varying(50)
);


--
-- TOC entry 225 (class 1259 OID 16779)
-- Name: riwi_movement_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_movement_type (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 16778)
-- Name: movement_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movement_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 224
-- Name: movement_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movement_type_id_seq OWNED BY public.riwi_movement_type.id;


--
-- TOC entry 227 (class 1259 OID 16788)
-- Name: riwi_purchase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_purchase (
    id integer NOT NULL,
    purchase_order character varying NOT NULL,
    movement_date date NOT NULL,
    id_movement_type integer NOT NULL,
    id_supplier integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16787)
-- Name: purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 226
-- Name: purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.purchase_id_seq OWNED BY public.riwi_purchase.id;


--
-- TOC entry 231 (class 1259 OID 16868)
-- Name: riwi_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_product (
    id integer NOT NULL,
    name character varying NOT NULL,
    id_category integer
);


--
-- TOC entry 232 (class 1259 OID 16871)
-- Name: riwi_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.riwi_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 232
-- Name: riwi_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.riwi_product_id_seq OWNED BY public.riwi_product.id;


--
-- TOC entry 219 (class 1259 OID 16728)
-- Name: riwi_supplier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_supplier (
    id integer NOT NULL,
    name character varying NOT NULL,
    id_city integer NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 16857)
-- Name: riwi_supplier_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_supplier_product (
    id_supplier integer NOT NULL,
    id_product integer NOT NULL,
    unity_price integer NOT NULL,
    stock integer,
    id integer NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 16938)
-- Name: riwi_supplier_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.riwi_supplier_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 234
-- Name: riwi_supplier_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.riwi_supplier_product_id_seq OWNED BY public.riwi_supplier_product.id;


--
-- TOC entry 230 (class 1259 OID 16865)
-- Name: riwi_supplier_product_purchase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_supplier_product_purchase (
    id_supplier_product integer NOT NULL,
    id_purchase integer NOT NULL,
    price integer NOT NULL,
    quantity character varying NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16742)
-- Name: riwi_warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_warehouse (
    id integer NOT NULL,
    name character varying NOT NULL,
    id_city integer NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 16907)
-- Name: riwi_warehouse_supplier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.riwi_warehouse_supplier (
    id_supplier integer NOT NULL,
    id_warehouse integer NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16727)
-- Name: supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 218
-- Name: supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.supplier_id_seq OWNED BY public.riwi_supplier.id;


--
-- TOC entry 220 (class 1259 OID 16741)
-- Name: warehouse_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 220
-- Name: warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.riwi_warehouse.id;


--
-- TOC entry 228 (class 1259 OID 16856)
-- Name: warehouse_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.warehouse_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 228
-- Name: warehouse_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.warehouse_product_id_seq OWNED BY public.riwi_supplier_product.id_supplier;


--
-- TOC entry 3318 (class 2604 OID 16759)
-- Name: riwi_category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 16704)
-- Name: riwi_city id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 16782)
-- Name: riwi_movement_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_movement_type ALTER COLUMN id SET DEFAULT nextval('public.movement_type_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 16872)
-- Name: riwi_product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_product ALTER COLUMN id SET DEFAULT nextval('public.riwi_product_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 16791)
-- Name: riwi_purchase id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_purchase ALTER COLUMN id SET DEFAULT nextval('public.purchase_id_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 16731)
-- Name: riwi_supplier id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier ALTER COLUMN id SET DEFAULT nextval('public.supplier_id_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 16920)
-- Name: riwi_supplier_product id_supplier; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier_product ALTER COLUMN id_supplier SET DEFAULT nextval('public.warehouse_product_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 16939)
-- Name: riwi_supplier_product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier_product ALTER COLUMN id SET DEFAULT nextval('public.riwi_supplier_product_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 16745)
-- Name: riwi_warehouse id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_warehouse ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);


--
-- TOC entry 3496 (class 0 OID 16697)
-- Dependencies: 215
-- Data for Name: dataset_riwisupply; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dataset_riwisupply VALUES ('2026-04-01', 'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta', 'Disco de Corte 4.5', 'Herramienta', 148, 115388, 'OUT', 'PO-1049');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-14', 'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta', 'Electrodo E6013', 'Consumible', 27, 35506, 'IN', 'PO-1041');
INSERT INTO public.dataset_riwisupply VALUES ('2026-01-01', 'Industriales SAS', 'Barranquilla', 'Bodega Costa', 'Santa Marta', 'Guante Nitrilo', 'EPP', 70, 14290, 'IN', 'PO-1022');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-16', 'Aceros del Norte S.A.S', 'Cartagena', 'Centro Logistico Norte', 'Cartagena', 'Guantes de Nitrilo', 'Elementos Protección', 160, 117524, 'IN', 'PO-1075');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-28', 'Industriales S.A.S', 'Barranquila', 'Bodega Central', 'Barranquilla', 'Electrodo E6013', 'Consumible', 40, 139836, 'OUT', 'PO-1091');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-06', 'Aceros del Norte S.A.S', 'Cartagena', 'Bod. Central', 'Barranquila', 'Disco de Corte 4.5', 'Herramienta', 130, 88512, 'OUT', 'PO-1041');
INSERT INTO public.dataset_riwisupply VALUES ('2026-01-20', 'Aceros del Norte', 'Cartagena', 'Bodega Central', 'Barranquilla', 'Soldadura E6013', 'Consumibles', 33, 43746, 'OUT', 'PO-1059');
INSERT INTO public.dataset_riwisupply VALUES ('2026-04-13', 'INDUSTRIALES SAS', 'B/quilla', 'Bodega Costa', 'Santa Marta', 'Guante Nitrilo', 'EPP', 119, 23022, 'OUT', 'PO-1035');
INSERT INTO public.dataset_riwisupply VALUES ('2026-04-17', 'Suministros Global SAS', 'Sta Marta', 'Bod. Central', 'Barranquila', 'Guantes de Nitrilo', 'Elementos Protección', 185, 123653, 'IN', 'PO-1032');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-02', 'Suministros Global SAS', 'Sta Marta', 'Bod. Central', 'Barranquila', 'Electrodo E6013', 'Consumible', 87, 123108, 'OUT', 'PO-1009');
INSERT INTO public.dataset_riwisupply VALUES ('2026-05-23', 'ACEROS NORTE', 'Ctg', 'Bodega Costa', 'Santa Marta', 'Guantes de Nitrilo', 'Elementos Protección', 175, 39944, 'IN', 'PO-1040');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-19', 'Aceros del Norte S.A.S', 'Cartagena', 'Bod. Central', 'Barranquila', 'Disco Corte 4.5', 'Herramientas', 199, 118291, 'OUT', 'PO-1023');
INSERT INTO public.dataset_riwisupply VALUES ('2026-01-25', 'INDUSTRIALES SAS', 'B/quilla', 'Centro Logistico Norte', 'Cartagena', 'Guante Nitrilo', 'EPP', 131, 71980, 'OUT', 'PO-1029');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-15', 'ACEROS NORTE', 'Ctg', 'Bodega Costa', 'Santa Marta', 'Disco de Corte 4.5', 'Herramienta', 134, 89964, 'OUT', 'PO-1035');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-12', 'Industriales SAS', 'Barranquilla', 'Bodega Central', 'Barranquilla', 'Disco Corte 4.5', 'Herramientas', 124, 52910, 'IN', 'PO-1094');
INSERT INTO public.dataset_riwisupply VALUES ('2026-04-26', 'INDUSTRIALES SAS', 'B/quilla', 'Bodega Central', 'Barranquilla', 'Disco Corte 4.5', 'Herramientas', 61, 136736, 'IN', 'PO-1034');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-03', 'INDUSTRIALES SAS', 'B/quilla', 'Centro Logistico Norte', 'Cartagena', 'Disco de Corte 4.5', 'Herramienta', 169, 18022, 'OUT', 'PO-1043');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-21', 'Aceros del Norte', 'Cartagena', 'Bodega Costa', 'Santa Marta', 'Casco Industrial', 'EPP', 192, 108802, 'OUT', 'PO-1083');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-11', 'Aceros del Norte', 'Cartagena', 'Centro Logistico Norte', 'Cartagena', 'Electrodo E6013', 'Consumible', 78, 37943, 'OUT', 'PO-1036');


--
-- TOC entry 3504 (class 0 OID 16756)
-- Dependencies: 223
-- Data for Name: riwi_category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.riwi_category VALUES (1, 'Consumible');
INSERT INTO public.riwi_category VALUES (2, 'EPP');
INSERT INTO public.riwi_category VALUES (3, 'Herramienta');


--
-- TOC entry 3498 (class 0 OID 16701)
-- Dependencies: 217
-- Data for Name: riwi_city; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.riwi_city VALUES (1, 'Barranquilla');
INSERT INTO public.riwi_city VALUES (2, 'Cartagena');
INSERT INTO public.riwi_city VALUES (3, 'Santa Marta');


--
-- TOC entry 3506 (class 0 OID 16779)
-- Dependencies: 225
-- Data for Name: riwi_movement_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.riwi_movement_type VALUES (1, 'Out');
INSERT INTO public.riwi_movement_type VALUES (2, 'In');


--
-- TOC entry 3512 (class 0 OID 16868)
-- Dependencies: 231
-- Data for Name: riwi_product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.riwi_product VALUES (1, 'Casco Industrial', 1);
INSERT INTO public.riwi_product VALUES (2, 'Disco de Corte 4.5', 3);
INSERT INTO public.riwi_product VALUES (3, 'Electrodo E6013', 1);
INSERT INTO public.riwi_product VALUES (4, 'Guantes de Nitrilo', 2);
INSERT INTO public.riwi_product VALUES (5, 'Soldadura E6013', 1);


--
-- TOC entry 3508 (class 0 OID 16788)
-- Dependencies: 227
-- Data for Name: riwi_purchase; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.riwi_purchase VALUES (1, 'PO-1049', '2026-04-01', 1, 1);
INSERT INTO public.riwi_purchase VALUES (2, 'PO-1041', '2026-02-14', 2, 1);
INSERT INTO public.riwi_purchase VALUES (3, 'PO-1022', '2026-01-01', 2, 2);
INSERT INTO public.riwi_purchase VALUES (4, 'PO-1075', '2026-02-16', 2, 1);
INSERT INTO public.riwi_purchase VALUES (5, 'PO-1091', '2026-02-28', 1, 2);


--
-- TOC entry 3500 (class 0 OID 16728)
-- Dependencies: 219
-- Data for Name: riwi_supplier; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.riwi_supplier VALUES (1, 'Aceros del Norte S.A.S', 2);
INSERT INTO public.riwi_supplier VALUES (2, 'Industriales S.A.S', 1);
INSERT INTO public.riwi_supplier VALUES (3, 'Suministros Global S.A.S', 3);


--
-- TOC entry 3510 (class 0 OID 16857)
-- Dependencies: 229
-- Data for Name: riwi_supplier_product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.riwi_supplier_product VALUES (1, 2, 148, 115388, 1);
INSERT INTO public.riwi_supplier_product VALUES (1, 3, 27, 35506, 2);
INSERT INTO public.riwi_supplier_product VALUES (1, 4, 70, 14290, 3);
INSERT INTO public.riwi_supplier_product VALUES (1, 4, 160, 117524, 4);
INSERT INTO public.riwi_supplier_product VALUES (1, 3, 40, 139836, 5);
INSERT INTO public.riwi_supplier_product VALUES (1, 2, 130, 88512, 6);
INSERT INTO public.riwi_supplier_product VALUES (1, 5, 33, 43746, 7);
INSERT INTO public.riwi_supplier_product VALUES (1, 4, 119, 23022, 8);
INSERT INTO public.riwi_supplier_product VALUES (1, 4, 185, 123653, 9);
INSERT INTO public.riwi_supplier_product VALUES (1, 3, 87, 123108, 10);
INSERT INTO public.riwi_supplier_product VALUES (1, 4, 175, 39944, 11);
INSERT INTO public.riwi_supplier_product VALUES (1, 2, 199, 118291, 12);
INSERT INTO public.riwi_supplier_product VALUES (1, 4, 131, 71980, 13);
INSERT INTO public.riwi_supplier_product VALUES (1, 2, 134, 89964, 14);
INSERT INTO public.riwi_supplier_product VALUES (1, 2, 124, 52910, 15);
INSERT INTO public.riwi_supplier_product VALUES (1, 2, 61, 136736, 16);
INSERT INTO public.riwi_supplier_product VALUES (1, 2, 169, 18022, 17);
INSERT INTO public.riwi_supplier_product VALUES (1, 1, 192, 108802, 18);
INSERT INTO public.riwi_supplier_product VALUES (1, 3, 78, 37943, 19);
INSERT INTO public.riwi_supplier_product VALUES (2, 4, 70, 14290, 20);
INSERT INTO public.riwi_supplier_product VALUES (2, 4, 160, 117524, 21);
INSERT INTO public.riwi_supplier_product VALUES (2, 2, 40, 139836, 22);
INSERT INTO public.riwi_supplier_product VALUES (2, 3, 130, 88512, 23);
INSERT INTO public.riwi_supplier_product VALUES (2, 5, 33, 43746, 24);
INSERT INTO public.riwi_supplier_product VALUES (2, 4, 119, 23022, 25);
INSERT INTO public.riwi_supplier_product VALUES (2, 4, 185, 123653, 26);
INSERT INTO public.riwi_supplier_product VALUES (2, 2, 87, 123108, 27);
INSERT INTO public.riwi_supplier_product VALUES (2, 4, 175, 39944, 28);
INSERT INTO public.riwi_supplier_product VALUES (2, 3, 199, 118291, 29);
INSERT INTO public.riwi_supplier_product VALUES (2, 4, 131, 71980, 30);
INSERT INTO public.riwi_supplier_product VALUES (2, 3, 134, 89964, 31);
INSERT INTO public.riwi_supplier_product VALUES (2, 3, 124, 52910, 32);
INSERT INTO public.riwi_supplier_product VALUES (2, 3, 61, 136736, 33);
INSERT INTO public.riwi_supplier_product VALUES (2, 3, 169, 18022, 34);
INSERT INTO public.riwi_supplier_product VALUES (3, 4, 185, 123653, 35);
INSERT INTO public.riwi_supplier_product VALUES (3, 3, 87, 123108, 36);


--
-- TOC entry 3511 (class 0 OID 16865)
-- Dependencies: 230
-- Data for Name: riwi_supplier_product_purchase; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3502 (class 0 OID 16742)
-- Dependencies: 221
-- Data for Name: riwi_warehouse; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.riwi_warehouse VALUES (1, 'Bodega Central', 1);
INSERT INTO public.riwi_warehouse VALUES (2, 'Bodega Costa', 3);
INSERT INTO public.riwi_warehouse VALUES (3, 'Centro logistico Norte', 2);


--
-- TOC entry 3514 (class 0 OID 16907)
-- Dependencies: 233
-- Data for Name: riwi_warehouse_supplier; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.riwi_warehouse_supplier VALUES (1, 3);
INSERT INTO public.riwi_warehouse_supplier VALUES (1, 2);
INSERT INTO public.riwi_warehouse_supplier VALUES (1, 1);
INSERT INTO public.riwi_warehouse_supplier VALUES (2, 2);
INSERT INTO public.riwi_warehouse_supplier VALUES (3, 1);
INSERT INTO public.riwi_warehouse_supplier VALUES (2, 1);
INSERT INTO public.riwi_warehouse_supplier VALUES (2, 3);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 222
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 216
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.city_id_seq', 3, true);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 224
-- Name: movement_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movement_type_id_seq', 2, true);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 226
-- Name: purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.purchase_id_seq', 11, true);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 232
-- Name: riwi_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.riwi_product_id_seq', 5, true);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 234
-- Name: riwi_supplier_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.riwi_supplier_product_id_seq', 36, true);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 218
-- Name: supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.supplier_id_seq', 3, true);


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 220
-- Name: warehouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.warehouse_id_seq', 3, true);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 228
-- Name: warehouse_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.warehouse_product_id_seq', 1, false);


--
-- TOC entry 3331 (class 2606 OID 16763)
-- Name: riwi_category category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 16708)
-- Name: riwi_city city_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 16786)
-- Name: riwi_movement_type movement_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_movement_type
    ADD CONSTRAINT movement_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 16795)
-- Name: riwi_purchase purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 16855)
-- Name: riwi_purchase purchase_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_purchase
    ADD CONSTRAINT purchase_unique UNIQUE (purchase_order);


--
-- TOC entry 3341 (class 2606 OID 16877)
-- Name: riwi_product riwi_product_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_product
    ADD CONSTRAINT riwi_product_pk PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 16944)
-- Name: riwi_supplier_product riwi_supplier_product_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier_product
    ADD CONSTRAINT riwi_supplier_product_pk PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 16735)
-- Name: riwi_supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 16749)
-- Name: riwi_warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 16811)
-- Name: riwi_purchase purchase_id_movement_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_purchase
    ADD CONSTRAINT purchase_id_movement_type_fkey FOREIGN KEY (id_movement_type) REFERENCES public.riwi_movement_type(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3345 (class 2606 OID 16816)
-- Name: riwi_purchase purchase_id_supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_purchase
    ADD CONSTRAINT purchase_id_supplier_fkey FOREIGN KEY (id_supplier) REFERENCES public.riwi_supplier(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3350 (class 2606 OID 16883)
-- Name: riwi_product riwi_product_riwi_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_product
    ADD CONSTRAINT riwi_product_riwi_category_fk FOREIGN KEY (id_category) REFERENCES public.riwi_category(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3348 (class 2606 OID 16933)
-- Name: riwi_supplier_product_purchase riwi_supplier_product_purchase_riwi_purchase_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier_product_purchase
    ADD CONSTRAINT riwi_supplier_product_purchase_riwi_purchase_fk FOREIGN KEY (id_purchase) REFERENCES public.riwi_purchase(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3349 (class 2606 OID 16945)
-- Name: riwi_supplier_product_purchase riwi_supplier_product_purchase_riwi_supplier_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier_product_purchase
    ADD CONSTRAINT riwi_supplier_product_purchase_riwi_supplier_product_fk FOREIGN KEY (id_supplier_product) REFERENCES public.riwi_supplier_product(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3346 (class 2606 OID 16928)
-- Name: riwi_supplier_product riwi_supplier_product_riwi_supplier_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier_product
    ADD CONSTRAINT riwi_supplier_product_riwi_supplier_fk FOREIGN KEY (id_supplier) REFERENCES public.riwi_supplier(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3347 (class 2606 OID 16892)
-- Name: riwi_supplier_product riwi_warehouse_product_riwi_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier_product
    ADD CONSTRAINT riwi_warehouse_product_riwi_product_fk FOREIGN KEY (id_product) REFERENCES public.riwi_product(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3351 (class 2606 OID 16910)
-- Name: riwi_warehouse_supplier riwi_warehouse_supplier_riwi_supplier_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_warehouse_supplier
    ADD CONSTRAINT riwi_warehouse_supplier_riwi_supplier_fk FOREIGN KEY (id_supplier) REFERENCES public.riwi_supplier(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3352 (class 2606 OID 16915)
-- Name: riwi_warehouse_supplier riwi_warehouse_supplier_riwi_warehouse_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_warehouse_supplier
    ADD CONSTRAINT riwi_warehouse_supplier_riwi_warehouse_fk FOREIGN KEY (id_warehouse) REFERENCES public.riwi_warehouse(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3342 (class 2606 OID 16831)
-- Name: riwi_supplier supplier_id_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_supplier
    ADD CONSTRAINT supplier_id_city_fkey FOREIGN KEY (id_city) REFERENCES public.riwi_city(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3343 (class 2606 OID 16826)
-- Name: riwi_warehouse warehouse_id_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.riwi_warehouse
    ADD CONSTRAINT warehouse_id_city_fkey FOREIGN KEY (id_city) REFERENCES public.riwi_city(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2026-07-06 10:55:51 -05

--
-- PostgreSQL database dump complete
--

\unrestrict WK3XfQMgctlkX3y7klMSDpQSfX93k4QbkotHM3baZNXfDHSS4xzhrqKndNgvpcZ

