--
-- PostgreSQL database dump
--

\restrict gPdmvOnvaRhJEwNvN1SQLix8PdrsTx9j9lxAHupheneDef8WqjZE3S6MAj2awj7

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-03-24 12:44:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 240 (class 1259 OID 16889)
-- Name: bai_tap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bai_tap (
    id integer NOT NULL,
    lop_hoc_phan_id integer,
    ten_bai_tap character varying(100),
    han_nop date,
    giang_vien_id integer,
    mo_ta text,
    ngay_tao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bai_tap OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16888)
-- Name: bai_tap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bai_tap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bai_tap_id_seq OWNER TO postgres;

--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 239
-- Name: bai_tap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bai_tap_id_seq OWNED BY public.bai_tap.id;


--
-- TOC entry 234 (class 1259 OID 16844)
-- Name: buoi_hoc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buoi_hoc (
    id integer NOT NULL,
    lop_hoc_phan_id integer,
    ngay_hoc date,
    trang_thai character varying(20) DEFAULT 'hoc'::character varying,
    CONSTRAINT chk_trang_thai_buoi_hoc CHECK (((trang_thai)::text = ANY ((ARRAY['hoc'::character varying, 'nghi'::character varying, 'hoc_bu'::character varying])::text[])))
);


ALTER TABLE public.buoi_hoc OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16843)
-- Name: buoi_hoc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buoi_hoc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buoi_hoc_id_seq OWNER TO postgres;

--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 233
-- Name: buoi_hoc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buoi_hoc_id_seq OWNED BY public.buoi_hoc.id;


--
-- TOC entry 232 (class 1259 OID 16825)
-- Name: dang_ky_hoc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dang_ky_hoc (
    id integer NOT NULL,
    sinh_vien_id integer,
    lop_hoc_phan_id integer,
    ngay_dang_ky date DEFAULT CURRENT_DATE
);


ALTER TABLE public.dang_ky_hoc OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16824)
-- Name: dang_ky_hoc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dang_ky_hoc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dang_ky_hoc_id_seq OWNER TO postgres;

--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 231
-- Name: dang_ky_hoc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dang_ky_hoc_id_seq OWNED BY public.dang_ky_hoc.id;


--
-- TOC entry 250 (class 1259 OID 16967)
-- Name: dang_ky_su_kien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dang_ky_su_kien (
    id integer NOT NULL,
    su_kien_id integer,
    sinh_vien_id integer,
    trang_thai character varying(20),
    thoi_gian_dang_ky timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.dang_ky_su_kien OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16966)
-- Name: dang_ky_su_kien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dang_ky_su_kien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dang_ky_su_kien_id_seq OWNER TO postgres;

--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 249
-- Name: dang_ky_su_kien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dang_ky_su_kien_id_seq OWNED BY public.dang_ky_su_kien.id;


--
-- TOC entry 238 (class 1259 OID 16870)
-- Name: diem_danh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diem_danh (
    id integer NOT NULL,
    buoi_hoc_id integer,
    sinh_vien_id integer,
    trang_thai character varying(20),
    thoi_gian timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    hinh_thuc character varying(20)
);


ALTER TABLE public.diem_danh OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16869)
-- Name: diem_danh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diem_danh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diem_danh_id_seq OWNER TO postgres;

--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 237
-- Name: diem_danh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diem_danh_id_seq OWNED BY public.diem_danh.id;


--
-- TOC entry 244 (class 1259 OID 16920)
-- Name: diem_ren_luyen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diem_ren_luyen (
    id integer NOT NULL,
    sinh_vien_id integer,
    tong_diem integer,
    xep_loai character varying(20),
    hoc_ky character varying(20),
    CONSTRAINT diem_ren_luyen_tong_diem_check CHECK ((tong_diem <= 100))
);


ALTER TABLE public.diem_ren_luyen OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16919)
-- Name: diem_ren_luyen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diem_ren_luyen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diem_ren_luyen_id_seq OWNER TO postgres;

--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 243
-- Name: diem_ren_luyen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diem_ren_luyen_id_seq OWNED BY public.diem_ren_luyen.id;


--
-- TOC entry 226 (class 1259 OID 16786)
-- Name: giang_vien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.giang_vien (
    id integer NOT NULL,
    nguoi_dung_id integer,
    ho_ten character varying(100),
    bo_mon character varying(100)
);


ALTER TABLE public.giang_vien OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16785)
-- Name: giang_vien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.giang_vien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.giang_vien_id_seq OWNER TO postgres;

--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 225
-- Name: giang_vien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.giang_vien_id_seq OWNED BY public.giang_vien.id;


--
-- TOC entry 228 (class 1259 OID 16799)
-- Name: hoc_phan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hoc_phan (
    id integer NOT NULL,
    ten_hoc_phan character varying(100),
    so_tin_chi integer
);


ALTER TABLE public.hoc_phan OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16798)
-- Name: hoc_phan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hoc_phan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hoc_phan_id_seq OWNER TO postgres;

--
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 227
-- Name: hoc_phan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hoc_phan_id_seq OWNED BY public.hoc_phan.id;


--
-- TOC entry 254 (class 1259 OID 17139)
-- Name: lich_hoc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lich_hoc (
    id integer NOT NULL,
    lop_hoc_phan_id integer,
    thu integer,
    gio_bat_dau time without time zone,
    gio_ket_thuc time without time zone,
    phong character varying(20)
);


ALTER TABLE public.lich_hoc OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 17138)
-- Name: lich_hoc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lich_hoc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lich_hoc_id_seq OWNER TO postgres;

--
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 253
-- Name: lich_hoc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lich_hoc_id_seq OWNED BY public.lich_hoc.id;


--
-- TOC entry 252 (class 1259 OID 16986)
-- Name: lich_su_diem_ren_luyen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lich_su_diem_ren_luyen (
    id integer NOT NULL,
    sinh_vien_id integer,
    so_diem integer,
    ly_do text,
    hoc_ky character varying(20),
    admin_id integer,
    thoi_gian timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.lich_su_diem_ren_luyen OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16985)
-- Name: lich_su_diem_ren_luyen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lich_su_diem_ren_luyen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lich_su_diem_ren_luyen_id_seq OWNER TO postgres;

--
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 251
-- Name: lich_su_diem_ren_luyen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lich_su_diem_ren_luyen_id_seq OWNED BY public.lich_su_diem_ren_luyen.id;


--
-- TOC entry 230 (class 1259 OID 16807)
-- Name: lop_hoc_phan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lop_hoc_phan (
    id integer NOT NULL,
    hoc_phan_id integer,
    giang_vien_id integer,
    hoc_ky character varying(20),
    si_so_toi_da integer DEFAULT 50,
    ma_lop character varying(20)
);


ALTER TABLE public.lop_hoc_phan OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16806)
-- Name: lop_hoc_phan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lop_hoc_phan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lop_hoc_phan_id_seq OWNER TO postgres;

--
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 229
-- Name: lop_hoc_phan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lop_hoc_phan_id_seq OWNED BY public.lop_hoc_phan.id;


--
-- TOC entry 222 (class 1259 OID 16752)
-- Name: nguoi_dung; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nguoi_dung (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    mat_khau character varying(255) NOT NULL,
    vai_tro_id integer
);


ALTER TABLE public.nguoi_dung OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16751)
-- Name: nguoi_dung_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nguoi_dung_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nguoi_dung_id_seq OWNER TO postgres;

--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 221
-- Name: nguoi_dung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nguoi_dung_id_seq OWNED BY public.nguoi_dung.id;


--
-- TOC entry 242 (class 1259 OID 16902)
-- Name: nop_bai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nop_bai (
    id integer NOT NULL,
    bai_tap_id integer,
    sinh_vien_id integer,
    ngay_nop date,
    trang_thai character varying(20)
);


ALTER TABLE public.nop_bai OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16901)
-- Name: nop_bai_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nop_bai_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nop_bai_id_seq OWNER TO postgres;

--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 241
-- Name: nop_bai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nop_bai_id_seq OWNED BY public.nop_bai.id;


--
-- TOC entry 246 (class 1259 OID 16934)
-- Name: phan_cong_giang_day; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phan_cong_giang_day (
    id integer NOT NULL,
    giang_vien_id integer,
    lop_hoc_phan_id integer
);


ALTER TABLE public.phan_cong_giang_day OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16933)
-- Name: phan_cong_giang_day_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phan_cong_giang_day_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.phan_cong_giang_day_id_seq OWNER TO postgres;

--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 245
-- Name: phan_cong_giang_day_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phan_cong_giang_day_id_seq OWNED BY public.phan_cong_giang_day.id;


--
-- TOC entry 236 (class 1259 OID 16857)
-- Name: phien_diem_danh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phien_diem_danh (
    id integer NOT NULL,
    buoi_hoc_id integer,
    ma_qr_phien character varying(100),
    bat_dau timestamp without time zone,
    ket_thuc timestamp without time zone
);


ALTER TABLE public.phien_diem_danh OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16856)
-- Name: phien_diem_danh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phien_diem_danh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.phien_diem_danh_id_seq OWNER TO postgres;

--
-- TOC entry 5255 (class 0 OID 0)
-- Dependencies: 235
-- Name: phien_diem_danh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phien_diem_danh_id_seq OWNED BY public.phien_diem_danh.id;


--
-- TOC entry 224 (class 1259 OID 16769)
-- Name: sinh_vien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sinh_vien (
    id integer NOT NULL,
    nguoi_dung_id integer,
    mssv character varying(20),
    ho_ten character varying(100),
    lop character varying(20),
    ma_qr character varying(100)
);


ALTER TABLE public.sinh_vien OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16768)
-- Name: sinh_vien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sinh_vien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sinh_vien_id_seq OWNER TO postgres;

--
-- TOC entry 5256 (class 0 OID 0)
-- Dependencies: 223
-- Name: sinh_vien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sinh_vien_id_seq OWNED BY public.sinh_vien.id;


--
-- TOC entry 248 (class 1259 OID 16952)
-- Name: su_kien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.su_kien (
    id integer NOT NULL,
    ten_su_kien character varying(150),
    mo_ta text,
    ngay_to_chuc date,
    dia_diem character varying(100),
    diem_cong integer,
    admin_id integer
);


ALTER TABLE public.su_kien OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16951)
-- Name: su_kien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.su_kien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.su_kien_id_seq OWNER TO postgres;

--
-- TOC entry 5257 (class 0 OID 0)
-- Dependencies: 247
-- Name: su_kien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.su_kien_id_seq OWNED BY public.su_kien.id;


--
-- TOC entry 256 (class 1259 OID 17156)
-- Name: thanh_toan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thanh_toan (
    id integer NOT NULL,
    sinh_vien_id integer NOT NULL,
    lop_hoc_phan_id integer NOT NULL,
    so_tien numeric(10,2) NOT NULL,
    trang_thai character varying(20) DEFAULT 'chua_thanh_toan'::character varying,
    phuong_thuc character varying(50),
    thoi_gian_thanh_toan timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_trang_thai_tt CHECK (((trang_thai)::text = ANY ((ARRAY['chua_thanh_toan'::character varying, 'da_thanh_toan'::character varying, 'that_bai'::character varying])::text[])))
);


ALTER TABLE public.thanh_toan OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 17155)
-- Name: thanh_toan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thanh_toan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thanh_toan_id_seq OWNER TO postgres;

--
-- TOC entry 5258 (class 0 OID 0)
-- Dependencies: 255
-- Name: thanh_toan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thanh_toan_id_seq OWNED BY public.thanh_toan.id;


--
-- TOC entry 220 (class 1259 OID 16741)
-- Name: vai_tro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vai_tro (
    id integer NOT NULL,
    ten_vai_tro character varying(50) NOT NULL
);


ALTER TABLE public.vai_tro OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16740)
-- Name: vai_tro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vai_tro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vai_tro_id_seq OWNER TO postgres;

--
-- TOC entry 5259 (class 0 OID 0)
-- Dependencies: 219
-- Name: vai_tro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vai_tro_id_seq OWNED BY public.vai_tro.id;


--
-- TOC entry 4960 (class 2604 OID 16892)
-- Name: bai_tap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bai_tap ALTER COLUMN id SET DEFAULT nextval('public.bai_tap_id_seq'::regclass);


--
-- TOC entry 4955 (class 2604 OID 16847)
-- Name: buoi_hoc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buoi_hoc ALTER COLUMN id SET DEFAULT nextval('public.buoi_hoc_id_seq'::regclass);


--
-- TOC entry 4953 (class 2604 OID 16828)
-- Name: dang_ky_hoc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dang_ky_hoc ALTER COLUMN id SET DEFAULT nextval('public.dang_ky_hoc_id_seq'::regclass);


--
-- TOC entry 4966 (class 2604 OID 16970)
-- Name: dang_ky_su_kien id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dang_ky_su_kien ALTER COLUMN id SET DEFAULT nextval('public.dang_ky_su_kien_id_seq'::regclass);


--
-- TOC entry 4958 (class 2604 OID 16873)
-- Name: diem_danh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diem_danh ALTER COLUMN id SET DEFAULT nextval('public.diem_danh_id_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 16923)
-- Name: diem_ren_luyen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diem_ren_luyen ALTER COLUMN id SET DEFAULT nextval('public.diem_ren_luyen_id_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 16789)
-- Name: giang_vien id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giang_vien ALTER COLUMN id SET DEFAULT nextval('public.giang_vien_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 16802)
-- Name: hoc_phan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoc_phan ALTER COLUMN id SET DEFAULT nextval('public.hoc_phan_id_seq'::regclass);


--
-- TOC entry 4970 (class 2604 OID 17142)
-- Name: lich_hoc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lich_hoc ALTER COLUMN id SET DEFAULT nextval('public.lich_hoc_id_seq'::regclass);


--
-- TOC entry 4968 (class 2604 OID 16989)
-- Name: lich_su_diem_ren_luyen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lich_su_diem_ren_luyen ALTER COLUMN id SET DEFAULT nextval('public.lich_su_diem_ren_luyen_id_seq'::regclass);


--
-- TOC entry 4951 (class 2604 OID 16810)
-- Name: lop_hoc_phan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lop_hoc_phan ALTER COLUMN id SET DEFAULT nextval('public.lop_hoc_phan_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 16755)
-- Name: nguoi_dung id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nguoi_dung ALTER COLUMN id SET DEFAULT nextval('public.nguoi_dung_id_seq'::regclass);


--
-- TOC entry 4962 (class 2604 OID 16905)
-- Name: nop_bai id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nop_bai ALTER COLUMN id SET DEFAULT nextval('public.nop_bai_id_seq'::regclass);


--
-- TOC entry 4964 (class 2604 OID 16937)
-- Name: phan_cong_giang_day id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phan_cong_giang_day ALTER COLUMN id SET DEFAULT nextval('public.phan_cong_giang_day_id_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 16860)
-- Name: phien_diem_danh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phien_diem_danh ALTER COLUMN id SET DEFAULT nextval('public.phien_diem_danh_id_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 16772)
-- Name: sinh_vien id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinh_vien ALTER COLUMN id SET DEFAULT nextval('public.sinh_vien_id_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 16955)
-- Name: su_kien id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.su_kien ALTER COLUMN id SET DEFAULT nextval('public.su_kien_id_seq'::regclass);


--
-- TOC entry 4971 (class 2604 OID 17159)
-- Name: thanh_toan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thanh_toan ALTER COLUMN id SET DEFAULT nextval('public.thanh_toan_id_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 16744)
-- Name: vai_tro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vai_tro ALTER COLUMN id SET DEFAULT nextval('public.vai_tro_id_seq'::regclass);


--
-- TOC entry 5219 (class 0 OID 16889)
-- Dependencies: 240
-- Data for Name: bai_tap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bai_tap (id, lop_hoc_phan_id, ten_bai_tap, han_nop, giang_vien_id, mo_ta, ngay_tao) FROM stdin;
1	13	Bài tập học phần 13	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
2	14	Bài tập học phần 14	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
3	15	Bài tập học phần 15	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
4	16	Bài tập học phần 16	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
5	17	Bài tập học phần 17	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
6	18	Bài tập học phần 18	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
7	19	Bài tập học phần 19	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
8	20	Bài tập học phần 20	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
9	21	Bài tập học phần 21	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
10	22	Bài tập học phần 22	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
11	23	Bài tập học phần 23	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
12	24	Bài tập học phần 24	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
13	25	Bài tập học phần 25	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
14	26	Bài tập học phần 26	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
15	27	Bài tập học phần 27	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
16	28	Bài tập học phần 28	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
17	29	Bài tập học phần 29	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
18	30	Bài tập học phần 30	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
19	31	Bài tập học phần 31	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
20	32	Bài tập học phần 32	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
21	33	Bài tập học phần 33	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
22	34	Bài tập học phần 34	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
23	35	Bài tập học phần 35	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
24	36	Bài tập học phần 36	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
25	37	Bài tập học phần 37	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
26	38	Bài tập học phần 38	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
27	39	Bài tập học phần 39	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
28	40	Bài tập học phần 40	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
29	41	Bài tập học phần 41	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
30	42	Bài tập học phần 42	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
31	43	Bài tập học phần 43	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
32	44	Bài tập học phần 44	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
33	45	Bài tập học phần 45	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
34	46	Bài tập học phần 46	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
35	47	Bài tập học phần 47	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
36	48	Bài tập học phần 48	2026-01-22	11	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
37	13	Bài tập học phần 13	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
38	14	Bài tập học phần 14	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
39	15	Bài tập học phần 15	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
40	16	Bài tập học phần 16	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
41	17	Bài tập học phần 17	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
42	18	Bài tập học phần 18	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
43	19	Bài tập học phần 19	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
44	20	Bài tập học phần 20	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
45	21	Bài tập học phần 21	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
46	22	Bài tập học phần 22	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
47	23	Bài tập học phần 23	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
48	24	Bài tập học phần 24	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
49	25	Bài tập học phần 25	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
50	26	Bài tập học phần 26	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
51	27	Bài tập học phần 27	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
52	28	Bài tập học phần 28	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
53	29	Bài tập học phần 29	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
54	30	Bài tập học phần 30	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
55	31	Bài tập học phần 31	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
56	32	Bài tập học phần 32	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
57	33	Bài tập học phần 33	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
58	34	Bài tập học phần 34	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
59	35	Bài tập học phần 35	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
60	36	Bài tập học phần 36	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
61	37	Bài tập học phần 37	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
62	38	Bài tập học phần 38	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
63	39	Bài tập học phần 39	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
64	40	Bài tập học phần 40	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
65	41	Bài tập học phần 41	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
66	42	Bài tập học phần 42	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
67	43	Bài tập học phần 43	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
68	44	Bài tập học phần 44	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
69	45	Bài tập học phần 45	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
70	46	Bài tập học phần 46	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
71	47	Bài tập học phần 47	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
72	48	Bài tập học phần 48	2026-01-22	12	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
73	13	Bài tập học phần 13	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
74	14	Bài tập học phần 14	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
75	15	Bài tập học phần 15	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
76	16	Bài tập học phần 16	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
77	17	Bài tập học phần 17	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
78	18	Bài tập học phần 18	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
79	19	Bài tập học phần 19	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
80	20	Bài tập học phần 20	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
81	21	Bài tập học phần 21	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
82	22	Bài tập học phần 22	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
83	23	Bài tập học phần 23	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
84	24	Bài tập học phần 24	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
85	25	Bài tập học phần 25	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
86	26	Bài tập học phần 26	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
87	27	Bài tập học phần 27	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
88	28	Bài tập học phần 28	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
89	29	Bài tập học phần 29	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
90	30	Bài tập học phần 30	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
91	31	Bài tập học phần 31	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
92	32	Bài tập học phần 32	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
93	33	Bài tập học phần 33	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
94	34	Bài tập học phần 34	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
95	35	Bài tập học phần 35	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
96	36	Bài tập học phần 36	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
97	37	Bài tập học phần 37	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
98	38	Bài tập học phần 38	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
99	39	Bài tập học phần 39	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
100	40	Bài tập học phần 40	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
101	41	Bài tập học phần 41	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
102	42	Bài tập học phần 42	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
103	43	Bài tập học phần 43	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
104	44	Bài tập học phần 44	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
105	45	Bài tập học phần 45	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
106	46	Bài tập học phần 46	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
107	47	Bài tập học phần 47	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
108	48	Bài tập học phần 48	2026-01-22	13	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
109	13	Bài tập học phần 13	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
110	14	Bài tập học phần 14	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
111	15	Bài tập học phần 15	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
112	16	Bài tập học phần 16	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
113	17	Bài tập học phần 17	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
114	18	Bài tập học phần 18	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
115	19	Bài tập học phần 19	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
116	20	Bài tập học phần 20	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
117	21	Bài tập học phần 21	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
118	22	Bài tập học phần 22	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
119	23	Bài tập học phần 23	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
120	24	Bài tập học phần 24	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
121	25	Bài tập học phần 25	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
122	26	Bài tập học phần 26	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
123	27	Bài tập học phần 27	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
124	28	Bài tập học phần 28	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
125	29	Bài tập học phần 29	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
126	30	Bài tập học phần 30	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
127	31	Bài tập học phần 31	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
128	32	Bài tập học phần 32	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
129	33	Bài tập học phần 33	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
130	34	Bài tập học phần 34	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
131	35	Bài tập học phần 35	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
132	36	Bài tập học phần 36	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
133	37	Bài tập học phần 37	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
134	38	Bài tập học phần 38	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
135	39	Bài tập học phần 39	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
136	40	Bài tập học phần 40	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
137	41	Bài tập học phần 41	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
138	42	Bài tập học phần 42	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
139	43	Bài tập học phần 43	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
140	44	Bài tập học phần 44	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
141	45	Bài tập học phần 45	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
142	46	Bài tập học phần 46	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
143	47	Bài tập học phần 47	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
144	48	Bài tập học phần 48	2026-01-22	14	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
145	13	Bài tập học phần 13	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
146	14	Bài tập học phần 14	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
147	15	Bài tập học phần 15	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
148	16	Bài tập học phần 16	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
149	17	Bài tập học phần 17	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
150	18	Bài tập học phần 18	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
151	19	Bài tập học phần 19	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
152	20	Bài tập học phần 20	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
153	21	Bài tập học phần 21	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
154	22	Bài tập học phần 22	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
155	23	Bài tập học phần 23	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
156	24	Bài tập học phần 24	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
157	25	Bài tập học phần 25	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
158	26	Bài tập học phần 26	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
159	27	Bài tập học phần 27	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
160	28	Bài tập học phần 28	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
161	29	Bài tập học phần 29	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
162	30	Bài tập học phần 30	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
163	31	Bài tập học phần 31	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
164	32	Bài tập học phần 32	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
165	33	Bài tập học phần 33	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
166	34	Bài tập học phần 34	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
167	35	Bài tập học phần 35	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
168	36	Bài tập học phần 36	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
169	37	Bài tập học phần 37	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
170	38	Bài tập học phần 38	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
171	39	Bài tập học phần 39	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
172	40	Bài tập học phần 40	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
173	41	Bài tập học phần 41	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
174	42	Bài tập học phần 42	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
175	43	Bài tập học phần 43	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
176	44	Bài tập học phần 44	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
177	45	Bài tập học phần 45	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
178	46	Bài tập học phần 46	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
179	47	Bài tập học phần 47	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
180	48	Bài tập học phần 48	2026-01-22	15	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
181	13	Bài tập học phần 13	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
182	14	Bài tập học phần 14	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
183	15	Bài tập học phần 15	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
184	16	Bài tập học phần 16	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
185	17	Bài tập học phần 17	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
186	18	Bài tập học phần 18	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
187	19	Bài tập học phần 19	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
188	20	Bài tập học phần 20	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
189	21	Bài tập học phần 21	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
190	22	Bài tập học phần 22	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
191	23	Bài tập học phần 23	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
192	24	Bài tập học phần 24	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
193	25	Bài tập học phần 25	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
194	26	Bài tập học phần 26	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
195	27	Bài tập học phần 27	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
196	28	Bài tập học phần 28	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
197	29	Bài tập học phần 29	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
198	30	Bài tập học phần 30	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
199	31	Bài tập học phần 31	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
200	32	Bài tập học phần 32	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
201	33	Bài tập học phần 33	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
202	34	Bài tập học phần 34	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
203	35	Bài tập học phần 35	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
204	36	Bài tập học phần 36	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
205	37	Bài tập học phần 37	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
206	38	Bài tập học phần 38	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
207	39	Bài tập học phần 39	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
208	40	Bài tập học phần 40	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
209	41	Bài tập học phần 41	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
210	42	Bài tập học phần 42	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
211	43	Bài tập học phần 43	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
212	44	Bài tập học phần 44	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
213	45	Bài tập học phần 45	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
214	46	Bài tập học phần 46	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
215	47	Bài tập học phần 47	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
216	48	Bài tập học phần 48	2026-01-22	16	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
217	13	Bài tập học phần 13	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
218	14	Bài tập học phần 14	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
219	15	Bài tập học phần 15	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
220	16	Bài tập học phần 16	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
221	17	Bài tập học phần 17	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
222	18	Bài tập học phần 18	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
223	19	Bài tập học phần 19	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
224	20	Bài tập học phần 20	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
225	21	Bài tập học phần 21	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
226	22	Bài tập học phần 22	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
227	23	Bài tập học phần 23	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
228	24	Bài tập học phần 24	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
229	25	Bài tập học phần 25	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
230	26	Bài tập học phần 26	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
231	27	Bài tập học phần 27	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
232	28	Bài tập học phần 28	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
233	29	Bài tập học phần 29	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
234	30	Bài tập học phần 30	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
235	31	Bài tập học phần 31	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
236	32	Bài tập học phần 32	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
237	33	Bài tập học phần 33	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
238	34	Bài tập học phần 34	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
239	35	Bài tập học phần 35	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
240	36	Bài tập học phần 36	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
241	37	Bài tập học phần 37	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
242	38	Bài tập học phần 38	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
243	39	Bài tập học phần 39	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
244	40	Bài tập học phần 40	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
245	41	Bài tập học phần 41	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
246	42	Bài tập học phần 42	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
247	43	Bài tập học phần 43	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
248	44	Bài tập học phần 44	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
249	45	Bài tập học phần 45	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
250	46	Bài tập học phần 46	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
251	47	Bài tập học phần 47	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
252	48	Bài tập học phần 48	2026-01-22	17	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
253	13	Bài tập học phần 13	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
254	14	Bài tập học phần 14	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
255	15	Bài tập học phần 15	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
256	16	Bài tập học phần 16	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
257	17	Bài tập học phần 17	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
258	18	Bài tập học phần 18	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
259	19	Bài tập học phần 19	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
260	20	Bài tập học phần 20	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
261	21	Bài tập học phần 21	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
262	22	Bài tập học phần 22	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
263	23	Bài tập học phần 23	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
264	24	Bài tập học phần 24	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
265	25	Bài tập học phần 25	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
266	26	Bài tập học phần 26	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
267	27	Bài tập học phần 27	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
268	28	Bài tập học phần 28	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
269	29	Bài tập học phần 29	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
270	30	Bài tập học phần 30	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
271	31	Bài tập học phần 31	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
272	32	Bài tập học phần 32	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
273	33	Bài tập học phần 33	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
274	34	Bài tập học phần 34	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
275	35	Bài tập học phần 35	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
276	36	Bài tập học phần 36	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
277	37	Bài tập học phần 37	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
278	38	Bài tập học phần 38	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
279	39	Bài tập học phần 39	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
280	40	Bài tập học phần 40	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
281	41	Bài tập học phần 41	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
282	42	Bài tập học phần 42	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
283	43	Bài tập học phần 43	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
284	44	Bài tập học phần 44	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
285	45	Bài tập học phần 45	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
286	46	Bài tập học phần 46	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
287	47	Bài tập học phần 47	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
288	48	Bài tập học phần 48	2026-01-22	18	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
289	13	Bài tập học phần 13	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
290	14	Bài tập học phần 14	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
291	15	Bài tập học phần 15	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
292	16	Bài tập học phần 16	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
293	17	Bài tập học phần 17	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
294	18	Bài tập học phần 18	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
295	19	Bài tập học phần 19	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
296	20	Bài tập học phần 20	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
297	21	Bài tập học phần 21	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
298	22	Bài tập học phần 22	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
299	23	Bài tập học phần 23	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
300	24	Bài tập học phần 24	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
301	25	Bài tập học phần 25	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
302	26	Bài tập học phần 26	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
303	27	Bài tập học phần 27	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
304	28	Bài tập học phần 28	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
305	29	Bài tập học phần 29	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
306	30	Bài tập học phần 30	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
307	31	Bài tập học phần 31	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
308	32	Bài tập học phần 32	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
309	33	Bài tập học phần 33	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
310	34	Bài tập học phần 34	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
311	35	Bài tập học phần 35	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
312	36	Bài tập học phần 36	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
313	37	Bài tập học phần 37	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
314	38	Bài tập học phần 38	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
315	39	Bài tập học phần 39	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
316	40	Bài tập học phần 40	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
317	41	Bài tập học phần 41	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
318	42	Bài tập học phần 42	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
319	43	Bài tập học phần 43	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
320	44	Bài tập học phần 44	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
321	45	Bài tập học phần 45	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
322	46	Bài tập học phần 46	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
323	47	Bài tập học phần 47	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
324	48	Bài tập học phần 48	2026-01-22	19	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
325	13	Bài tập học phần 13	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 13	2026-01-08 00:00:00
326	14	Bài tập học phần 14	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 14	2026-01-08 00:00:00
327	15	Bài tập học phần 15	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 15	2026-01-08 00:00:00
328	16	Bài tập học phần 16	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 16	2026-01-08 00:00:00
329	17	Bài tập học phần 17	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 17	2026-01-08 00:00:00
330	18	Bài tập học phần 18	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 18	2026-01-08 00:00:00
331	19	Bài tập học phần 19	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 19	2026-01-08 00:00:00
332	20	Bài tập học phần 20	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 20	2026-01-08 00:00:00
333	21	Bài tập học phần 21	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 21	2026-01-08 00:00:00
334	22	Bài tập học phần 22	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 22	2026-01-08 00:00:00
335	23	Bài tập học phần 23	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 23	2026-01-08 00:00:00
336	24	Bài tập học phần 24	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 24	2026-01-08 00:00:00
337	25	Bài tập học phần 25	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 25	2026-01-08 00:00:00
338	26	Bài tập học phần 26	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 26	2026-01-08 00:00:00
339	27	Bài tập học phần 27	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 27	2026-01-08 00:00:00
340	28	Bài tập học phần 28	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 28	2026-01-08 00:00:00
341	29	Bài tập học phần 29	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 29	2026-01-08 00:00:00
342	30	Bài tập học phần 30	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 30	2026-01-08 00:00:00
343	31	Bài tập học phần 31	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 31	2026-01-08 00:00:00
344	32	Bài tập học phần 32	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 32	2026-01-08 00:00:00
345	33	Bài tập học phần 33	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 33	2026-01-08 00:00:00
346	34	Bài tập học phần 34	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 34	2026-01-08 00:00:00
347	35	Bài tập học phần 35	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 35	2026-01-08 00:00:00
348	36	Bài tập học phần 36	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 36	2026-01-08 00:00:00
349	37	Bài tập học phần 37	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 37	2026-01-08 00:00:00
350	38	Bài tập học phần 38	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 38	2026-01-08 00:00:00
351	39	Bài tập học phần 39	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 39	2026-01-08 00:00:00
352	40	Bài tập học phần 40	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 40	2026-01-08 00:00:00
353	41	Bài tập học phần 41	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 41	2026-01-08 00:00:00
354	42	Bài tập học phần 42	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 42	2026-01-08 00:00:00
355	43	Bài tập học phần 43	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 43	2026-01-08 00:00:00
356	44	Bài tập học phần 44	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 44	2026-01-08 00:00:00
357	45	Bài tập học phần 45	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 45	2026-01-08 00:00:00
358	46	Bài tập học phần 46	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 46	2026-01-08 00:00:00
359	47	Bài tập học phần 47	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 47	2026-01-08 00:00:00
360	48	Bài tập học phần 48	2026-01-22	20	Bài tập do giảng viên giao cho lớp học phần 48	2026-01-08 00:00:00
\.


--
-- TOC entry 5213 (class 0 OID 16844)
-- Dependencies: 234
-- Data for Name: buoi_hoc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buoi_hoc (id, lop_hoc_phan_id, ngay_hoc, trang_thai) FROM stdin;
1	13	2026-01-08	hoc
2	14	2026-01-09	hoc
4	16	2026-01-11	hoc
5	17	2026-01-12	hoc
6	18	2026-01-13	hoc
8	20	2026-01-15	hoc
9	21	2026-01-16	hoc
10	22	2026-01-17	hoc
11	23	2026-01-18	hoc
13	25	2026-01-20	hoc
15	27	2026-01-22	hoc
16	28	2026-01-23	hoc
17	29	2026-01-24	hoc
18	30	2026-01-25	hoc
19	31	2026-01-26	hoc
20	32	2026-01-27	hoc
22	34	2026-01-29	hoc
23	35	2026-01-30	hoc
24	36	2026-01-31	hoc
25	37	2026-02-01	hoc
26	38	2026-02-02	hoc
27	39	2026-02-03	hoc
29	41	2026-02-05	hoc
31	43	2026-02-07	hoc
32	44	2026-02-08	hoc
33	45	2026-02-09	hoc
34	46	2026-02-10	hoc
36	48	2026-02-12	hoc
7	19	2026-01-14	nghi
14	26	2026-01-21	nghi
28	40	2026-02-04	nghi
35	47	2026-02-11	nghi
3	15	2026-01-10	hoc_bu
12	24	2026-01-19	hoc_bu
21	33	2026-01-28	hoc_bu
30	42	2026-02-06	hoc_bu
\.


--
-- TOC entry 5211 (class 0 OID 16825)
-- Dependencies: 232
-- Data for Name: dang_ky_hoc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dang_ky_hoc (id, sinh_vien_id, lop_hoc_phan_id, ngay_dang_ky) FROM stdin;
1	67	13	2026-01-08
2	67	14	2026-01-08
3	67	15	2026-01-08
4	67	16	2026-01-08
5	67	17	2026-01-08
6	67	18	2026-01-08
7	67	19	2026-01-08
8	67	20	2026-01-08
9	67	21	2026-01-08
10	67	22	2026-01-08
11	67	23	2026-01-08
12	67	24	2026-01-08
13	67	25	2026-01-08
14	67	26	2026-01-08
15	67	27	2026-01-08
16	67	28	2026-01-08
17	67	29	2026-01-08
18	67	30	2026-01-08
19	67	31	2026-01-08
20	67	32	2026-01-08
21	67	33	2026-01-08
22	67	34	2026-01-08
23	67	35	2026-01-08
24	67	36	2026-01-08
25	67	37	2026-01-08
26	67	38	2026-01-08
27	67	39	2026-01-08
28	67	40	2026-01-08
29	67	41	2026-01-08
30	67	42	2026-01-08
31	67	43	2026-01-08
32	67	44	2026-01-08
33	67	45	2026-01-08
34	67	46	2026-01-08
35	67	47	2026-01-08
36	67	48	2026-01-08
37	68	13	2026-01-08
38	68	14	2026-01-08
39	68	15	2026-01-08
40	68	16	2026-01-08
41	68	17	2026-01-08
42	68	18	2026-01-08
43	68	19	2026-01-08
44	68	20	2026-01-08
45	68	21	2026-01-08
46	68	22	2026-01-08
47	68	23	2026-01-08
48	68	24	2026-01-08
49	68	25	2026-01-08
50	68	26	2026-01-08
51	68	27	2026-01-08
52	68	28	2026-01-08
53	68	29	2026-01-08
54	68	30	2026-01-08
55	68	31	2026-01-08
56	68	32	2026-01-08
57	68	33	2026-01-08
58	68	34	2026-01-08
59	68	35	2026-01-08
60	68	36	2026-01-08
61	68	37	2026-01-08
62	68	38	2026-01-08
63	68	39	2026-01-08
64	68	40	2026-01-08
65	68	41	2026-01-08
66	68	42	2026-01-08
67	68	43	2026-01-08
68	68	44	2026-01-08
69	68	45	2026-01-08
70	68	46	2026-01-08
71	68	47	2026-01-08
72	68	48	2026-01-08
73	69	13	2026-01-08
74	69	14	2026-01-08
75	69	15	2026-01-08
76	69	16	2026-01-08
77	69	17	2026-01-08
78	69	18	2026-01-08
79	69	19	2026-01-08
80	69	20	2026-01-08
81	69	21	2026-01-08
82	69	22	2026-01-08
83	69	23	2026-01-08
84	69	24	2026-01-08
85	69	25	2026-01-08
86	69	26	2026-01-08
87	69	27	2026-01-08
88	69	28	2026-01-08
89	69	29	2026-01-08
90	69	30	2026-01-08
91	69	31	2026-01-08
92	69	32	2026-01-08
93	69	33	2026-01-08
94	69	34	2026-01-08
95	69	35	2026-01-08
96	69	36	2026-01-08
97	69	37	2026-01-08
98	69	38	2026-01-08
99	69	39	2026-01-08
100	69	40	2026-01-08
101	69	41	2026-01-08
102	69	42	2026-01-08
103	69	43	2026-01-08
104	69	44	2026-01-08
105	69	45	2026-01-08
106	69	46	2026-01-08
107	69	47	2026-01-08
108	69	48	2026-01-08
109	70	13	2026-01-08
110	70	14	2026-01-08
111	70	15	2026-01-08
112	70	16	2026-01-08
113	70	17	2026-01-08
114	70	18	2026-01-08
115	70	19	2026-01-08
116	70	20	2026-01-08
117	70	21	2026-01-08
118	70	22	2026-01-08
119	70	23	2026-01-08
120	70	24	2026-01-08
121	70	25	2026-01-08
122	70	26	2026-01-08
123	70	27	2026-01-08
124	70	28	2026-01-08
125	70	29	2026-01-08
126	70	30	2026-01-08
127	70	31	2026-01-08
128	70	32	2026-01-08
129	70	33	2026-01-08
130	70	34	2026-01-08
131	70	35	2026-01-08
132	70	36	2026-01-08
133	70	37	2026-01-08
134	70	38	2026-01-08
135	70	39	2026-01-08
136	70	40	2026-01-08
137	70	41	2026-01-08
138	70	42	2026-01-08
139	70	43	2026-01-08
140	70	44	2026-01-08
141	70	45	2026-01-08
142	70	46	2026-01-08
143	70	47	2026-01-08
144	70	48	2026-01-08
145	71	13	2026-01-08
146	71	14	2026-01-08
147	71	15	2026-01-08
148	71	16	2026-01-08
149	71	17	2026-01-08
150	71	18	2026-01-08
151	71	19	2026-01-08
152	71	20	2026-01-08
153	71	21	2026-01-08
154	71	22	2026-01-08
155	71	23	2026-01-08
156	71	24	2026-01-08
157	71	25	2026-01-08
158	71	26	2026-01-08
159	71	27	2026-01-08
160	71	28	2026-01-08
161	71	29	2026-01-08
162	71	30	2026-01-08
163	71	31	2026-01-08
164	71	32	2026-01-08
165	71	33	2026-01-08
166	71	34	2026-01-08
167	71	35	2026-01-08
168	71	36	2026-01-08
169	71	37	2026-01-08
170	71	38	2026-01-08
171	71	39	2026-01-08
172	71	40	2026-01-08
173	71	41	2026-01-08
174	71	42	2026-01-08
175	71	43	2026-01-08
176	71	44	2026-01-08
177	71	45	2026-01-08
178	71	46	2026-01-08
179	71	47	2026-01-08
180	71	48	2026-01-08
181	72	13	2026-01-08
182	72	14	2026-01-08
183	72	15	2026-01-08
184	72	16	2026-01-08
185	72	17	2026-01-08
186	72	18	2026-01-08
187	72	19	2026-01-08
188	72	20	2026-01-08
189	72	21	2026-01-08
190	72	22	2026-01-08
191	72	23	2026-01-08
192	72	24	2026-01-08
193	72	25	2026-01-08
194	72	26	2026-01-08
195	72	27	2026-01-08
196	72	28	2026-01-08
197	72	29	2026-01-08
198	72	30	2026-01-08
199	72	31	2026-01-08
200	72	32	2026-01-08
201	72	33	2026-01-08
202	72	34	2026-01-08
203	72	35	2026-01-08
204	72	36	2026-01-08
205	72	37	2026-01-08
206	72	38	2026-01-08
207	72	39	2026-01-08
208	72	40	2026-01-08
209	72	41	2026-01-08
210	72	42	2026-01-08
211	72	43	2026-01-08
212	72	44	2026-01-08
213	72	45	2026-01-08
214	72	46	2026-01-08
215	72	47	2026-01-08
216	72	48	2026-01-08
217	73	13	2026-01-08
218	73	14	2026-01-08
219	73	15	2026-01-08
220	73	16	2026-01-08
221	73	17	2026-01-08
222	73	18	2026-01-08
223	73	19	2026-01-08
224	73	20	2026-01-08
225	73	21	2026-01-08
226	73	22	2026-01-08
227	73	23	2026-01-08
228	73	24	2026-01-08
229	73	25	2026-01-08
230	73	26	2026-01-08
231	73	27	2026-01-08
232	73	28	2026-01-08
233	73	29	2026-01-08
234	73	30	2026-01-08
235	73	31	2026-01-08
236	73	32	2026-01-08
237	73	33	2026-01-08
238	73	34	2026-01-08
239	73	35	2026-01-08
240	73	36	2026-01-08
241	73	37	2026-01-08
242	73	38	2026-01-08
243	73	39	2026-01-08
244	73	40	2026-01-08
245	73	41	2026-01-08
246	73	42	2026-01-08
247	73	43	2026-01-08
248	73	44	2026-01-08
249	73	45	2026-01-08
250	73	46	2026-01-08
251	73	47	2026-01-08
252	73	48	2026-01-08
253	74	13	2026-01-08
254	74	14	2026-01-08
255	74	15	2026-01-08
256	74	16	2026-01-08
257	74	17	2026-01-08
258	74	18	2026-01-08
259	74	19	2026-01-08
260	74	20	2026-01-08
261	74	21	2026-01-08
262	74	22	2026-01-08
263	74	23	2026-01-08
264	74	24	2026-01-08
265	74	25	2026-01-08
266	74	26	2026-01-08
267	74	27	2026-01-08
268	74	28	2026-01-08
269	74	29	2026-01-08
270	74	30	2026-01-08
271	74	31	2026-01-08
272	74	32	2026-01-08
273	74	33	2026-01-08
274	74	34	2026-01-08
275	74	35	2026-01-08
276	74	36	2026-01-08
277	74	37	2026-01-08
278	74	38	2026-01-08
279	74	39	2026-01-08
280	74	40	2026-01-08
281	74	41	2026-01-08
282	74	42	2026-01-08
283	74	43	2026-01-08
284	74	44	2026-01-08
285	74	45	2026-01-08
286	74	46	2026-01-08
287	74	47	2026-01-08
288	74	48	2026-01-08
289	75	13	2026-01-08
290	75	14	2026-01-08
291	75	15	2026-01-08
292	75	16	2026-01-08
293	75	17	2026-01-08
294	75	18	2026-01-08
295	75	19	2026-01-08
296	75	20	2026-01-08
297	75	21	2026-01-08
298	75	22	2026-01-08
299	75	23	2026-01-08
300	75	24	2026-01-08
301	75	25	2026-01-08
302	75	26	2026-01-08
303	75	27	2026-01-08
304	75	28	2026-01-08
305	75	29	2026-01-08
306	75	30	2026-01-08
307	75	31	2026-01-08
308	75	32	2026-01-08
309	75	33	2026-01-08
310	75	34	2026-01-08
311	75	35	2026-01-08
312	75	36	2026-01-08
313	75	37	2026-01-08
314	75	38	2026-01-08
315	75	39	2026-01-08
316	75	40	2026-01-08
317	75	41	2026-01-08
318	75	42	2026-01-08
319	75	43	2026-01-08
320	75	44	2026-01-08
321	75	45	2026-01-08
322	75	46	2026-01-08
323	75	47	2026-01-08
324	75	48	2026-01-08
325	76	13	2026-01-08
326	76	14	2026-01-08
327	76	15	2026-01-08
328	76	16	2026-01-08
329	76	17	2026-01-08
330	76	18	2026-01-08
331	76	19	2026-01-08
332	76	20	2026-01-08
333	76	21	2026-01-08
334	76	22	2026-01-08
335	76	23	2026-01-08
336	76	24	2026-01-08
337	76	25	2026-01-08
338	76	26	2026-01-08
339	76	27	2026-01-08
340	76	28	2026-01-08
341	76	29	2026-01-08
342	76	30	2026-01-08
343	76	31	2026-01-08
344	76	32	2026-01-08
345	76	33	2026-01-08
346	76	34	2026-01-08
347	76	35	2026-01-08
348	76	36	2026-01-08
349	76	37	2026-01-08
350	76	38	2026-01-08
351	76	39	2026-01-08
352	76	40	2026-01-08
353	76	41	2026-01-08
354	76	42	2026-01-08
355	76	43	2026-01-08
356	76	44	2026-01-08
357	76	45	2026-01-08
358	76	46	2026-01-08
359	76	47	2026-01-08
360	76	48	2026-01-08
361	77	13	2026-01-08
362	77	14	2026-01-08
363	77	15	2026-01-08
364	77	16	2026-01-08
365	77	17	2026-01-08
366	77	18	2026-01-08
367	77	19	2026-01-08
368	77	20	2026-01-08
369	77	21	2026-01-08
370	77	22	2026-01-08
371	77	23	2026-01-08
372	77	24	2026-01-08
373	77	25	2026-01-08
374	77	26	2026-01-08
375	77	27	2026-01-08
376	77	28	2026-01-08
377	77	29	2026-01-08
378	77	30	2026-01-08
379	77	31	2026-01-08
380	77	32	2026-01-08
381	77	33	2026-01-08
382	77	34	2026-01-08
383	77	35	2026-01-08
384	77	36	2026-01-08
385	77	37	2026-01-08
386	77	38	2026-01-08
387	77	39	2026-01-08
388	77	40	2026-01-08
389	77	41	2026-01-08
390	77	42	2026-01-08
391	77	43	2026-01-08
392	77	44	2026-01-08
393	77	45	2026-01-08
394	77	46	2026-01-08
395	77	47	2026-01-08
396	77	48	2026-01-08
397	78	13	2026-01-08
398	78	14	2026-01-08
399	78	15	2026-01-08
400	78	16	2026-01-08
401	78	17	2026-01-08
402	78	18	2026-01-08
403	78	19	2026-01-08
404	78	20	2026-01-08
405	78	21	2026-01-08
406	78	22	2026-01-08
407	78	23	2026-01-08
408	78	24	2026-01-08
409	78	25	2026-01-08
410	78	26	2026-01-08
411	78	27	2026-01-08
412	78	28	2026-01-08
413	78	29	2026-01-08
414	78	30	2026-01-08
415	78	31	2026-01-08
416	78	32	2026-01-08
417	78	33	2026-01-08
418	78	34	2026-01-08
419	78	35	2026-01-08
420	78	36	2026-01-08
421	78	37	2026-01-08
422	78	38	2026-01-08
423	78	39	2026-01-08
424	78	40	2026-01-08
425	78	41	2026-01-08
426	78	42	2026-01-08
427	78	43	2026-01-08
428	78	44	2026-01-08
429	78	45	2026-01-08
430	78	46	2026-01-08
431	78	47	2026-01-08
432	78	48	2026-01-08
433	79	13	2026-01-08
434	79	14	2026-01-08
435	79	15	2026-01-08
436	79	16	2026-01-08
437	79	17	2026-01-08
438	79	18	2026-01-08
439	79	19	2026-01-08
440	79	20	2026-01-08
441	79	21	2026-01-08
442	79	22	2026-01-08
443	79	23	2026-01-08
444	79	24	2026-01-08
445	79	25	2026-01-08
446	79	26	2026-01-08
447	79	27	2026-01-08
448	79	28	2026-01-08
449	79	29	2026-01-08
450	79	30	2026-01-08
451	79	31	2026-01-08
452	79	32	2026-01-08
453	79	33	2026-01-08
454	79	34	2026-01-08
455	79	35	2026-01-08
456	79	36	2026-01-08
457	79	37	2026-01-08
458	79	38	2026-01-08
459	79	39	2026-01-08
460	79	40	2026-01-08
461	79	41	2026-01-08
462	79	42	2026-01-08
463	79	43	2026-01-08
464	79	44	2026-01-08
465	79	45	2026-01-08
466	79	46	2026-01-08
467	79	47	2026-01-08
468	79	48	2026-01-08
469	80	13	2026-01-08
470	80	14	2026-01-08
471	80	15	2026-01-08
472	80	16	2026-01-08
473	80	17	2026-01-08
474	80	18	2026-01-08
475	80	19	2026-01-08
476	80	20	2026-01-08
477	80	21	2026-01-08
478	80	22	2026-01-08
479	80	23	2026-01-08
480	80	24	2026-01-08
481	80	25	2026-01-08
482	80	26	2026-01-08
483	80	27	2026-01-08
484	80	28	2026-01-08
485	80	29	2026-01-08
486	80	30	2026-01-08
487	80	31	2026-01-08
488	80	32	2026-01-08
489	80	33	2026-01-08
490	80	34	2026-01-08
491	80	35	2026-01-08
492	80	36	2026-01-08
493	80	37	2026-01-08
494	80	38	2026-01-08
495	80	39	2026-01-08
496	80	40	2026-01-08
497	80	41	2026-01-08
498	80	42	2026-01-08
499	80	43	2026-01-08
500	80	44	2026-01-08
501	80	45	2026-01-08
502	80	46	2026-01-08
503	80	47	2026-01-08
504	80	48	2026-01-08
505	81	13	2026-01-08
506	81	14	2026-01-08
507	81	15	2026-01-08
508	81	16	2026-01-08
509	81	17	2026-01-08
510	81	18	2026-01-08
511	81	19	2026-01-08
512	81	20	2026-01-08
513	81	21	2026-01-08
514	81	22	2026-01-08
515	81	23	2026-01-08
516	81	24	2026-01-08
517	81	25	2026-01-08
518	81	26	2026-01-08
519	81	27	2026-01-08
520	81	28	2026-01-08
521	81	29	2026-01-08
522	81	30	2026-01-08
523	81	31	2026-01-08
524	81	32	2026-01-08
525	81	33	2026-01-08
526	81	34	2026-01-08
527	81	35	2026-01-08
528	81	36	2026-01-08
529	81	37	2026-01-08
530	81	38	2026-01-08
531	81	39	2026-01-08
532	81	40	2026-01-08
533	81	41	2026-01-08
534	81	42	2026-01-08
535	81	43	2026-01-08
536	81	44	2026-01-08
537	81	45	2026-01-08
538	81	46	2026-01-08
539	81	47	2026-01-08
540	81	48	2026-01-08
541	82	13	2026-01-08
542	82	14	2026-01-08
543	82	15	2026-01-08
544	82	16	2026-01-08
545	82	17	2026-01-08
546	82	18	2026-01-08
547	82	19	2026-01-08
548	82	20	2026-01-08
549	82	21	2026-01-08
550	82	22	2026-01-08
551	82	23	2026-01-08
552	82	24	2026-01-08
553	82	25	2026-01-08
554	82	26	2026-01-08
555	82	27	2026-01-08
556	82	28	2026-01-08
557	82	29	2026-01-08
558	82	30	2026-01-08
559	82	31	2026-01-08
560	82	32	2026-01-08
561	82	33	2026-01-08
562	82	34	2026-01-08
563	82	35	2026-01-08
564	82	36	2026-01-08
565	82	37	2026-01-08
566	82	38	2026-01-08
567	82	39	2026-01-08
568	82	40	2026-01-08
569	82	41	2026-01-08
570	82	42	2026-01-08
571	82	43	2026-01-08
572	82	44	2026-01-08
573	82	45	2026-01-08
574	82	46	2026-01-08
575	82	47	2026-01-08
576	82	48	2026-01-08
577	83	13	2026-01-08
578	83	14	2026-01-08
579	83	15	2026-01-08
580	83	16	2026-01-08
581	83	17	2026-01-08
582	83	18	2026-01-08
583	83	19	2026-01-08
584	83	20	2026-01-08
585	83	21	2026-01-08
586	83	22	2026-01-08
587	83	23	2026-01-08
588	83	24	2026-01-08
589	83	25	2026-01-08
590	83	26	2026-01-08
591	83	27	2026-01-08
592	83	28	2026-01-08
593	83	29	2026-01-08
594	83	30	2026-01-08
595	83	31	2026-01-08
596	83	32	2026-01-08
597	83	33	2026-01-08
598	83	34	2026-01-08
599	83	35	2026-01-08
600	83	36	2026-01-08
601	83	37	2026-01-08
602	83	38	2026-01-08
603	83	39	2026-01-08
604	83	40	2026-01-08
605	83	41	2026-01-08
606	83	42	2026-01-08
607	83	43	2026-01-08
608	83	44	2026-01-08
609	83	45	2026-01-08
610	83	46	2026-01-08
611	83	47	2026-01-08
612	83	48	2026-01-08
613	84	13	2026-01-08
614	84	14	2026-01-08
615	84	15	2026-01-08
616	84	16	2026-01-08
617	84	17	2026-01-08
618	84	18	2026-01-08
619	84	19	2026-01-08
620	84	20	2026-01-08
621	84	21	2026-01-08
622	84	22	2026-01-08
623	84	23	2026-01-08
624	84	24	2026-01-08
625	84	25	2026-01-08
626	84	26	2026-01-08
627	84	27	2026-01-08
628	84	28	2026-01-08
629	84	29	2026-01-08
630	84	30	2026-01-08
631	84	31	2026-01-08
632	84	32	2026-01-08
633	84	33	2026-01-08
634	84	34	2026-01-08
635	84	35	2026-01-08
636	84	36	2026-01-08
637	84	37	2026-01-08
638	84	38	2026-01-08
639	84	39	2026-01-08
640	84	40	2026-01-08
641	84	41	2026-01-08
642	84	42	2026-01-08
643	84	43	2026-01-08
644	84	44	2026-01-08
645	84	45	2026-01-08
646	84	46	2026-01-08
647	84	47	2026-01-08
648	84	48	2026-01-08
649	85	13	2026-01-08
650	85	14	2026-01-08
651	85	15	2026-01-08
652	85	16	2026-01-08
653	85	17	2026-01-08
654	85	18	2026-01-08
655	85	19	2026-01-08
656	85	20	2026-01-08
657	85	21	2026-01-08
658	85	22	2026-01-08
659	85	23	2026-01-08
660	85	24	2026-01-08
661	85	25	2026-01-08
662	85	26	2026-01-08
663	85	27	2026-01-08
664	85	28	2026-01-08
665	85	29	2026-01-08
666	85	30	2026-01-08
667	85	31	2026-01-08
668	85	32	2026-01-08
669	85	33	2026-01-08
670	85	34	2026-01-08
671	85	35	2026-01-08
672	85	36	2026-01-08
673	85	37	2026-01-08
674	85	38	2026-01-08
675	85	39	2026-01-08
676	85	40	2026-01-08
677	85	41	2026-01-08
678	85	42	2026-01-08
679	85	43	2026-01-08
680	85	44	2026-01-08
681	85	45	2026-01-08
682	85	46	2026-01-08
683	85	47	2026-01-08
684	85	48	2026-01-08
685	86	13	2026-01-08
686	86	14	2026-01-08
687	86	15	2026-01-08
688	86	16	2026-01-08
689	86	17	2026-01-08
690	86	18	2026-01-08
691	86	19	2026-01-08
692	86	20	2026-01-08
693	86	21	2026-01-08
694	86	22	2026-01-08
695	86	23	2026-01-08
696	86	24	2026-01-08
697	86	25	2026-01-08
698	86	26	2026-01-08
699	86	27	2026-01-08
700	86	28	2026-01-08
701	86	29	2026-01-08
702	86	30	2026-01-08
703	86	31	2026-01-08
704	86	32	2026-01-08
705	86	33	2026-01-08
706	86	34	2026-01-08
707	86	35	2026-01-08
708	86	36	2026-01-08
709	86	37	2026-01-08
710	86	38	2026-01-08
711	86	39	2026-01-08
712	86	40	2026-01-08
713	86	41	2026-01-08
714	86	42	2026-01-08
715	86	43	2026-01-08
716	86	44	2026-01-08
717	86	45	2026-01-08
718	86	46	2026-01-08
719	86	47	2026-01-08
720	86	48	2026-01-08
721	87	13	2026-01-08
722	87	14	2026-01-08
723	87	15	2026-01-08
724	87	16	2026-01-08
725	87	17	2026-01-08
726	87	18	2026-01-08
727	87	19	2026-01-08
728	87	20	2026-01-08
729	87	21	2026-01-08
730	87	22	2026-01-08
731	87	23	2026-01-08
732	87	24	2026-01-08
733	87	25	2026-01-08
734	87	26	2026-01-08
735	87	27	2026-01-08
736	87	28	2026-01-08
737	87	29	2026-01-08
738	87	30	2026-01-08
739	87	31	2026-01-08
740	87	32	2026-01-08
741	87	33	2026-01-08
742	87	34	2026-01-08
743	87	35	2026-01-08
744	87	36	2026-01-08
745	87	37	2026-01-08
746	87	38	2026-01-08
747	87	39	2026-01-08
748	87	40	2026-01-08
749	87	41	2026-01-08
750	87	42	2026-01-08
751	87	43	2026-01-08
752	87	44	2026-01-08
753	87	45	2026-01-08
754	87	46	2026-01-08
755	87	47	2026-01-08
756	87	48	2026-01-08
757	88	13	2026-01-08
758	88	14	2026-01-08
759	88	15	2026-01-08
760	88	16	2026-01-08
761	88	17	2026-01-08
762	88	18	2026-01-08
763	88	19	2026-01-08
764	88	20	2026-01-08
765	88	21	2026-01-08
766	88	22	2026-01-08
767	88	23	2026-01-08
768	88	24	2026-01-08
769	88	25	2026-01-08
770	88	26	2026-01-08
771	88	27	2026-01-08
772	88	28	2026-01-08
773	88	29	2026-01-08
774	88	30	2026-01-08
775	88	31	2026-01-08
776	88	32	2026-01-08
777	88	33	2026-01-08
778	88	34	2026-01-08
779	88	35	2026-01-08
780	88	36	2026-01-08
781	88	37	2026-01-08
782	88	38	2026-01-08
783	88	39	2026-01-08
784	88	40	2026-01-08
785	88	41	2026-01-08
786	88	42	2026-01-08
787	88	43	2026-01-08
788	88	44	2026-01-08
789	88	45	2026-01-08
790	88	46	2026-01-08
791	88	47	2026-01-08
792	88	48	2026-01-08
793	89	13	2026-01-08
794	89	14	2026-01-08
795	89	15	2026-01-08
796	89	16	2026-01-08
797	89	17	2026-01-08
798	89	18	2026-01-08
799	89	19	2026-01-08
800	89	20	2026-01-08
801	89	21	2026-01-08
802	89	22	2026-01-08
803	89	23	2026-01-08
804	89	24	2026-01-08
805	89	25	2026-01-08
806	89	26	2026-01-08
807	89	27	2026-01-08
808	89	28	2026-01-08
809	89	29	2026-01-08
810	89	30	2026-01-08
811	89	31	2026-01-08
812	89	32	2026-01-08
813	89	33	2026-01-08
814	89	34	2026-01-08
815	89	35	2026-01-08
816	89	36	2026-01-08
817	89	37	2026-01-08
818	89	38	2026-01-08
819	89	39	2026-01-08
820	89	40	2026-01-08
821	89	41	2026-01-08
822	89	42	2026-01-08
823	89	43	2026-01-08
824	89	44	2026-01-08
825	89	45	2026-01-08
826	89	46	2026-01-08
827	89	47	2026-01-08
828	89	48	2026-01-08
829	90	13	2026-01-08
830	90	14	2026-01-08
831	90	15	2026-01-08
832	90	16	2026-01-08
833	90	17	2026-01-08
834	90	18	2026-01-08
835	90	19	2026-01-08
836	90	20	2026-01-08
837	90	21	2026-01-08
838	90	22	2026-01-08
839	90	23	2026-01-08
840	90	24	2026-01-08
841	90	25	2026-01-08
842	90	26	2026-01-08
843	90	27	2026-01-08
844	90	28	2026-01-08
845	90	29	2026-01-08
846	90	30	2026-01-08
847	90	31	2026-01-08
848	90	32	2026-01-08
849	90	33	2026-01-08
850	90	34	2026-01-08
851	90	35	2026-01-08
852	90	36	2026-01-08
853	90	37	2026-01-08
854	90	38	2026-01-08
855	90	39	2026-01-08
856	90	40	2026-01-08
857	90	41	2026-01-08
858	90	42	2026-01-08
859	90	43	2026-01-08
860	90	44	2026-01-08
861	90	45	2026-01-08
862	90	46	2026-01-08
863	90	47	2026-01-08
864	90	48	2026-01-08
865	91	13	2026-01-08
866	91	14	2026-01-08
867	91	15	2026-01-08
868	91	16	2026-01-08
869	91	17	2026-01-08
870	91	18	2026-01-08
871	91	19	2026-01-08
872	91	20	2026-01-08
873	91	21	2026-01-08
874	91	22	2026-01-08
875	91	23	2026-01-08
876	91	24	2026-01-08
877	91	25	2026-01-08
878	91	26	2026-01-08
879	91	27	2026-01-08
880	91	28	2026-01-08
881	91	29	2026-01-08
882	91	30	2026-01-08
883	91	31	2026-01-08
884	91	32	2026-01-08
885	91	33	2026-01-08
886	91	34	2026-01-08
887	91	35	2026-01-08
888	91	36	2026-01-08
889	91	37	2026-01-08
890	91	38	2026-01-08
891	91	39	2026-01-08
892	91	40	2026-01-08
893	91	41	2026-01-08
894	91	42	2026-01-08
895	91	43	2026-01-08
896	91	44	2026-01-08
897	91	45	2026-01-08
898	91	46	2026-01-08
899	91	47	2026-01-08
900	91	48	2026-01-08
901	92	13	2026-01-08
902	92	14	2026-01-08
903	92	15	2026-01-08
904	92	16	2026-01-08
905	92	17	2026-01-08
906	92	18	2026-01-08
907	92	19	2026-01-08
908	92	20	2026-01-08
909	92	21	2026-01-08
910	92	22	2026-01-08
911	92	23	2026-01-08
912	92	24	2026-01-08
913	92	25	2026-01-08
914	92	26	2026-01-08
915	92	27	2026-01-08
916	92	28	2026-01-08
917	92	29	2026-01-08
918	92	30	2026-01-08
919	92	31	2026-01-08
920	92	32	2026-01-08
921	92	33	2026-01-08
922	92	34	2026-01-08
923	92	35	2026-01-08
924	92	36	2026-01-08
925	92	37	2026-01-08
926	92	38	2026-01-08
927	92	39	2026-01-08
928	92	40	2026-01-08
929	92	41	2026-01-08
930	92	42	2026-01-08
931	92	43	2026-01-08
932	92	44	2026-01-08
933	92	45	2026-01-08
934	92	46	2026-01-08
935	92	47	2026-01-08
936	92	48	2026-01-08
937	93	13	2026-01-08
938	93	14	2026-01-08
939	93	15	2026-01-08
940	93	16	2026-01-08
941	93	17	2026-01-08
942	93	18	2026-01-08
943	93	19	2026-01-08
944	93	20	2026-01-08
945	93	21	2026-01-08
946	93	22	2026-01-08
947	93	23	2026-01-08
948	93	24	2026-01-08
949	93	25	2026-01-08
950	93	26	2026-01-08
951	93	27	2026-01-08
952	93	28	2026-01-08
953	93	29	2026-01-08
954	93	30	2026-01-08
955	93	31	2026-01-08
956	93	32	2026-01-08
957	93	33	2026-01-08
958	93	34	2026-01-08
959	93	35	2026-01-08
960	93	36	2026-01-08
961	93	37	2026-01-08
962	93	38	2026-01-08
963	93	39	2026-01-08
964	93	40	2026-01-08
965	93	41	2026-01-08
966	93	42	2026-01-08
967	93	43	2026-01-08
968	93	44	2026-01-08
969	93	45	2026-01-08
970	93	46	2026-01-08
971	93	47	2026-01-08
972	93	48	2026-01-08
973	94	13	2026-01-08
974	94	14	2026-01-08
975	94	15	2026-01-08
976	94	16	2026-01-08
977	94	17	2026-01-08
978	94	18	2026-01-08
979	94	19	2026-01-08
980	94	20	2026-01-08
981	94	21	2026-01-08
982	94	22	2026-01-08
983	94	23	2026-01-08
984	94	24	2026-01-08
985	94	25	2026-01-08
986	94	26	2026-01-08
987	94	27	2026-01-08
988	94	28	2026-01-08
989	94	29	2026-01-08
990	94	30	2026-01-08
991	94	31	2026-01-08
992	94	32	2026-01-08
993	94	33	2026-01-08
994	94	34	2026-01-08
995	94	35	2026-01-08
996	94	36	2026-01-08
997	94	37	2026-01-08
998	94	38	2026-01-08
999	94	39	2026-01-08
1000	94	40	2026-01-08
1001	94	41	2026-01-08
1002	94	42	2026-01-08
1003	94	43	2026-01-08
1004	94	44	2026-01-08
1005	94	45	2026-01-08
1006	94	46	2026-01-08
1007	94	47	2026-01-08
1008	94	48	2026-01-08
1009	95	13	2026-01-08
1010	95	14	2026-01-08
1011	95	15	2026-01-08
1012	95	16	2026-01-08
1013	95	17	2026-01-08
1014	95	18	2026-01-08
1015	95	19	2026-01-08
1016	95	20	2026-01-08
1017	95	21	2026-01-08
1018	95	22	2026-01-08
1019	95	23	2026-01-08
1020	95	24	2026-01-08
1021	95	25	2026-01-08
1022	95	26	2026-01-08
1023	95	27	2026-01-08
1024	95	28	2026-01-08
1025	95	29	2026-01-08
1026	95	30	2026-01-08
1027	95	31	2026-01-08
1028	95	32	2026-01-08
1029	95	33	2026-01-08
1030	95	34	2026-01-08
1031	95	35	2026-01-08
1032	95	36	2026-01-08
1033	95	37	2026-01-08
1034	95	38	2026-01-08
1035	95	39	2026-01-08
1036	95	40	2026-01-08
1037	95	41	2026-01-08
1038	95	42	2026-01-08
1039	95	43	2026-01-08
1040	95	44	2026-01-08
1041	95	45	2026-01-08
1042	95	46	2026-01-08
1043	95	47	2026-01-08
1044	95	48	2026-01-08
1045	96	13	2026-01-08
1046	96	14	2026-01-08
1047	96	15	2026-01-08
1048	96	16	2026-01-08
1049	96	17	2026-01-08
1050	96	18	2026-01-08
1051	96	19	2026-01-08
1052	96	20	2026-01-08
1053	96	21	2026-01-08
1054	96	22	2026-01-08
1055	96	23	2026-01-08
1056	96	24	2026-01-08
1057	96	25	2026-01-08
1058	96	26	2026-01-08
1059	96	27	2026-01-08
1060	96	28	2026-01-08
1061	96	29	2026-01-08
1062	96	30	2026-01-08
1063	96	31	2026-01-08
1064	96	32	2026-01-08
1065	96	33	2026-01-08
1066	96	34	2026-01-08
1067	96	35	2026-01-08
1068	96	36	2026-01-08
1069	96	37	2026-01-08
1070	96	38	2026-01-08
1071	96	39	2026-01-08
1072	96	40	2026-01-08
1073	96	41	2026-01-08
1074	96	42	2026-01-08
1075	96	43	2026-01-08
1076	96	44	2026-01-08
1077	96	45	2026-01-08
1078	96	46	2026-01-08
1079	96	47	2026-01-08
1080	96	48	2026-01-08
1081	97	13	2026-01-08
1082	97	14	2026-01-08
1083	97	15	2026-01-08
1084	97	16	2026-01-08
1085	97	17	2026-01-08
1086	97	18	2026-01-08
1087	97	19	2026-01-08
1088	97	20	2026-01-08
1089	97	21	2026-01-08
1090	97	22	2026-01-08
1091	97	23	2026-01-08
1092	97	24	2026-01-08
1093	97	25	2026-01-08
1094	97	26	2026-01-08
1095	97	27	2026-01-08
1096	97	28	2026-01-08
1097	97	29	2026-01-08
1098	97	30	2026-01-08
1099	97	31	2026-01-08
1100	97	32	2026-01-08
1101	97	33	2026-01-08
1102	97	34	2026-01-08
1103	97	35	2026-01-08
1104	97	36	2026-01-08
1105	97	37	2026-01-08
1106	97	38	2026-01-08
1107	97	39	2026-01-08
1108	97	40	2026-01-08
1109	97	41	2026-01-08
1110	97	42	2026-01-08
1111	97	43	2026-01-08
1112	97	44	2026-01-08
1113	97	45	2026-01-08
1114	97	46	2026-01-08
1115	97	47	2026-01-08
1116	97	48	2026-01-08
1117	98	13	2026-01-08
1118	98	14	2026-01-08
1119	98	15	2026-01-08
1120	98	16	2026-01-08
1121	98	17	2026-01-08
1122	98	18	2026-01-08
1123	98	19	2026-01-08
1124	98	20	2026-01-08
1125	98	21	2026-01-08
1126	98	22	2026-01-08
1127	98	23	2026-01-08
1128	98	24	2026-01-08
1129	98	25	2026-01-08
1130	98	26	2026-01-08
1131	98	27	2026-01-08
1132	98	28	2026-01-08
1133	98	29	2026-01-08
1134	98	30	2026-01-08
1135	98	31	2026-01-08
1136	98	32	2026-01-08
1137	98	33	2026-01-08
1138	98	34	2026-01-08
1139	98	35	2026-01-08
1140	98	36	2026-01-08
1141	98	37	2026-01-08
1142	98	38	2026-01-08
1143	98	39	2026-01-08
1144	98	40	2026-01-08
1145	98	41	2026-01-08
1146	98	42	2026-01-08
1147	98	43	2026-01-08
1148	98	44	2026-01-08
1149	98	45	2026-01-08
1150	98	46	2026-01-08
1151	98	47	2026-01-08
1152	98	48	2026-01-08
1153	99	13	2026-01-08
1154	99	14	2026-01-08
1155	99	15	2026-01-08
1156	99	16	2026-01-08
1157	99	17	2026-01-08
1158	99	18	2026-01-08
1159	99	19	2026-01-08
1160	99	20	2026-01-08
1161	99	21	2026-01-08
1162	99	22	2026-01-08
1163	99	23	2026-01-08
1164	99	24	2026-01-08
1165	99	25	2026-01-08
1166	99	26	2026-01-08
1167	99	27	2026-01-08
1168	99	28	2026-01-08
1169	99	29	2026-01-08
1170	99	30	2026-01-08
1171	99	31	2026-01-08
1172	99	32	2026-01-08
1173	99	33	2026-01-08
1174	99	34	2026-01-08
1175	99	35	2026-01-08
1176	99	36	2026-01-08
1177	99	37	2026-01-08
1178	99	38	2026-01-08
1179	99	39	2026-01-08
1180	99	40	2026-01-08
1181	99	41	2026-01-08
1182	99	42	2026-01-08
1183	99	43	2026-01-08
1184	99	44	2026-01-08
1185	99	45	2026-01-08
1186	99	46	2026-01-08
1187	99	47	2026-01-08
1188	99	48	2026-01-08
1189	100	13	2026-01-08
1190	100	14	2026-01-08
1191	100	15	2026-01-08
1192	100	16	2026-01-08
1193	100	17	2026-01-08
1194	100	18	2026-01-08
1195	100	19	2026-01-08
1196	100	20	2026-01-08
1197	100	21	2026-01-08
1198	100	22	2026-01-08
1199	100	23	2026-01-08
1200	100	24	2026-01-08
1201	100	25	2026-01-08
1202	100	26	2026-01-08
1203	100	27	2026-01-08
1204	100	28	2026-01-08
1205	100	29	2026-01-08
1206	100	30	2026-01-08
1207	100	31	2026-01-08
1208	100	32	2026-01-08
1209	100	33	2026-01-08
1210	100	34	2026-01-08
1211	100	35	2026-01-08
1212	100	36	2026-01-08
1213	100	37	2026-01-08
1214	100	38	2026-01-08
1215	100	39	2026-01-08
1216	100	40	2026-01-08
1217	100	41	2026-01-08
1218	100	42	2026-01-08
1219	100	43	2026-01-08
1220	100	44	2026-01-08
1221	100	45	2026-01-08
1222	100	46	2026-01-08
1223	100	47	2026-01-08
1224	100	48	2026-01-08
1225	101	13	2026-01-08
1226	101	14	2026-01-08
1227	101	15	2026-01-08
1228	101	16	2026-01-08
1229	101	17	2026-01-08
1230	101	18	2026-01-08
1231	101	19	2026-01-08
1232	101	20	2026-01-08
1233	101	21	2026-01-08
1234	101	22	2026-01-08
1235	101	23	2026-01-08
1236	101	24	2026-01-08
1237	101	25	2026-01-08
1238	101	26	2026-01-08
1239	101	27	2026-01-08
1240	101	28	2026-01-08
1241	101	29	2026-01-08
1242	101	30	2026-01-08
1243	101	31	2026-01-08
1244	101	32	2026-01-08
1245	101	33	2026-01-08
1246	101	34	2026-01-08
1247	101	35	2026-01-08
1248	101	36	2026-01-08
1249	101	37	2026-01-08
1250	101	38	2026-01-08
1251	101	39	2026-01-08
1252	101	40	2026-01-08
1253	101	41	2026-01-08
1254	101	42	2026-01-08
1255	101	43	2026-01-08
1256	101	44	2026-01-08
1257	101	45	2026-01-08
1258	101	46	2026-01-08
1259	101	47	2026-01-08
1260	101	48	2026-01-08
1261	102	13	2026-01-08
1262	102	14	2026-01-08
1263	102	15	2026-01-08
1264	102	16	2026-01-08
1265	102	17	2026-01-08
1266	102	18	2026-01-08
1267	102	19	2026-01-08
1268	102	20	2026-01-08
1269	102	21	2026-01-08
1270	102	22	2026-01-08
1271	102	23	2026-01-08
1272	102	24	2026-01-08
1273	102	25	2026-01-08
1274	102	26	2026-01-08
1275	102	27	2026-01-08
1276	102	28	2026-01-08
1277	102	29	2026-01-08
1278	102	30	2026-01-08
1279	102	31	2026-01-08
1280	102	32	2026-01-08
1281	102	33	2026-01-08
1282	102	34	2026-01-08
1283	102	35	2026-01-08
1284	102	36	2026-01-08
1285	102	37	2026-01-08
1286	102	38	2026-01-08
1287	102	39	2026-01-08
1288	102	40	2026-01-08
1289	102	41	2026-01-08
1290	102	42	2026-01-08
1291	102	43	2026-01-08
1292	102	44	2026-01-08
1293	102	45	2026-01-08
1294	102	46	2026-01-08
1295	102	47	2026-01-08
1296	102	48	2026-01-08
1297	103	13	2026-01-08
1298	103	14	2026-01-08
1299	103	15	2026-01-08
1300	103	16	2026-01-08
1301	103	17	2026-01-08
1302	103	18	2026-01-08
1303	103	19	2026-01-08
1304	103	20	2026-01-08
1305	103	21	2026-01-08
1306	103	22	2026-01-08
1307	103	23	2026-01-08
1308	103	24	2026-01-08
1309	103	25	2026-01-08
1310	103	26	2026-01-08
1311	103	27	2026-01-08
1312	103	28	2026-01-08
1313	103	29	2026-01-08
1314	103	30	2026-01-08
1315	103	31	2026-01-08
1316	103	32	2026-01-08
1317	103	33	2026-01-08
1318	103	34	2026-01-08
1319	103	35	2026-01-08
1320	103	36	2026-01-08
1321	103	37	2026-01-08
1322	103	38	2026-01-08
1323	103	39	2026-01-08
1324	103	40	2026-01-08
1325	103	41	2026-01-08
1326	103	42	2026-01-08
1327	103	43	2026-01-08
1328	103	44	2026-01-08
1329	103	45	2026-01-08
1330	103	46	2026-01-08
1331	103	47	2026-01-08
1332	103	48	2026-01-08
1333	104	13	2026-01-08
1334	104	14	2026-01-08
1335	104	15	2026-01-08
1336	104	16	2026-01-08
1337	104	17	2026-01-08
1338	104	18	2026-01-08
1339	104	19	2026-01-08
1340	104	20	2026-01-08
1341	104	21	2026-01-08
1342	104	22	2026-01-08
1343	104	23	2026-01-08
1344	104	24	2026-01-08
1345	104	25	2026-01-08
1346	104	26	2026-01-08
1347	104	27	2026-01-08
1348	104	28	2026-01-08
1349	104	29	2026-01-08
1350	104	30	2026-01-08
1351	104	31	2026-01-08
1352	104	32	2026-01-08
1353	104	33	2026-01-08
1354	104	34	2026-01-08
1355	104	35	2026-01-08
1356	104	36	2026-01-08
1357	104	37	2026-01-08
1358	104	38	2026-01-08
1359	104	39	2026-01-08
1360	104	40	2026-01-08
1361	104	41	2026-01-08
1362	104	42	2026-01-08
1363	104	43	2026-01-08
1364	104	44	2026-01-08
1365	104	45	2026-01-08
1366	104	46	2026-01-08
1367	104	47	2026-01-08
1368	104	48	2026-01-08
1369	105	13	2026-01-08
1370	105	14	2026-01-08
1371	105	15	2026-01-08
1372	105	16	2026-01-08
1373	105	17	2026-01-08
1374	105	18	2026-01-08
1375	105	19	2026-01-08
1376	105	20	2026-01-08
1377	105	21	2026-01-08
1378	105	22	2026-01-08
1379	105	23	2026-01-08
1380	105	24	2026-01-08
1381	105	25	2026-01-08
1382	105	26	2026-01-08
1383	105	27	2026-01-08
1384	105	28	2026-01-08
1385	105	29	2026-01-08
1386	105	30	2026-01-08
1387	105	31	2026-01-08
1388	105	32	2026-01-08
1389	105	33	2026-01-08
1390	105	34	2026-01-08
1391	105	35	2026-01-08
1392	105	36	2026-01-08
1393	105	37	2026-01-08
1394	105	38	2026-01-08
1395	105	39	2026-01-08
1396	105	40	2026-01-08
1397	105	41	2026-01-08
1398	105	42	2026-01-08
1399	105	43	2026-01-08
1400	105	44	2026-01-08
1401	105	45	2026-01-08
1402	105	46	2026-01-08
1403	105	47	2026-01-08
1404	105	48	2026-01-08
1405	106	13	2026-01-08
1406	106	14	2026-01-08
1407	106	15	2026-01-08
1408	106	16	2026-01-08
1409	106	17	2026-01-08
1410	106	18	2026-01-08
1411	106	19	2026-01-08
1412	106	20	2026-01-08
1413	106	21	2026-01-08
1414	106	22	2026-01-08
1415	106	23	2026-01-08
1416	106	24	2026-01-08
1417	106	25	2026-01-08
1418	106	26	2026-01-08
1419	106	27	2026-01-08
1420	106	28	2026-01-08
1421	106	29	2026-01-08
1422	106	30	2026-01-08
1423	106	31	2026-01-08
1424	106	32	2026-01-08
1425	106	33	2026-01-08
1426	106	34	2026-01-08
1427	106	35	2026-01-08
1428	106	36	2026-01-08
1429	106	37	2026-01-08
1430	106	38	2026-01-08
1431	106	39	2026-01-08
1432	106	40	2026-01-08
1433	106	41	2026-01-08
1434	106	42	2026-01-08
1435	106	43	2026-01-08
1436	106	44	2026-01-08
1437	106	45	2026-01-08
1438	106	46	2026-01-08
1439	106	47	2026-01-08
1440	106	48	2026-01-08
1441	107	13	2026-01-08
1442	107	14	2026-01-08
1443	107	15	2026-01-08
1444	107	16	2026-01-08
1445	107	17	2026-01-08
1446	107	18	2026-01-08
1447	107	19	2026-01-08
1448	107	20	2026-01-08
1449	107	21	2026-01-08
1450	107	22	2026-01-08
1451	107	23	2026-01-08
1452	107	24	2026-01-08
1453	107	25	2026-01-08
1454	107	26	2026-01-08
1455	107	27	2026-01-08
1456	107	28	2026-01-08
1457	107	29	2026-01-08
1458	107	30	2026-01-08
1459	107	31	2026-01-08
1460	107	32	2026-01-08
1461	107	33	2026-01-08
1462	107	34	2026-01-08
1463	107	35	2026-01-08
1464	107	36	2026-01-08
1465	107	37	2026-01-08
1466	107	38	2026-01-08
1467	107	39	2026-01-08
1468	107	40	2026-01-08
1469	107	41	2026-01-08
1470	107	42	2026-01-08
1471	107	43	2026-01-08
1472	107	44	2026-01-08
1473	107	45	2026-01-08
1474	107	46	2026-01-08
1475	107	47	2026-01-08
1476	107	48	2026-01-08
1477	108	13	2026-01-08
1478	108	14	2026-01-08
1479	108	15	2026-01-08
1480	108	16	2026-01-08
1481	108	17	2026-01-08
1482	108	18	2026-01-08
1483	108	19	2026-01-08
1484	108	20	2026-01-08
1485	108	21	2026-01-08
1486	108	22	2026-01-08
1487	108	23	2026-01-08
1488	108	24	2026-01-08
1489	108	25	2026-01-08
1490	108	26	2026-01-08
1491	108	27	2026-01-08
1492	108	28	2026-01-08
1493	108	29	2026-01-08
1494	108	30	2026-01-08
1495	108	31	2026-01-08
1496	108	32	2026-01-08
1497	108	33	2026-01-08
1498	108	34	2026-01-08
1499	108	35	2026-01-08
1500	108	36	2026-01-08
1501	108	37	2026-01-08
1502	108	38	2026-01-08
1503	108	39	2026-01-08
1504	108	40	2026-01-08
1505	108	41	2026-01-08
1506	108	42	2026-01-08
1507	108	43	2026-01-08
1508	108	44	2026-01-08
1509	108	45	2026-01-08
1510	108	46	2026-01-08
1511	108	47	2026-01-08
1512	108	48	2026-01-08
1513	109	13	2026-01-08
1514	109	14	2026-01-08
1515	109	15	2026-01-08
1516	109	16	2026-01-08
1517	109	17	2026-01-08
1518	109	18	2026-01-08
1519	109	19	2026-01-08
1520	109	20	2026-01-08
1521	109	21	2026-01-08
1522	109	22	2026-01-08
1523	109	23	2026-01-08
1524	109	24	2026-01-08
1525	109	25	2026-01-08
1526	109	26	2026-01-08
1527	109	27	2026-01-08
1528	109	28	2026-01-08
1529	109	29	2026-01-08
1530	109	30	2026-01-08
1531	109	31	2026-01-08
1532	109	32	2026-01-08
1533	109	33	2026-01-08
1534	109	34	2026-01-08
1535	109	35	2026-01-08
1536	109	36	2026-01-08
1537	109	37	2026-01-08
1538	109	38	2026-01-08
1539	109	39	2026-01-08
1540	109	40	2026-01-08
1541	109	41	2026-01-08
1542	109	42	2026-01-08
1543	109	43	2026-01-08
1544	109	44	2026-01-08
1545	109	45	2026-01-08
1546	109	46	2026-01-08
1547	109	47	2026-01-08
1548	109	48	2026-01-08
1549	110	13	2026-01-08
1550	110	14	2026-01-08
1551	110	15	2026-01-08
1552	110	16	2026-01-08
1553	110	17	2026-01-08
1554	110	18	2026-01-08
1555	110	19	2026-01-08
1556	110	20	2026-01-08
1557	110	21	2026-01-08
1558	110	22	2026-01-08
1559	110	23	2026-01-08
1560	110	24	2026-01-08
1561	110	25	2026-01-08
1562	110	26	2026-01-08
1563	110	27	2026-01-08
1564	110	28	2026-01-08
1565	110	29	2026-01-08
1566	110	30	2026-01-08
1567	110	31	2026-01-08
1568	110	32	2026-01-08
1569	110	33	2026-01-08
1570	110	34	2026-01-08
1571	110	35	2026-01-08
1572	110	36	2026-01-08
1573	110	37	2026-01-08
1574	110	38	2026-01-08
1575	110	39	2026-01-08
1576	110	40	2026-01-08
1577	110	41	2026-01-08
1578	110	42	2026-01-08
1579	110	43	2026-01-08
1580	110	44	2026-01-08
1581	110	45	2026-01-08
1582	110	46	2026-01-08
1583	110	47	2026-01-08
1584	110	48	2026-01-08
\.


--
-- TOC entry 5229 (class 0 OID 16967)
-- Dependencies: 250
-- Data for Name: dang_ky_su_kien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dang_ky_su_kien (id, su_kien_id, sinh_vien_id, trang_thai, thoi_gian_dang_ky) FROM stdin;
1	6	74	da_dang_ky	2026-03-04 21:12:52.275789
2	6	75	da_dang_ky	2026-03-04 21:12:52.275789
3	6	76	da_dang_ky	2026-03-04 21:12:52.275789
4	7	77	da_dang_ky	2026-03-04 21:12:52.275789
5	7	78	da_dang_ky	2026-03-04 21:12:52.275789
6	7	79	da_dang_ky	2026-03-04 21:12:52.275789
7	7	80	da_dang_ky	2026-03-04 21:12:52.275789
8	7	81	da_dang_ky	2026-03-04 21:12:52.275789
9	7	82	da_dang_ky	2026-03-04 21:12:52.275789
10	7	83	da_dang_ky	2026-03-04 21:12:52.275789
11	7	84	da_dang_ky	2026-03-04 21:12:52.275789
12	7	85	da_dang_ky	2026-03-04 21:12:52.275789
13	7	86	da_dang_ky	2026-03-04 21:12:52.275789
14	8	87	da_dang_ky	2026-03-04 21:12:52.275789
15	6	67	da_dang_ky	2026-03-04 21:12:52.275789
16	6	68	da_dang_ky	2026-03-04 21:12:52.275789
17	6	69	da_dang_ky	2026-03-04 21:12:52.275789
18	6	70	da_dang_ky	2026-03-04 21:12:52.275789
19	6	71	da_dang_ky	2026-03-04 21:12:52.275789
20	6	72	da_dang_ky	2026-03-04 21:12:52.275789
21	6	73	da_dang_ky	2026-03-04 21:12:52.275789
22	8	88	da_dang_ky	2026-03-04 21:12:52.275789
23	8	89	da_dang_ky	2026-03-04 21:12:52.275789
24	8	90	da_dang_ky	2026-03-04 21:12:52.275789
25	8	91	da_dang_ky	2026-03-04 21:12:52.275789
26	8	92	da_dang_ky	2026-03-04 21:12:52.275789
27	8	93	da_dang_ky	2026-03-04 21:12:52.275789
28	8	94	da_dang_ky	2026-03-04 21:12:52.275789
29	8	95	da_dang_ky	2026-03-04 21:12:52.275789
30	8	96	da_dang_ky	2026-03-04 21:12:52.275789
31	9	97	da_dang_ky	2026-03-04 21:12:52.275789
32	9	98	da_dang_ky	2026-03-04 21:12:52.275789
33	9	99	da_dang_ky	2026-03-04 21:12:52.275789
34	9	100	da_dang_ky	2026-03-04 21:12:52.275789
35	9	101	da_dang_ky	2026-03-04 21:12:52.275789
36	9	102	da_dang_ky	2026-03-04 21:12:52.275789
37	9	103	da_dang_ky	2026-03-04 21:12:52.275789
38	9	104	da_dang_ky	2026-03-04 21:12:52.275789
39	9	105	da_dang_ky	2026-03-04 21:12:52.275789
40	9	106	da_dang_ky	2026-03-04 21:12:52.275789
\.


--
-- TOC entry 5217 (class 0 OID 16870)
-- Dependencies: 238
-- Data for Name: diem_danh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diem_danh (id, buoi_hoc_id, sinh_vien_id, trang_thai, thoi_gian, hinh_thuc) FROM stdin;
2	1	68	co_mat	2026-01-08 19:05:35.776153	qr
3	1	69	co_mat	2026-01-08 19:05:35.776153	qr
4	1	70	co_mat	2026-01-08 19:05:35.776153	qr
5	1	71	co_mat	2026-01-08 19:05:35.776153	qr
6	1	72	vang	2026-01-08 19:05:35.776153	qr
7	1	73	co_mat	2026-01-08 19:05:35.776153	qr
8	1	74	co_mat	2026-01-08 19:05:35.776153	qr
9	1	75	vang	2026-01-08 19:05:35.776153	qr
10	1	76	co_mat	2026-01-08 19:05:35.776153	qr
11	1	77	co_mat	2026-01-08 19:05:35.776153	qr
12	1	78	co_mat	2026-01-08 19:05:35.776153	qr
13	1	79	co_mat	2026-01-08 19:05:35.776153	qr
14	1	80	vang	2026-01-08 19:05:35.776153	qr
15	1	81	co_mat	2026-01-08 19:05:35.776153	qr
16	1	82	co_mat	2026-01-08 19:05:35.776153	qr
17	1	83	co_mat	2026-01-08 19:05:35.776153	qr
18	1	84	co_mat	2026-01-08 19:05:35.776153	qr
19	1	85	co_mat	2026-01-08 19:05:35.776153	qr
20	1	86	co_mat	2026-01-08 19:05:35.776153	qr
21	1	87	co_mat	2026-01-08 19:05:35.776153	qr
22	1	88	co_mat	2026-01-08 19:05:35.776153	qr
23	1	89	co_mat	2026-01-08 19:05:35.776153	qr
24	1	90	co_mat	2026-01-08 19:05:35.776153	qr
25	1	91	co_mat	2026-01-08 19:05:35.776153	qr
26	1	92	vang	2026-01-08 19:05:35.776153	qr
27	1	93	co_mat	2026-01-08 19:05:35.776153	qr
28	1	94	co_mat	2026-01-08 19:05:35.776153	qr
29	1	95	co_mat	2026-01-08 19:05:35.776153	qr
30	1	96	co_mat	2026-01-08 19:05:35.776153	qr
31	1	97	co_mat	2026-01-08 19:05:35.776153	qr
32	1	98	co_mat	2026-01-08 19:05:35.776153	qr
33	1	99	co_mat	2026-01-08 19:05:35.776153	qr
34	1	100	co_mat	2026-01-08 19:05:35.776153	qr
35	1	101	vang	2026-01-08 19:05:35.776153	qr
36	1	102	co_mat	2026-01-08 19:05:35.776153	qr
37	1	103	co_mat	2026-01-08 19:05:35.776153	qr
38	1	104	co_mat	2026-01-08 19:05:35.776153	qr
39	1	105	co_mat	2026-01-08 19:05:35.776153	qr
40	1	106	co_mat	2026-01-08 19:05:35.776153	qr
41	1	107	co_mat	2026-01-08 19:05:35.776153	qr
42	1	108	co_mat	2026-01-08 19:05:35.776153	qr
43	1	109	co_mat	2026-01-08 19:05:35.776153	qr
44	1	110	vang	2026-01-08 19:05:35.776153	qr
45	2	67	vang	2026-01-08 19:05:35.776153	qr
46	2	68	co_mat	2026-01-08 19:05:35.776153	qr
47	2	69	co_mat	2026-01-08 19:05:35.776153	qr
48	2	70	co_mat	2026-01-08 19:05:35.776153	qr
49	2	71	co_mat	2026-01-08 19:05:35.776153	qr
50	2	72	co_mat	2026-01-08 19:05:35.776153	qr
51	2	73	vang	2026-01-08 19:05:35.776153	qr
52	2	74	co_mat	2026-01-08 19:05:35.776153	qr
53	2	75	co_mat	2026-01-08 19:05:35.776153	qr
54	2	76	co_mat	2026-01-08 19:05:35.776153	qr
55	2	77	co_mat	2026-01-08 19:05:35.776153	qr
56	2	78	co_mat	2026-01-08 19:05:35.776153	qr
57	2	79	co_mat	2026-01-08 19:05:35.776153	qr
58	2	80	co_mat	2026-01-08 19:05:35.776153	qr
59	2	81	vang	2026-01-08 19:05:35.776153	qr
60	2	82	co_mat	2026-01-08 19:05:35.776153	qr
61	2	83	co_mat	2026-01-08 19:05:35.776153	qr
62	2	84	co_mat	2026-01-08 19:05:35.776153	qr
63	2	85	co_mat	2026-01-08 19:05:35.776153	qr
64	2	86	co_mat	2026-01-08 19:05:35.776153	qr
65	2	87	co_mat	2026-01-08 19:05:35.776153	qr
66	2	88	co_mat	2026-01-08 19:05:35.776153	qr
67	2	89	co_mat	2026-01-08 19:05:35.776153	qr
68	2	90	co_mat	2026-01-08 19:05:35.776153	qr
69	2	91	co_mat	2026-01-08 19:05:35.776153	qr
70	2	92	co_mat	2026-01-08 19:05:35.776153	qr
71	2	93	co_mat	2026-01-08 19:05:35.776153	qr
72	2	94	co_mat	2026-01-08 19:05:35.776153	qr
73	2	95	co_mat	2026-01-08 19:05:35.776153	qr
74	2	96	co_mat	2026-01-08 19:05:35.776153	qr
75	2	97	co_mat	2026-01-08 19:05:35.776153	qr
76	2	98	co_mat	2026-01-08 19:05:35.776153	qr
77	2	99	co_mat	2026-01-08 19:05:35.776153	qr
78	2	100	co_mat	2026-01-08 19:05:35.776153	qr
79	2	101	co_mat	2026-01-08 19:05:35.776153	qr
80	2	102	vang	2026-01-08 19:05:35.776153	qr
81	2	103	co_mat	2026-01-08 19:05:35.776153	qr
82	2	104	vang	2026-01-08 19:05:35.776153	qr
83	2	105	co_mat	2026-01-08 19:05:35.776153	qr
84	2	106	co_mat	2026-01-08 19:05:35.776153	qr
85	2	107	co_mat	2026-01-08 19:05:35.776153	qr
86	2	108	co_mat	2026-01-08 19:05:35.776153	qr
87	2	109	co_mat	2026-01-08 19:05:35.776153	qr
88	2	110	co_mat	2026-01-08 19:05:35.776153	qr
89	3	67	co_mat	2026-01-08 19:05:35.776153	qr
90	3	68	co_mat	2026-01-08 19:05:35.776153	qr
91	3	69	vang	2026-01-08 19:05:35.776153	qr
92	3	70	co_mat	2026-01-08 19:05:35.776153	qr
93	3	71	co_mat	2026-01-08 19:05:35.776153	qr
94	3	72	co_mat	2026-01-08 19:05:35.776153	qr
95	3	73	co_mat	2026-01-08 19:05:35.776153	qr
96	3	74	co_mat	2026-01-08 19:05:35.776153	qr
97	3	75	vang	2026-01-08 19:05:35.776153	qr
98	3	76	co_mat	2026-01-08 19:05:35.776153	qr
99	3	77	co_mat	2026-01-08 19:05:35.776153	qr
100	3	78	co_mat	2026-01-08 19:05:35.776153	qr
101	3	79	co_mat	2026-01-08 19:05:35.776153	qr
102	3	80	vang	2026-01-08 19:05:35.776153	qr
103	3	81	co_mat	2026-01-08 19:05:35.776153	qr
104	3	82	co_mat	2026-01-08 19:05:35.776153	qr
105	3	83	co_mat	2026-01-08 19:05:35.776153	qr
106	3	84	vang	2026-01-08 19:05:35.776153	qr
107	3	85	co_mat	2026-01-08 19:05:35.776153	qr
108	3	86	co_mat	2026-01-08 19:05:35.776153	qr
109	3	87	co_mat	2026-01-08 19:05:35.776153	qr
110	3	88	co_mat	2026-01-08 19:05:35.776153	qr
111	3	89	co_mat	2026-01-08 19:05:35.776153	qr
112	3	90	co_mat	2026-01-08 19:05:35.776153	qr
113	3	91	co_mat	2026-01-08 19:05:35.776153	qr
114	3	92	co_mat	2026-01-08 19:05:35.776153	qr
115	3	93	co_mat	2026-01-08 19:05:35.776153	qr
116	3	94	co_mat	2026-01-08 19:05:35.776153	qr
117	3	95	co_mat	2026-01-08 19:05:35.776153	qr
118	3	96	co_mat	2026-01-08 19:05:35.776153	qr
119	3	97	co_mat	2026-01-08 19:05:35.776153	qr
120	3	98	co_mat	2026-01-08 19:05:35.776153	qr
121	3	99	co_mat	2026-01-08 19:05:35.776153	qr
122	3	100	co_mat	2026-01-08 19:05:35.776153	qr
123	3	101	co_mat	2026-01-08 19:05:35.776153	qr
124	3	102	co_mat	2026-01-08 19:05:35.776153	qr
125	3	103	co_mat	2026-01-08 19:05:35.776153	qr
126	3	104	co_mat	2026-01-08 19:05:35.776153	qr
127	3	105	co_mat	2026-01-08 19:05:35.776153	qr
128	3	106	vang	2026-01-08 19:05:35.776153	qr
129	3	107	vang	2026-01-08 19:05:35.776153	qr
130	3	108	co_mat	2026-01-08 19:05:35.776153	qr
131	3	109	co_mat	2026-01-08 19:05:35.776153	qr
132	3	110	vang	2026-01-08 19:05:35.776153	qr
133	4	67	co_mat	2026-01-08 19:05:35.776153	qr
134	4	68	vang	2026-01-08 19:05:35.776153	qr
135	4	69	co_mat	2026-01-08 19:05:35.776153	qr
136	4	70	co_mat	2026-01-08 19:05:35.776153	qr
137	4	71	co_mat	2026-01-08 19:05:35.776153	qr
138	4	72	co_mat	2026-01-08 19:05:35.776153	qr
139	4	73	co_mat	2026-01-08 19:05:35.776153	qr
140	4	74	vang	2026-01-08 19:05:35.776153	qr
141	4	75	co_mat	2026-01-08 19:05:35.776153	qr
142	4	76	co_mat	2026-01-08 19:05:35.776153	qr
143	4	77	vang	2026-01-08 19:05:35.776153	qr
144	4	78	co_mat	2026-01-08 19:05:35.776153	qr
145	4	79	co_mat	2026-01-08 19:05:35.776153	qr
146	4	80	co_mat	2026-01-08 19:05:35.776153	qr
147	4	81	co_mat	2026-01-08 19:05:35.776153	qr
148	4	82	co_mat	2026-01-08 19:05:35.776153	qr
149	4	83	vang	2026-01-08 19:05:35.776153	qr
150	4	84	co_mat	2026-01-08 19:05:35.776153	qr
151	4	85	co_mat	2026-01-08 19:05:35.776153	qr
152	4	86	co_mat	2026-01-08 19:05:35.776153	qr
153	4	87	vang	2026-01-08 19:05:35.776153	qr
154	4	88	co_mat	2026-01-08 19:05:35.776153	qr
155	4	89	vang	2026-01-08 19:05:35.776153	qr
156	4	90	co_mat	2026-01-08 19:05:35.776153	qr
157	4	91	co_mat	2026-01-08 19:05:35.776153	qr
158	4	92	co_mat	2026-01-08 19:05:35.776153	qr
159	4	93	co_mat	2026-01-08 19:05:35.776153	qr
160	4	94	co_mat	2026-01-08 19:05:35.776153	qr
161	4	95	co_mat	2026-01-08 19:05:35.776153	qr
162	4	96	co_mat	2026-01-08 19:05:35.776153	qr
163	4	97	co_mat	2026-01-08 19:05:35.776153	qr
164	4	98	co_mat	2026-01-08 19:05:35.776153	qr
165	4	99	co_mat	2026-01-08 19:05:35.776153	qr
166	4	100	co_mat	2026-01-08 19:05:35.776153	qr
167	4	101	co_mat	2026-01-08 19:05:35.776153	qr
168	4	102	co_mat	2026-01-08 19:05:35.776153	qr
169	4	103	co_mat	2026-01-08 19:05:35.776153	qr
170	4	104	co_mat	2026-01-08 19:05:35.776153	qr
171	4	105	co_mat	2026-01-08 19:05:35.776153	qr
172	4	106	co_mat	2026-01-08 19:05:35.776153	qr
173	4	107	co_mat	2026-01-08 19:05:35.776153	qr
174	4	108	co_mat	2026-01-08 19:05:35.776153	qr
175	4	109	co_mat	2026-01-08 19:05:35.776153	qr
176	4	110	vang	2026-01-08 19:05:35.776153	qr
177	5	67	co_mat	2026-01-08 19:05:35.776153	qr
178	5	68	vang	2026-01-08 19:05:35.776153	qr
179	5	69	co_mat	2026-01-08 19:05:35.776153	qr
180	5	70	co_mat	2026-01-08 19:05:35.776153	qr
181	5	71	co_mat	2026-01-08 19:05:35.776153	qr
182	5	72	co_mat	2026-01-08 19:05:35.776153	qr
183	5	73	co_mat	2026-01-08 19:05:35.776153	qr
184	5	74	co_mat	2026-01-08 19:05:35.776153	qr
185	5	75	co_mat	2026-01-08 19:05:35.776153	qr
186	5	76	vang	2026-01-08 19:05:35.776153	qr
187	5	77	co_mat	2026-01-08 19:05:35.776153	qr
188	5	78	co_mat	2026-01-08 19:05:35.776153	qr
189	5	79	co_mat	2026-01-08 19:05:35.776153	qr
190	5	80	co_mat	2026-01-08 19:05:35.776153	qr
191	5	81	co_mat	2026-01-08 19:05:35.776153	qr
192	5	82	co_mat	2026-01-08 19:05:35.776153	qr
193	5	83	co_mat	2026-01-08 19:05:35.776153	qr
194	5	84	co_mat	2026-01-08 19:05:35.776153	qr
195	5	85	vang	2026-01-08 19:05:35.776153	qr
196	5	86	co_mat	2026-01-08 19:05:35.776153	qr
197	5	87	co_mat	2026-01-08 19:05:35.776153	qr
198	5	88	co_mat	2026-01-08 19:05:35.776153	qr
199	5	89	co_mat	2026-01-08 19:05:35.776153	qr
200	5	90	co_mat	2026-01-08 19:05:35.776153	qr
201	5	91	co_mat	2026-01-08 19:05:35.776153	qr
202	5	92	co_mat	2026-01-08 19:05:35.776153	qr
203	5	93	co_mat	2026-01-08 19:05:35.776153	qr
204	5	94	co_mat	2026-01-08 19:05:35.776153	qr
205	5	95	co_mat	2026-01-08 19:05:35.776153	qr
206	5	96	co_mat	2026-01-08 19:05:35.776153	qr
207	5	97	co_mat	2026-01-08 19:05:35.776153	qr
208	5	98	co_mat	2026-01-08 19:05:35.776153	qr
209	5	99	co_mat	2026-01-08 19:05:35.776153	qr
210	5	100	co_mat	2026-01-08 19:05:35.776153	qr
211	5	101	co_mat	2026-01-08 19:05:35.776153	qr
212	5	102	co_mat	2026-01-08 19:05:35.776153	qr
213	5	103	co_mat	2026-01-08 19:05:35.776153	qr
214	5	104	co_mat	2026-01-08 19:05:35.776153	qr
215	5	105	vang	2026-01-08 19:05:35.776153	qr
216	5	106	co_mat	2026-01-08 19:05:35.776153	qr
217	5	107	vang	2026-01-08 19:05:35.776153	qr
218	5	108	co_mat	2026-01-08 19:05:35.776153	qr
219	5	109	co_mat	2026-01-08 19:05:35.776153	qr
220	5	110	co_mat	2026-01-08 19:05:35.776153	qr
221	6	67	co_mat	2026-01-08 19:05:35.776153	qr
222	6	68	co_mat	2026-01-08 19:05:35.776153	qr
223	6	69	co_mat	2026-01-08 19:05:35.776153	qr
224	6	70	co_mat	2026-01-08 19:05:35.776153	qr
225	6	71	co_mat	2026-01-08 19:05:35.776153	qr
226	6	72	co_mat	2026-01-08 19:05:35.776153	qr
227	6	73	co_mat	2026-01-08 19:05:35.776153	qr
228	6	74	co_mat	2026-01-08 19:05:35.776153	qr
229	6	75	vang	2026-01-08 19:05:35.776153	qr
230	6	76	vang	2026-01-08 19:05:35.776153	qr
231	6	77	co_mat	2026-01-08 19:05:35.776153	qr
232	6	78	co_mat	2026-01-08 19:05:35.776153	qr
233	6	79	co_mat	2026-01-08 19:05:35.776153	qr
234	6	80	co_mat	2026-01-08 19:05:35.776153	qr
235	6	81	vang	2026-01-08 19:05:35.776153	qr
236	6	82	co_mat	2026-01-08 19:05:35.776153	qr
237	6	83	co_mat	2026-01-08 19:05:35.776153	qr
238	6	84	co_mat	2026-01-08 19:05:35.776153	qr
239	6	85	co_mat	2026-01-08 19:05:35.776153	qr
240	6	86	co_mat	2026-01-08 19:05:35.776153	qr
241	6	87	co_mat	2026-01-08 19:05:35.776153	qr
242	6	88	co_mat	2026-01-08 19:05:35.776153	qr
243	6	89	co_mat	2026-01-08 19:05:35.776153	qr
244	6	90	co_mat	2026-01-08 19:05:35.776153	qr
245	6	91	co_mat	2026-01-08 19:05:35.776153	qr
246	6	92	vang	2026-01-08 19:05:35.776153	qr
247	6	93	co_mat	2026-01-08 19:05:35.776153	qr
248	6	94	co_mat	2026-01-08 19:05:35.776153	qr
249	6	95	co_mat	2026-01-08 19:05:35.776153	qr
250	6	96	co_mat	2026-01-08 19:05:35.776153	qr
251	6	97	vang	2026-01-08 19:05:35.776153	qr
252	6	98	co_mat	2026-01-08 19:05:35.776153	qr
253	6	99	co_mat	2026-01-08 19:05:35.776153	qr
254	6	100	co_mat	2026-01-08 19:05:35.776153	qr
255	6	101	co_mat	2026-01-08 19:05:35.776153	qr
256	6	102	vang	2026-01-08 19:05:35.776153	qr
257	6	103	vang	2026-01-08 19:05:35.776153	qr
258	6	104	co_mat	2026-01-08 19:05:35.776153	qr
259	6	105	co_mat	2026-01-08 19:05:35.776153	qr
260	6	106	co_mat	2026-01-08 19:05:35.776153	qr
261	6	107	vang	2026-01-08 19:05:35.776153	qr
262	6	108	co_mat	2026-01-08 19:05:35.776153	qr
263	6	109	co_mat	2026-01-08 19:05:35.776153	qr
264	6	110	co_mat	2026-01-08 19:05:35.776153	qr
265	7	67	co_mat	2026-01-08 19:05:35.776153	qr
266	7	68	co_mat	2026-01-08 19:05:35.776153	qr
267	7	69	co_mat	2026-01-08 19:05:35.776153	qr
268	7	70	co_mat	2026-01-08 19:05:35.776153	qr
269	7	71	co_mat	2026-01-08 19:05:35.776153	qr
270	7	72	co_mat	2026-01-08 19:05:35.776153	qr
271	7	73	co_mat	2026-01-08 19:05:35.776153	qr
272	7	74	co_mat	2026-01-08 19:05:35.776153	qr
273	7	75	co_mat	2026-01-08 19:05:35.776153	qr
274	7	76	co_mat	2026-01-08 19:05:35.776153	qr
275	7	77	co_mat	2026-01-08 19:05:35.776153	qr
276	7	78	co_mat	2026-01-08 19:05:35.776153	qr
277	7	79	vang	2026-01-08 19:05:35.776153	qr
278	7	80	co_mat	2026-01-08 19:05:35.776153	qr
279	7	81	co_mat	2026-01-08 19:05:35.776153	qr
280	7	82	co_mat	2026-01-08 19:05:35.776153	qr
281	7	83	vang	2026-01-08 19:05:35.776153	qr
282	7	84	co_mat	2026-01-08 19:05:35.776153	qr
283	7	85	co_mat	2026-01-08 19:05:35.776153	qr
284	7	86	co_mat	2026-01-08 19:05:35.776153	qr
285	7	87	co_mat	2026-01-08 19:05:35.776153	qr
286	7	88	vang	2026-01-08 19:05:35.776153	qr
287	7	89	co_mat	2026-01-08 19:05:35.776153	qr
288	7	90	co_mat	2026-01-08 19:05:35.776153	qr
289	7	91	co_mat	2026-01-08 19:05:35.776153	qr
290	7	92	co_mat	2026-01-08 19:05:35.776153	qr
291	7	93	vang	2026-01-08 19:05:35.776153	qr
292	7	94	co_mat	2026-01-08 19:05:35.776153	qr
293	7	95	co_mat	2026-01-08 19:05:35.776153	qr
294	7	96	co_mat	2026-01-08 19:05:35.776153	qr
295	7	97	vang	2026-01-08 19:05:35.776153	qr
296	7	98	co_mat	2026-01-08 19:05:35.776153	qr
297	7	99	co_mat	2026-01-08 19:05:35.776153	qr
298	7	100	co_mat	2026-01-08 19:05:35.776153	qr
299	7	101	vang	2026-01-08 19:05:35.776153	qr
300	7	102	co_mat	2026-01-08 19:05:35.776153	qr
301	7	103	co_mat	2026-01-08 19:05:35.776153	qr
302	7	104	co_mat	2026-01-08 19:05:35.776153	qr
303	7	105	co_mat	2026-01-08 19:05:35.776153	qr
304	7	106	co_mat	2026-01-08 19:05:35.776153	qr
305	7	107	co_mat	2026-01-08 19:05:35.776153	qr
306	7	108	co_mat	2026-01-08 19:05:35.776153	qr
307	7	109	co_mat	2026-01-08 19:05:35.776153	qr
308	7	110	vang	2026-01-08 19:05:35.776153	qr
309	8	67	vang	2026-01-08 19:05:35.776153	qr
310	8	68	co_mat	2026-01-08 19:05:35.776153	qr
311	8	69	vang	2026-01-08 19:05:35.776153	qr
312	8	70	co_mat	2026-01-08 19:05:35.776153	qr
313	8	71	co_mat	2026-01-08 19:05:35.776153	qr
314	8	72	co_mat	2026-01-08 19:05:35.776153	qr
315	8	73	co_mat	2026-01-08 19:05:35.776153	qr
316	8	74	co_mat	2026-01-08 19:05:35.776153	qr
317	8	75	co_mat	2026-01-08 19:05:35.776153	qr
318	8	76	co_mat	2026-01-08 19:05:35.776153	qr
319	8	77	co_mat	2026-01-08 19:05:35.776153	qr
320	8	78	co_mat	2026-01-08 19:05:35.776153	qr
321	8	79	co_mat	2026-01-08 19:05:35.776153	qr
322	8	80	co_mat	2026-01-08 19:05:35.776153	qr
323	8	81	co_mat	2026-01-08 19:05:35.776153	qr
324	8	82	co_mat	2026-01-08 19:05:35.776153	qr
325	8	83	vang	2026-01-08 19:05:35.776153	qr
326	8	84	vang	2026-01-08 19:05:35.776153	qr
327	8	85	co_mat	2026-01-08 19:05:35.776153	qr
328	8	86	co_mat	2026-01-08 19:05:35.776153	qr
329	8	87	co_mat	2026-01-08 19:05:35.776153	qr
330	8	88	co_mat	2026-01-08 19:05:35.776153	qr
331	8	89	co_mat	2026-01-08 19:05:35.776153	qr
332	8	90	co_mat	2026-01-08 19:05:35.776153	qr
333	8	91	vang	2026-01-08 19:05:35.776153	qr
334	8	92	co_mat	2026-01-08 19:05:35.776153	qr
335	8	93	co_mat	2026-01-08 19:05:35.776153	qr
336	8	94	co_mat	2026-01-08 19:05:35.776153	qr
337	8	95	co_mat	2026-01-08 19:05:35.776153	qr
338	8	96	vang	2026-01-08 19:05:35.776153	qr
339	8	97	vang	2026-01-08 19:05:35.776153	qr
340	8	98	co_mat	2026-01-08 19:05:35.776153	qr
341	8	99	vang	2026-01-08 19:05:35.776153	qr
342	8	100	co_mat	2026-01-08 19:05:35.776153	qr
343	8	101	vang	2026-01-08 19:05:35.776153	qr
344	8	102	co_mat	2026-01-08 19:05:35.776153	qr
345	8	103	co_mat	2026-01-08 19:05:35.776153	qr
346	8	104	co_mat	2026-01-08 19:05:35.776153	qr
347	8	105	co_mat	2026-01-08 19:05:35.776153	qr
348	8	106	co_mat	2026-01-08 19:05:35.776153	qr
349	8	107	co_mat	2026-01-08 19:05:35.776153	qr
350	8	108	co_mat	2026-01-08 19:05:35.776153	qr
351	8	109	co_mat	2026-01-08 19:05:35.776153	qr
352	8	110	co_mat	2026-01-08 19:05:35.776153	qr
353	9	67	co_mat	2026-01-08 19:05:35.776153	qr
354	9	68	co_mat	2026-01-08 19:05:35.776153	qr
355	9	69	vang	2026-01-08 19:05:35.776153	qr
356	9	70	co_mat	2026-01-08 19:05:35.776153	qr
357	9	71	co_mat	2026-01-08 19:05:35.776153	qr
358	9	72	co_mat	2026-01-08 19:05:35.776153	qr
359	9	73	co_mat	2026-01-08 19:05:35.776153	qr
360	9	74	co_mat	2026-01-08 19:05:35.776153	qr
361	9	75	co_mat	2026-01-08 19:05:35.776153	qr
362	9	76	co_mat	2026-01-08 19:05:35.776153	qr
363	9	77	co_mat	2026-01-08 19:05:35.776153	qr
364	9	78	vang	2026-01-08 19:05:35.776153	qr
365	9	79	co_mat	2026-01-08 19:05:35.776153	qr
366	9	80	co_mat	2026-01-08 19:05:35.776153	qr
367	9	81	co_mat	2026-01-08 19:05:35.776153	qr
368	9	82	vang	2026-01-08 19:05:35.776153	qr
369	9	83	vang	2026-01-08 19:05:35.776153	qr
370	9	84	co_mat	2026-01-08 19:05:35.776153	qr
371	9	85	co_mat	2026-01-08 19:05:35.776153	qr
372	9	86	co_mat	2026-01-08 19:05:35.776153	qr
373	9	87	co_mat	2026-01-08 19:05:35.776153	qr
374	9	88	co_mat	2026-01-08 19:05:35.776153	qr
375	9	89	co_mat	2026-01-08 19:05:35.776153	qr
376	9	90	co_mat	2026-01-08 19:05:35.776153	qr
377	9	91	co_mat	2026-01-08 19:05:35.776153	qr
378	9	92	co_mat	2026-01-08 19:05:35.776153	qr
379	9	93	vang	2026-01-08 19:05:35.776153	qr
380	9	94	co_mat	2026-01-08 19:05:35.776153	qr
381	9	95	co_mat	2026-01-08 19:05:35.776153	qr
382	9	96	co_mat	2026-01-08 19:05:35.776153	qr
383	9	97	co_mat	2026-01-08 19:05:35.776153	qr
384	9	98	co_mat	2026-01-08 19:05:35.776153	qr
385	9	99	co_mat	2026-01-08 19:05:35.776153	qr
386	9	100	co_mat	2026-01-08 19:05:35.776153	qr
387	9	101	vang	2026-01-08 19:05:35.776153	qr
388	9	102	co_mat	2026-01-08 19:05:35.776153	qr
389	9	103	co_mat	2026-01-08 19:05:35.776153	qr
390	9	104	co_mat	2026-01-08 19:05:35.776153	qr
391	9	105	co_mat	2026-01-08 19:05:35.776153	qr
392	9	106	co_mat	2026-01-08 19:05:35.776153	qr
393	9	107	co_mat	2026-01-08 19:05:35.776153	qr
394	9	108	co_mat	2026-01-08 19:05:35.776153	qr
395	9	109	co_mat	2026-01-08 19:05:35.776153	qr
396	9	110	vang	2026-01-08 19:05:35.776153	qr
397	10	67	co_mat	2026-01-08 19:05:35.776153	qr
398	10	68	co_mat	2026-01-08 19:05:35.776153	qr
399	10	69	co_mat	2026-01-08 19:05:35.776153	qr
400	10	70	co_mat	2026-01-08 19:05:35.776153	qr
401	10	71	vang	2026-01-08 19:05:35.776153	qr
402	10	72	co_mat	2026-01-08 19:05:35.776153	qr
403	10	73	vang	2026-01-08 19:05:35.776153	qr
404	10	74	co_mat	2026-01-08 19:05:35.776153	qr
405	10	75	vang	2026-01-08 19:05:35.776153	qr
406	10	76	co_mat	2026-01-08 19:05:35.776153	qr
407	10	77	co_mat	2026-01-08 19:05:35.776153	qr
408	10	78	co_mat	2026-01-08 19:05:35.776153	qr
409	10	79	co_mat	2026-01-08 19:05:35.776153	qr
410	10	80	co_mat	2026-01-08 19:05:35.776153	qr
411	10	81	co_mat	2026-01-08 19:05:35.776153	qr
412	10	82	vang	2026-01-08 19:05:35.776153	qr
413	10	83	co_mat	2026-01-08 19:05:35.776153	qr
414	10	84	co_mat	2026-01-08 19:05:35.776153	qr
415	10	85	vang	2026-01-08 19:05:35.776153	qr
416	10	86	co_mat	2026-01-08 19:05:35.776153	qr
417	10	87	co_mat	2026-01-08 19:05:35.776153	qr
418	10	88	co_mat	2026-01-08 19:05:35.776153	qr
419	10	89	co_mat	2026-01-08 19:05:35.776153	qr
420	10	90	co_mat	2026-01-08 19:05:35.776153	qr
421	10	91	co_mat	2026-01-08 19:05:35.776153	qr
422	10	92	co_mat	2026-01-08 19:05:35.776153	qr
423	10	93	co_mat	2026-01-08 19:05:35.776153	qr
424	10	94	co_mat	2026-01-08 19:05:35.776153	qr
425	10	95	co_mat	2026-01-08 19:05:35.776153	qr
426	10	96	co_mat	2026-01-08 19:05:35.776153	qr
427	10	97	co_mat	2026-01-08 19:05:35.776153	qr
428	10	98	co_mat	2026-01-08 19:05:35.776153	qr
429	10	99	co_mat	2026-01-08 19:05:35.776153	qr
430	10	100	co_mat	2026-01-08 19:05:35.776153	qr
431	10	101	co_mat	2026-01-08 19:05:35.776153	qr
432	10	102	co_mat	2026-01-08 19:05:35.776153	qr
433	10	103	co_mat	2026-01-08 19:05:35.776153	qr
434	10	104	co_mat	2026-01-08 19:05:35.776153	qr
435	10	105	vang	2026-01-08 19:05:35.776153	qr
436	10	106	co_mat	2026-01-08 19:05:35.776153	qr
437	10	107	co_mat	2026-01-08 19:05:35.776153	qr
438	10	108	co_mat	2026-01-08 19:05:35.776153	qr
439	10	109	vang	2026-01-08 19:05:35.776153	qr
440	10	110	co_mat	2026-01-08 19:05:35.776153	qr
441	11	67	co_mat	2026-01-08 19:05:35.776153	qr
442	11	68	co_mat	2026-01-08 19:05:35.776153	qr
443	11	69	vang	2026-01-08 19:05:35.776153	qr
444	11	70	vang	2026-01-08 19:05:35.776153	qr
445	11	71	co_mat	2026-01-08 19:05:35.776153	qr
446	11	72	co_mat	2026-01-08 19:05:35.776153	qr
447	11	73	co_mat	2026-01-08 19:05:35.776153	qr
448	11	74	co_mat	2026-01-08 19:05:35.776153	qr
449	11	75	co_mat	2026-01-08 19:05:35.776153	qr
450	11	76	co_mat	2026-01-08 19:05:35.776153	qr
451	11	77	vang	2026-01-08 19:05:35.776153	qr
452	11	78	co_mat	2026-01-08 19:05:35.776153	qr
453	11	79	co_mat	2026-01-08 19:05:35.776153	qr
454	11	80	co_mat	2026-01-08 19:05:35.776153	qr
455	11	81	co_mat	2026-01-08 19:05:35.776153	qr
456	11	82	co_mat	2026-01-08 19:05:35.776153	qr
457	11	83	vang	2026-01-08 19:05:35.776153	qr
458	11	84	vang	2026-01-08 19:05:35.776153	qr
459	11	85	co_mat	2026-01-08 19:05:35.776153	qr
460	11	86	co_mat	2026-01-08 19:05:35.776153	qr
461	11	87	vang	2026-01-08 19:05:35.776153	qr
462	11	88	co_mat	2026-01-08 19:05:35.776153	qr
463	11	89	co_mat	2026-01-08 19:05:35.776153	qr
464	11	90	co_mat	2026-01-08 19:05:35.776153	qr
465	11	91	co_mat	2026-01-08 19:05:35.776153	qr
466	11	92	co_mat	2026-01-08 19:05:35.776153	qr
467	11	93	co_mat	2026-01-08 19:05:35.776153	qr
468	11	94	co_mat	2026-01-08 19:05:35.776153	qr
469	11	95	vang	2026-01-08 19:05:35.776153	qr
470	11	96	co_mat	2026-01-08 19:05:35.776153	qr
471	11	97	co_mat	2026-01-08 19:05:35.776153	qr
472	11	98	co_mat	2026-01-08 19:05:35.776153	qr
473	11	99	co_mat	2026-01-08 19:05:35.776153	qr
474	11	100	co_mat	2026-01-08 19:05:35.776153	qr
475	11	101	co_mat	2026-01-08 19:05:35.776153	qr
476	11	102	co_mat	2026-01-08 19:05:35.776153	qr
477	11	103	co_mat	2026-01-08 19:05:35.776153	qr
478	11	104	co_mat	2026-01-08 19:05:35.776153	qr
479	11	105	co_mat	2026-01-08 19:05:35.776153	qr
480	11	106	co_mat	2026-01-08 19:05:35.776153	qr
481	11	107	co_mat	2026-01-08 19:05:35.776153	qr
482	11	108	co_mat	2026-01-08 19:05:35.776153	qr
483	11	109	co_mat	2026-01-08 19:05:35.776153	qr
484	11	110	co_mat	2026-01-08 19:05:35.776153	qr
485	12	67	co_mat	2026-01-08 19:05:35.776153	qr
486	12	68	co_mat	2026-01-08 19:05:35.776153	qr
487	12	69	vang	2026-01-08 19:05:35.776153	qr
488	12	70	co_mat	2026-01-08 19:05:35.776153	qr
489	12	71	co_mat	2026-01-08 19:05:35.776153	qr
490	12	72	co_mat	2026-01-08 19:05:35.776153	qr
491	12	73	co_mat	2026-01-08 19:05:35.776153	qr
492	12	74	co_mat	2026-01-08 19:05:35.776153	qr
493	12	75	co_mat	2026-01-08 19:05:35.776153	qr
494	12	76	co_mat	2026-01-08 19:05:35.776153	qr
495	12	77	co_mat	2026-01-08 19:05:35.776153	qr
496	12	78	co_mat	2026-01-08 19:05:35.776153	qr
497	12	79	co_mat	2026-01-08 19:05:35.776153	qr
498	12	80	co_mat	2026-01-08 19:05:35.776153	qr
499	12	81	co_mat	2026-01-08 19:05:35.776153	qr
500	12	82	co_mat	2026-01-08 19:05:35.776153	qr
501	12	83	co_mat	2026-01-08 19:05:35.776153	qr
502	12	84	co_mat	2026-01-08 19:05:35.776153	qr
503	12	85	co_mat	2026-01-08 19:05:35.776153	qr
504	12	86	co_mat	2026-01-08 19:05:35.776153	qr
505	12	87	co_mat	2026-01-08 19:05:35.776153	qr
506	12	88	vang	2026-01-08 19:05:35.776153	qr
507	12	89	co_mat	2026-01-08 19:05:35.776153	qr
508	12	90	co_mat	2026-01-08 19:05:35.776153	qr
509	12	91	co_mat	2026-01-08 19:05:35.776153	qr
510	12	92	vang	2026-01-08 19:05:35.776153	qr
511	12	93	co_mat	2026-01-08 19:05:35.776153	qr
512	12	94	co_mat	2026-01-08 19:05:35.776153	qr
513	12	95	vang	2026-01-08 19:05:35.776153	qr
514	12	96	co_mat	2026-01-08 19:05:35.776153	qr
515	12	97	co_mat	2026-01-08 19:05:35.776153	qr
516	12	98	co_mat	2026-01-08 19:05:35.776153	qr
517	12	99	co_mat	2026-01-08 19:05:35.776153	qr
518	12	100	co_mat	2026-01-08 19:05:35.776153	qr
519	12	101	vang	2026-01-08 19:05:35.776153	qr
520	12	102	vang	2026-01-08 19:05:35.776153	qr
521	12	103	vang	2026-01-08 19:05:35.776153	qr
522	12	104	co_mat	2026-01-08 19:05:35.776153	qr
523	12	105	co_mat	2026-01-08 19:05:35.776153	qr
524	12	106	co_mat	2026-01-08 19:05:35.776153	qr
525	12	107	co_mat	2026-01-08 19:05:35.776153	qr
526	12	108	co_mat	2026-01-08 19:05:35.776153	qr
527	12	109	co_mat	2026-01-08 19:05:35.776153	qr
528	12	110	co_mat	2026-01-08 19:05:35.776153	qr
529	13	67	co_mat	2026-01-08 19:05:35.776153	qr
530	13	68	co_mat	2026-01-08 19:05:35.776153	qr
531	13	69	co_mat	2026-01-08 19:05:35.776153	qr
532	13	70	co_mat	2026-01-08 19:05:35.776153	qr
533	13	71	co_mat	2026-01-08 19:05:35.776153	qr
534	13	72	co_mat	2026-01-08 19:05:35.776153	qr
535	13	73	co_mat	2026-01-08 19:05:35.776153	qr
536	13	74	co_mat	2026-01-08 19:05:35.776153	qr
537	13	75	co_mat	2026-01-08 19:05:35.776153	qr
538	13	76	co_mat	2026-01-08 19:05:35.776153	qr
539	13	77	co_mat	2026-01-08 19:05:35.776153	qr
540	13	78	vang	2026-01-08 19:05:35.776153	qr
541	13	79	co_mat	2026-01-08 19:05:35.776153	qr
542	13	80	co_mat	2026-01-08 19:05:35.776153	qr
543	13	81	co_mat	2026-01-08 19:05:35.776153	qr
544	13	82	co_mat	2026-01-08 19:05:35.776153	qr
545	13	83	co_mat	2026-01-08 19:05:35.776153	qr
546	13	84	co_mat	2026-01-08 19:05:35.776153	qr
547	13	85	co_mat	2026-01-08 19:05:35.776153	qr
548	13	86	co_mat	2026-01-08 19:05:35.776153	qr
549	13	87	co_mat	2026-01-08 19:05:35.776153	qr
550	13	88	co_mat	2026-01-08 19:05:35.776153	qr
551	13	89	co_mat	2026-01-08 19:05:35.776153	qr
552	13	90	co_mat	2026-01-08 19:05:35.776153	qr
553	13	91	co_mat	2026-01-08 19:05:35.776153	qr
554	13	92	co_mat	2026-01-08 19:05:35.776153	qr
555	13	93	co_mat	2026-01-08 19:05:35.776153	qr
556	13	94	co_mat	2026-01-08 19:05:35.776153	qr
557	13	95	co_mat	2026-01-08 19:05:35.776153	qr
558	13	96	vang	2026-01-08 19:05:35.776153	qr
559	13	97	co_mat	2026-01-08 19:05:35.776153	qr
560	13	98	co_mat	2026-01-08 19:05:35.776153	qr
561	13	99	vang	2026-01-08 19:05:35.776153	qr
562	13	100	co_mat	2026-01-08 19:05:35.776153	qr
563	13	101	co_mat	2026-01-08 19:05:35.776153	qr
564	13	102	co_mat	2026-01-08 19:05:35.776153	qr
565	13	103	co_mat	2026-01-08 19:05:35.776153	qr
566	13	104	co_mat	2026-01-08 19:05:35.776153	qr
567	13	105	co_mat	2026-01-08 19:05:35.776153	qr
568	13	106	vang	2026-01-08 19:05:35.776153	qr
569	13	107	co_mat	2026-01-08 19:05:35.776153	qr
570	13	108	co_mat	2026-01-08 19:05:35.776153	qr
571	13	109	co_mat	2026-01-08 19:05:35.776153	qr
572	13	110	co_mat	2026-01-08 19:05:35.776153	qr
573	14	67	co_mat	2026-01-08 19:05:35.776153	qr
574	14	68	co_mat	2026-01-08 19:05:35.776153	qr
575	14	69	co_mat	2026-01-08 19:05:35.776153	qr
576	14	70	co_mat	2026-01-08 19:05:35.776153	qr
577	14	71	vang	2026-01-08 19:05:35.776153	qr
578	14	72	co_mat	2026-01-08 19:05:35.776153	qr
579	14	73	vang	2026-01-08 19:05:35.776153	qr
580	14	74	vang	2026-01-08 19:05:35.776153	qr
581	14	75	co_mat	2026-01-08 19:05:35.776153	qr
582	14	76	co_mat	2026-01-08 19:05:35.776153	qr
583	14	77	co_mat	2026-01-08 19:05:35.776153	qr
584	14	78	co_mat	2026-01-08 19:05:35.776153	qr
585	14	79	co_mat	2026-01-08 19:05:35.776153	qr
586	14	80	co_mat	2026-01-08 19:05:35.776153	qr
587	14	81	co_mat	2026-01-08 19:05:35.776153	qr
588	14	82	co_mat	2026-01-08 19:05:35.776153	qr
589	14	83	co_mat	2026-01-08 19:05:35.776153	qr
590	14	84	co_mat	2026-01-08 19:05:35.776153	qr
591	14	85	co_mat	2026-01-08 19:05:35.776153	qr
592	14	86	vang	2026-01-08 19:05:35.776153	qr
593	14	87	co_mat	2026-01-08 19:05:35.776153	qr
594	14	88	co_mat	2026-01-08 19:05:35.776153	qr
595	14	89	co_mat	2026-01-08 19:05:35.776153	qr
596	14	90	co_mat	2026-01-08 19:05:35.776153	qr
597	14	91	co_mat	2026-01-08 19:05:35.776153	qr
598	14	92	co_mat	2026-01-08 19:05:35.776153	qr
599	14	93	co_mat	2026-01-08 19:05:35.776153	qr
600	14	94	co_mat	2026-01-08 19:05:35.776153	qr
601	14	95	co_mat	2026-01-08 19:05:35.776153	qr
602	14	96	co_mat	2026-01-08 19:05:35.776153	qr
603	14	97	co_mat	2026-01-08 19:05:35.776153	qr
604	14	98	co_mat	2026-01-08 19:05:35.776153	qr
605	14	99	co_mat	2026-01-08 19:05:35.776153	qr
606	14	100	co_mat	2026-01-08 19:05:35.776153	qr
607	14	101	vang	2026-01-08 19:05:35.776153	qr
608	14	102	co_mat	2026-01-08 19:05:35.776153	qr
609	14	103	co_mat	2026-01-08 19:05:35.776153	qr
610	14	104	co_mat	2026-01-08 19:05:35.776153	qr
611	14	105	co_mat	2026-01-08 19:05:35.776153	qr
612	14	106	co_mat	2026-01-08 19:05:35.776153	qr
613	14	107	co_mat	2026-01-08 19:05:35.776153	qr
614	14	108	co_mat	2026-01-08 19:05:35.776153	qr
615	14	109	co_mat	2026-01-08 19:05:35.776153	qr
616	14	110	co_mat	2026-01-08 19:05:35.776153	qr
617	15	67	co_mat	2026-01-08 19:05:35.776153	qr
618	15	68	co_mat	2026-01-08 19:05:35.776153	qr
619	15	69	co_mat	2026-01-08 19:05:35.776153	qr
620	15	70	co_mat	2026-01-08 19:05:35.776153	qr
621	15	71	co_mat	2026-01-08 19:05:35.776153	qr
622	15	72	co_mat	2026-01-08 19:05:35.776153	qr
623	15	73	vang	2026-01-08 19:05:35.776153	qr
624	15	74	co_mat	2026-01-08 19:05:35.776153	qr
625	15	75	co_mat	2026-01-08 19:05:35.776153	qr
626	15	76	co_mat	2026-01-08 19:05:35.776153	qr
627	15	77	vang	2026-01-08 19:05:35.776153	qr
628	15	78	co_mat	2026-01-08 19:05:35.776153	qr
629	15	79	co_mat	2026-01-08 19:05:35.776153	qr
630	15	80	co_mat	2026-01-08 19:05:35.776153	qr
631	15	81	co_mat	2026-01-08 19:05:35.776153	qr
632	15	82	vang	2026-01-08 19:05:35.776153	qr
633	15	83	co_mat	2026-01-08 19:05:35.776153	qr
634	15	84	co_mat	2026-01-08 19:05:35.776153	qr
635	15	85	co_mat	2026-01-08 19:05:35.776153	qr
636	15	86	co_mat	2026-01-08 19:05:35.776153	qr
637	15	87	co_mat	2026-01-08 19:05:35.776153	qr
638	15	88	co_mat	2026-01-08 19:05:35.776153	qr
639	15	89	vang	2026-01-08 19:05:35.776153	qr
640	15	90	co_mat	2026-01-08 19:05:35.776153	qr
641	15	91	co_mat	2026-01-08 19:05:35.776153	qr
642	15	92	co_mat	2026-01-08 19:05:35.776153	qr
643	15	93	co_mat	2026-01-08 19:05:35.776153	qr
644	15	94	co_mat	2026-01-08 19:05:35.776153	qr
645	15	95	co_mat	2026-01-08 19:05:35.776153	qr
646	15	96	co_mat	2026-01-08 19:05:35.776153	qr
647	15	97	co_mat	2026-01-08 19:05:35.776153	qr
648	15	98	co_mat	2026-01-08 19:05:35.776153	qr
649	15	99	co_mat	2026-01-08 19:05:35.776153	qr
650	15	100	co_mat	2026-01-08 19:05:35.776153	qr
651	15	101	co_mat	2026-01-08 19:05:35.776153	qr
652	15	102	co_mat	2026-01-08 19:05:35.776153	qr
653	15	103	co_mat	2026-01-08 19:05:35.776153	qr
654	15	104	co_mat	2026-01-08 19:05:35.776153	qr
655	15	105	co_mat	2026-01-08 19:05:35.776153	qr
656	15	106	co_mat	2026-01-08 19:05:35.776153	qr
657	15	107	co_mat	2026-01-08 19:05:35.776153	qr
658	15	108	co_mat	2026-01-08 19:05:35.776153	qr
659	15	109	co_mat	2026-01-08 19:05:35.776153	qr
660	15	110	co_mat	2026-01-08 19:05:35.776153	qr
661	16	67	co_mat	2026-01-08 19:05:35.776153	qr
662	16	68	co_mat	2026-01-08 19:05:35.776153	qr
663	16	69	co_mat	2026-01-08 19:05:35.776153	qr
664	16	70	co_mat	2026-01-08 19:05:35.776153	qr
665	16	71	co_mat	2026-01-08 19:05:35.776153	qr
666	16	72	co_mat	2026-01-08 19:05:35.776153	qr
667	16	73	vang	2026-01-08 19:05:35.776153	qr
668	16	74	vang	2026-01-08 19:05:35.776153	qr
669	16	75	co_mat	2026-01-08 19:05:35.776153	qr
670	16	76	vang	2026-01-08 19:05:35.776153	qr
671	16	77	co_mat	2026-01-08 19:05:35.776153	qr
672	16	78	co_mat	2026-01-08 19:05:35.776153	qr
673	16	79	vang	2026-01-08 19:05:35.776153	qr
674	16	80	vang	2026-01-08 19:05:35.776153	qr
675	16	81	co_mat	2026-01-08 19:05:35.776153	qr
676	16	82	co_mat	2026-01-08 19:05:35.776153	qr
677	16	83	co_mat	2026-01-08 19:05:35.776153	qr
678	16	84	co_mat	2026-01-08 19:05:35.776153	qr
679	16	85	co_mat	2026-01-08 19:05:35.776153	qr
680	16	86	vang	2026-01-08 19:05:35.776153	qr
681	16	87	co_mat	2026-01-08 19:05:35.776153	qr
682	16	88	co_mat	2026-01-08 19:05:35.776153	qr
683	16	89	co_mat	2026-01-08 19:05:35.776153	qr
684	16	90	co_mat	2026-01-08 19:05:35.776153	qr
685	16	91	co_mat	2026-01-08 19:05:35.776153	qr
686	16	92	co_mat	2026-01-08 19:05:35.776153	qr
687	16	93	co_mat	2026-01-08 19:05:35.776153	qr
688	16	94	vang	2026-01-08 19:05:35.776153	qr
689	16	95	vang	2026-01-08 19:05:35.776153	qr
690	16	96	co_mat	2026-01-08 19:05:35.776153	qr
691	16	97	co_mat	2026-01-08 19:05:35.776153	qr
692	16	98	co_mat	2026-01-08 19:05:35.776153	qr
693	16	99	co_mat	2026-01-08 19:05:35.776153	qr
694	16	100	co_mat	2026-01-08 19:05:35.776153	qr
695	16	101	co_mat	2026-01-08 19:05:35.776153	qr
696	16	102	co_mat	2026-01-08 19:05:35.776153	qr
697	16	103	vang	2026-01-08 19:05:35.776153	qr
698	16	104	co_mat	2026-01-08 19:05:35.776153	qr
699	16	105	co_mat	2026-01-08 19:05:35.776153	qr
700	16	106	co_mat	2026-01-08 19:05:35.776153	qr
701	16	107	co_mat	2026-01-08 19:05:35.776153	qr
702	16	108	co_mat	2026-01-08 19:05:35.776153	qr
703	16	109	vang	2026-01-08 19:05:35.776153	qr
704	16	110	co_mat	2026-01-08 19:05:35.776153	qr
705	17	67	co_mat	2026-01-08 19:05:35.776153	qr
706	17	68	co_mat	2026-01-08 19:05:35.776153	qr
707	17	69	co_mat	2026-01-08 19:05:35.776153	qr
708	17	70	co_mat	2026-01-08 19:05:35.776153	qr
709	17	71	co_mat	2026-01-08 19:05:35.776153	qr
710	17	72	co_mat	2026-01-08 19:05:35.776153	qr
711	17	73	co_mat	2026-01-08 19:05:35.776153	qr
712	17	74	vang	2026-01-08 19:05:35.776153	qr
713	17	75	co_mat	2026-01-08 19:05:35.776153	qr
714	17	76	co_mat	2026-01-08 19:05:35.776153	qr
715	17	77	co_mat	2026-01-08 19:05:35.776153	qr
716	17	78	co_mat	2026-01-08 19:05:35.776153	qr
717	17	79	vang	2026-01-08 19:05:35.776153	qr
718	17	80	vang	2026-01-08 19:05:35.776153	qr
719	17	81	co_mat	2026-01-08 19:05:35.776153	qr
720	17	82	co_mat	2026-01-08 19:05:35.776153	qr
721	17	83	co_mat	2026-01-08 19:05:35.776153	qr
722	17	84	vang	2026-01-08 19:05:35.776153	qr
723	17	85	co_mat	2026-01-08 19:05:35.776153	qr
724	17	86	vang	2026-01-08 19:05:35.776153	qr
725	17	87	co_mat	2026-01-08 19:05:35.776153	qr
726	17	88	co_mat	2026-01-08 19:05:35.776153	qr
727	17	89	co_mat	2026-01-08 19:05:35.776153	qr
728	17	90	co_mat	2026-01-08 19:05:35.776153	qr
729	17	91	co_mat	2026-01-08 19:05:35.776153	qr
730	17	92	co_mat	2026-01-08 19:05:35.776153	qr
731	17	93	co_mat	2026-01-08 19:05:35.776153	qr
732	17	94	co_mat	2026-01-08 19:05:35.776153	qr
733	17	95	co_mat	2026-01-08 19:05:35.776153	qr
734	17	96	co_mat	2026-01-08 19:05:35.776153	qr
735	17	97	co_mat	2026-01-08 19:05:35.776153	qr
736	17	98	co_mat	2026-01-08 19:05:35.776153	qr
737	17	99	co_mat	2026-01-08 19:05:35.776153	qr
738	17	100	co_mat	2026-01-08 19:05:35.776153	qr
739	17	101	co_mat	2026-01-08 19:05:35.776153	qr
740	17	102	co_mat	2026-01-08 19:05:35.776153	qr
741	17	103	co_mat	2026-01-08 19:05:35.776153	qr
742	17	104	vang	2026-01-08 19:05:35.776153	qr
743	17	105	co_mat	2026-01-08 19:05:35.776153	qr
744	17	106	co_mat	2026-01-08 19:05:35.776153	qr
745	17	107	co_mat	2026-01-08 19:05:35.776153	qr
746	17	108	co_mat	2026-01-08 19:05:35.776153	qr
747	17	109	co_mat	2026-01-08 19:05:35.776153	qr
748	17	110	co_mat	2026-01-08 19:05:35.776153	qr
749	18	67	vang	2026-01-08 19:05:35.776153	qr
750	18	68	co_mat	2026-01-08 19:05:35.776153	qr
751	18	69	co_mat	2026-01-08 19:05:35.776153	qr
752	18	70	co_mat	2026-01-08 19:05:35.776153	qr
753	18	71	co_mat	2026-01-08 19:05:35.776153	qr
754	18	72	co_mat	2026-01-08 19:05:35.776153	qr
755	18	73	co_mat	2026-01-08 19:05:35.776153	qr
756	18	74	co_mat	2026-01-08 19:05:35.776153	qr
757	18	75	co_mat	2026-01-08 19:05:35.776153	qr
758	18	76	co_mat	2026-01-08 19:05:35.776153	qr
759	18	77	co_mat	2026-01-08 19:05:35.776153	qr
760	18	78	co_mat	2026-01-08 19:05:35.776153	qr
761	18	79	co_mat	2026-01-08 19:05:35.776153	qr
762	18	80	co_mat	2026-01-08 19:05:35.776153	qr
763	18	81	vang	2026-01-08 19:05:35.776153	qr
764	18	82	vang	2026-01-08 19:05:35.776153	qr
765	18	83	co_mat	2026-01-08 19:05:35.776153	qr
766	18	84	co_mat	2026-01-08 19:05:35.776153	qr
767	18	85	co_mat	2026-01-08 19:05:35.776153	qr
768	18	86	vang	2026-01-08 19:05:35.776153	qr
769	18	87	co_mat	2026-01-08 19:05:35.776153	qr
770	18	88	co_mat	2026-01-08 19:05:35.776153	qr
771	18	89	co_mat	2026-01-08 19:05:35.776153	qr
772	18	90	vang	2026-01-08 19:05:35.776153	qr
773	18	91	vang	2026-01-08 19:05:35.776153	qr
774	18	92	co_mat	2026-01-08 19:05:35.776153	qr
775	18	93	co_mat	2026-01-08 19:05:35.776153	qr
776	18	94	co_mat	2026-01-08 19:05:35.776153	qr
777	18	95	co_mat	2026-01-08 19:05:35.776153	qr
778	18	96	co_mat	2026-01-08 19:05:35.776153	qr
779	18	97	co_mat	2026-01-08 19:05:35.776153	qr
780	18	98	co_mat	2026-01-08 19:05:35.776153	qr
781	18	99	co_mat	2026-01-08 19:05:35.776153	qr
782	18	100	co_mat	2026-01-08 19:05:35.776153	qr
783	18	101	co_mat	2026-01-08 19:05:35.776153	qr
784	18	102	co_mat	2026-01-08 19:05:35.776153	qr
785	18	103	vang	2026-01-08 19:05:35.776153	qr
786	18	104	co_mat	2026-01-08 19:05:35.776153	qr
787	18	105	co_mat	2026-01-08 19:05:35.776153	qr
788	18	106	co_mat	2026-01-08 19:05:35.776153	qr
789	18	107	co_mat	2026-01-08 19:05:35.776153	qr
790	18	108	co_mat	2026-01-08 19:05:35.776153	qr
791	18	109	co_mat	2026-01-08 19:05:35.776153	qr
792	18	110	co_mat	2026-01-08 19:05:35.776153	qr
793	19	67	co_mat	2026-01-08 19:05:35.776153	qr
794	19	68	vang	2026-01-08 19:05:35.776153	qr
795	19	69	co_mat	2026-01-08 19:05:35.776153	qr
796	19	70	co_mat	2026-01-08 19:05:35.776153	qr
797	19	71	co_mat	2026-01-08 19:05:35.776153	qr
798	19	72	co_mat	2026-01-08 19:05:35.776153	qr
799	19	73	vang	2026-01-08 19:05:35.776153	qr
800	19	74	co_mat	2026-01-08 19:05:35.776153	qr
801	19	75	co_mat	2026-01-08 19:05:35.776153	qr
802	19	76	co_mat	2026-01-08 19:05:35.776153	qr
803	19	77	co_mat	2026-01-08 19:05:35.776153	qr
804	19	78	co_mat	2026-01-08 19:05:35.776153	qr
805	19	79	co_mat	2026-01-08 19:05:35.776153	qr
806	19	80	co_mat	2026-01-08 19:05:35.776153	qr
807	19	81	co_mat	2026-01-08 19:05:35.776153	qr
808	19	82	co_mat	2026-01-08 19:05:35.776153	qr
809	19	83	co_mat	2026-01-08 19:05:35.776153	qr
810	19	84	co_mat	2026-01-08 19:05:35.776153	qr
811	19	85	co_mat	2026-01-08 19:05:35.776153	qr
812	19	86	co_mat	2026-01-08 19:05:35.776153	qr
813	19	87	vang	2026-01-08 19:05:35.776153	qr
814	19	88	vang	2026-01-08 19:05:35.776153	qr
815	19	89	co_mat	2026-01-08 19:05:35.776153	qr
816	19	90	co_mat	2026-01-08 19:05:35.776153	qr
817	19	91	co_mat	2026-01-08 19:05:35.776153	qr
818	19	92	co_mat	2026-01-08 19:05:35.776153	qr
819	19	93	co_mat	2026-01-08 19:05:35.776153	qr
820	19	94	co_mat	2026-01-08 19:05:35.776153	qr
821	19	95	vang	2026-01-08 19:05:35.776153	qr
822	19	96	co_mat	2026-01-08 19:05:35.776153	qr
823	19	97	co_mat	2026-01-08 19:05:35.776153	qr
824	19	98	co_mat	2026-01-08 19:05:35.776153	qr
825	19	99	co_mat	2026-01-08 19:05:35.776153	qr
826	19	100	co_mat	2026-01-08 19:05:35.776153	qr
827	19	101	co_mat	2026-01-08 19:05:35.776153	qr
828	19	102	co_mat	2026-01-08 19:05:35.776153	qr
829	19	103	co_mat	2026-01-08 19:05:35.776153	qr
830	19	104	co_mat	2026-01-08 19:05:35.776153	qr
831	19	105	co_mat	2026-01-08 19:05:35.776153	qr
832	19	106	co_mat	2026-01-08 19:05:35.776153	qr
833	19	107	co_mat	2026-01-08 19:05:35.776153	qr
834	19	108	co_mat	2026-01-08 19:05:35.776153	qr
835	19	109	vang	2026-01-08 19:05:35.776153	qr
836	19	110	co_mat	2026-01-08 19:05:35.776153	qr
837	20	67	co_mat	2026-01-08 19:05:35.776153	qr
838	20	68	co_mat	2026-01-08 19:05:35.776153	qr
839	20	69	co_mat	2026-01-08 19:05:35.776153	qr
840	20	70	co_mat	2026-01-08 19:05:35.776153	qr
841	20	71	co_mat	2026-01-08 19:05:35.776153	qr
842	20	72	co_mat	2026-01-08 19:05:35.776153	qr
843	20	73	co_mat	2026-01-08 19:05:35.776153	qr
844	20	74	co_mat	2026-01-08 19:05:35.776153	qr
845	20	75	co_mat	2026-01-08 19:05:35.776153	qr
846	20	76	co_mat	2026-01-08 19:05:35.776153	qr
847	20	77	co_mat	2026-01-08 19:05:35.776153	qr
848	20	78	co_mat	2026-01-08 19:05:35.776153	qr
849	20	79	co_mat	2026-01-08 19:05:35.776153	qr
850	20	80	co_mat	2026-01-08 19:05:35.776153	qr
851	20	81	co_mat	2026-01-08 19:05:35.776153	qr
852	20	82	co_mat	2026-01-08 19:05:35.776153	qr
853	20	83	co_mat	2026-01-08 19:05:35.776153	qr
854	20	84	co_mat	2026-01-08 19:05:35.776153	qr
855	20	85	co_mat	2026-01-08 19:05:35.776153	qr
856	20	86	co_mat	2026-01-08 19:05:35.776153	qr
857	20	87	co_mat	2026-01-08 19:05:35.776153	qr
858	20	88	vang	2026-01-08 19:05:35.776153	qr
859	20	89	co_mat	2026-01-08 19:05:35.776153	qr
860	20	90	co_mat	2026-01-08 19:05:35.776153	qr
861	20	91	vang	2026-01-08 19:05:35.776153	qr
862	20	92	co_mat	2026-01-08 19:05:35.776153	qr
863	20	93	vang	2026-01-08 19:05:35.776153	qr
864	20	94	co_mat	2026-01-08 19:05:35.776153	qr
865	20	95	co_mat	2026-01-08 19:05:35.776153	qr
866	20	96	co_mat	2026-01-08 19:05:35.776153	qr
867	20	97	co_mat	2026-01-08 19:05:35.776153	qr
868	20	98	co_mat	2026-01-08 19:05:35.776153	qr
869	20	99	vang	2026-01-08 19:05:35.776153	qr
870	20	100	co_mat	2026-01-08 19:05:35.776153	qr
871	20	101	co_mat	2026-01-08 19:05:35.776153	qr
872	20	102	co_mat	2026-01-08 19:05:35.776153	qr
873	20	103	co_mat	2026-01-08 19:05:35.776153	qr
874	20	104	co_mat	2026-01-08 19:05:35.776153	qr
875	20	105	co_mat	2026-01-08 19:05:35.776153	qr
876	20	106	co_mat	2026-01-08 19:05:35.776153	qr
877	20	107	co_mat	2026-01-08 19:05:35.776153	qr
878	20	108	co_mat	2026-01-08 19:05:35.776153	qr
879	20	109	vang	2026-01-08 19:05:35.776153	qr
880	20	110	co_mat	2026-01-08 19:05:35.776153	qr
881	21	67	co_mat	2026-01-08 19:05:35.776153	qr
882	21	68	co_mat	2026-01-08 19:05:35.776153	qr
883	21	69	co_mat	2026-01-08 19:05:35.776153	qr
884	21	70	co_mat	2026-01-08 19:05:35.776153	qr
885	21	71	co_mat	2026-01-08 19:05:35.776153	qr
886	21	72	co_mat	2026-01-08 19:05:35.776153	qr
887	21	73	co_mat	2026-01-08 19:05:35.776153	qr
888	21	74	co_mat	2026-01-08 19:05:35.776153	qr
889	21	75	co_mat	2026-01-08 19:05:35.776153	qr
890	21	76	co_mat	2026-01-08 19:05:35.776153	qr
891	21	77	co_mat	2026-01-08 19:05:35.776153	qr
892	21	78	co_mat	2026-01-08 19:05:35.776153	qr
893	21	79	co_mat	2026-01-08 19:05:35.776153	qr
894	21	80	co_mat	2026-01-08 19:05:35.776153	qr
895	21	81	co_mat	2026-01-08 19:05:35.776153	qr
896	21	82	vang	2026-01-08 19:05:35.776153	qr
897	21	83	co_mat	2026-01-08 19:05:35.776153	qr
898	21	84	co_mat	2026-01-08 19:05:35.776153	qr
899	21	85	co_mat	2026-01-08 19:05:35.776153	qr
900	21	86	co_mat	2026-01-08 19:05:35.776153	qr
901	21	87	co_mat	2026-01-08 19:05:35.776153	qr
902	21	88	co_mat	2026-01-08 19:05:35.776153	qr
903	21	89	co_mat	2026-01-08 19:05:35.776153	qr
904	21	90	co_mat	2026-01-08 19:05:35.776153	qr
905	21	91	co_mat	2026-01-08 19:05:35.776153	qr
906	21	92	vang	2026-01-08 19:05:35.776153	qr
907	21	93	co_mat	2026-01-08 19:05:35.776153	qr
908	21	94	co_mat	2026-01-08 19:05:35.776153	qr
909	21	95	co_mat	2026-01-08 19:05:35.776153	qr
910	21	96	vang	2026-01-08 19:05:35.776153	qr
911	21	97	co_mat	2026-01-08 19:05:35.776153	qr
912	21	98	co_mat	2026-01-08 19:05:35.776153	qr
913	21	99	co_mat	2026-01-08 19:05:35.776153	qr
914	21	100	vang	2026-01-08 19:05:35.776153	qr
915	21	101	co_mat	2026-01-08 19:05:35.776153	qr
916	21	102	co_mat	2026-01-08 19:05:35.776153	qr
917	21	103	vang	2026-01-08 19:05:35.776153	qr
918	21	104	co_mat	2026-01-08 19:05:35.776153	qr
919	21	105	co_mat	2026-01-08 19:05:35.776153	qr
920	21	106	vang	2026-01-08 19:05:35.776153	qr
921	21	107	vang	2026-01-08 19:05:35.776153	qr
922	21	108	co_mat	2026-01-08 19:05:35.776153	qr
923	21	109	co_mat	2026-01-08 19:05:35.776153	qr
924	21	110	co_mat	2026-01-08 19:05:35.776153	qr
925	22	67	co_mat	2026-01-08 19:05:35.776153	qr
926	22	68	co_mat	2026-01-08 19:05:35.776153	qr
927	22	69	vang	2026-01-08 19:05:35.776153	qr
928	22	70	co_mat	2026-01-08 19:05:35.776153	qr
929	22	71	co_mat	2026-01-08 19:05:35.776153	qr
930	22	72	co_mat	2026-01-08 19:05:35.776153	qr
931	22	73	co_mat	2026-01-08 19:05:35.776153	qr
932	22	74	co_mat	2026-01-08 19:05:35.776153	qr
933	22	75	co_mat	2026-01-08 19:05:35.776153	qr
934	22	76	co_mat	2026-01-08 19:05:35.776153	qr
935	22	77	vang	2026-01-08 19:05:35.776153	qr
936	22	78	co_mat	2026-01-08 19:05:35.776153	qr
937	22	79	co_mat	2026-01-08 19:05:35.776153	qr
938	22	80	co_mat	2026-01-08 19:05:35.776153	qr
939	22	81	co_mat	2026-01-08 19:05:35.776153	qr
940	22	82	vang	2026-01-08 19:05:35.776153	qr
941	22	83	co_mat	2026-01-08 19:05:35.776153	qr
942	22	84	co_mat	2026-01-08 19:05:35.776153	qr
943	22	85	co_mat	2026-01-08 19:05:35.776153	qr
944	22	86	co_mat	2026-01-08 19:05:35.776153	qr
945	22	87	co_mat	2026-01-08 19:05:35.776153	qr
946	22	88	co_mat	2026-01-08 19:05:35.776153	qr
947	22	89	co_mat	2026-01-08 19:05:35.776153	qr
948	22	90	co_mat	2026-01-08 19:05:35.776153	qr
949	22	91	co_mat	2026-01-08 19:05:35.776153	qr
950	22	92	co_mat	2026-01-08 19:05:35.776153	qr
951	22	93	co_mat	2026-01-08 19:05:35.776153	qr
952	22	94	co_mat	2026-01-08 19:05:35.776153	qr
953	22	95	vang	2026-01-08 19:05:35.776153	qr
954	22	96	co_mat	2026-01-08 19:05:35.776153	qr
955	22	97	co_mat	2026-01-08 19:05:35.776153	qr
956	22	98	co_mat	2026-01-08 19:05:35.776153	qr
957	22	99	co_mat	2026-01-08 19:05:35.776153	qr
958	22	100	co_mat	2026-01-08 19:05:35.776153	qr
959	22	101	co_mat	2026-01-08 19:05:35.776153	qr
960	22	102	co_mat	2026-01-08 19:05:35.776153	qr
961	22	103	vang	2026-01-08 19:05:35.776153	qr
962	22	104	co_mat	2026-01-08 19:05:35.776153	qr
963	22	105	co_mat	2026-01-08 19:05:35.776153	qr
964	22	106	co_mat	2026-01-08 19:05:35.776153	qr
965	22	107	co_mat	2026-01-08 19:05:35.776153	qr
966	22	108	vang	2026-01-08 19:05:35.776153	qr
967	22	109	co_mat	2026-01-08 19:05:35.776153	qr
968	22	110	co_mat	2026-01-08 19:05:35.776153	qr
969	23	67	co_mat	2026-01-08 19:05:35.776153	qr
970	23	68	vang	2026-01-08 19:05:35.776153	qr
971	23	69	co_mat	2026-01-08 19:05:35.776153	qr
972	23	70	co_mat	2026-01-08 19:05:35.776153	qr
973	23	71	co_mat	2026-01-08 19:05:35.776153	qr
974	23	72	co_mat	2026-01-08 19:05:35.776153	qr
975	23	73	co_mat	2026-01-08 19:05:35.776153	qr
976	23	74	co_mat	2026-01-08 19:05:35.776153	qr
977	23	75	co_mat	2026-01-08 19:05:35.776153	qr
978	23	76	vang	2026-01-08 19:05:35.776153	qr
979	23	77	co_mat	2026-01-08 19:05:35.776153	qr
980	23	78	co_mat	2026-01-08 19:05:35.776153	qr
981	23	79	co_mat	2026-01-08 19:05:35.776153	qr
982	23	80	co_mat	2026-01-08 19:05:35.776153	qr
983	23	81	co_mat	2026-01-08 19:05:35.776153	qr
984	23	82	co_mat	2026-01-08 19:05:35.776153	qr
985	23	83	co_mat	2026-01-08 19:05:35.776153	qr
986	23	84	co_mat	2026-01-08 19:05:35.776153	qr
987	23	85	co_mat	2026-01-08 19:05:35.776153	qr
988	23	86	vang	2026-01-08 19:05:35.776153	qr
989	23	87	vang	2026-01-08 19:05:35.776153	qr
990	23	88	co_mat	2026-01-08 19:05:35.776153	qr
991	23	89	co_mat	2026-01-08 19:05:35.776153	qr
992	23	90	vang	2026-01-08 19:05:35.776153	qr
993	23	91	co_mat	2026-01-08 19:05:35.776153	qr
994	23	92	co_mat	2026-01-08 19:05:35.776153	qr
995	23	93	co_mat	2026-01-08 19:05:35.776153	qr
996	23	94	co_mat	2026-01-08 19:05:35.776153	qr
997	23	95	co_mat	2026-01-08 19:05:35.776153	qr
998	23	96	co_mat	2026-01-08 19:05:35.776153	qr
999	23	97	co_mat	2026-01-08 19:05:35.776153	qr
1000	23	98	co_mat	2026-01-08 19:05:35.776153	qr
1001	23	99	co_mat	2026-01-08 19:05:35.776153	qr
1002	23	100	co_mat	2026-01-08 19:05:35.776153	qr
1003	23	101	co_mat	2026-01-08 19:05:35.776153	qr
1004	23	102	co_mat	2026-01-08 19:05:35.776153	qr
1005	23	103	co_mat	2026-01-08 19:05:35.776153	qr
1006	23	104	co_mat	2026-01-08 19:05:35.776153	qr
1007	23	105	co_mat	2026-01-08 19:05:35.776153	qr
1008	23	106	co_mat	2026-01-08 19:05:35.776153	qr
1009	23	107	co_mat	2026-01-08 19:05:35.776153	qr
1010	23	108	co_mat	2026-01-08 19:05:35.776153	qr
1011	23	109	co_mat	2026-01-08 19:05:35.776153	qr
1012	23	110	co_mat	2026-01-08 19:05:35.776153	qr
1013	24	67	vang	2026-01-08 19:05:35.776153	qr
1014	24	68	co_mat	2026-01-08 19:05:35.776153	qr
1015	24	69	vang	2026-01-08 19:05:35.776153	qr
1016	24	70	co_mat	2026-01-08 19:05:35.776153	qr
1017	24	71	co_mat	2026-01-08 19:05:35.776153	qr
1018	24	72	co_mat	2026-01-08 19:05:35.776153	qr
1019	24	73	co_mat	2026-01-08 19:05:35.776153	qr
1020	24	74	co_mat	2026-01-08 19:05:35.776153	qr
1021	24	75	co_mat	2026-01-08 19:05:35.776153	qr
1022	24	76	co_mat	2026-01-08 19:05:35.776153	qr
1023	24	77	vang	2026-01-08 19:05:35.776153	qr
1024	24	78	vang	2026-01-08 19:05:35.776153	qr
1025	24	79	vang	2026-01-08 19:05:35.776153	qr
1026	24	80	co_mat	2026-01-08 19:05:35.776153	qr
1027	24	81	co_mat	2026-01-08 19:05:35.776153	qr
1028	24	82	co_mat	2026-01-08 19:05:35.776153	qr
1029	24	83	co_mat	2026-01-08 19:05:35.776153	qr
1030	24	84	vang	2026-01-08 19:05:35.776153	qr
1031	24	85	co_mat	2026-01-08 19:05:35.776153	qr
1032	24	86	co_mat	2026-01-08 19:05:35.776153	qr
1033	24	87	co_mat	2026-01-08 19:05:35.776153	qr
1034	24	88	co_mat	2026-01-08 19:05:35.776153	qr
1035	24	89	co_mat	2026-01-08 19:05:35.776153	qr
1036	24	90	vang	2026-01-08 19:05:35.776153	qr
1037	24	91	co_mat	2026-01-08 19:05:35.776153	qr
1038	24	92	co_mat	2026-01-08 19:05:35.776153	qr
1039	24	93	co_mat	2026-01-08 19:05:35.776153	qr
1040	24	94	co_mat	2026-01-08 19:05:35.776153	qr
1041	24	95	vang	2026-01-08 19:05:35.776153	qr
1042	24	96	co_mat	2026-01-08 19:05:35.776153	qr
1043	24	97	vang	2026-01-08 19:05:35.776153	qr
1044	24	98	co_mat	2026-01-08 19:05:35.776153	qr
1045	24	99	co_mat	2026-01-08 19:05:35.776153	qr
1046	24	100	co_mat	2026-01-08 19:05:35.776153	qr
1047	24	101	co_mat	2026-01-08 19:05:35.776153	qr
1048	24	102	co_mat	2026-01-08 19:05:35.776153	qr
1049	24	103	co_mat	2026-01-08 19:05:35.776153	qr
1050	24	104	vang	2026-01-08 19:05:35.776153	qr
1051	24	105	co_mat	2026-01-08 19:05:35.776153	qr
1052	24	106	co_mat	2026-01-08 19:05:35.776153	qr
1053	24	107	vang	2026-01-08 19:05:35.776153	qr
1054	24	108	co_mat	2026-01-08 19:05:35.776153	qr
1055	24	109	co_mat	2026-01-08 19:05:35.776153	qr
1056	24	110	co_mat	2026-01-08 19:05:35.776153	qr
1057	25	67	co_mat	2026-01-08 19:05:35.776153	qr
1058	25	68	vang	2026-01-08 19:05:35.776153	qr
1059	25	69	co_mat	2026-01-08 19:05:35.776153	qr
1060	25	70	co_mat	2026-01-08 19:05:35.776153	qr
1061	25	71	vang	2026-01-08 19:05:35.776153	qr
1062	25	72	vang	2026-01-08 19:05:35.776153	qr
1063	25	73	co_mat	2026-01-08 19:05:35.776153	qr
1064	25	74	vang	2026-01-08 19:05:35.776153	qr
1065	25	75	co_mat	2026-01-08 19:05:35.776153	qr
1066	25	76	co_mat	2026-01-08 19:05:35.776153	qr
1067	25	77	co_mat	2026-01-08 19:05:35.776153	qr
1068	25	78	co_mat	2026-01-08 19:05:35.776153	qr
1069	25	79	co_mat	2026-01-08 19:05:35.776153	qr
1070	25	80	co_mat	2026-01-08 19:05:35.776153	qr
1071	25	81	vang	2026-01-08 19:05:35.776153	qr
1072	25	82	co_mat	2026-01-08 19:05:35.776153	qr
1073	25	83	co_mat	2026-01-08 19:05:35.776153	qr
1074	25	84	co_mat	2026-01-08 19:05:35.776153	qr
1075	25	85	co_mat	2026-01-08 19:05:35.776153	qr
1076	25	86	co_mat	2026-01-08 19:05:35.776153	qr
1077	25	87	co_mat	2026-01-08 19:05:35.776153	qr
1078	25	88	vang	2026-01-08 19:05:35.776153	qr
1079	25	89	co_mat	2026-01-08 19:05:35.776153	qr
1080	25	90	co_mat	2026-01-08 19:05:35.776153	qr
1081	25	91	co_mat	2026-01-08 19:05:35.776153	qr
1082	25	92	co_mat	2026-01-08 19:05:35.776153	qr
1083	25	93	co_mat	2026-01-08 19:05:35.776153	qr
1084	25	94	vang	2026-01-08 19:05:35.776153	qr
1085	25	95	co_mat	2026-01-08 19:05:35.776153	qr
1086	25	96	co_mat	2026-01-08 19:05:35.776153	qr
1087	25	97	co_mat	2026-01-08 19:05:35.776153	qr
1088	25	98	co_mat	2026-01-08 19:05:35.776153	qr
1089	25	99	co_mat	2026-01-08 19:05:35.776153	qr
1090	25	100	co_mat	2026-01-08 19:05:35.776153	qr
1091	25	101	co_mat	2026-01-08 19:05:35.776153	qr
1092	25	102	co_mat	2026-01-08 19:05:35.776153	qr
1093	25	103	co_mat	2026-01-08 19:05:35.776153	qr
1094	25	104	co_mat	2026-01-08 19:05:35.776153	qr
1095	25	105	co_mat	2026-01-08 19:05:35.776153	qr
1096	25	106	co_mat	2026-01-08 19:05:35.776153	qr
1097	25	107	co_mat	2026-01-08 19:05:35.776153	qr
1098	25	108	co_mat	2026-01-08 19:05:35.776153	qr
1099	25	109	co_mat	2026-01-08 19:05:35.776153	qr
1100	25	110	co_mat	2026-01-08 19:05:35.776153	qr
1101	26	67	co_mat	2026-01-08 19:05:35.776153	qr
1102	26	68	co_mat	2026-01-08 19:05:35.776153	qr
1103	26	69	co_mat	2026-01-08 19:05:35.776153	qr
1104	26	70	co_mat	2026-01-08 19:05:35.776153	qr
1105	26	71	vang	2026-01-08 19:05:35.776153	qr
1106	26	72	co_mat	2026-01-08 19:05:35.776153	qr
1107	26	73	vang	2026-01-08 19:05:35.776153	qr
1108	26	74	co_mat	2026-01-08 19:05:35.776153	qr
1109	26	75	vang	2026-01-08 19:05:35.776153	qr
1110	26	76	co_mat	2026-01-08 19:05:35.776153	qr
1111	26	77	co_mat	2026-01-08 19:05:35.776153	qr
1112	26	78	co_mat	2026-01-08 19:05:35.776153	qr
1113	26	79	vang	2026-01-08 19:05:35.776153	qr
1114	26	80	co_mat	2026-01-08 19:05:35.776153	qr
1115	26	81	co_mat	2026-01-08 19:05:35.776153	qr
1116	26	82	co_mat	2026-01-08 19:05:35.776153	qr
1117	26	83	co_mat	2026-01-08 19:05:35.776153	qr
1118	26	84	vang	2026-01-08 19:05:35.776153	qr
1119	26	85	co_mat	2026-01-08 19:05:35.776153	qr
1120	26	86	co_mat	2026-01-08 19:05:35.776153	qr
1121	26	87	co_mat	2026-01-08 19:05:35.776153	qr
1122	26	88	co_mat	2026-01-08 19:05:35.776153	qr
1123	26	89	co_mat	2026-01-08 19:05:35.776153	qr
1124	26	90	vang	2026-01-08 19:05:35.776153	qr
1125	26	91	co_mat	2026-01-08 19:05:35.776153	qr
1126	26	92	co_mat	2026-01-08 19:05:35.776153	qr
1127	26	93	vang	2026-01-08 19:05:35.776153	qr
1128	26	94	co_mat	2026-01-08 19:05:35.776153	qr
1129	26	95	co_mat	2026-01-08 19:05:35.776153	qr
1130	26	96	vang	2026-01-08 19:05:35.776153	qr
1131	26	97	co_mat	2026-01-08 19:05:35.776153	qr
1132	26	98	vang	2026-01-08 19:05:35.776153	qr
1133	26	99	co_mat	2026-01-08 19:05:35.776153	qr
1134	26	100	co_mat	2026-01-08 19:05:35.776153	qr
1135	26	101	co_mat	2026-01-08 19:05:35.776153	qr
1136	26	102	vang	2026-01-08 19:05:35.776153	qr
1137	26	103	co_mat	2026-01-08 19:05:35.776153	qr
1138	26	104	co_mat	2026-01-08 19:05:35.776153	qr
1139	26	105	co_mat	2026-01-08 19:05:35.776153	qr
1140	26	106	co_mat	2026-01-08 19:05:35.776153	qr
1141	26	107	co_mat	2026-01-08 19:05:35.776153	qr
1142	26	108	vang	2026-01-08 19:05:35.776153	qr
1143	26	109	co_mat	2026-01-08 19:05:35.776153	qr
1144	26	110	co_mat	2026-01-08 19:05:35.776153	qr
1145	27	67	co_mat	2026-01-08 19:05:35.776153	qr
1146	27	68	co_mat	2026-01-08 19:05:35.776153	qr
1147	27	69	co_mat	2026-01-08 19:05:35.776153	qr
1148	27	70	vang	2026-01-08 19:05:35.776153	qr
1149	27	71	co_mat	2026-01-08 19:05:35.776153	qr
1150	27	72	co_mat	2026-01-08 19:05:35.776153	qr
1151	27	73	co_mat	2026-01-08 19:05:35.776153	qr
1152	27	74	co_mat	2026-01-08 19:05:35.776153	qr
1153	27	75	co_mat	2026-01-08 19:05:35.776153	qr
1154	27	76	co_mat	2026-01-08 19:05:35.776153	qr
1155	27	77	co_mat	2026-01-08 19:05:35.776153	qr
1156	27	78	vang	2026-01-08 19:05:35.776153	qr
1157	27	79	co_mat	2026-01-08 19:05:35.776153	qr
1158	27	80	co_mat	2026-01-08 19:05:35.776153	qr
1159	27	81	co_mat	2026-01-08 19:05:35.776153	qr
1160	27	82	co_mat	2026-01-08 19:05:35.776153	qr
1161	27	83	co_mat	2026-01-08 19:05:35.776153	qr
1162	27	84	co_mat	2026-01-08 19:05:35.776153	qr
1163	27	85	co_mat	2026-01-08 19:05:35.776153	qr
1164	27	86	co_mat	2026-01-08 19:05:35.776153	qr
1165	27	87	co_mat	2026-01-08 19:05:35.776153	qr
1166	27	88	co_mat	2026-01-08 19:05:35.776153	qr
1167	27	89	co_mat	2026-01-08 19:05:35.776153	qr
1168	27	90	co_mat	2026-01-08 19:05:35.776153	qr
1169	27	91	co_mat	2026-01-08 19:05:35.776153	qr
1170	27	92	co_mat	2026-01-08 19:05:35.776153	qr
1171	27	93	co_mat	2026-01-08 19:05:35.776153	qr
1172	27	94	co_mat	2026-01-08 19:05:35.776153	qr
1173	27	95	vang	2026-01-08 19:05:35.776153	qr
1174	27	96	co_mat	2026-01-08 19:05:35.776153	qr
1175	27	97	co_mat	2026-01-08 19:05:35.776153	qr
1176	27	98	co_mat	2026-01-08 19:05:35.776153	qr
1177	27	99	co_mat	2026-01-08 19:05:35.776153	qr
1178	27	100	co_mat	2026-01-08 19:05:35.776153	qr
1179	27	101	co_mat	2026-01-08 19:05:35.776153	qr
1180	27	102	co_mat	2026-01-08 19:05:35.776153	qr
1181	27	103	co_mat	2026-01-08 19:05:35.776153	qr
1182	27	104	co_mat	2026-01-08 19:05:35.776153	qr
1183	27	105	co_mat	2026-01-08 19:05:35.776153	qr
1184	27	106	co_mat	2026-01-08 19:05:35.776153	qr
1185	27	107	vang	2026-01-08 19:05:35.776153	qr
1186	27	108	co_mat	2026-01-08 19:05:35.776153	qr
1187	27	109	co_mat	2026-01-08 19:05:35.776153	qr
1188	27	110	vang	2026-01-08 19:05:35.776153	qr
1189	28	67	vang	2026-01-08 19:05:35.776153	qr
1190	28	68	vang	2026-01-08 19:05:35.776153	qr
1191	28	69	co_mat	2026-01-08 19:05:35.776153	qr
1192	28	70	vang	2026-01-08 19:05:35.776153	qr
1193	28	71	co_mat	2026-01-08 19:05:35.776153	qr
1194	28	72	co_mat	2026-01-08 19:05:35.776153	qr
1195	28	73	co_mat	2026-01-08 19:05:35.776153	qr
1196	28	74	co_mat	2026-01-08 19:05:35.776153	qr
1197	28	75	co_mat	2026-01-08 19:05:35.776153	qr
1198	28	76	co_mat	2026-01-08 19:05:35.776153	qr
1199	28	77	co_mat	2026-01-08 19:05:35.776153	qr
1200	28	78	co_mat	2026-01-08 19:05:35.776153	qr
1201	28	79	co_mat	2026-01-08 19:05:35.776153	qr
1202	28	80	co_mat	2026-01-08 19:05:35.776153	qr
1203	28	81	vang	2026-01-08 19:05:35.776153	qr
1204	28	82	co_mat	2026-01-08 19:05:35.776153	qr
1205	28	83	co_mat	2026-01-08 19:05:35.776153	qr
1206	28	84	co_mat	2026-01-08 19:05:35.776153	qr
1207	28	85	vang	2026-01-08 19:05:35.776153	qr
1208	28	86	co_mat	2026-01-08 19:05:35.776153	qr
1209	28	87	co_mat	2026-01-08 19:05:35.776153	qr
1210	28	88	vang	2026-01-08 19:05:35.776153	qr
1211	28	89	co_mat	2026-01-08 19:05:35.776153	qr
1212	28	90	co_mat	2026-01-08 19:05:35.776153	qr
1213	28	91	co_mat	2026-01-08 19:05:35.776153	qr
1214	28	92	co_mat	2026-01-08 19:05:35.776153	qr
1215	28	93	co_mat	2026-01-08 19:05:35.776153	qr
1216	28	94	co_mat	2026-01-08 19:05:35.776153	qr
1217	28	95	co_mat	2026-01-08 19:05:35.776153	qr
1218	28	96	co_mat	2026-01-08 19:05:35.776153	qr
1219	28	97	co_mat	2026-01-08 19:05:35.776153	qr
1220	28	98	vang	2026-01-08 19:05:35.776153	qr
1221	28	99	vang	2026-01-08 19:05:35.776153	qr
1222	28	100	co_mat	2026-01-08 19:05:35.776153	qr
1223	28	101	co_mat	2026-01-08 19:05:35.776153	qr
1224	28	102	co_mat	2026-01-08 19:05:35.776153	qr
1225	28	103	co_mat	2026-01-08 19:05:35.776153	qr
1226	28	104	co_mat	2026-01-08 19:05:35.776153	qr
1227	28	105	co_mat	2026-01-08 19:05:35.776153	qr
1228	28	106	co_mat	2026-01-08 19:05:35.776153	qr
1229	28	107	co_mat	2026-01-08 19:05:35.776153	qr
1230	28	108	co_mat	2026-01-08 19:05:35.776153	qr
1231	28	109	co_mat	2026-01-08 19:05:35.776153	qr
1232	28	110	co_mat	2026-01-08 19:05:35.776153	qr
1233	29	67	co_mat	2026-01-08 19:05:35.776153	qr
1234	29	68	vang	2026-01-08 19:05:35.776153	qr
1235	29	69	co_mat	2026-01-08 19:05:35.776153	qr
1236	29	70	co_mat	2026-01-08 19:05:35.776153	qr
1237	29	71	co_mat	2026-01-08 19:05:35.776153	qr
1238	29	72	co_mat	2026-01-08 19:05:35.776153	qr
1239	29	73	co_mat	2026-01-08 19:05:35.776153	qr
1240	29	74	co_mat	2026-01-08 19:05:35.776153	qr
1241	29	75	co_mat	2026-01-08 19:05:35.776153	qr
1242	29	76	co_mat	2026-01-08 19:05:35.776153	qr
1243	29	77	co_mat	2026-01-08 19:05:35.776153	qr
1244	29	78	co_mat	2026-01-08 19:05:35.776153	qr
1245	29	79	co_mat	2026-01-08 19:05:35.776153	qr
1246	29	80	co_mat	2026-01-08 19:05:35.776153	qr
1247	29	81	co_mat	2026-01-08 19:05:35.776153	qr
1248	29	82	co_mat	2026-01-08 19:05:35.776153	qr
1249	29	83	co_mat	2026-01-08 19:05:35.776153	qr
1250	29	84	vang	2026-01-08 19:05:35.776153	qr
1251	29	85	co_mat	2026-01-08 19:05:35.776153	qr
1252	29	86	vang	2026-01-08 19:05:35.776153	qr
1253	29	87	co_mat	2026-01-08 19:05:35.776153	qr
1254	29	88	co_mat	2026-01-08 19:05:35.776153	qr
1255	29	89	co_mat	2026-01-08 19:05:35.776153	qr
1256	29	90	vang	2026-01-08 19:05:35.776153	qr
1257	29	91	co_mat	2026-01-08 19:05:35.776153	qr
1258	29	92	co_mat	2026-01-08 19:05:35.776153	qr
1259	29	93	co_mat	2026-01-08 19:05:35.776153	qr
1260	29	94	co_mat	2026-01-08 19:05:35.776153	qr
1261	29	95	co_mat	2026-01-08 19:05:35.776153	qr
1262	29	96	vang	2026-01-08 19:05:35.776153	qr
1263	29	97	co_mat	2026-01-08 19:05:35.776153	qr
1264	29	98	co_mat	2026-01-08 19:05:35.776153	qr
1265	29	99	co_mat	2026-01-08 19:05:35.776153	qr
1266	29	100	co_mat	2026-01-08 19:05:35.776153	qr
1267	29	101	co_mat	2026-01-08 19:05:35.776153	qr
1268	29	102	co_mat	2026-01-08 19:05:35.776153	qr
1269	29	103	co_mat	2026-01-08 19:05:35.776153	qr
1270	29	104	co_mat	2026-01-08 19:05:35.776153	qr
1271	29	105	co_mat	2026-01-08 19:05:35.776153	qr
1272	29	106	co_mat	2026-01-08 19:05:35.776153	qr
1273	29	107	co_mat	2026-01-08 19:05:35.776153	qr
1274	29	108	co_mat	2026-01-08 19:05:35.776153	qr
1275	29	109	co_mat	2026-01-08 19:05:35.776153	qr
1276	29	110	co_mat	2026-01-08 19:05:35.776153	qr
1277	30	67	co_mat	2026-01-08 19:05:35.776153	qr
1278	30	68	co_mat	2026-01-08 19:05:35.776153	qr
1279	30	69	co_mat	2026-01-08 19:05:35.776153	qr
1280	30	70	co_mat	2026-01-08 19:05:35.776153	qr
1281	30	71	vang	2026-01-08 19:05:35.776153	qr
1282	30	72	co_mat	2026-01-08 19:05:35.776153	qr
1283	30	73	co_mat	2026-01-08 19:05:35.776153	qr
1284	30	74	co_mat	2026-01-08 19:05:35.776153	qr
1285	30	75	co_mat	2026-01-08 19:05:35.776153	qr
1286	30	76	co_mat	2026-01-08 19:05:35.776153	qr
1287	30	77	co_mat	2026-01-08 19:05:35.776153	qr
1288	30	78	co_mat	2026-01-08 19:05:35.776153	qr
1289	30	79	co_mat	2026-01-08 19:05:35.776153	qr
1290	30	80	vang	2026-01-08 19:05:35.776153	qr
1291	30	81	co_mat	2026-01-08 19:05:35.776153	qr
1292	30	82	co_mat	2026-01-08 19:05:35.776153	qr
1293	30	83	co_mat	2026-01-08 19:05:35.776153	qr
1294	30	84	co_mat	2026-01-08 19:05:35.776153	qr
1295	30	85	co_mat	2026-01-08 19:05:35.776153	qr
1296	30	86	vang	2026-01-08 19:05:35.776153	qr
1297	30	87	vang	2026-01-08 19:05:35.776153	qr
1298	30	88	vang	2026-01-08 19:05:35.776153	qr
1299	30	89	co_mat	2026-01-08 19:05:35.776153	qr
1300	30	90	co_mat	2026-01-08 19:05:35.776153	qr
1301	30	91	co_mat	2026-01-08 19:05:35.776153	qr
1302	30	92	co_mat	2026-01-08 19:05:35.776153	qr
1303	30	93	co_mat	2026-01-08 19:05:35.776153	qr
1304	30	94	co_mat	2026-01-08 19:05:35.776153	qr
1305	30	95	co_mat	2026-01-08 19:05:35.776153	qr
1306	30	96	co_mat	2026-01-08 19:05:35.776153	qr
1307	30	97	co_mat	2026-01-08 19:05:35.776153	qr
1308	30	98	vang	2026-01-08 19:05:35.776153	qr
1309	30	99	co_mat	2026-01-08 19:05:35.776153	qr
1310	30	100	vang	2026-01-08 19:05:35.776153	qr
1311	30	101	co_mat	2026-01-08 19:05:35.776153	qr
1312	30	102	co_mat	2026-01-08 19:05:35.776153	qr
1313	30	103	co_mat	2026-01-08 19:05:35.776153	qr
1314	30	104	co_mat	2026-01-08 19:05:35.776153	qr
1315	30	105	vang	2026-01-08 19:05:35.776153	qr
1316	30	106	co_mat	2026-01-08 19:05:35.776153	qr
1317	30	107	vang	2026-01-08 19:05:35.776153	qr
1318	30	108	co_mat	2026-01-08 19:05:35.776153	qr
1319	30	109	co_mat	2026-01-08 19:05:35.776153	qr
1320	30	110	co_mat	2026-01-08 19:05:35.776153	qr
1321	31	67	co_mat	2026-01-08 19:05:35.776153	qr
1322	31	68	co_mat	2026-01-08 19:05:35.776153	qr
1323	31	69	co_mat	2026-01-08 19:05:35.776153	qr
1324	31	70	co_mat	2026-01-08 19:05:35.776153	qr
1325	31	71	co_mat	2026-01-08 19:05:35.776153	qr
1326	31	72	co_mat	2026-01-08 19:05:35.776153	qr
1327	31	73	co_mat	2026-01-08 19:05:35.776153	qr
1328	31	74	co_mat	2026-01-08 19:05:35.776153	qr
1329	31	75	co_mat	2026-01-08 19:05:35.776153	qr
1330	31	76	co_mat	2026-01-08 19:05:35.776153	qr
1331	31	77	co_mat	2026-01-08 19:05:35.776153	qr
1332	31	78	co_mat	2026-01-08 19:05:35.776153	qr
1333	31	79	co_mat	2026-01-08 19:05:35.776153	qr
1334	31	80	co_mat	2026-01-08 19:05:35.776153	qr
1335	31	81	co_mat	2026-01-08 19:05:35.776153	qr
1336	31	82	co_mat	2026-01-08 19:05:35.776153	qr
1337	31	83	co_mat	2026-01-08 19:05:35.776153	qr
1338	31	84	co_mat	2026-01-08 19:05:35.776153	qr
1339	31	85	co_mat	2026-01-08 19:05:35.776153	qr
1340	31	86	co_mat	2026-01-08 19:05:35.776153	qr
1341	31	87	co_mat	2026-01-08 19:05:35.776153	qr
1342	31	88	co_mat	2026-01-08 19:05:35.776153	qr
1343	31	89	co_mat	2026-01-08 19:05:35.776153	qr
1344	31	90	co_mat	2026-01-08 19:05:35.776153	qr
1345	31	91	co_mat	2026-01-08 19:05:35.776153	qr
1346	31	92	co_mat	2026-01-08 19:05:35.776153	qr
1347	31	93	co_mat	2026-01-08 19:05:35.776153	qr
1348	31	94	co_mat	2026-01-08 19:05:35.776153	qr
1349	31	95	co_mat	2026-01-08 19:05:35.776153	qr
1350	31	96	co_mat	2026-01-08 19:05:35.776153	qr
1351	31	97	co_mat	2026-01-08 19:05:35.776153	qr
1352	31	98	co_mat	2026-01-08 19:05:35.776153	qr
1353	31	99	co_mat	2026-01-08 19:05:35.776153	qr
1354	31	100	co_mat	2026-01-08 19:05:35.776153	qr
1355	31	101	vang	2026-01-08 19:05:35.776153	qr
1356	31	102	co_mat	2026-01-08 19:05:35.776153	qr
1357	31	103	co_mat	2026-01-08 19:05:35.776153	qr
1358	31	104	vang	2026-01-08 19:05:35.776153	qr
1359	31	105	co_mat	2026-01-08 19:05:35.776153	qr
1360	31	106	vang	2026-01-08 19:05:35.776153	qr
1361	31	107	co_mat	2026-01-08 19:05:35.776153	qr
1362	31	108	co_mat	2026-01-08 19:05:35.776153	qr
1363	31	109	co_mat	2026-01-08 19:05:35.776153	qr
1364	31	110	co_mat	2026-01-08 19:05:35.776153	qr
1365	32	67	co_mat	2026-01-08 19:05:35.776153	qr
1366	32	68	co_mat	2026-01-08 19:05:35.776153	qr
1367	32	69	co_mat	2026-01-08 19:05:35.776153	qr
1368	32	70	co_mat	2026-01-08 19:05:35.776153	qr
1369	32	71	co_mat	2026-01-08 19:05:35.776153	qr
1370	32	72	co_mat	2026-01-08 19:05:35.776153	qr
1371	32	73	co_mat	2026-01-08 19:05:35.776153	qr
1372	32	74	co_mat	2026-01-08 19:05:35.776153	qr
1373	32	75	co_mat	2026-01-08 19:05:35.776153	qr
1374	32	76	vang	2026-01-08 19:05:35.776153	qr
1375	32	77	vang	2026-01-08 19:05:35.776153	qr
1376	32	78	co_mat	2026-01-08 19:05:35.776153	qr
1377	32	79	co_mat	2026-01-08 19:05:35.776153	qr
1378	32	80	vang	2026-01-08 19:05:35.776153	qr
1379	32	81	co_mat	2026-01-08 19:05:35.776153	qr
1380	32	82	co_mat	2026-01-08 19:05:35.776153	qr
1381	32	83	co_mat	2026-01-08 19:05:35.776153	qr
1382	32	84	vang	2026-01-08 19:05:35.776153	qr
1383	32	85	co_mat	2026-01-08 19:05:35.776153	qr
1384	32	86	co_mat	2026-01-08 19:05:35.776153	qr
1385	32	87	vang	2026-01-08 19:05:35.776153	qr
1386	32	88	co_mat	2026-01-08 19:05:35.776153	qr
1387	32	89	co_mat	2026-01-08 19:05:35.776153	qr
1388	32	90	co_mat	2026-01-08 19:05:35.776153	qr
1389	32	91	co_mat	2026-01-08 19:05:35.776153	qr
1390	32	92	co_mat	2026-01-08 19:05:35.776153	qr
1391	32	93	co_mat	2026-01-08 19:05:35.776153	qr
1392	32	94	co_mat	2026-01-08 19:05:35.776153	qr
1393	32	95	co_mat	2026-01-08 19:05:35.776153	qr
1394	32	96	co_mat	2026-01-08 19:05:35.776153	qr
1395	32	97	co_mat	2026-01-08 19:05:35.776153	qr
1396	32	98	co_mat	2026-01-08 19:05:35.776153	qr
1397	32	99	vang	2026-01-08 19:05:35.776153	qr
1398	32	100	co_mat	2026-01-08 19:05:35.776153	qr
1399	32	101	co_mat	2026-01-08 19:05:35.776153	qr
1400	32	102	co_mat	2026-01-08 19:05:35.776153	qr
1401	32	103	co_mat	2026-01-08 19:05:35.776153	qr
1402	32	104	co_mat	2026-01-08 19:05:35.776153	qr
1403	32	105	vang	2026-01-08 19:05:35.776153	qr
1404	32	106	co_mat	2026-01-08 19:05:35.776153	qr
1405	32	107	co_mat	2026-01-08 19:05:35.776153	qr
1406	32	108	co_mat	2026-01-08 19:05:35.776153	qr
1407	32	109	co_mat	2026-01-08 19:05:35.776153	qr
1408	32	110	co_mat	2026-01-08 19:05:35.776153	qr
1409	33	67	co_mat	2026-01-08 19:05:35.776153	qr
1410	33	68	co_mat	2026-01-08 19:05:35.776153	qr
1411	33	69	co_mat	2026-01-08 19:05:35.776153	qr
1412	33	70	co_mat	2026-01-08 19:05:35.776153	qr
1413	33	71	co_mat	2026-01-08 19:05:35.776153	qr
1414	33	72	co_mat	2026-01-08 19:05:35.776153	qr
1415	33	73	co_mat	2026-01-08 19:05:35.776153	qr
1416	33	74	co_mat	2026-01-08 19:05:35.776153	qr
1417	33	75	co_mat	2026-01-08 19:05:35.776153	qr
1418	33	76	co_mat	2026-01-08 19:05:35.776153	qr
1419	33	77	co_mat	2026-01-08 19:05:35.776153	qr
1420	33	78	co_mat	2026-01-08 19:05:35.776153	qr
1421	33	79	co_mat	2026-01-08 19:05:35.776153	qr
1422	33	80	co_mat	2026-01-08 19:05:35.776153	qr
1423	33	81	co_mat	2026-01-08 19:05:35.776153	qr
1424	33	82	co_mat	2026-01-08 19:05:35.776153	qr
1425	33	83	co_mat	2026-01-08 19:05:35.776153	qr
1426	33	84	co_mat	2026-01-08 19:05:35.776153	qr
1427	33	85	co_mat	2026-01-08 19:05:35.776153	qr
1428	33	86	co_mat	2026-01-08 19:05:35.776153	qr
1429	33	87	co_mat	2026-01-08 19:05:35.776153	qr
1430	33	88	co_mat	2026-01-08 19:05:35.776153	qr
1431	33	89	co_mat	2026-01-08 19:05:35.776153	qr
1432	33	90	co_mat	2026-01-08 19:05:35.776153	qr
1433	33	91	co_mat	2026-01-08 19:05:35.776153	qr
1434	33	92	co_mat	2026-01-08 19:05:35.776153	qr
1435	33	93	co_mat	2026-01-08 19:05:35.776153	qr
1436	33	94	co_mat	2026-01-08 19:05:35.776153	qr
1437	33	95	vang	2026-01-08 19:05:35.776153	qr
1438	33	96	co_mat	2026-01-08 19:05:35.776153	qr
1439	33	97	co_mat	2026-01-08 19:05:35.776153	qr
1440	33	98	co_mat	2026-01-08 19:05:35.776153	qr
1441	33	99	co_mat	2026-01-08 19:05:35.776153	qr
1442	33	100	vang	2026-01-08 19:05:35.776153	qr
1443	33	101	co_mat	2026-01-08 19:05:35.776153	qr
1444	33	102	co_mat	2026-01-08 19:05:35.776153	qr
1445	33	103	co_mat	2026-01-08 19:05:35.776153	qr
1446	33	104	vang	2026-01-08 19:05:35.776153	qr
1447	33	105	co_mat	2026-01-08 19:05:35.776153	qr
1448	33	106	co_mat	2026-01-08 19:05:35.776153	qr
1449	33	107	co_mat	2026-01-08 19:05:35.776153	qr
1450	33	108	co_mat	2026-01-08 19:05:35.776153	qr
1451	33	109	co_mat	2026-01-08 19:05:35.776153	qr
1452	33	110	co_mat	2026-01-08 19:05:35.776153	qr
1453	34	67	co_mat	2026-01-08 19:05:35.776153	qr
1454	34	68	co_mat	2026-01-08 19:05:35.776153	qr
1455	34	69	co_mat	2026-01-08 19:05:35.776153	qr
1456	34	70	co_mat	2026-01-08 19:05:35.776153	qr
1457	34	71	vang	2026-01-08 19:05:35.776153	qr
1458	34	72	co_mat	2026-01-08 19:05:35.776153	qr
1459	34	73	co_mat	2026-01-08 19:05:35.776153	qr
1460	34	74	co_mat	2026-01-08 19:05:35.776153	qr
1461	34	75	co_mat	2026-01-08 19:05:35.776153	qr
1462	34	76	co_mat	2026-01-08 19:05:35.776153	qr
1463	34	77	co_mat	2026-01-08 19:05:35.776153	qr
1464	34	78	co_mat	2026-01-08 19:05:35.776153	qr
1465	34	79	co_mat	2026-01-08 19:05:35.776153	qr
1466	34	80	co_mat	2026-01-08 19:05:35.776153	qr
1467	34	81	co_mat	2026-01-08 19:05:35.776153	qr
1468	34	82	co_mat	2026-01-08 19:05:35.776153	qr
1469	34	83	co_mat	2026-01-08 19:05:35.776153	qr
1470	34	84	co_mat	2026-01-08 19:05:35.776153	qr
1471	34	85	co_mat	2026-01-08 19:05:35.776153	qr
1472	34	86	co_mat	2026-01-08 19:05:35.776153	qr
1473	34	87	co_mat	2026-01-08 19:05:35.776153	qr
1474	34	88	co_mat	2026-01-08 19:05:35.776153	qr
1475	34	89	co_mat	2026-01-08 19:05:35.776153	qr
1476	34	90	co_mat	2026-01-08 19:05:35.776153	qr
1477	34	91	co_mat	2026-01-08 19:05:35.776153	qr
1478	34	92	co_mat	2026-01-08 19:05:35.776153	qr
1479	34	93	vang	2026-01-08 19:05:35.776153	qr
1480	34	94	co_mat	2026-01-08 19:05:35.776153	qr
1481	34	95	co_mat	2026-01-08 19:05:35.776153	qr
1482	34	96	co_mat	2026-01-08 19:05:35.776153	qr
1483	34	97	co_mat	2026-01-08 19:05:35.776153	qr
1484	34	98	vang	2026-01-08 19:05:35.776153	qr
1485	34	99	co_mat	2026-01-08 19:05:35.776153	qr
1486	34	100	vang	2026-01-08 19:05:35.776153	qr
1487	34	101	vang	2026-01-08 19:05:35.776153	qr
1488	34	102	co_mat	2026-01-08 19:05:35.776153	qr
1489	34	103	co_mat	2026-01-08 19:05:35.776153	qr
1490	34	104	co_mat	2026-01-08 19:05:35.776153	qr
1491	34	105	co_mat	2026-01-08 19:05:35.776153	qr
1492	34	106	co_mat	2026-01-08 19:05:35.776153	qr
1493	34	107	co_mat	2026-01-08 19:05:35.776153	qr
1494	34	108	co_mat	2026-01-08 19:05:35.776153	qr
1495	34	109	co_mat	2026-01-08 19:05:35.776153	qr
1496	34	110	vang	2026-01-08 19:05:35.776153	qr
1497	35	67	co_mat	2026-01-08 19:05:35.776153	qr
1498	35	68	co_mat	2026-01-08 19:05:35.776153	qr
1499	35	69	co_mat	2026-01-08 19:05:35.776153	qr
1500	35	70	vang	2026-01-08 19:05:35.776153	qr
1501	35	71	co_mat	2026-01-08 19:05:35.776153	qr
1502	35	72	co_mat	2026-01-08 19:05:35.776153	qr
1503	35	73	co_mat	2026-01-08 19:05:35.776153	qr
1504	35	74	co_mat	2026-01-08 19:05:35.776153	qr
1505	35	75	co_mat	2026-01-08 19:05:35.776153	qr
1506	35	76	co_mat	2026-01-08 19:05:35.776153	qr
1507	35	77	co_mat	2026-01-08 19:05:35.776153	qr
1508	35	78	co_mat	2026-01-08 19:05:35.776153	qr
1509	35	79	co_mat	2026-01-08 19:05:35.776153	qr
1510	35	80	co_mat	2026-01-08 19:05:35.776153	qr
1511	35	81	co_mat	2026-01-08 19:05:35.776153	qr
1512	35	82	vang	2026-01-08 19:05:35.776153	qr
1513	35	83	co_mat	2026-01-08 19:05:35.776153	qr
1514	35	84	co_mat	2026-01-08 19:05:35.776153	qr
1515	35	85	vang	2026-01-08 19:05:35.776153	qr
1516	35	86	co_mat	2026-01-08 19:05:35.776153	qr
1517	35	87	co_mat	2026-01-08 19:05:35.776153	qr
1518	35	88	co_mat	2026-01-08 19:05:35.776153	qr
1519	35	89	co_mat	2026-01-08 19:05:35.776153	qr
1520	35	90	co_mat	2026-01-08 19:05:35.776153	qr
1521	35	91	co_mat	2026-01-08 19:05:35.776153	qr
1522	35	92	co_mat	2026-01-08 19:05:35.776153	qr
1523	35	93	co_mat	2026-01-08 19:05:35.776153	qr
1524	35	94	co_mat	2026-01-08 19:05:35.776153	qr
1525	35	95	co_mat	2026-01-08 19:05:35.776153	qr
1526	35	96	co_mat	2026-01-08 19:05:35.776153	qr
1527	35	97	co_mat	2026-01-08 19:05:35.776153	qr
1528	35	98	co_mat	2026-01-08 19:05:35.776153	qr
1529	35	99	co_mat	2026-01-08 19:05:35.776153	qr
1530	35	100	co_mat	2026-01-08 19:05:35.776153	qr
1531	35	101	co_mat	2026-01-08 19:05:35.776153	qr
1532	35	102	co_mat	2026-01-08 19:05:35.776153	qr
1533	35	103	vang	2026-01-08 19:05:35.776153	qr
1534	35	104	co_mat	2026-01-08 19:05:35.776153	qr
1535	35	105	co_mat	2026-01-08 19:05:35.776153	qr
1536	35	106	vang	2026-01-08 19:05:35.776153	qr
1537	35	107	co_mat	2026-01-08 19:05:35.776153	qr
1538	35	108	co_mat	2026-01-08 19:05:35.776153	qr
1539	35	109	co_mat	2026-01-08 19:05:35.776153	qr
1540	35	110	co_mat	2026-01-08 19:05:35.776153	qr
1541	36	67	co_mat	2026-01-08 19:05:35.776153	qr
1542	36	68	co_mat	2026-01-08 19:05:35.776153	qr
1543	36	69	co_mat	2026-01-08 19:05:35.776153	qr
1544	36	70	co_mat	2026-01-08 19:05:35.776153	qr
1545	36	71	co_mat	2026-01-08 19:05:35.776153	qr
1546	36	72	co_mat	2026-01-08 19:05:35.776153	qr
1547	36	73	co_mat	2026-01-08 19:05:35.776153	qr
1548	36	74	co_mat	2026-01-08 19:05:35.776153	qr
1549	36	75	co_mat	2026-01-08 19:05:35.776153	qr
1550	36	76	co_mat	2026-01-08 19:05:35.776153	qr
1551	36	77	vang	2026-01-08 19:05:35.776153	qr
1552	36	78	co_mat	2026-01-08 19:05:35.776153	qr
1553	36	79	co_mat	2026-01-08 19:05:35.776153	qr
1554	36	80	co_mat	2026-01-08 19:05:35.776153	qr
1555	36	81	co_mat	2026-01-08 19:05:35.776153	qr
1556	36	82	co_mat	2026-01-08 19:05:35.776153	qr
1557	36	83	co_mat	2026-01-08 19:05:35.776153	qr
1558	36	84	co_mat	2026-01-08 19:05:35.776153	qr
1559	36	85	co_mat	2026-01-08 19:05:35.776153	qr
1560	36	86	co_mat	2026-01-08 19:05:35.776153	qr
1561	36	87	co_mat	2026-01-08 19:05:35.776153	qr
1562	36	88	co_mat	2026-01-08 19:05:35.776153	qr
1563	36	89	co_mat	2026-01-08 19:05:35.776153	qr
1564	36	90	co_mat	2026-01-08 19:05:35.776153	qr
1565	36	91	co_mat	2026-01-08 19:05:35.776153	qr
1566	36	92	co_mat	2026-01-08 19:05:35.776153	qr
1567	36	93	co_mat	2026-01-08 19:05:35.776153	qr
1568	36	94	co_mat	2026-01-08 19:05:35.776153	qr
1569	36	95	co_mat	2026-01-08 19:05:35.776153	qr
1570	36	96	vang	2026-01-08 19:05:35.776153	qr
1571	36	97	co_mat	2026-01-08 19:05:35.776153	qr
1572	36	98	co_mat	2026-01-08 19:05:35.776153	qr
1573	36	99	vang	2026-01-08 19:05:35.776153	qr
1574	36	100	vang	2026-01-08 19:05:35.776153	qr
1575	36	101	vang	2026-01-08 19:05:35.776153	qr
1576	36	102	co_mat	2026-01-08 19:05:35.776153	qr
1577	36	103	co_mat	2026-01-08 19:05:35.776153	qr
1578	36	104	co_mat	2026-01-08 19:05:35.776153	qr
1579	36	105	co_mat	2026-01-08 19:05:35.776153	qr
1580	36	106	co_mat	2026-01-08 19:05:35.776153	qr
1581	36	107	co_mat	2026-01-08 19:05:35.776153	qr
1582	36	108	co_mat	2026-01-08 19:05:35.776153	qr
1583	36	109	co_mat	2026-01-08 19:05:35.776153	qr
1584	36	110	co_mat	2026-01-08 19:05:35.776153	qr
1	1	67	CO_MAT	2026-01-15 04:11:48.294	THE_SV
\.


--
-- TOC entry 5223 (class 0 OID 16920)
-- Dependencies: 244
-- Data for Name: diem_ren_luyen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diem_ren_luyen (id, sinh_vien_id, tong_diem, xep_loai, hoc_ky) FROM stdin;
66	67	87	TỐT	HK1-2024
67	68	88	TỐT	HK1-2024
68	69	89	TỐT	HK1-2024
69	70	90	TỐT	HK1-2024
70	71	91	TỐT	HK1-2024
71	72	92	TỐT	HK1-2024
72	73	93	TỐT	HK1-2024
73	74	94	TỐT	HK1-2024
74	75	95	TỐT	HK1-2024
75	76	96	TỐT	HK1-2024
76	77	97	TỐT	HK1-2024
77	78	98	TỐT	HK1-2024
78	79	99	TỐT	HK1-2024
79	80	60	TỐT	HK1-2024
80	81	61	TỐT	HK1-2024
81	82	62	TỐT	HK1-2024
82	83	63	TỐT	HK1-2024
83	84	64	TỐT	HK1-2024
84	85	65	TỐT	HK1-2024
85	86	66	TỐT	HK1-2024
86	87	67	TỐT	HK1-2024
87	88	68	TỐT	HK1-2024
88	89	69	TỐT	HK1-2024
89	90	70	TỐT	HK1-2024
90	91	71	TỐT	HK1-2024
91	92	72	TỐT	HK1-2024
92	93	73	TỐT	HK1-2024
93	94	74	TỐT	HK1-2024
94	95	75	TỐT	HK1-2024
95	96	76	TỐT	HK1-2024
96	97	77	TỐT	HK1-2024
97	98	78	TỐT	HK1-2024
98	99	79	TỐT	HK1-2024
99	100	80	TỐT	HK1-2024
100	101	81	TỐT	HK1-2024
101	102	82	TỐT	HK1-2024
102	103	83	TỐT	HK1-2024
103	104	84	TỐT	HK1-2024
104	105	85	TỐT	HK1-2024
105	106	86	TỐT	HK1-2024
106	107	87	TỐT	HK1-2024
107	108	88	TỐT	HK1-2024
108	109	89	TỐT	HK1-2024
109	110	90	TỐT	HK1-2024
110	111	91	TỐT	HK1-2024
111	112	92	TỐT	HK1-2024
112	113	93	TỐT	HK1-2024
113	114	94	TỐT	HK1-2024
114	115	95	TỐT	HK1-2024
115	116	96	TỐT	HK1-2024
116	117	97	TỐT	HK1-2024
117	118	98	TỐT	HK1-2024
118	119	99	TỐT	HK1-2024
119	120	60	TỐT	HK1-2024
120	121	61	TỐT	HK1-2024
121	122	62	TỐT	HK1-2024
122	123	63	TỐT	HK1-2024
123	124	64	TỐT	HK1-2024
124	125	65	TỐT	HK1-2024
125	126	66	TỐT	HK1-2024
\.


--
-- TOC entry 5205 (class 0 OID 16786)
-- Dependencies: 226
-- Data for Name: giang_vien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.giang_vien (id, nguoi_dung_id, ho_ten, bo_mon) FROM stdin;
11	2	ThS. Nguyễn Văn Hùng	Công nghệ thông tin
12	3	TS. Trần Minh Quân	Công nghệ thông tin
13	4	ThS. Lê Hoàng Nam	Công nghệ thông tin
14	5	TS. Phạm Quốc Bảo	Công nghệ thông tin
15	6	ThS. Đặng Thị Lan	Công nghệ thông tin
16	7	TS. Nguyễn Hải Long	Công nghệ thông tin
17	8	ThS. Trịnh Minh Tâm	Công nghệ thông tin
18	9	TS. Võ Quốc Thắng	Công nghệ thông tin
19	10	ThS. Lê Thanh Bình	Công nghệ thông tin
20	11	TS. Phan Anh Tuấn	Công nghệ thông tin
\.


--
-- TOC entry 5207 (class 0 OID 16799)
-- Dependencies: 228
-- Data for Name: hoc_phan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hoc_phan (id, ten_hoc_phan, so_tin_chi) FROM stdin;
9	Cơ sở dữ liệu	3
10	Lập trình Web	3
11	Cấu trúc dữ liệu	3
12	Hệ điều hành	3
13	Mạng máy tính	3
14	Phân tích thiết kế HTTT	3
\.


--
-- TOC entry 5233 (class 0 OID 17139)
-- Dependencies: 254
-- Data for Name: lich_hoc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lich_hoc (id, lop_hoc_phan_id, thu, gio_bat_dau, gio_ket_thuc, phong) FROM stdin;
1	13	2	07:00:00	09:00:00	A101
2	14	6	13:00:00	15:00:00	A102
3	15	3	07:00:00	09:00:00	B201
4	16	4	13:00:00	15:00:00	B202
5	17	5	07:00:00	09:00:00	C101
6	18	2	13:00:00	15:00:00	C102
7	13	2	13:00:00	15:00:00	A102
8	14	3	07:00:00	09:00:00	A103
9	15	4	13:00:00	15:00:00	B201
10	16	5	07:00:00	09:00:00	B202
11	17	6	13:00:00	15:00:00	B203
12	18	2	07:00:00	09:00:00	A101
13	19	3	13:00:00	15:00:00	A102
14	20	4	07:00:00	09:00:00	A103
15	21	5	13:00:00	15:00:00	B201
16	22	6	07:00:00	09:00:00	B202
17	23	2	13:00:00	15:00:00	B203
18	24	3	07:00:00	09:00:00	A101
19	25	4	13:00:00	15:00:00	A102
20	26	5	07:00:00	09:00:00	A103
21	27	6	13:00:00	15:00:00	B201
22	28	2	07:00:00	09:00:00	B202
23	29	3	13:00:00	15:00:00	B203
24	30	4	07:00:00	09:00:00	A101
25	31	5	13:00:00	15:00:00	A102
26	32	6	07:00:00	09:00:00	A103
27	33	2	13:00:00	15:00:00	B201
28	34	3	07:00:00	09:00:00	B202
29	35	4	13:00:00	15:00:00	B203
30	36	5	07:00:00	09:00:00	A101
31	37	6	13:00:00	15:00:00	A102
32	38	2	07:00:00	09:00:00	A103
33	39	3	13:00:00	15:00:00	B201
34	40	4	07:00:00	09:00:00	B202
35	41	5	13:00:00	15:00:00	B203
36	42	6	07:00:00	09:00:00	A101
37	43	2	13:00:00	15:00:00	A102
38	44	3	07:00:00	09:00:00	A103
39	45	4	13:00:00	15:00:00	B201
40	46	5	07:00:00	09:00:00	B202
41	47	6	13:00:00	15:00:00	B203
42	48	2	07:00:00	09:00:00	A101
\.


--
-- TOC entry 5231 (class 0 OID 16986)
-- Dependencies: 252
-- Data for Name: lich_su_diem_ren_luyen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lich_su_diem_ren_luyen (id, sinh_vien_id, so_diem, ly_do, hoc_ky, admin_id, thoi_gian) FROM stdin;
1	67	64	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
2	68	61	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
3	69	69	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
4	70	75	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
5	71	79	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
6	72	77	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
7	73	66	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
8	74	68	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
9	75	77	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
10	76	76	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
11	77	64	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
12	78	77	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
13	79	78	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
14	80	73	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
15	81	73	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
16	82	60	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
17	83	70	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
18	84	62	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
19	85	69	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
20	86	67	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
21	87	65	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
22	88	64	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
23	89	79	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
24	90	78	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
25	91	80	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
26	92	70	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
27	93	63	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
28	94	63	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
29	95	75	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
30	96	76	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
31	97	60	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
32	98	63	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
33	99	61	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
34	100	61	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
35	101	66	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
36	102	70	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
37	103	77	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
38	104	77	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
39	105	75	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
40	106	79	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
41	107	60	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
42	108	67	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
43	109	66	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
44	110	77	Tham gia hoạt động học kỳ	HK1-2024-2025	1	2026-01-08 19:13:39.030491
\.


--
-- TOC entry 5209 (class 0 OID 16807)
-- Dependencies: 230
-- Data for Name: lop_hoc_phan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lop_hoc_phan (id, hoc_phan_id, giang_vien_id, hoc_ky, si_so_toi_da, ma_lop) FROM stdin;
13	9	11	HK1-2024	50	CSDL-HK1-2024-01
14	9	12	HK1-2024	50	CSDL-HK1-2024-02
15	9	13	HK1-2024	50	CSDL-HK1-2024-03
16	9	14	HK1-2024	50	CSDL-HK1-2024-04
17	9	15	HK1-2024	50	CSDL-HK1-2024-05
18	9	16	HK1-2024	50	CSDL-HK1-2024-06
19	10	11	HK1-2024	50	LTW-HK1-2024-01
20	10	12	HK1-2024	50	LTW-HK1-2024-02
21	10	13	HK1-2024	50	LTW-HK1-2024-03
22	10	14	HK1-2024	50	LTW-HK1-2024-04
23	10	15	HK1-2024	50	LTW-HK1-2024-05
24	10	16	HK1-2024	50	LTW-HK1-2024-06
25	11	11	HK1-2024	50	CTDL-HK1-2024-01
26	11	12	HK1-2024	50	CTDL-HK1-2024-02
27	11	13	HK1-2024	50	CTDL-HK1-2024-03
28	11	14	HK1-2024	50	CTDL-HK1-2024-04
29	11	15	HK1-2024	50	CTDL-HK1-2024-05
30	11	16	HK1-2024	50	CTDL-HK1-2024-06
31	12	11	HK1-2024	50	HDH-HK1-2024-01
32	12	12	HK1-2024	50	HDH-HK1-2024-02
33	12	13	HK1-2024	50	HDH-HK1-2024-03
34	12	14	HK1-2024	50	HDH-HK1-2024-04
35	12	15	HK1-2024	50	HDH-HK1-2024-05
36	12	16	HK1-2024	50	HDH-HK1-2024-06
37	13	11	HK1-2024	50	MMT-HK1-2024-01
38	13	12	HK1-2024	50	MMT-HK1-2024-02
39	13	13	HK1-2024	50	MMT-HK1-2024-03
40	13	14	HK1-2024	50	MMT-HK1-2024-04
41	13	15	HK1-2024	50	MMT-HK1-2024-05
42	13	16	HK1-2024	50	MMT-HK1-2024-06
43	14	11	HK1-2024	50	PTHT-HK1-2024-01
44	14	12	HK1-2024	50	PTHT-HK1-2024-02
45	14	13	HK1-2024	50	PTHT-HK1-2024-03
46	14	14	HK1-2024	50	PTHT-HK1-2024-04
47	14	15	HK1-2024	50	PTHT-HK1-2024-05
48	14	16	HK1-2024	50	PTHT-HK1-2024-06
\.


--
-- TOC entry 5201 (class 0 OID 16752)
-- Dependencies: 222
-- Data for Name: nguoi_dung; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nguoi_dung (id, email, mat_khau, vai_tro_id) FROM stdin;
1	admin@vaa.edu.vn	admin123	1
3	gv2@vaa.edu.vn	123456	2
4	gv3@vaa.edu.vn	123456	2
5	gv4@vaa.edu.vn	123456	2
6	gv5@vaa.edu.vn	123456	2
7	gv6@vaa.edu.vn	123456	2
8	gv7@vaa.edu.vn	123456	2
9	gv8@vaa.edu.vn	123456	2
10	gv9@vaa.edu.vn	123456	2
11	gv10@vaa.edu.vn	123456	2
2	gv1@vaa.edu.vn	123456	2
12	sv1@vaa.edu.vn	123456	3
13	sv2@vaa.edu.vn	123456	3
14	sv3@vaa.edu.vn	123456	3
15	sv4@vaa.edu.vn	123456	3
16	sv5@vaa.edu.vn	123456	3
17	sv6@vaa.edu.vn	123456	3
18	sv7@vaa.edu.vn	123456	3
19	sv8@vaa.edu.vn	123456	3
20	sv9@vaa.edu.vn	123456	3
21	sv10@vaa.edu.vn	123456	3
22	sv11@vaa.edu.vn	123456	3
23	sv12@vaa.edu.vn	123456	3
24	sv13@vaa.edu.vn	123456	3
25	sv14@vaa.edu.vn	123456	3
26	sv15@vaa.edu.vn	123456	3
27	sv16@vaa.edu.vn	123456	3
28	sv17@vaa.edu.vn	123456	3
29	sv18@vaa.edu.vn	123456	3
30	sv19@vaa.edu.vn	123456	3
31	sv20@vaa.edu.vn	123456	3
32	sv21@vaa.edu.vn	123456	3
33	sv22@vaa.edu.vn	123456	3
34	sv23@vaa.edu.vn	123456	3
35	sv24@vaa.edu.vn	123456	3
36	sv25@vaa.edu.vn	123456	3
37	sv26@vaa.edu.vn	123456	3
38	sv27@vaa.edu.vn	123456	3
39	sv28@vaa.edu.vn	123456	3
40	sv29@vaa.edu.vn	123456	3
41	sv30@vaa.edu.vn	123456	3
42	sv31@vaa.edu.vn	123456	3
43	sv32@vaa.edu.vn	123456	3
44	sv33@vaa.edu.vn	123456	3
45	sv34@vaa.edu.vn	123456	3
46	sv35@vaa.edu.vn	123456	3
47	sv36@vaa.edu.vn	123456	3
48	sv37@vaa.edu.vn	123456	3
49	sv38@vaa.edu.vn	123456	3
50	sv39@vaa.edu.vn	123456	3
51	sv40@vaa.edu.vn	123456	3
52	sv41@vaa.edu.vn	123456	3
53	sv42@vaa.edu.vn	123456	3
54	sv43@vaa.edu.vn	123456	3
55	sv44@vaa.edu.vn	123456	3
56	sv45@vaa.edu.vn	123456	3
57	sv46@vaa.edu.vn	123456	3
58	sv47@vaa.edu.vn	123456	3
59	sv48@vaa.edu.vn	123456	3
60	sv49@vaa.edu.vn	123456	3
61	sv50@vaa.edu.vn	123456	3
62	sv51@vaa.edu.vn	123456	3
63	sv52@vaa.edu.vn	123456	3
64	sv53@vaa.edu.vn	123456	3
65	sv54@vaa.edu.vn	123456	3
66	sv55@vaa.edu.vn	123456	3
67	sv56@vaa.edu.vn	123456	3
68	sv57@vaa.edu.vn	123456	3
69	sv58@vaa.edu.vn	123456	3
70	sv59@vaa.edu.vn	123456	3
71	sv60@vaa.edu.vn	123456	3
\.


--
-- TOC entry 5221 (class 0 OID 16902)
-- Dependencies: 242
-- Data for Name: nop_bai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nop_bai (id, bai_tap_id, sinh_vien_id, ngay_nop, trang_thai) FROM stdin;
1	1	67	2026-01-08	da_nop
2	1	68	2026-01-08	da_nop
3	1	69	2026-01-08	da_nop
4	1	70	2026-01-08	da_nop
5	1	71	2026-01-08	da_nop
6	1	72	2026-01-08	da_nop
7	1	73	2026-01-08	da_nop
8	1	74	2026-01-08	da_nop
9	1	75	2026-01-08	da_nop
10	1	76	2026-01-08	tre_han
11	1	77	2026-01-08	da_nop
12	1	78	2026-01-08	da_nop
13	1	79	2026-01-08	da_nop
14	1	80	2026-01-08	da_nop
15	1	81	2026-01-08	da_nop
16	1	82	2026-01-08	da_nop
17	1	83	2026-01-08	da_nop
18	1	84	2026-01-08	tre_han
19	1	85	2026-01-08	da_nop
20	1	86	2026-01-08	da_nop
21	1	87	2026-01-08	da_nop
22	1	88	2026-01-08	da_nop
23	1	89	2026-01-08	da_nop
24	1	90	2026-01-08	tre_han
25	1	91	2026-01-08	da_nop
26	1	92	2026-01-08	tre_han
27	1	93	2026-01-08	da_nop
28	1	94	2026-01-08	da_nop
29	1	95	2026-01-08	tre_han
30	1	96	2026-01-08	tre_han
31	1	97	2026-01-08	da_nop
32	1	98	2026-01-08	tre_han
33	1	99	2026-01-08	da_nop
34	1	100	2026-01-08	da_nop
35	1	101	2026-01-08	da_nop
36	1	102	2026-01-08	tre_han
37	1	103	2026-01-08	da_nop
38	1	104	2026-01-08	da_nop
39	1	105	2026-01-08	da_nop
40	1	106	2026-01-08	da_nop
41	1	107	2026-01-08	da_nop
42	1	108	2026-01-08	da_nop
43	1	109	2026-01-08	da_nop
44	1	110	2026-01-08	da_nop
45	2	67	2026-01-08	tre_han
46	2	68	2026-01-08	da_nop
47	2	69	2026-01-08	tre_han
48	2	70	2026-01-08	da_nop
49	2	71	2026-01-08	da_nop
50	2	72	2026-01-08	da_nop
51	2	73	2026-01-08	da_nop
52	2	74	2026-01-08	da_nop
53	2	75	2026-01-08	da_nop
54	2	76	2026-01-08	tre_han
55	2	77	2026-01-08	da_nop
56	2	78	2026-01-08	da_nop
57	2	79	2026-01-08	da_nop
58	2	80	2026-01-08	tre_han
59	2	81	2026-01-08	da_nop
60	2	82	2026-01-08	tre_han
61	2	83	2026-01-08	da_nop
62	2	84	2026-01-08	tre_han
63	2	85	2026-01-08	da_nop
64	2	86	2026-01-08	da_nop
65	2	87	2026-01-08	da_nop
66	2	88	2026-01-08	da_nop
67	2	89	2026-01-08	tre_han
68	2	90	2026-01-08	da_nop
69	2	91	2026-01-08	da_nop
70	2	92	2026-01-08	da_nop
71	2	93	2026-01-08	da_nop
72	2	94	2026-01-08	da_nop
73	2	95	2026-01-08	da_nop
74	2	96	2026-01-08	da_nop
75	2	97	2026-01-08	da_nop
76	2	98	2026-01-08	da_nop
77	2	99	2026-01-08	da_nop
78	2	100	2026-01-08	tre_han
79	2	101	2026-01-08	da_nop
80	2	102	2026-01-08	da_nop
81	2	103	2026-01-08	da_nop
82	2	104	2026-01-08	da_nop
83	2	105	2026-01-08	tre_han
84	2	106	2026-01-08	da_nop
85	2	107	2026-01-08	da_nop
86	2	108	2026-01-08	da_nop
87	2	109	2026-01-08	da_nop
88	2	110	2026-01-08	da_nop
89	3	67	2026-01-08	da_nop
90	3	68	2026-01-08	tre_han
91	3	69	2026-01-08	da_nop
92	3	70	2026-01-08	da_nop
93	3	71	2026-01-08	tre_han
94	3	72	2026-01-08	da_nop
95	3	73	2026-01-08	da_nop
96	3	74	2026-01-08	da_nop
97	3	75	2026-01-08	da_nop
98	3	76	2026-01-08	da_nop
99	3	77	2026-01-08	tre_han
100	3	78	2026-01-08	da_nop
101	3	79	2026-01-08	da_nop
102	3	80	2026-01-08	da_nop
103	3	81	2026-01-08	da_nop
104	3	82	2026-01-08	da_nop
105	3	83	2026-01-08	da_nop
106	3	84	2026-01-08	tre_han
107	3	85	2026-01-08	tre_han
108	3	86	2026-01-08	tre_han
109	3	87	2026-01-08	da_nop
110	3	88	2026-01-08	da_nop
111	3	89	2026-01-08	da_nop
112	3	90	2026-01-08	da_nop
113	3	91	2026-01-08	da_nop
114	3	92	2026-01-08	da_nop
115	3	93	2026-01-08	da_nop
116	3	94	2026-01-08	da_nop
117	3	95	2026-01-08	da_nop
118	3	96	2026-01-08	tre_han
119	3	97	2026-01-08	da_nop
120	3	98	2026-01-08	da_nop
121	3	99	2026-01-08	da_nop
122	3	100	2026-01-08	tre_han
123	3	101	2026-01-08	tre_han
124	3	102	2026-01-08	da_nop
125	3	103	2026-01-08	da_nop
126	3	104	2026-01-08	da_nop
127	3	105	2026-01-08	da_nop
128	3	106	2026-01-08	da_nop
129	3	107	2026-01-08	da_nop
130	3	108	2026-01-08	da_nop
131	3	109	2026-01-08	da_nop
132	3	110	2026-01-08	da_nop
133	4	67	2026-01-08	da_nop
134	4	68	2026-01-08	da_nop
135	4	69	2026-01-08	da_nop
136	4	70	2026-01-08	da_nop
137	4	71	2026-01-08	da_nop
138	4	72	2026-01-08	da_nop
139	4	73	2026-01-08	da_nop
140	4	74	2026-01-08	da_nop
141	4	75	2026-01-08	da_nop
142	4	76	2026-01-08	da_nop
143	4	77	2026-01-08	da_nop
144	4	78	2026-01-08	tre_han
145	4	79	2026-01-08	da_nop
146	4	80	2026-01-08	da_nop
147	4	81	2026-01-08	da_nop
148	4	82	2026-01-08	da_nop
149	4	83	2026-01-08	da_nop
150	4	84	2026-01-08	da_nop
151	4	85	2026-01-08	da_nop
152	4	86	2026-01-08	da_nop
153	4	87	2026-01-08	da_nop
154	4	88	2026-01-08	da_nop
155	4	89	2026-01-08	da_nop
156	4	90	2026-01-08	tre_han
157	4	91	2026-01-08	tre_han
158	4	92	2026-01-08	da_nop
159	4	93	2026-01-08	da_nop
160	4	94	2026-01-08	da_nop
161	4	95	2026-01-08	da_nop
162	4	96	2026-01-08	da_nop
163	4	97	2026-01-08	da_nop
164	4	98	2026-01-08	da_nop
165	4	99	2026-01-08	da_nop
166	4	100	2026-01-08	tre_han
167	4	101	2026-01-08	da_nop
168	4	102	2026-01-08	da_nop
169	4	103	2026-01-08	da_nop
170	4	104	2026-01-08	da_nop
171	4	105	2026-01-08	da_nop
172	4	106	2026-01-08	da_nop
173	4	107	2026-01-08	tre_han
174	4	108	2026-01-08	da_nop
175	4	109	2026-01-08	da_nop
176	4	110	2026-01-08	da_nop
177	5	67	2026-01-08	tre_han
178	5	68	2026-01-08	da_nop
179	5	69	2026-01-08	da_nop
180	5	70	2026-01-08	da_nop
181	5	71	2026-01-08	da_nop
182	5	72	2026-01-08	da_nop
183	5	73	2026-01-08	da_nop
184	5	74	2026-01-08	da_nop
185	5	75	2026-01-08	tre_han
186	5	76	2026-01-08	da_nop
187	5	77	2026-01-08	da_nop
188	5	78	2026-01-08	da_nop
189	5	79	2026-01-08	tre_han
190	5	80	2026-01-08	da_nop
191	5	81	2026-01-08	da_nop
192	5	82	2026-01-08	da_nop
193	5	83	2026-01-08	da_nop
194	5	84	2026-01-08	da_nop
195	5	85	2026-01-08	da_nop
196	5	86	2026-01-08	da_nop
197	5	87	2026-01-08	tre_han
198	5	88	2026-01-08	tre_han
199	5	89	2026-01-08	da_nop
200	5	90	2026-01-08	da_nop
201	5	91	2026-01-08	da_nop
202	5	92	2026-01-08	da_nop
203	5	93	2026-01-08	tre_han
204	5	94	2026-01-08	da_nop
205	5	95	2026-01-08	tre_han
206	5	96	2026-01-08	da_nop
207	5	97	2026-01-08	da_nop
208	5	98	2026-01-08	tre_han
209	5	99	2026-01-08	tre_han
210	5	100	2026-01-08	da_nop
211	5	101	2026-01-08	da_nop
212	5	102	2026-01-08	tre_han
213	5	103	2026-01-08	da_nop
214	5	104	2026-01-08	da_nop
215	5	105	2026-01-08	da_nop
216	5	106	2026-01-08	da_nop
217	5	107	2026-01-08	da_nop
218	5	108	2026-01-08	da_nop
219	5	109	2026-01-08	da_nop
220	5	110	2026-01-08	da_nop
221	6	67	2026-01-08	da_nop
222	6	68	2026-01-08	da_nop
223	6	69	2026-01-08	da_nop
224	6	70	2026-01-08	da_nop
225	6	71	2026-01-08	da_nop
226	6	72	2026-01-08	da_nop
227	6	73	2026-01-08	da_nop
228	6	74	2026-01-08	tre_han
229	6	75	2026-01-08	da_nop
230	6	76	2026-01-08	da_nop
231	6	77	2026-01-08	da_nop
232	6	78	2026-01-08	da_nop
233	6	79	2026-01-08	da_nop
234	6	80	2026-01-08	da_nop
235	6	81	2026-01-08	tre_han
236	6	82	2026-01-08	da_nop
237	6	83	2026-01-08	tre_han
238	6	84	2026-01-08	da_nop
239	6	85	2026-01-08	da_nop
240	6	86	2026-01-08	tre_han
241	6	87	2026-01-08	da_nop
242	6	88	2026-01-08	da_nop
243	6	89	2026-01-08	da_nop
244	6	90	2026-01-08	da_nop
245	6	91	2026-01-08	da_nop
246	6	92	2026-01-08	da_nop
247	6	93	2026-01-08	tre_han
248	6	94	2026-01-08	da_nop
249	6	95	2026-01-08	da_nop
250	6	96	2026-01-08	da_nop
251	6	97	2026-01-08	da_nop
252	6	98	2026-01-08	da_nop
253	6	99	2026-01-08	tre_han
254	6	100	2026-01-08	da_nop
255	6	101	2026-01-08	da_nop
256	6	102	2026-01-08	da_nop
257	6	103	2026-01-08	da_nop
258	6	104	2026-01-08	da_nop
259	6	105	2026-01-08	da_nop
260	6	106	2026-01-08	tre_han
261	6	107	2026-01-08	da_nop
262	6	108	2026-01-08	da_nop
263	6	109	2026-01-08	da_nop
264	6	110	2026-01-08	da_nop
265	7	67	2026-01-08	da_nop
266	7	68	2026-01-08	da_nop
267	7	69	2026-01-08	da_nop
268	7	70	2026-01-08	da_nop
269	7	71	2026-01-08	tre_han
270	7	72	2026-01-08	da_nop
271	7	73	2026-01-08	da_nop
272	7	74	2026-01-08	tre_han
273	7	75	2026-01-08	da_nop
274	7	76	2026-01-08	tre_han
275	7	77	2026-01-08	da_nop
276	7	78	2026-01-08	da_nop
277	7	79	2026-01-08	da_nop
278	7	80	2026-01-08	da_nop
279	7	81	2026-01-08	da_nop
280	7	82	2026-01-08	tre_han
281	7	83	2026-01-08	da_nop
282	7	84	2026-01-08	da_nop
283	7	85	2026-01-08	da_nop
284	7	86	2026-01-08	da_nop
285	7	87	2026-01-08	tre_han
286	7	88	2026-01-08	da_nop
287	7	89	2026-01-08	da_nop
288	7	90	2026-01-08	da_nop
289	7	91	2026-01-08	da_nop
290	7	92	2026-01-08	da_nop
291	7	93	2026-01-08	da_nop
292	7	94	2026-01-08	da_nop
293	7	95	2026-01-08	da_nop
294	7	96	2026-01-08	tre_han
295	7	97	2026-01-08	da_nop
296	7	98	2026-01-08	da_nop
297	7	99	2026-01-08	da_nop
298	7	100	2026-01-08	da_nop
299	7	101	2026-01-08	da_nop
300	7	102	2026-01-08	da_nop
301	7	103	2026-01-08	tre_han
302	7	104	2026-01-08	tre_han
303	7	105	2026-01-08	da_nop
304	7	106	2026-01-08	da_nop
305	7	107	2026-01-08	da_nop
306	7	108	2026-01-08	tre_han
307	7	109	2026-01-08	da_nop
308	7	110	2026-01-08	tre_han
309	8	67	2026-01-08	da_nop
310	8	68	2026-01-08	da_nop
311	8	69	2026-01-08	tre_han
312	8	70	2026-01-08	da_nop
313	8	71	2026-01-08	da_nop
314	8	72	2026-01-08	tre_han
315	8	73	2026-01-08	da_nop
316	8	74	2026-01-08	tre_han
317	8	75	2026-01-08	tre_han
318	8	76	2026-01-08	da_nop
319	8	77	2026-01-08	da_nop
320	8	78	2026-01-08	da_nop
321	8	79	2026-01-08	da_nop
322	8	80	2026-01-08	da_nop
323	8	81	2026-01-08	tre_han
324	8	82	2026-01-08	da_nop
325	8	83	2026-01-08	da_nop
326	8	84	2026-01-08	da_nop
327	8	85	2026-01-08	da_nop
328	8	86	2026-01-08	da_nop
329	8	87	2026-01-08	tre_han
330	8	88	2026-01-08	da_nop
331	8	89	2026-01-08	da_nop
332	8	90	2026-01-08	da_nop
333	8	91	2026-01-08	tre_han
334	8	92	2026-01-08	da_nop
335	8	93	2026-01-08	da_nop
336	8	94	2026-01-08	da_nop
337	8	95	2026-01-08	da_nop
338	8	96	2026-01-08	da_nop
339	8	97	2026-01-08	tre_han
340	8	98	2026-01-08	da_nop
341	8	99	2026-01-08	da_nop
342	8	100	2026-01-08	da_nop
343	8	101	2026-01-08	tre_han
344	8	102	2026-01-08	da_nop
345	8	103	2026-01-08	tre_han
346	8	104	2026-01-08	da_nop
347	8	105	2026-01-08	da_nop
348	8	106	2026-01-08	da_nop
349	8	107	2026-01-08	da_nop
350	8	108	2026-01-08	da_nop
351	8	109	2026-01-08	da_nop
352	8	110	2026-01-08	da_nop
353	9	67	2026-01-08	da_nop
354	9	68	2026-01-08	da_nop
355	9	69	2026-01-08	da_nop
356	9	70	2026-01-08	da_nop
357	9	71	2026-01-08	da_nop
358	9	72	2026-01-08	da_nop
359	9	73	2026-01-08	da_nop
360	9	74	2026-01-08	da_nop
361	9	75	2026-01-08	da_nop
362	9	76	2026-01-08	da_nop
363	9	77	2026-01-08	da_nop
364	9	78	2026-01-08	da_nop
365	9	79	2026-01-08	da_nop
366	9	80	2026-01-08	tre_han
367	9	81	2026-01-08	da_nop
368	9	82	2026-01-08	tre_han
369	9	83	2026-01-08	da_nop
370	9	84	2026-01-08	da_nop
371	9	85	2026-01-08	da_nop
372	9	86	2026-01-08	da_nop
373	9	87	2026-01-08	da_nop
374	9	88	2026-01-08	da_nop
375	9	89	2026-01-08	da_nop
376	9	90	2026-01-08	tre_han
377	9	91	2026-01-08	da_nop
378	9	92	2026-01-08	da_nop
379	9	93	2026-01-08	da_nop
380	9	94	2026-01-08	da_nop
381	9	95	2026-01-08	tre_han
382	9	96	2026-01-08	tre_han
383	9	97	2026-01-08	da_nop
384	9	98	2026-01-08	da_nop
385	9	99	2026-01-08	da_nop
386	9	100	2026-01-08	da_nop
387	9	101	2026-01-08	da_nop
388	9	102	2026-01-08	da_nop
389	9	103	2026-01-08	da_nop
390	9	104	2026-01-08	tre_han
391	9	105	2026-01-08	da_nop
392	9	106	2026-01-08	da_nop
393	9	107	2026-01-08	da_nop
394	9	108	2026-01-08	da_nop
395	9	109	2026-01-08	tre_han
396	9	110	2026-01-08	da_nop
397	10	67	2026-01-08	da_nop
398	10	68	2026-01-08	da_nop
399	10	69	2026-01-08	da_nop
400	10	70	2026-01-08	tre_han
401	10	71	2026-01-08	tre_han
402	10	72	2026-01-08	da_nop
403	10	73	2026-01-08	da_nop
404	10	74	2026-01-08	da_nop
405	10	75	2026-01-08	da_nop
406	10	76	2026-01-08	da_nop
407	10	77	2026-01-08	tre_han
408	10	78	2026-01-08	da_nop
409	10	79	2026-01-08	da_nop
410	10	80	2026-01-08	da_nop
411	10	81	2026-01-08	tre_han
412	10	82	2026-01-08	tre_han
413	10	83	2026-01-08	da_nop
414	10	84	2026-01-08	da_nop
415	10	85	2026-01-08	da_nop
416	10	86	2026-01-08	da_nop
417	10	87	2026-01-08	da_nop
418	10	88	2026-01-08	da_nop
419	10	89	2026-01-08	da_nop
420	10	90	2026-01-08	tre_han
421	10	91	2026-01-08	tre_han
422	10	92	2026-01-08	da_nop
423	10	93	2026-01-08	da_nop
424	10	94	2026-01-08	da_nop
425	10	95	2026-01-08	da_nop
426	10	96	2026-01-08	da_nop
427	10	97	2026-01-08	da_nop
428	10	98	2026-01-08	da_nop
429	10	99	2026-01-08	da_nop
430	10	100	2026-01-08	tre_han
431	10	101	2026-01-08	da_nop
432	10	102	2026-01-08	da_nop
433	10	103	2026-01-08	da_nop
434	10	104	2026-01-08	da_nop
435	10	105	2026-01-08	da_nop
436	10	106	2026-01-08	tre_han
437	10	107	2026-01-08	da_nop
438	10	108	2026-01-08	da_nop
439	10	109	2026-01-08	da_nop
440	10	110	2026-01-08	tre_han
441	11	67	2026-01-08	tre_han
442	11	68	2026-01-08	da_nop
443	11	69	2026-01-08	da_nop
444	11	70	2026-01-08	da_nop
445	11	71	2026-01-08	da_nop
446	11	72	2026-01-08	da_nop
447	11	73	2026-01-08	da_nop
448	11	74	2026-01-08	da_nop
449	11	75	2026-01-08	da_nop
450	11	76	2026-01-08	da_nop
451	11	77	2026-01-08	da_nop
452	11	78	2026-01-08	da_nop
453	11	79	2026-01-08	da_nop
454	11	80	2026-01-08	da_nop
455	11	81	2026-01-08	da_nop
456	11	82	2026-01-08	da_nop
457	11	83	2026-01-08	da_nop
458	11	84	2026-01-08	da_nop
459	11	85	2026-01-08	da_nop
460	11	86	2026-01-08	da_nop
461	11	87	2026-01-08	da_nop
462	11	88	2026-01-08	tre_han
463	11	89	2026-01-08	tre_han
464	11	90	2026-01-08	da_nop
465	11	91	2026-01-08	da_nop
466	11	92	2026-01-08	tre_han
467	11	93	2026-01-08	tre_han
468	11	94	2026-01-08	da_nop
469	11	95	2026-01-08	da_nop
470	11	96	2026-01-08	tre_han
471	11	97	2026-01-08	da_nop
472	11	98	2026-01-08	da_nop
473	11	99	2026-01-08	da_nop
474	11	100	2026-01-08	da_nop
475	11	101	2026-01-08	da_nop
476	11	102	2026-01-08	da_nop
477	11	103	2026-01-08	da_nop
478	11	104	2026-01-08	da_nop
479	11	105	2026-01-08	da_nop
480	11	106	2026-01-08	da_nop
481	11	107	2026-01-08	tre_han
482	11	108	2026-01-08	da_nop
483	11	109	2026-01-08	da_nop
484	11	110	2026-01-08	tre_han
485	12	67	2026-01-08	da_nop
486	12	68	2026-01-08	da_nop
487	12	69	2026-01-08	da_nop
488	12	70	2026-01-08	da_nop
489	12	71	2026-01-08	da_nop
490	12	72	2026-01-08	da_nop
491	12	73	2026-01-08	tre_han
492	12	74	2026-01-08	da_nop
493	12	75	2026-01-08	da_nop
494	12	76	2026-01-08	da_nop
495	12	77	2026-01-08	da_nop
496	12	78	2026-01-08	da_nop
497	12	79	2026-01-08	da_nop
498	12	80	2026-01-08	da_nop
499	12	81	2026-01-08	tre_han
500	12	82	2026-01-08	da_nop
501	12	83	2026-01-08	da_nop
502	12	84	2026-01-08	da_nop
503	12	85	2026-01-08	da_nop
504	12	86	2026-01-08	da_nop
505	12	87	2026-01-08	da_nop
506	12	88	2026-01-08	da_nop
507	12	89	2026-01-08	da_nop
508	12	90	2026-01-08	da_nop
509	12	91	2026-01-08	da_nop
510	12	92	2026-01-08	da_nop
511	12	93	2026-01-08	da_nop
512	12	94	2026-01-08	da_nop
513	12	95	2026-01-08	da_nop
514	12	96	2026-01-08	da_nop
515	12	97	2026-01-08	tre_han
516	12	98	2026-01-08	da_nop
517	12	99	2026-01-08	da_nop
518	12	100	2026-01-08	da_nop
519	12	101	2026-01-08	da_nop
520	12	102	2026-01-08	da_nop
521	12	103	2026-01-08	da_nop
522	12	104	2026-01-08	da_nop
523	12	105	2026-01-08	da_nop
524	12	106	2026-01-08	tre_han
525	12	107	2026-01-08	da_nop
526	12	108	2026-01-08	da_nop
527	12	109	2026-01-08	tre_han
528	12	110	2026-01-08	da_nop
529	13	67	2026-01-08	da_nop
530	13	68	2026-01-08	da_nop
531	13	69	2026-01-08	da_nop
532	13	70	2026-01-08	tre_han
533	13	71	2026-01-08	da_nop
534	13	72	2026-01-08	da_nop
535	13	73	2026-01-08	da_nop
536	13	74	2026-01-08	tre_han
537	13	75	2026-01-08	da_nop
538	13	76	2026-01-08	da_nop
539	13	77	2026-01-08	tre_han
540	13	78	2026-01-08	da_nop
541	13	79	2026-01-08	tre_han
542	13	80	2026-01-08	da_nop
543	13	81	2026-01-08	da_nop
544	13	82	2026-01-08	da_nop
545	13	83	2026-01-08	da_nop
546	13	84	2026-01-08	da_nop
547	13	85	2026-01-08	da_nop
548	13	86	2026-01-08	tre_han
549	13	87	2026-01-08	da_nop
550	13	88	2026-01-08	da_nop
551	13	89	2026-01-08	da_nop
552	13	90	2026-01-08	da_nop
553	13	91	2026-01-08	tre_han
554	13	92	2026-01-08	da_nop
555	13	93	2026-01-08	da_nop
556	13	94	2026-01-08	da_nop
557	13	95	2026-01-08	tre_han
558	13	96	2026-01-08	tre_han
559	13	97	2026-01-08	da_nop
560	13	98	2026-01-08	da_nop
561	13	99	2026-01-08	da_nop
562	13	100	2026-01-08	da_nop
563	13	101	2026-01-08	da_nop
564	13	102	2026-01-08	da_nop
565	13	103	2026-01-08	da_nop
566	13	104	2026-01-08	da_nop
567	13	105	2026-01-08	da_nop
568	13	106	2026-01-08	da_nop
569	13	107	2026-01-08	tre_han
570	13	108	2026-01-08	da_nop
571	13	109	2026-01-08	da_nop
572	13	110	2026-01-08	da_nop
573	14	67	2026-01-08	da_nop
574	14	68	2026-01-08	da_nop
575	14	69	2026-01-08	da_nop
576	14	70	2026-01-08	da_nop
577	14	71	2026-01-08	da_nop
578	14	72	2026-01-08	da_nop
579	14	73	2026-01-08	da_nop
580	14	74	2026-01-08	da_nop
581	14	75	2026-01-08	da_nop
582	14	76	2026-01-08	da_nop
583	14	77	2026-01-08	da_nop
584	14	78	2026-01-08	da_nop
585	14	79	2026-01-08	da_nop
586	14	80	2026-01-08	da_nop
587	14	81	2026-01-08	da_nop
588	14	82	2026-01-08	da_nop
589	14	83	2026-01-08	tre_han
590	14	84	2026-01-08	tre_han
591	14	85	2026-01-08	da_nop
592	14	86	2026-01-08	da_nop
593	14	87	2026-01-08	da_nop
594	14	88	2026-01-08	da_nop
595	14	89	2026-01-08	da_nop
596	14	90	2026-01-08	da_nop
597	14	91	2026-01-08	da_nop
598	14	92	2026-01-08	da_nop
599	14	93	2026-01-08	da_nop
600	14	94	2026-01-08	tre_han
601	14	95	2026-01-08	da_nop
602	14	96	2026-01-08	da_nop
603	14	97	2026-01-08	da_nop
604	14	98	2026-01-08	da_nop
605	14	99	2026-01-08	da_nop
606	14	100	2026-01-08	da_nop
607	14	101	2026-01-08	da_nop
608	14	102	2026-01-08	da_nop
609	14	103	2026-01-08	da_nop
610	14	104	2026-01-08	da_nop
611	14	105	2026-01-08	da_nop
612	14	106	2026-01-08	tre_han
613	14	107	2026-01-08	tre_han
614	14	108	2026-01-08	da_nop
615	14	109	2026-01-08	da_nop
616	14	110	2026-01-08	da_nop
617	15	67	2026-01-08	da_nop
618	15	68	2026-01-08	da_nop
619	15	69	2026-01-08	tre_han
620	15	70	2026-01-08	da_nop
621	15	71	2026-01-08	da_nop
622	15	72	2026-01-08	da_nop
623	15	73	2026-01-08	da_nop
624	15	74	2026-01-08	da_nop
625	15	75	2026-01-08	da_nop
626	15	76	2026-01-08	da_nop
627	15	77	2026-01-08	da_nop
628	15	78	2026-01-08	da_nop
629	15	79	2026-01-08	da_nop
630	15	80	2026-01-08	tre_han
631	15	81	2026-01-08	da_nop
632	15	82	2026-01-08	da_nop
633	15	83	2026-01-08	da_nop
634	15	84	2026-01-08	da_nop
635	15	85	2026-01-08	da_nop
636	15	86	2026-01-08	tre_han
637	15	87	2026-01-08	da_nop
638	15	88	2026-01-08	tre_han
639	15	89	2026-01-08	da_nop
640	15	90	2026-01-08	da_nop
641	15	91	2026-01-08	da_nop
642	15	92	2026-01-08	da_nop
643	15	93	2026-01-08	da_nop
644	15	94	2026-01-08	da_nop
645	15	95	2026-01-08	da_nop
646	15	96	2026-01-08	da_nop
647	15	97	2026-01-08	da_nop
648	15	98	2026-01-08	tre_han
649	15	99	2026-01-08	da_nop
650	15	100	2026-01-08	da_nop
651	15	101	2026-01-08	da_nop
652	15	102	2026-01-08	da_nop
653	15	103	2026-01-08	da_nop
654	15	104	2026-01-08	tre_han
655	15	105	2026-01-08	da_nop
656	15	106	2026-01-08	da_nop
657	15	107	2026-01-08	da_nop
658	15	108	2026-01-08	tre_han
659	15	109	2026-01-08	tre_han
660	15	110	2026-01-08	tre_han
661	16	67	2026-01-08	da_nop
662	16	68	2026-01-08	tre_han
663	16	69	2026-01-08	da_nop
664	16	70	2026-01-08	da_nop
665	16	71	2026-01-08	da_nop
666	16	72	2026-01-08	da_nop
667	16	73	2026-01-08	da_nop
668	16	74	2026-01-08	da_nop
669	16	75	2026-01-08	tre_han
670	16	76	2026-01-08	tre_han
671	16	77	2026-01-08	da_nop
672	16	78	2026-01-08	da_nop
673	16	79	2026-01-08	da_nop
674	16	80	2026-01-08	tre_han
675	16	81	2026-01-08	da_nop
676	16	82	2026-01-08	da_nop
677	16	83	2026-01-08	da_nop
678	16	84	2026-01-08	da_nop
679	16	85	2026-01-08	da_nop
680	16	86	2026-01-08	da_nop
681	16	87	2026-01-08	da_nop
682	16	88	2026-01-08	da_nop
683	16	89	2026-01-08	tre_han
684	16	90	2026-01-08	tre_han
685	16	91	2026-01-08	da_nop
686	16	92	2026-01-08	da_nop
687	16	93	2026-01-08	da_nop
688	16	94	2026-01-08	da_nop
689	16	95	2026-01-08	da_nop
690	16	96	2026-01-08	da_nop
691	16	97	2026-01-08	tre_han
692	16	98	2026-01-08	da_nop
693	16	99	2026-01-08	da_nop
694	16	100	2026-01-08	da_nop
695	16	101	2026-01-08	da_nop
696	16	102	2026-01-08	da_nop
697	16	103	2026-01-08	da_nop
698	16	104	2026-01-08	tre_han
699	16	105	2026-01-08	da_nop
700	16	106	2026-01-08	tre_han
701	16	107	2026-01-08	da_nop
702	16	108	2026-01-08	da_nop
703	16	109	2026-01-08	da_nop
704	16	110	2026-01-08	tre_han
705	17	67	2026-01-08	tre_han
706	17	68	2026-01-08	da_nop
707	17	69	2026-01-08	da_nop
708	17	70	2026-01-08	da_nop
709	17	71	2026-01-08	da_nop
710	17	72	2026-01-08	da_nop
711	17	73	2026-01-08	da_nop
712	17	74	2026-01-08	da_nop
713	17	75	2026-01-08	da_nop
714	17	76	2026-01-08	da_nop
715	17	77	2026-01-08	da_nop
716	17	78	2026-01-08	tre_han
717	17	79	2026-01-08	da_nop
718	17	80	2026-01-08	da_nop
719	17	81	2026-01-08	da_nop
720	17	82	2026-01-08	tre_han
721	17	83	2026-01-08	da_nop
722	17	84	2026-01-08	da_nop
723	17	85	2026-01-08	da_nop
724	17	86	2026-01-08	da_nop
725	17	87	2026-01-08	da_nop
726	17	88	2026-01-08	da_nop
727	17	89	2026-01-08	da_nop
728	17	90	2026-01-08	da_nop
729	17	91	2026-01-08	da_nop
730	17	92	2026-01-08	tre_han
731	17	93	2026-01-08	da_nop
732	17	94	2026-01-08	da_nop
733	17	95	2026-01-08	da_nop
734	17	96	2026-01-08	da_nop
735	17	97	2026-01-08	da_nop
736	17	98	2026-01-08	da_nop
737	17	99	2026-01-08	da_nop
738	17	100	2026-01-08	da_nop
739	17	101	2026-01-08	da_nop
740	17	102	2026-01-08	da_nop
741	17	103	2026-01-08	da_nop
742	17	104	2026-01-08	da_nop
743	17	105	2026-01-08	tre_han
744	17	106	2026-01-08	da_nop
745	17	107	2026-01-08	tre_han
746	17	108	2026-01-08	da_nop
747	17	109	2026-01-08	da_nop
748	17	110	2026-01-08	tre_han
749	18	67	2026-01-08	da_nop
750	18	68	2026-01-08	da_nop
751	18	69	2026-01-08	da_nop
752	18	70	2026-01-08	da_nop
753	18	71	2026-01-08	tre_han
754	18	72	2026-01-08	da_nop
755	18	73	2026-01-08	da_nop
756	18	74	2026-01-08	da_nop
757	18	75	2026-01-08	tre_han
758	18	76	2026-01-08	da_nop
759	18	77	2026-01-08	da_nop
760	18	78	2026-01-08	da_nop
761	18	79	2026-01-08	da_nop
762	18	80	2026-01-08	da_nop
763	18	81	2026-01-08	da_nop
764	18	82	2026-01-08	tre_han
765	18	83	2026-01-08	da_nop
766	18	84	2026-01-08	tre_han
767	18	85	2026-01-08	da_nop
768	18	86	2026-01-08	da_nop
769	18	87	2026-01-08	da_nop
770	18	88	2026-01-08	tre_han
771	18	89	2026-01-08	da_nop
772	18	90	2026-01-08	tre_han
773	18	91	2026-01-08	da_nop
774	18	92	2026-01-08	da_nop
775	18	93	2026-01-08	da_nop
776	18	94	2026-01-08	tre_han
777	18	95	2026-01-08	tre_han
778	18	96	2026-01-08	da_nop
779	18	97	2026-01-08	da_nop
780	18	98	2026-01-08	da_nop
781	18	99	2026-01-08	da_nop
782	18	100	2026-01-08	tre_han
783	18	101	2026-01-08	da_nop
784	18	102	2026-01-08	da_nop
785	18	103	2026-01-08	da_nop
786	18	104	2026-01-08	da_nop
787	18	105	2026-01-08	da_nop
788	18	106	2026-01-08	da_nop
789	18	107	2026-01-08	da_nop
790	18	108	2026-01-08	da_nop
791	18	109	2026-01-08	da_nop
792	18	110	2026-01-08	tre_han
793	19	67	2026-01-08	da_nop
794	19	68	2026-01-08	da_nop
795	19	69	2026-01-08	da_nop
796	19	70	2026-01-08	da_nop
797	19	71	2026-01-08	da_nop
798	19	72	2026-01-08	tre_han
799	19	73	2026-01-08	tre_han
800	19	74	2026-01-08	da_nop
801	19	75	2026-01-08	tre_han
802	19	76	2026-01-08	da_nop
803	19	77	2026-01-08	da_nop
804	19	78	2026-01-08	da_nop
805	19	79	2026-01-08	da_nop
806	19	80	2026-01-08	da_nop
807	19	81	2026-01-08	da_nop
808	19	82	2026-01-08	da_nop
809	19	83	2026-01-08	da_nop
810	19	84	2026-01-08	da_nop
811	19	85	2026-01-08	da_nop
812	19	86	2026-01-08	da_nop
813	19	87	2026-01-08	da_nop
814	19	88	2026-01-08	tre_han
815	19	89	2026-01-08	da_nop
816	19	90	2026-01-08	da_nop
817	19	91	2026-01-08	da_nop
818	19	92	2026-01-08	tre_han
819	19	93	2026-01-08	da_nop
820	19	94	2026-01-08	da_nop
821	19	95	2026-01-08	da_nop
822	19	96	2026-01-08	da_nop
823	19	97	2026-01-08	da_nop
824	19	98	2026-01-08	da_nop
825	19	99	2026-01-08	tre_han
826	19	100	2026-01-08	da_nop
827	19	101	2026-01-08	da_nop
828	19	102	2026-01-08	da_nop
829	19	103	2026-01-08	tre_han
830	19	104	2026-01-08	tre_han
831	19	105	2026-01-08	da_nop
832	19	106	2026-01-08	tre_han
833	19	107	2026-01-08	da_nop
834	19	108	2026-01-08	da_nop
835	19	109	2026-01-08	da_nop
836	19	110	2026-01-08	da_nop
837	20	67	2026-01-08	tre_han
838	20	68	2026-01-08	tre_han
839	20	69	2026-01-08	da_nop
840	20	70	2026-01-08	da_nop
841	20	71	2026-01-08	da_nop
842	20	72	2026-01-08	da_nop
843	20	73	2026-01-08	tre_han
844	20	74	2026-01-08	da_nop
845	20	75	2026-01-08	da_nop
846	20	76	2026-01-08	da_nop
847	20	77	2026-01-08	da_nop
848	20	78	2026-01-08	tre_han
849	20	79	2026-01-08	da_nop
850	20	80	2026-01-08	tre_han
851	20	81	2026-01-08	da_nop
852	20	82	2026-01-08	da_nop
853	20	83	2026-01-08	tre_han
854	20	84	2026-01-08	da_nop
855	20	85	2026-01-08	da_nop
856	20	86	2026-01-08	da_nop
857	20	87	2026-01-08	da_nop
858	20	88	2026-01-08	da_nop
859	20	89	2026-01-08	tre_han
860	20	90	2026-01-08	da_nop
861	20	91	2026-01-08	da_nop
862	20	92	2026-01-08	da_nop
863	20	93	2026-01-08	da_nop
864	20	94	2026-01-08	da_nop
865	20	95	2026-01-08	da_nop
866	20	96	2026-01-08	da_nop
867	20	97	2026-01-08	tre_han
868	20	98	2026-01-08	da_nop
869	20	99	2026-01-08	tre_han
870	20	100	2026-01-08	da_nop
871	20	101	2026-01-08	tre_han
872	20	102	2026-01-08	da_nop
873	20	103	2026-01-08	da_nop
874	20	104	2026-01-08	da_nop
875	20	105	2026-01-08	da_nop
876	20	106	2026-01-08	da_nop
877	20	107	2026-01-08	da_nop
878	20	108	2026-01-08	da_nop
879	20	109	2026-01-08	da_nop
880	20	110	2026-01-08	da_nop
881	21	67	2026-01-08	da_nop
882	21	68	2026-01-08	tre_han
883	21	69	2026-01-08	tre_han
884	21	70	2026-01-08	da_nop
885	21	71	2026-01-08	tre_han
886	21	72	2026-01-08	da_nop
887	21	73	2026-01-08	da_nop
888	21	74	2026-01-08	tre_han
889	21	75	2026-01-08	da_nop
890	21	76	2026-01-08	da_nop
891	21	77	2026-01-08	da_nop
892	21	78	2026-01-08	da_nop
893	21	79	2026-01-08	da_nop
894	21	80	2026-01-08	da_nop
895	21	81	2026-01-08	da_nop
896	21	82	2026-01-08	da_nop
897	21	83	2026-01-08	da_nop
898	21	84	2026-01-08	da_nop
899	21	85	2026-01-08	da_nop
900	21	86	2026-01-08	da_nop
901	21	87	2026-01-08	da_nop
902	21	88	2026-01-08	da_nop
903	21	89	2026-01-08	da_nop
904	21	90	2026-01-08	da_nop
905	21	91	2026-01-08	tre_han
906	21	92	2026-01-08	tre_han
907	21	93	2026-01-08	da_nop
908	21	94	2026-01-08	da_nop
909	21	95	2026-01-08	tre_han
910	21	96	2026-01-08	da_nop
911	21	97	2026-01-08	da_nop
912	21	98	2026-01-08	da_nop
913	21	99	2026-01-08	da_nop
914	21	100	2026-01-08	da_nop
915	21	101	2026-01-08	da_nop
916	21	102	2026-01-08	da_nop
917	21	103	2026-01-08	tre_han
918	21	104	2026-01-08	da_nop
919	21	105	2026-01-08	da_nop
920	21	106	2026-01-08	tre_han
921	21	107	2026-01-08	tre_han
922	21	108	2026-01-08	da_nop
923	21	109	2026-01-08	da_nop
924	21	110	2026-01-08	da_nop
925	22	67	2026-01-08	tre_han
926	22	68	2026-01-08	da_nop
927	22	69	2026-01-08	tre_han
928	22	70	2026-01-08	da_nop
929	22	71	2026-01-08	da_nop
930	22	72	2026-01-08	da_nop
931	22	73	2026-01-08	da_nop
932	22	74	2026-01-08	tre_han
933	22	75	2026-01-08	da_nop
934	22	76	2026-01-08	da_nop
935	22	77	2026-01-08	da_nop
936	22	78	2026-01-08	da_nop
937	22	79	2026-01-08	tre_han
938	22	80	2026-01-08	da_nop
939	22	81	2026-01-08	tre_han
940	22	82	2026-01-08	da_nop
941	22	83	2026-01-08	tre_han
942	22	84	2026-01-08	da_nop
943	22	85	2026-01-08	da_nop
944	22	86	2026-01-08	da_nop
945	22	87	2026-01-08	da_nop
946	22	88	2026-01-08	tre_han
947	22	89	2026-01-08	da_nop
948	22	90	2026-01-08	tre_han
949	22	91	2026-01-08	da_nop
950	22	92	2026-01-08	da_nop
951	22	93	2026-01-08	da_nop
952	22	94	2026-01-08	da_nop
953	22	95	2026-01-08	da_nop
954	22	96	2026-01-08	da_nop
955	22	97	2026-01-08	da_nop
956	22	98	2026-01-08	tre_han
957	22	99	2026-01-08	da_nop
958	22	100	2026-01-08	da_nop
959	22	101	2026-01-08	tre_han
960	22	102	2026-01-08	da_nop
961	22	103	2026-01-08	tre_han
962	22	104	2026-01-08	da_nop
963	22	105	2026-01-08	da_nop
964	22	106	2026-01-08	da_nop
965	22	107	2026-01-08	da_nop
966	22	108	2026-01-08	da_nop
967	22	109	2026-01-08	tre_han
968	22	110	2026-01-08	da_nop
969	23	67	2026-01-08	da_nop
970	23	68	2026-01-08	da_nop
971	23	69	2026-01-08	da_nop
972	23	70	2026-01-08	da_nop
973	23	71	2026-01-08	tre_han
974	23	72	2026-01-08	tre_han
975	23	73	2026-01-08	da_nop
976	23	74	2026-01-08	da_nop
977	23	75	2026-01-08	da_nop
978	23	76	2026-01-08	da_nop
979	23	77	2026-01-08	da_nop
980	23	78	2026-01-08	da_nop
981	23	79	2026-01-08	da_nop
982	23	80	2026-01-08	da_nop
983	23	81	2026-01-08	da_nop
984	23	82	2026-01-08	da_nop
985	23	83	2026-01-08	da_nop
986	23	84	2026-01-08	tre_han
987	23	85	2026-01-08	tre_han
988	23	86	2026-01-08	tre_han
989	23	87	2026-01-08	da_nop
990	23	88	2026-01-08	da_nop
991	23	89	2026-01-08	da_nop
992	23	90	2026-01-08	da_nop
993	23	91	2026-01-08	da_nop
994	23	92	2026-01-08	da_nop
995	23	93	2026-01-08	da_nop
996	23	94	2026-01-08	da_nop
997	23	95	2026-01-08	da_nop
998	23	96	2026-01-08	tre_han
999	23	97	2026-01-08	da_nop
1000	23	98	2026-01-08	da_nop
1001	23	99	2026-01-08	da_nop
1002	23	100	2026-01-08	tre_han
1003	23	101	2026-01-08	da_nop
1004	23	102	2026-01-08	da_nop
1005	23	103	2026-01-08	da_nop
1006	23	104	2026-01-08	da_nop
1007	23	105	2026-01-08	da_nop
1008	23	106	2026-01-08	da_nop
1009	23	107	2026-01-08	da_nop
1010	23	108	2026-01-08	da_nop
1011	23	109	2026-01-08	tre_han
1012	23	110	2026-01-08	da_nop
1013	24	67	2026-01-08	da_nop
1014	24	68	2026-01-08	da_nop
1015	24	69	2026-01-08	tre_han
1016	24	70	2026-01-08	da_nop
1017	24	71	2026-01-08	da_nop
1018	24	72	2026-01-08	da_nop
1019	24	73	2026-01-08	da_nop
1020	24	74	2026-01-08	da_nop
1021	24	75	2026-01-08	da_nop
1022	24	76	2026-01-08	da_nop
1023	24	77	2026-01-08	tre_han
1024	24	78	2026-01-08	da_nop
1025	24	79	2026-01-08	da_nop
1026	24	80	2026-01-08	da_nop
1027	24	81	2026-01-08	da_nop
1028	24	82	2026-01-08	da_nop
1029	24	83	2026-01-08	da_nop
1030	24	84	2026-01-08	da_nop
1031	24	85	2026-01-08	da_nop
1032	24	86	2026-01-08	da_nop
1033	24	87	2026-01-08	da_nop
1034	24	88	2026-01-08	da_nop
1035	24	89	2026-01-08	tre_han
1036	24	90	2026-01-08	da_nop
1037	24	91	2026-01-08	da_nop
1038	24	92	2026-01-08	da_nop
1039	24	93	2026-01-08	da_nop
1040	24	94	2026-01-08	tre_han
1041	24	95	2026-01-08	tre_han
1042	24	96	2026-01-08	tre_han
1043	24	97	2026-01-08	da_nop
1044	24	98	2026-01-08	da_nop
1045	24	99	2026-01-08	da_nop
1046	24	100	2026-01-08	tre_han
1047	24	101	2026-01-08	da_nop
1048	24	102	2026-01-08	da_nop
1049	24	103	2026-01-08	da_nop
1050	24	104	2026-01-08	da_nop
1051	24	105	2026-01-08	da_nop
1052	24	106	2026-01-08	da_nop
1053	24	107	2026-01-08	tre_han
1054	24	108	2026-01-08	da_nop
1055	24	109	2026-01-08	da_nop
1056	24	110	2026-01-08	tre_han
1057	25	67	2026-01-08	tre_han
1058	25	68	2026-01-08	da_nop
1059	25	69	2026-01-08	da_nop
1060	25	70	2026-01-08	da_nop
1061	25	71	2026-01-08	da_nop
1062	25	72	2026-01-08	da_nop
1063	25	73	2026-01-08	tre_han
1064	25	74	2026-01-08	da_nop
1065	25	75	2026-01-08	da_nop
1066	25	76	2026-01-08	da_nop
1067	25	77	2026-01-08	da_nop
1068	25	78	2026-01-08	da_nop
1069	25	79	2026-01-08	da_nop
1070	25	80	2026-01-08	da_nop
1071	25	81	2026-01-08	da_nop
1072	25	82	2026-01-08	tre_han
1073	25	83	2026-01-08	da_nop
1074	25	84	2026-01-08	da_nop
1075	25	85	2026-01-08	da_nop
1076	25	86	2026-01-08	da_nop
1077	25	87	2026-01-08	da_nop
1078	25	88	2026-01-08	da_nop
1079	25	89	2026-01-08	tre_han
1080	25	90	2026-01-08	tre_han
1081	25	91	2026-01-08	da_nop
1082	25	92	2026-01-08	da_nop
1083	25	93	2026-01-08	da_nop
1084	25	94	2026-01-08	da_nop
1085	25	95	2026-01-08	da_nop
1086	25	96	2026-01-08	da_nop
1087	25	97	2026-01-08	tre_han
1088	25	98	2026-01-08	da_nop
1089	25	99	2026-01-08	da_nop
1090	25	100	2026-01-08	tre_han
1091	25	101	2026-01-08	tre_han
1092	25	102	2026-01-08	da_nop
1093	25	103	2026-01-08	da_nop
1094	25	104	2026-01-08	tre_han
1095	25	105	2026-01-08	da_nop
1096	25	106	2026-01-08	da_nop
1097	25	107	2026-01-08	da_nop
1098	25	108	2026-01-08	da_nop
1099	25	109	2026-01-08	da_nop
1100	25	110	2026-01-08	da_nop
1101	26	67	2026-01-08	da_nop
1102	26	68	2026-01-08	da_nop
1103	26	69	2026-01-08	da_nop
1104	26	70	2026-01-08	da_nop
1105	26	71	2026-01-08	da_nop
1106	26	72	2026-01-08	da_nop
1107	26	73	2026-01-08	da_nop
1108	26	74	2026-01-08	da_nop
1109	26	75	2026-01-08	da_nop
1110	26	76	2026-01-08	da_nop
1111	26	77	2026-01-08	da_nop
1112	26	78	2026-01-08	da_nop
1113	26	79	2026-01-08	tre_han
1114	26	80	2026-01-08	da_nop
1115	26	81	2026-01-08	da_nop
1116	26	82	2026-01-08	da_nop
1117	26	83	2026-01-08	da_nop
1118	26	84	2026-01-08	da_nop
1119	26	85	2026-01-08	tre_han
1120	26	86	2026-01-08	da_nop
1121	26	87	2026-01-08	tre_han
1122	26	88	2026-01-08	da_nop
1123	26	89	2026-01-08	da_nop
1124	26	90	2026-01-08	da_nop
1125	26	91	2026-01-08	da_nop
1126	26	92	2026-01-08	da_nop
1127	26	93	2026-01-08	da_nop
1128	26	94	2026-01-08	tre_han
1129	26	95	2026-01-08	da_nop
1130	26	96	2026-01-08	da_nop
1131	26	97	2026-01-08	tre_han
1132	26	98	2026-01-08	da_nop
1133	26	99	2026-01-08	da_nop
1134	26	100	2026-01-08	da_nop
1135	26	101	2026-01-08	da_nop
1136	26	102	2026-01-08	da_nop
1137	26	103	2026-01-08	da_nop
1138	26	104	2026-01-08	da_nop
1139	26	105	2026-01-08	da_nop
1140	26	106	2026-01-08	tre_han
1141	26	107	2026-01-08	da_nop
1142	26	108	2026-01-08	da_nop
1143	26	109	2026-01-08	da_nop
1144	26	110	2026-01-08	da_nop
1145	27	67	2026-01-08	da_nop
1146	27	68	2026-01-08	da_nop
1147	27	69	2026-01-08	da_nop
1148	27	70	2026-01-08	tre_han
1149	27	71	2026-01-08	da_nop
1150	27	72	2026-01-08	da_nop
1151	27	73	2026-01-08	da_nop
1152	27	74	2026-01-08	da_nop
1153	27	75	2026-01-08	da_nop
1154	27	76	2026-01-08	tre_han
1155	27	77	2026-01-08	da_nop
1156	27	78	2026-01-08	da_nop
1157	27	79	2026-01-08	tre_han
1158	27	80	2026-01-08	da_nop
1159	27	81	2026-01-08	tre_han
1160	27	82	2026-01-08	da_nop
1161	27	83	2026-01-08	da_nop
1162	27	84	2026-01-08	da_nop
1163	27	85	2026-01-08	da_nop
1164	27	86	2026-01-08	da_nop
1165	27	87	2026-01-08	tre_han
1166	27	88	2026-01-08	da_nop
1167	27	89	2026-01-08	da_nop
1168	27	90	2026-01-08	da_nop
1169	27	91	2026-01-08	tre_han
1170	27	92	2026-01-08	da_nop
1171	27	93	2026-01-08	da_nop
1172	27	94	2026-01-08	da_nop
1173	27	95	2026-01-08	tre_han
1174	27	96	2026-01-08	da_nop
1175	27	97	2026-01-08	tre_han
1176	27	98	2026-01-08	da_nop
1177	27	99	2026-01-08	da_nop
1178	27	100	2026-01-08	da_nop
1179	27	101	2026-01-08	da_nop
1180	27	102	2026-01-08	da_nop
1181	27	103	2026-01-08	da_nop
1182	27	104	2026-01-08	tre_han
1183	27	105	2026-01-08	da_nop
1184	27	106	2026-01-08	tre_han
1185	27	107	2026-01-08	da_nop
1186	27	108	2026-01-08	da_nop
1187	27	109	2026-01-08	da_nop
1188	27	110	2026-01-08	da_nop
1189	28	67	2026-01-08	da_nop
1190	28	68	2026-01-08	da_nop
1191	28	69	2026-01-08	da_nop
1192	28	70	2026-01-08	da_nop
1193	28	71	2026-01-08	da_nop
1194	28	72	2026-01-08	da_nop
1195	28	73	2026-01-08	da_nop
1196	28	74	2026-01-08	da_nop
1197	28	75	2026-01-08	tre_han
1198	28	76	2026-01-08	da_nop
1199	28	77	2026-01-08	da_nop
1200	28	78	2026-01-08	da_nop
1201	28	79	2026-01-08	da_nop
1202	28	80	2026-01-08	da_nop
1203	28	81	2026-01-08	da_nop
1204	28	82	2026-01-08	tre_han
1205	28	83	2026-01-08	tre_han
1206	28	84	2026-01-08	da_nop
1207	28	85	2026-01-08	da_nop
1208	28	86	2026-01-08	da_nop
1209	28	87	2026-01-08	tre_han
1210	28	88	2026-01-08	da_nop
1211	28	89	2026-01-08	da_nop
1212	28	90	2026-01-08	tre_han
1213	28	91	2026-01-08	tre_han
1214	28	92	2026-01-08	da_nop
1215	28	93	2026-01-08	da_nop
1216	28	94	2026-01-08	da_nop
1217	28	95	2026-01-08	da_nop
1218	28	96	2026-01-08	tre_han
1219	28	97	2026-01-08	tre_han
1220	28	98	2026-01-08	da_nop
1221	28	99	2026-01-08	da_nop
1222	28	100	2026-01-08	da_nop
1223	28	101	2026-01-08	da_nop
1224	28	102	2026-01-08	da_nop
1225	28	103	2026-01-08	da_nop
1226	28	104	2026-01-08	da_nop
1227	28	105	2026-01-08	tre_han
1228	28	106	2026-01-08	da_nop
1229	28	107	2026-01-08	da_nop
1230	28	108	2026-01-08	da_nop
1231	28	109	2026-01-08	da_nop
1232	28	110	2026-01-08	da_nop
1233	29	67	2026-01-08	da_nop
1234	29	68	2026-01-08	da_nop
1235	29	69	2026-01-08	da_nop
1236	29	70	2026-01-08	da_nop
1237	29	71	2026-01-08	da_nop
1238	29	72	2026-01-08	da_nop
1239	29	73	2026-01-08	da_nop
1240	29	74	2026-01-08	da_nop
1241	29	75	2026-01-08	da_nop
1242	29	76	2026-01-08	da_nop
1243	29	77	2026-01-08	tre_han
1244	29	78	2026-01-08	tre_han
1245	29	79	2026-01-08	tre_han
1246	29	80	2026-01-08	da_nop
1247	29	81	2026-01-08	da_nop
1248	29	82	2026-01-08	tre_han
1249	29	83	2026-01-08	da_nop
1250	29	84	2026-01-08	da_nop
1251	29	85	2026-01-08	da_nop
1252	29	86	2026-01-08	tre_han
1253	29	87	2026-01-08	da_nop
1254	29	88	2026-01-08	da_nop
1255	29	89	2026-01-08	da_nop
1256	29	90	2026-01-08	da_nop
1257	29	91	2026-01-08	da_nop
1258	29	92	2026-01-08	da_nop
1259	29	93	2026-01-08	da_nop
1260	29	94	2026-01-08	da_nop
1261	29	95	2026-01-08	da_nop
1262	29	96	2026-01-08	da_nop
1263	29	97	2026-01-08	da_nop
1264	29	98	2026-01-08	tre_han
1265	29	99	2026-01-08	da_nop
1266	29	100	2026-01-08	da_nop
1267	29	101	2026-01-08	da_nop
1268	29	102	2026-01-08	da_nop
1269	29	103	2026-01-08	da_nop
1270	29	104	2026-01-08	da_nop
1271	29	105	2026-01-08	tre_han
1272	29	106	2026-01-08	da_nop
1273	29	107	2026-01-08	da_nop
1274	29	108	2026-01-08	da_nop
1275	29	109	2026-01-08	da_nop
1276	29	110	2026-01-08	da_nop
1277	30	67	2026-01-08	da_nop
1278	30	68	2026-01-08	da_nop
1279	30	69	2026-01-08	da_nop
1280	30	70	2026-01-08	da_nop
1281	30	71	2026-01-08	da_nop
1282	30	72	2026-01-08	da_nop
1283	30	73	2026-01-08	da_nop
1284	30	74	2026-01-08	da_nop
1285	30	75	2026-01-08	da_nop
1286	30	76	2026-01-08	da_nop
1287	30	77	2026-01-08	da_nop
1288	30	78	2026-01-08	da_nop
1289	30	79	2026-01-08	da_nop
1290	30	80	2026-01-08	da_nop
1291	30	81	2026-01-08	da_nop
1292	30	82	2026-01-08	da_nop
1293	30	83	2026-01-08	da_nop
1294	30	84	2026-01-08	da_nop
1295	30	85	2026-01-08	da_nop
1296	30	86	2026-01-08	da_nop
1297	30	87	2026-01-08	da_nop
1298	30	88	2026-01-08	tre_han
1299	30	89	2026-01-08	da_nop
1300	30	90	2026-01-08	tre_han
1301	30	91	2026-01-08	da_nop
1302	30	92	2026-01-08	da_nop
1303	30	93	2026-01-08	da_nop
1304	30	94	2026-01-08	da_nop
1305	30	95	2026-01-08	da_nop
1306	30	96	2026-01-08	da_nop
1307	30	97	2026-01-08	tre_han
1308	30	98	2026-01-08	da_nop
1309	30	99	2026-01-08	da_nop
1310	30	100	2026-01-08	tre_han
1311	30	101	2026-01-08	tre_han
1312	30	102	2026-01-08	da_nop
1313	30	103	2026-01-08	tre_han
1314	30	104	2026-01-08	da_nop
1315	30	105	2026-01-08	da_nop
1316	30	106	2026-01-08	da_nop
1317	30	107	2026-01-08	tre_han
1318	30	108	2026-01-08	da_nop
1319	30	109	2026-01-08	da_nop
1320	30	110	2026-01-08	da_nop
1321	31	67	2026-01-08	da_nop
1322	31	68	2026-01-08	tre_han
1323	31	69	2026-01-08	da_nop
1324	31	70	2026-01-08	da_nop
1325	31	71	2026-01-08	tre_han
1326	31	72	2026-01-08	da_nop
1327	31	73	2026-01-08	da_nop
1328	31	74	2026-01-08	da_nop
1329	31	75	2026-01-08	tre_han
1330	31	76	2026-01-08	da_nop
1331	31	77	2026-01-08	da_nop
1332	31	78	2026-01-08	da_nop
1333	31	79	2026-01-08	da_nop
1334	31	80	2026-01-08	da_nop
1335	31	81	2026-01-08	da_nop
1336	31	82	2026-01-08	da_nop
1337	31	83	2026-01-08	da_nop
1338	31	84	2026-01-08	da_nop
1339	31	85	2026-01-08	da_nop
1340	31	86	2026-01-08	da_nop
1341	31	87	2026-01-08	da_nop
1342	31	88	2026-01-08	tre_han
1343	31	89	2026-01-08	da_nop
1344	31	90	2026-01-08	tre_han
1345	31	91	2026-01-08	tre_han
1346	31	92	2026-01-08	tre_han
1347	31	93	2026-01-08	tre_han
1348	31	94	2026-01-08	da_nop
1349	31	95	2026-01-08	da_nop
1350	31	96	2026-01-08	tre_han
1351	31	97	2026-01-08	da_nop
1352	31	98	2026-01-08	tre_han
1353	31	99	2026-01-08	da_nop
1354	31	100	2026-01-08	da_nop
1355	31	101	2026-01-08	da_nop
1356	31	102	2026-01-08	da_nop
1357	31	103	2026-01-08	tre_han
1358	31	104	2026-01-08	da_nop
1359	31	105	2026-01-08	da_nop
1360	31	106	2026-01-08	da_nop
1361	31	107	2026-01-08	da_nop
1362	31	108	2026-01-08	da_nop
1363	31	109	2026-01-08	da_nop
1364	31	110	2026-01-08	da_nop
1365	32	67	2026-01-08	da_nop
1366	32	68	2026-01-08	da_nop
1367	32	69	2026-01-08	da_nop
1368	32	70	2026-01-08	tre_han
1369	32	71	2026-01-08	tre_han
1370	32	72	2026-01-08	da_nop
1371	32	73	2026-01-08	da_nop
1372	32	74	2026-01-08	da_nop
1373	32	75	2026-01-08	da_nop
1374	32	76	2026-01-08	da_nop
1375	32	77	2026-01-08	da_nop
1376	32	78	2026-01-08	da_nop
1377	32	79	2026-01-08	da_nop
1378	32	80	2026-01-08	da_nop
1379	32	81	2026-01-08	da_nop
1380	32	82	2026-01-08	da_nop
1381	32	83	2026-01-08	da_nop
1382	32	84	2026-01-08	da_nop
1383	32	85	2026-01-08	da_nop
1384	32	86	2026-01-08	da_nop
1385	32	87	2026-01-08	da_nop
1386	32	88	2026-01-08	da_nop
1387	32	89	2026-01-08	da_nop
1388	32	90	2026-01-08	tre_han
1389	32	91	2026-01-08	da_nop
1390	32	92	2026-01-08	da_nop
1391	32	93	2026-01-08	da_nop
1392	32	94	2026-01-08	da_nop
1393	32	95	2026-01-08	da_nop
1394	32	96	2026-01-08	da_nop
1395	32	97	2026-01-08	da_nop
1396	32	98	2026-01-08	da_nop
1397	32	99	2026-01-08	da_nop
1398	32	100	2026-01-08	da_nop
1399	32	101	2026-01-08	da_nop
1400	32	102	2026-01-08	da_nop
1401	32	103	2026-01-08	tre_han
1402	32	104	2026-01-08	da_nop
1403	32	105	2026-01-08	da_nop
1404	32	106	2026-01-08	da_nop
1405	32	107	2026-01-08	da_nop
1406	32	108	2026-01-08	da_nop
1407	32	109	2026-01-08	da_nop
1408	32	110	2026-01-08	da_nop
1409	33	67	2026-01-08	da_nop
1410	33	68	2026-01-08	da_nop
1411	33	69	2026-01-08	da_nop
1412	33	70	2026-01-08	tre_han
1413	33	71	2026-01-08	da_nop
1414	33	72	2026-01-08	da_nop
1415	33	73	2026-01-08	da_nop
1416	33	74	2026-01-08	tre_han
1417	33	75	2026-01-08	da_nop
1418	33	76	2026-01-08	da_nop
1419	33	77	2026-01-08	da_nop
1420	33	78	2026-01-08	da_nop
1421	33	79	2026-01-08	tre_han
1422	33	80	2026-01-08	da_nop
1423	33	81	2026-01-08	da_nop
1424	33	82	2026-01-08	tre_han
1425	33	83	2026-01-08	tre_han
1426	33	84	2026-01-08	da_nop
1427	33	85	2026-01-08	da_nop
1428	33	86	2026-01-08	da_nop
1429	33	87	2026-01-08	da_nop
1430	33	88	2026-01-08	da_nop
1431	33	89	2026-01-08	da_nop
1432	33	90	2026-01-08	da_nop
1433	33	91	2026-01-08	da_nop
1434	33	92	2026-01-08	tre_han
1435	33	93	2026-01-08	da_nop
1436	33	94	2026-01-08	da_nop
1437	33	95	2026-01-08	da_nop
1438	33	96	2026-01-08	da_nop
1439	33	97	2026-01-08	da_nop
1440	33	98	2026-01-08	tre_han
1441	33	99	2026-01-08	da_nop
1442	33	100	2026-01-08	da_nop
1443	33	101	2026-01-08	da_nop
1444	33	102	2026-01-08	tre_han
1445	33	103	2026-01-08	tre_han
1446	33	104	2026-01-08	da_nop
1447	33	105	2026-01-08	da_nop
1448	33	106	2026-01-08	tre_han
1449	33	107	2026-01-08	da_nop
1450	33	108	2026-01-08	da_nop
1451	33	109	2026-01-08	da_nop
1452	33	110	2026-01-08	tre_han
1453	34	67	2026-01-08	da_nop
1454	34	68	2026-01-08	tre_han
1455	34	69	2026-01-08	da_nop
1456	34	70	2026-01-08	da_nop
1457	34	71	2026-01-08	da_nop
1458	34	72	2026-01-08	tre_han
1459	34	73	2026-01-08	da_nop
1460	34	74	2026-01-08	tre_han
1461	34	75	2026-01-08	da_nop
1462	34	76	2026-01-08	tre_han
1463	34	77	2026-01-08	da_nop
1464	34	78	2026-01-08	da_nop
1465	34	79	2026-01-08	da_nop
1466	34	80	2026-01-08	da_nop
1467	34	81	2026-01-08	da_nop
1468	34	82	2026-01-08	da_nop
1469	34	83	2026-01-08	da_nop
1470	34	84	2026-01-08	da_nop
1471	34	85	2026-01-08	da_nop
1472	34	86	2026-01-08	da_nop
1473	34	87	2026-01-08	da_nop
1474	34	88	2026-01-08	da_nop
1475	34	89	2026-01-08	da_nop
1476	34	90	2026-01-08	da_nop
1477	34	91	2026-01-08	tre_han
1478	34	92	2026-01-08	da_nop
1479	34	93	2026-01-08	da_nop
1480	34	94	2026-01-08	tre_han
1481	34	95	2026-01-08	tre_han
1482	34	96	2026-01-08	tre_han
1483	34	97	2026-01-08	da_nop
1484	34	98	2026-01-08	tre_han
1485	34	99	2026-01-08	da_nop
1486	34	100	2026-01-08	tre_han
1487	34	101	2026-01-08	da_nop
1488	34	102	2026-01-08	tre_han
1489	34	103	2026-01-08	da_nop
1490	34	104	2026-01-08	da_nop
1491	34	105	2026-01-08	da_nop
1492	34	106	2026-01-08	da_nop
1493	34	107	2026-01-08	da_nop
1494	34	108	2026-01-08	tre_han
1495	34	109	2026-01-08	da_nop
1496	34	110	2026-01-08	da_nop
1497	35	67	2026-01-08	da_nop
1498	35	68	2026-01-08	da_nop
1499	35	69	2026-01-08	da_nop
1500	35	70	2026-01-08	da_nop
1501	35	71	2026-01-08	tre_han
1502	35	72	2026-01-08	tre_han
1503	35	73	2026-01-08	da_nop
1504	35	74	2026-01-08	da_nop
1505	35	75	2026-01-08	da_nop
1506	35	76	2026-01-08	tre_han
1507	35	77	2026-01-08	da_nop
1508	35	78	2026-01-08	da_nop
1509	35	79	2026-01-08	da_nop
1510	35	80	2026-01-08	da_nop
1511	35	81	2026-01-08	da_nop
1512	35	82	2026-01-08	da_nop
1513	35	83	2026-01-08	da_nop
1514	35	84	2026-01-08	da_nop
1515	35	85	2026-01-08	da_nop
1516	35	86	2026-01-08	da_nop
1517	35	87	2026-01-08	da_nop
1518	35	88	2026-01-08	da_nop
1519	35	89	2026-01-08	da_nop
1520	35	90	2026-01-08	tre_han
1521	35	91	2026-01-08	da_nop
1522	35	92	2026-01-08	da_nop
1523	35	93	2026-01-08	da_nop
1524	35	94	2026-01-08	da_nop
1525	35	95	2026-01-08	da_nop
1526	35	96	2026-01-08	da_nop
1527	35	97	2026-01-08	tre_han
1528	35	98	2026-01-08	da_nop
1529	35	99	2026-01-08	da_nop
1530	35	100	2026-01-08	da_nop
1531	35	101	2026-01-08	da_nop
1532	35	102	2026-01-08	da_nop
1533	35	103	2026-01-08	tre_han
1534	35	104	2026-01-08	da_nop
1535	35	105	2026-01-08	da_nop
1536	35	106	2026-01-08	da_nop
1537	35	107	2026-01-08	da_nop
1538	35	108	2026-01-08	da_nop
1539	35	109	2026-01-08	tre_han
1540	35	110	2026-01-08	tre_han
1541	36	67	2026-01-08	tre_han
1542	36	68	2026-01-08	da_nop
1543	36	69	2026-01-08	da_nop
1544	36	70	2026-01-08	da_nop
1545	36	71	2026-01-08	da_nop
1546	36	72	2026-01-08	da_nop
1547	36	73	2026-01-08	da_nop
1548	36	74	2026-01-08	tre_han
1549	36	75	2026-01-08	da_nop
1550	36	76	2026-01-08	tre_han
1551	36	77	2026-01-08	da_nop
1552	36	78	2026-01-08	da_nop
1553	36	79	2026-01-08	da_nop
1554	36	80	2026-01-08	da_nop
1555	36	81	2026-01-08	da_nop
1556	36	82	2026-01-08	da_nop
1557	36	83	2026-01-08	da_nop
1558	36	84	2026-01-08	da_nop
1559	36	85	2026-01-08	da_nop
1560	36	86	2026-01-08	tre_han
1561	36	87	2026-01-08	da_nop
1562	36	88	2026-01-08	da_nop
1563	36	89	2026-01-08	tre_han
1564	36	90	2026-01-08	da_nop
1565	36	91	2026-01-08	da_nop
1566	36	92	2026-01-08	da_nop
1567	36	93	2026-01-08	da_nop
1568	36	94	2026-01-08	da_nop
1569	36	95	2026-01-08	da_nop
1570	36	96	2026-01-08	da_nop
1571	36	97	2026-01-08	da_nop
1572	36	98	2026-01-08	da_nop
1573	36	99	2026-01-08	tre_han
1574	36	100	2026-01-08	da_nop
1575	36	101	2026-01-08	da_nop
1576	36	102	2026-01-08	tre_han
1577	36	103	2026-01-08	da_nop
1578	36	104	2026-01-08	da_nop
1579	36	105	2026-01-08	da_nop
1580	36	106	2026-01-08	da_nop
1581	36	107	2026-01-08	da_nop
1582	36	108	2026-01-08	da_nop
1583	36	109	2026-01-08	da_nop
1584	36	110	2026-01-08	da_nop
1585	37	67	2026-01-08	da_nop
1586	37	68	2026-01-08	da_nop
1587	37	69	2026-01-08	da_nop
1588	37	70	2026-01-08	da_nop
1589	37	71	2026-01-08	da_nop
1590	37	72	2026-01-08	da_nop
1591	37	73	2026-01-08	tre_han
1592	37	74	2026-01-08	tre_han
1593	37	75	2026-01-08	tre_han
1594	37	76	2026-01-08	tre_han
1595	37	77	2026-01-08	da_nop
1596	37	78	2026-01-08	tre_han
1597	37	79	2026-01-08	tre_han
1598	37	80	2026-01-08	da_nop
1599	37	81	2026-01-08	da_nop
1600	37	82	2026-01-08	da_nop
1601	37	83	2026-01-08	tre_han
1602	37	84	2026-01-08	da_nop
1603	37	85	2026-01-08	da_nop
1604	37	86	2026-01-08	da_nop
1605	37	87	2026-01-08	tre_han
1606	37	88	2026-01-08	tre_han
1607	37	89	2026-01-08	da_nop
1608	37	90	2026-01-08	da_nop
1609	37	91	2026-01-08	tre_han
1610	37	92	2026-01-08	da_nop
1611	37	93	2026-01-08	tre_han
1612	37	94	2026-01-08	da_nop
1613	37	95	2026-01-08	da_nop
1614	37	96	2026-01-08	tre_han
1615	37	97	2026-01-08	da_nop
1616	37	98	2026-01-08	da_nop
1617	37	99	2026-01-08	da_nop
1618	37	100	2026-01-08	da_nop
1619	37	101	2026-01-08	da_nop
1620	37	102	2026-01-08	da_nop
1621	37	103	2026-01-08	da_nop
1622	37	104	2026-01-08	da_nop
1623	37	105	2026-01-08	tre_han
1624	37	106	2026-01-08	da_nop
1625	37	107	2026-01-08	da_nop
1626	37	108	2026-01-08	da_nop
1627	37	109	2026-01-08	da_nop
1628	37	110	2026-01-08	da_nop
1629	38	67	2026-01-08	da_nop
1630	38	68	2026-01-08	tre_han
1631	38	69	2026-01-08	da_nop
1632	38	70	2026-01-08	da_nop
1633	38	71	2026-01-08	da_nop
1634	38	72	2026-01-08	da_nop
1635	38	73	2026-01-08	da_nop
1636	38	74	2026-01-08	da_nop
1637	38	75	2026-01-08	da_nop
1638	38	76	2026-01-08	da_nop
1639	38	77	2026-01-08	da_nop
1640	38	78	2026-01-08	da_nop
1641	38	79	2026-01-08	da_nop
1642	38	80	2026-01-08	da_nop
1643	38	81	2026-01-08	da_nop
1644	38	82	2026-01-08	tre_han
1645	38	83	2026-01-08	da_nop
1646	38	84	2026-01-08	tre_han
1647	38	85	2026-01-08	da_nop
1648	38	86	2026-01-08	tre_han
1649	38	87	2026-01-08	da_nop
1650	38	88	2026-01-08	tre_han
1651	38	89	2026-01-08	da_nop
1652	38	90	2026-01-08	da_nop
1653	38	91	2026-01-08	da_nop
1654	38	92	2026-01-08	da_nop
1655	38	93	2026-01-08	tre_han
1656	38	94	2026-01-08	da_nop
1657	38	95	2026-01-08	tre_han
1658	38	96	2026-01-08	tre_han
1659	38	97	2026-01-08	da_nop
1660	38	98	2026-01-08	da_nop
1661	38	99	2026-01-08	da_nop
1662	38	100	2026-01-08	da_nop
1663	38	101	2026-01-08	da_nop
1664	38	102	2026-01-08	tre_han
1665	38	103	2026-01-08	da_nop
1666	38	104	2026-01-08	da_nop
1667	38	105	2026-01-08	tre_han
1668	38	106	2026-01-08	da_nop
1669	38	107	2026-01-08	da_nop
1670	38	108	2026-01-08	da_nop
1671	38	109	2026-01-08	tre_han
1672	38	110	2026-01-08	da_nop
1673	39	67	2026-01-08	da_nop
1674	39	68	2026-01-08	da_nop
1675	39	69	2026-01-08	da_nop
1676	39	70	2026-01-08	da_nop
1677	39	71	2026-01-08	da_nop
1678	39	72	2026-01-08	da_nop
1679	39	73	2026-01-08	tre_han
1680	39	74	2026-01-08	tre_han
1681	39	75	2026-01-08	tre_han
1682	39	76	2026-01-08	da_nop
1683	39	77	2026-01-08	da_nop
1684	39	78	2026-01-08	tre_han
1685	39	79	2026-01-08	tre_han
1686	39	80	2026-01-08	da_nop
1687	39	81	2026-01-08	da_nop
1688	39	82	2026-01-08	da_nop
1689	39	83	2026-01-08	da_nop
1690	39	84	2026-01-08	da_nop
1691	39	85	2026-01-08	da_nop
1692	39	86	2026-01-08	tre_han
1693	39	87	2026-01-08	da_nop
1694	39	88	2026-01-08	da_nop
1695	39	89	2026-01-08	tre_han
1696	39	90	2026-01-08	da_nop
1697	39	91	2026-01-08	da_nop
1698	39	92	2026-01-08	da_nop
1699	39	93	2026-01-08	tre_han
1700	39	94	2026-01-08	da_nop
1701	39	95	2026-01-08	da_nop
1702	39	96	2026-01-08	da_nop
1703	39	97	2026-01-08	da_nop
1704	39	98	2026-01-08	da_nop
1705	39	99	2026-01-08	da_nop
1706	39	100	2026-01-08	tre_han
1707	39	101	2026-01-08	da_nop
1708	39	102	2026-01-08	da_nop
1709	39	103	2026-01-08	da_nop
1710	39	104	2026-01-08	da_nop
1711	39	105	2026-01-08	da_nop
1712	39	106	2026-01-08	da_nop
1713	39	107	2026-01-08	da_nop
1714	39	108	2026-01-08	da_nop
1715	39	109	2026-01-08	da_nop
1716	39	110	2026-01-08	tre_han
1717	40	67	2026-01-08	tre_han
1718	40	68	2026-01-08	da_nop
1719	40	69	2026-01-08	tre_han
1720	40	70	2026-01-08	da_nop
1721	40	71	2026-01-08	da_nop
1722	40	72	2026-01-08	da_nop
1723	40	73	2026-01-08	da_nop
1724	40	74	2026-01-08	da_nop
1725	40	75	2026-01-08	da_nop
1726	40	76	2026-01-08	da_nop
1727	40	77	2026-01-08	da_nop
1728	40	78	2026-01-08	da_nop
1729	40	79	2026-01-08	da_nop
1730	40	80	2026-01-08	da_nop
1731	40	81	2026-01-08	da_nop
1732	40	82	2026-01-08	da_nop
1733	40	83	2026-01-08	da_nop
1734	40	84	2026-01-08	da_nop
1735	40	85	2026-01-08	da_nop
1736	40	86	2026-01-08	da_nop
1737	40	87	2026-01-08	tre_han
1738	40	88	2026-01-08	da_nop
1739	40	89	2026-01-08	da_nop
1740	40	90	2026-01-08	da_nop
1741	40	91	2026-01-08	da_nop
1742	40	92	2026-01-08	da_nop
1743	40	93	2026-01-08	da_nop
1744	40	94	2026-01-08	da_nop
1745	40	95	2026-01-08	tre_han
1746	40	96	2026-01-08	tre_han
1747	40	97	2026-01-08	da_nop
1748	40	98	2026-01-08	da_nop
1749	40	99	2026-01-08	da_nop
1750	40	100	2026-01-08	da_nop
1751	40	101	2026-01-08	da_nop
1752	40	102	2026-01-08	da_nop
1753	40	103	2026-01-08	da_nop
1754	40	104	2026-01-08	da_nop
1755	40	105	2026-01-08	da_nop
1756	40	106	2026-01-08	tre_han
1757	40	107	2026-01-08	tre_han
1758	40	108	2026-01-08	da_nop
1759	40	109	2026-01-08	da_nop
1760	40	110	2026-01-08	tre_han
1761	41	67	2026-01-08	tre_han
1762	41	68	2026-01-08	da_nop
1763	41	69	2026-01-08	da_nop
1764	41	70	2026-01-08	tre_han
1765	41	71	2026-01-08	da_nop
1766	41	72	2026-01-08	tre_han
1767	41	73	2026-01-08	da_nop
1768	41	74	2026-01-08	da_nop
1769	41	75	2026-01-08	da_nop
1770	41	76	2026-01-08	da_nop
1771	41	77	2026-01-08	da_nop
1772	41	78	2026-01-08	da_nop
1773	41	79	2026-01-08	tre_han
1774	41	80	2026-01-08	da_nop
1775	41	81	2026-01-08	da_nop
1776	41	82	2026-01-08	da_nop
1777	41	83	2026-01-08	da_nop
1778	41	84	2026-01-08	da_nop
1779	41	85	2026-01-08	da_nop
1780	41	86	2026-01-08	da_nop
1781	41	87	2026-01-08	da_nop
1782	41	88	2026-01-08	da_nop
1783	41	89	2026-01-08	da_nop
1784	41	90	2026-01-08	da_nop
1785	41	91	2026-01-08	tre_han
1786	41	92	2026-01-08	da_nop
1787	41	93	2026-01-08	da_nop
1788	41	94	2026-01-08	tre_han
1789	41	95	2026-01-08	da_nop
1790	41	96	2026-01-08	da_nop
1791	41	97	2026-01-08	da_nop
1792	41	98	2026-01-08	tre_han
1793	41	99	2026-01-08	da_nop
1794	41	100	2026-01-08	da_nop
1795	41	101	2026-01-08	da_nop
1796	41	102	2026-01-08	da_nop
1797	41	103	2026-01-08	tre_han
1798	41	104	2026-01-08	tre_han
1799	41	105	2026-01-08	da_nop
1800	41	106	2026-01-08	tre_han
1801	41	107	2026-01-08	da_nop
1802	41	108	2026-01-08	da_nop
1803	41	109	2026-01-08	tre_han
1804	41	110	2026-01-08	tre_han
1805	42	67	2026-01-08	da_nop
1806	42	68	2026-01-08	da_nop
1807	42	69	2026-01-08	da_nop
1808	42	70	2026-01-08	da_nop
1809	42	71	2026-01-08	da_nop
1810	42	72	2026-01-08	da_nop
1811	42	73	2026-01-08	da_nop
1812	42	74	2026-01-08	tre_han
1813	42	75	2026-01-08	da_nop
1814	42	76	2026-01-08	da_nop
1815	42	77	2026-01-08	da_nop
1816	42	78	2026-01-08	tre_han
1817	42	79	2026-01-08	tre_han
1818	42	80	2026-01-08	da_nop
1819	42	81	2026-01-08	da_nop
1820	42	82	2026-01-08	da_nop
1821	42	83	2026-01-08	da_nop
1822	42	84	2026-01-08	da_nop
1823	42	85	2026-01-08	da_nop
1824	42	86	2026-01-08	da_nop
1825	42	87	2026-01-08	da_nop
1826	42	88	2026-01-08	tre_han
1827	42	89	2026-01-08	tre_han
1828	42	90	2026-01-08	tre_han
1829	42	91	2026-01-08	da_nop
1830	42	92	2026-01-08	da_nop
1831	42	93	2026-01-08	da_nop
1832	42	94	2026-01-08	da_nop
1833	42	95	2026-01-08	da_nop
1834	42	96	2026-01-08	da_nop
1835	42	97	2026-01-08	da_nop
1836	42	98	2026-01-08	tre_han
1837	42	99	2026-01-08	tre_han
1838	42	100	2026-01-08	da_nop
1839	42	101	2026-01-08	da_nop
1840	42	102	2026-01-08	da_nop
1841	42	103	2026-01-08	da_nop
1842	42	104	2026-01-08	da_nop
1843	42	105	2026-01-08	tre_han
1844	42	106	2026-01-08	da_nop
1845	42	107	2026-01-08	tre_han
1846	42	108	2026-01-08	tre_han
1847	42	109	2026-01-08	da_nop
1848	42	110	2026-01-08	da_nop
1849	43	67	2026-01-08	tre_han
1850	43	68	2026-01-08	tre_han
1851	43	69	2026-01-08	da_nop
1852	43	70	2026-01-08	da_nop
1853	43	71	2026-01-08	da_nop
1854	43	72	2026-01-08	da_nop
1855	43	73	2026-01-08	da_nop
1856	43	74	2026-01-08	da_nop
1857	43	75	2026-01-08	da_nop
1858	43	76	2026-01-08	da_nop
1859	43	77	2026-01-08	tre_han
1860	43	78	2026-01-08	da_nop
1861	43	79	2026-01-08	da_nop
1862	43	80	2026-01-08	da_nop
1863	43	81	2026-01-08	da_nop
1864	43	82	2026-01-08	da_nop
1865	43	83	2026-01-08	da_nop
1866	43	84	2026-01-08	tre_han
1867	43	85	2026-01-08	da_nop
1868	43	86	2026-01-08	da_nop
1869	43	87	2026-01-08	da_nop
1870	43	88	2026-01-08	tre_han
1871	43	89	2026-01-08	da_nop
1872	43	90	2026-01-08	da_nop
1873	43	91	2026-01-08	da_nop
1874	43	92	2026-01-08	da_nop
1875	43	93	2026-01-08	da_nop
1876	43	94	2026-01-08	da_nop
1877	43	95	2026-01-08	da_nop
1878	43	96	2026-01-08	da_nop
1879	43	97	2026-01-08	da_nop
1880	43	98	2026-01-08	da_nop
1881	43	99	2026-01-08	da_nop
1882	43	100	2026-01-08	tre_han
1883	43	101	2026-01-08	da_nop
1884	43	102	2026-01-08	da_nop
1885	43	103	2026-01-08	tre_han
1886	43	104	2026-01-08	da_nop
1887	43	105	2026-01-08	da_nop
1888	43	106	2026-01-08	da_nop
1889	43	107	2026-01-08	da_nop
1890	43	108	2026-01-08	da_nop
1891	43	109	2026-01-08	da_nop
1892	43	110	2026-01-08	da_nop
1893	44	67	2026-01-08	tre_han
1894	44	68	2026-01-08	da_nop
1895	44	69	2026-01-08	tre_han
1896	44	70	2026-01-08	da_nop
1897	44	71	2026-01-08	da_nop
1898	44	72	2026-01-08	tre_han
1899	44	73	2026-01-08	da_nop
1900	44	74	2026-01-08	da_nop
1901	44	75	2026-01-08	da_nop
1902	44	76	2026-01-08	da_nop
1903	44	77	2026-01-08	tre_han
1904	44	78	2026-01-08	da_nop
1905	44	79	2026-01-08	da_nop
1906	44	80	2026-01-08	da_nop
1907	44	81	2026-01-08	da_nop
1908	44	82	2026-01-08	tre_han
1909	44	83	2026-01-08	tre_han
1910	44	84	2026-01-08	tre_han
1911	44	85	2026-01-08	da_nop
1912	44	86	2026-01-08	da_nop
1913	44	87	2026-01-08	da_nop
1914	44	88	2026-01-08	da_nop
1915	44	89	2026-01-08	da_nop
1916	44	90	2026-01-08	da_nop
1917	44	91	2026-01-08	da_nop
1918	44	92	2026-01-08	da_nop
1919	44	93	2026-01-08	da_nop
1920	44	94	2026-01-08	da_nop
1921	44	95	2026-01-08	tre_han
1922	44	96	2026-01-08	tre_han
1923	44	97	2026-01-08	da_nop
1924	44	98	2026-01-08	da_nop
1925	44	99	2026-01-08	da_nop
1926	44	100	2026-01-08	da_nop
1927	44	101	2026-01-08	tre_han
1928	44	102	2026-01-08	tre_han
1929	44	103	2026-01-08	tre_han
1930	44	104	2026-01-08	da_nop
1931	44	105	2026-01-08	da_nop
1932	44	106	2026-01-08	da_nop
1933	44	107	2026-01-08	da_nop
1934	44	108	2026-01-08	da_nop
1935	44	109	2026-01-08	da_nop
1936	44	110	2026-01-08	da_nop
1937	45	67	2026-01-08	da_nop
1938	45	68	2026-01-08	da_nop
1939	45	69	2026-01-08	tre_han
1940	45	70	2026-01-08	tre_han
1941	45	71	2026-01-08	da_nop
1942	45	72	2026-01-08	da_nop
1943	45	73	2026-01-08	da_nop
1944	45	74	2026-01-08	tre_han
1945	45	75	2026-01-08	da_nop
1946	45	76	2026-01-08	tre_han
1947	45	77	2026-01-08	tre_han
1948	45	78	2026-01-08	da_nop
1949	45	79	2026-01-08	tre_han
1950	45	80	2026-01-08	da_nop
1951	45	81	2026-01-08	da_nop
1952	45	82	2026-01-08	da_nop
1953	45	83	2026-01-08	da_nop
1954	45	84	2026-01-08	da_nop
1955	45	85	2026-01-08	da_nop
1956	45	86	2026-01-08	tre_han
1957	45	87	2026-01-08	da_nop
1958	45	88	2026-01-08	da_nop
1959	45	89	2026-01-08	da_nop
1960	45	90	2026-01-08	da_nop
1961	45	91	2026-01-08	da_nop
1962	45	92	2026-01-08	da_nop
1963	45	93	2026-01-08	da_nop
1964	45	94	2026-01-08	tre_han
1965	45	95	2026-01-08	da_nop
1966	45	96	2026-01-08	da_nop
1967	45	97	2026-01-08	da_nop
1968	45	98	2026-01-08	da_nop
1969	45	99	2026-01-08	da_nop
1970	45	100	2026-01-08	tre_han
1971	45	101	2026-01-08	da_nop
1972	45	102	2026-01-08	da_nop
1973	45	103	2026-01-08	da_nop
1974	45	104	2026-01-08	da_nop
1975	45	105	2026-01-08	da_nop
1976	45	106	2026-01-08	da_nop
1977	45	107	2026-01-08	da_nop
1978	45	108	2026-01-08	da_nop
1979	45	109	2026-01-08	da_nop
1980	45	110	2026-01-08	da_nop
1981	46	67	2026-01-08	da_nop
1982	46	68	2026-01-08	da_nop
1983	46	69	2026-01-08	da_nop
1984	46	70	2026-01-08	da_nop
1985	46	71	2026-01-08	da_nop
1986	46	72	2026-01-08	da_nop
1987	46	73	2026-01-08	tre_han
1988	46	74	2026-01-08	da_nop
1989	46	75	2026-01-08	da_nop
1990	46	76	2026-01-08	da_nop
1991	46	77	2026-01-08	da_nop
1992	46	78	2026-01-08	da_nop
1993	46	79	2026-01-08	da_nop
1994	46	80	2026-01-08	da_nop
1995	46	81	2026-01-08	da_nop
1996	46	82	2026-01-08	da_nop
1997	46	83	2026-01-08	tre_han
1998	46	84	2026-01-08	da_nop
1999	46	85	2026-01-08	da_nop
2000	46	86	2026-01-08	tre_han
2001	46	87	2026-01-08	da_nop
2002	46	88	2026-01-08	tre_han
2003	46	89	2026-01-08	da_nop
2004	46	90	2026-01-08	da_nop
2005	46	91	2026-01-08	da_nop
2006	46	92	2026-01-08	da_nop
2007	46	93	2026-01-08	tre_han
2008	46	94	2026-01-08	da_nop
2009	46	95	2026-01-08	da_nop
2010	46	96	2026-01-08	da_nop
2011	46	97	2026-01-08	da_nop
2012	46	98	2026-01-08	tre_han
2013	46	99	2026-01-08	da_nop
2014	46	100	2026-01-08	tre_han
2015	46	101	2026-01-08	da_nop
2016	46	102	2026-01-08	da_nop
2017	46	103	2026-01-08	tre_han
2018	46	104	2026-01-08	da_nop
2019	46	105	2026-01-08	tre_han
2020	46	106	2026-01-08	da_nop
2021	46	107	2026-01-08	tre_han
2022	46	108	2026-01-08	da_nop
2023	46	109	2026-01-08	da_nop
2024	46	110	2026-01-08	tre_han
2025	47	67	2026-01-08	da_nop
2026	47	68	2026-01-08	da_nop
2027	47	69	2026-01-08	da_nop
2028	47	70	2026-01-08	da_nop
2029	47	71	2026-01-08	da_nop
2030	47	72	2026-01-08	tre_han
2031	47	73	2026-01-08	da_nop
2032	47	74	2026-01-08	da_nop
2033	47	75	2026-01-08	da_nop
2034	47	76	2026-01-08	tre_han
2035	47	77	2026-01-08	tre_han
2036	47	78	2026-01-08	da_nop
2037	47	79	2026-01-08	da_nop
2038	47	80	2026-01-08	da_nop
2039	47	81	2026-01-08	da_nop
2040	47	82	2026-01-08	da_nop
2041	47	83	2026-01-08	da_nop
2042	47	84	2026-01-08	da_nop
2043	47	85	2026-01-08	da_nop
2044	47	86	2026-01-08	da_nop
2045	47	87	2026-01-08	da_nop
2046	47	88	2026-01-08	da_nop
2047	47	89	2026-01-08	da_nop
2048	47	90	2026-01-08	da_nop
2049	47	91	2026-01-08	tre_han
2050	47	92	2026-01-08	da_nop
2051	47	93	2026-01-08	da_nop
2052	47	94	2026-01-08	da_nop
2053	47	95	2026-01-08	da_nop
2054	47	96	2026-01-08	da_nop
2055	47	97	2026-01-08	da_nop
2056	47	98	2026-01-08	tre_han
2057	47	99	2026-01-08	da_nop
2058	47	100	2026-01-08	da_nop
2059	47	101	2026-01-08	da_nop
2060	47	102	2026-01-08	da_nop
2061	47	103	2026-01-08	da_nop
2062	47	104	2026-01-08	da_nop
2063	47	105	2026-01-08	da_nop
2064	47	106	2026-01-08	da_nop
2065	47	107	2026-01-08	da_nop
2066	47	108	2026-01-08	da_nop
2067	47	109	2026-01-08	tre_han
2068	47	110	2026-01-08	da_nop
2069	48	67	2026-01-08	da_nop
2070	48	68	2026-01-08	tre_han
2071	48	69	2026-01-08	da_nop
2072	48	70	2026-01-08	tre_han
2073	48	71	2026-01-08	da_nop
2074	48	72	2026-01-08	da_nop
2075	48	73	2026-01-08	da_nop
2076	48	74	2026-01-08	da_nop
2077	48	75	2026-01-08	da_nop
2078	48	76	2026-01-08	da_nop
2079	48	77	2026-01-08	da_nop
2080	48	78	2026-01-08	tre_han
2081	48	79	2026-01-08	tre_han
2082	48	80	2026-01-08	da_nop
2083	48	81	2026-01-08	tre_han
2084	48	82	2026-01-08	da_nop
2085	48	83	2026-01-08	da_nop
2086	48	84	2026-01-08	da_nop
2087	48	85	2026-01-08	tre_han
2088	48	86	2026-01-08	da_nop
2089	48	87	2026-01-08	tre_han
2090	48	88	2026-01-08	da_nop
2091	48	89	2026-01-08	da_nop
2092	48	90	2026-01-08	tre_han
2093	48	91	2026-01-08	tre_han
2094	48	92	2026-01-08	da_nop
2095	48	93	2026-01-08	da_nop
2096	48	94	2026-01-08	da_nop
2097	48	95	2026-01-08	da_nop
2098	48	96	2026-01-08	da_nop
2099	48	97	2026-01-08	da_nop
2100	48	98	2026-01-08	da_nop
2101	48	99	2026-01-08	da_nop
2102	48	100	2026-01-08	da_nop
2103	48	101	2026-01-08	da_nop
2104	48	102	2026-01-08	da_nop
2105	48	103	2026-01-08	tre_han
2106	48	104	2026-01-08	da_nop
2107	48	105	2026-01-08	da_nop
2108	48	106	2026-01-08	da_nop
2109	48	107	2026-01-08	da_nop
2110	48	108	2026-01-08	da_nop
2111	48	109	2026-01-08	tre_han
2112	48	110	2026-01-08	tre_han
2113	49	67	2026-01-08	da_nop
2114	49	68	2026-01-08	da_nop
2115	49	69	2026-01-08	da_nop
2116	49	70	2026-01-08	da_nop
2117	49	71	2026-01-08	da_nop
2118	49	72	2026-01-08	tre_han
2119	49	73	2026-01-08	da_nop
2120	49	74	2026-01-08	da_nop
2121	49	75	2026-01-08	da_nop
2122	49	76	2026-01-08	da_nop
2123	49	77	2026-01-08	da_nop
2124	49	78	2026-01-08	da_nop
2125	49	79	2026-01-08	da_nop
2126	49	80	2026-01-08	da_nop
2127	49	81	2026-01-08	da_nop
2128	49	82	2026-01-08	da_nop
2129	49	83	2026-01-08	da_nop
2130	49	84	2026-01-08	da_nop
2131	49	85	2026-01-08	da_nop
2132	49	86	2026-01-08	tre_han
2133	49	87	2026-01-08	tre_han
2134	49	88	2026-01-08	da_nop
2135	49	89	2026-01-08	da_nop
2136	49	90	2026-01-08	da_nop
2137	49	91	2026-01-08	da_nop
2138	49	92	2026-01-08	da_nop
2139	49	93	2026-01-08	tre_han
2140	49	94	2026-01-08	da_nop
2141	49	95	2026-01-08	da_nop
2142	49	96	2026-01-08	da_nop
2143	49	97	2026-01-08	da_nop
2144	49	98	2026-01-08	da_nop
2145	49	99	2026-01-08	da_nop
2146	49	100	2026-01-08	da_nop
2147	49	101	2026-01-08	da_nop
2148	49	102	2026-01-08	da_nop
2149	49	103	2026-01-08	da_nop
2150	49	104	2026-01-08	da_nop
2151	49	105	2026-01-08	da_nop
2152	49	106	2026-01-08	da_nop
2153	49	107	2026-01-08	da_nop
2154	49	108	2026-01-08	da_nop
2155	49	109	2026-01-08	da_nop
2156	49	110	2026-01-08	tre_han
2157	50	67	2026-01-08	da_nop
2158	50	68	2026-01-08	da_nop
2159	50	69	2026-01-08	da_nop
2160	50	70	2026-01-08	da_nop
2161	50	71	2026-01-08	da_nop
2162	50	72	2026-01-08	da_nop
2163	50	73	2026-01-08	da_nop
2164	50	74	2026-01-08	da_nop
2165	50	75	2026-01-08	da_nop
2166	50	76	2026-01-08	tre_han
2167	50	77	2026-01-08	da_nop
2168	50	78	2026-01-08	da_nop
2169	50	79	2026-01-08	tre_han
2170	50	80	2026-01-08	da_nop
2171	50	81	2026-01-08	da_nop
2172	50	82	2026-01-08	tre_han
2173	50	83	2026-01-08	da_nop
2174	50	84	2026-01-08	da_nop
2175	50	85	2026-01-08	da_nop
2176	50	86	2026-01-08	tre_han
2177	50	87	2026-01-08	da_nop
2178	50	88	2026-01-08	tre_han
2179	50	89	2026-01-08	da_nop
2180	50	90	2026-01-08	da_nop
2181	50	91	2026-01-08	da_nop
2182	50	92	2026-01-08	tre_han
2183	50	93	2026-01-08	tre_han
2184	50	94	2026-01-08	da_nop
2185	50	95	2026-01-08	da_nop
2186	50	96	2026-01-08	tre_han
2187	50	97	2026-01-08	da_nop
2188	50	98	2026-01-08	tre_han
2189	50	99	2026-01-08	da_nop
2190	50	100	2026-01-08	da_nop
2191	50	101	2026-01-08	da_nop
2192	50	102	2026-01-08	da_nop
2193	50	103	2026-01-08	da_nop
2194	50	104	2026-01-08	tre_han
2195	50	105	2026-01-08	da_nop
2196	50	106	2026-01-08	da_nop
2197	50	107	2026-01-08	da_nop
2198	50	108	2026-01-08	da_nop
2199	50	109	2026-01-08	da_nop
2200	50	110	2026-01-08	da_nop
2201	51	67	2026-01-08	da_nop
2202	51	68	2026-01-08	tre_han
2203	51	69	2026-01-08	tre_han
2204	51	70	2026-01-08	da_nop
2205	51	71	2026-01-08	da_nop
2206	51	72	2026-01-08	da_nop
2207	51	73	2026-01-08	da_nop
2208	51	74	2026-01-08	da_nop
2209	51	75	2026-01-08	da_nop
2210	51	76	2026-01-08	da_nop
2211	51	77	2026-01-08	da_nop
2212	51	78	2026-01-08	da_nop
2213	51	79	2026-01-08	da_nop
2214	51	80	2026-01-08	da_nop
2215	51	81	2026-01-08	da_nop
2216	51	82	2026-01-08	da_nop
2217	51	83	2026-01-08	tre_han
2218	51	84	2026-01-08	da_nop
2219	51	85	2026-01-08	tre_han
2220	51	86	2026-01-08	da_nop
2221	51	87	2026-01-08	da_nop
2222	51	88	2026-01-08	da_nop
2223	51	89	2026-01-08	da_nop
2224	51	90	2026-01-08	tre_han
2225	51	91	2026-01-08	tre_han
2226	51	92	2026-01-08	da_nop
2227	51	93	2026-01-08	da_nop
2228	51	94	2026-01-08	da_nop
2229	51	95	2026-01-08	tre_han
2230	51	96	2026-01-08	da_nop
2231	51	97	2026-01-08	tre_han
2232	51	98	2026-01-08	da_nop
2233	51	99	2026-01-08	da_nop
2234	51	100	2026-01-08	da_nop
2235	51	101	2026-01-08	tre_han
2236	51	102	2026-01-08	tre_han
2237	51	103	2026-01-08	da_nop
2238	51	104	2026-01-08	tre_han
2239	51	105	2026-01-08	tre_han
2240	51	106	2026-01-08	da_nop
2241	51	107	2026-01-08	da_nop
2242	51	108	2026-01-08	da_nop
2243	51	109	2026-01-08	tre_han
2244	51	110	2026-01-08	tre_han
2245	52	67	2026-01-08	da_nop
2246	52	68	2026-01-08	da_nop
2247	52	69	2026-01-08	da_nop
2248	52	70	2026-01-08	da_nop
2249	52	71	2026-01-08	da_nop
2250	52	72	2026-01-08	tre_han
2251	52	73	2026-01-08	da_nop
2252	52	74	2026-01-08	da_nop
2253	52	75	2026-01-08	da_nop
2254	52	76	2026-01-08	da_nop
2255	52	77	2026-01-08	da_nop
2256	52	78	2026-01-08	da_nop
2257	52	79	2026-01-08	tre_han
2258	52	80	2026-01-08	da_nop
2259	52	81	2026-01-08	da_nop
2260	52	82	2026-01-08	da_nop
2261	52	83	2026-01-08	da_nop
2262	52	84	2026-01-08	da_nop
2263	52	85	2026-01-08	tre_han
2264	52	86	2026-01-08	tre_han
2265	52	87	2026-01-08	da_nop
2266	52	88	2026-01-08	da_nop
2267	52	89	2026-01-08	da_nop
2268	52	90	2026-01-08	da_nop
2269	52	91	2026-01-08	da_nop
2270	52	92	2026-01-08	da_nop
2271	52	93	2026-01-08	da_nop
2272	52	94	2026-01-08	da_nop
2273	52	95	2026-01-08	da_nop
2274	52	96	2026-01-08	tre_han
2275	52	97	2026-01-08	da_nop
2276	52	98	2026-01-08	da_nop
2277	52	99	2026-01-08	da_nop
2278	52	100	2026-01-08	da_nop
2279	52	101	2026-01-08	da_nop
2280	52	102	2026-01-08	da_nop
2281	52	103	2026-01-08	tre_han
2282	52	104	2026-01-08	da_nop
2283	52	105	2026-01-08	da_nop
2284	52	106	2026-01-08	tre_han
2285	52	107	2026-01-08	da_nop
2286	52	108	2026-01-08	da_nop
2287	52	109	2026-01-08	tre_han
2288	52	110	2026-01-08	da_nop
2289	53	67	2026-01-08	da_nop
2290	53	68	2026-01-08	tre_han
2291	53	69	2026-01-08	da_nop
2292	53	70	2026-01-08	da_nop
2293	53	71	2026-01-08	da_nop
2294	53	72	2026-01-08	da_nop
2295	53	73	2026-01-08	da_nop
2296	53	74	2026-01-08	da_nop
2297	53	75	2026-01-08	da_nop
2298	53	76	2026-01-08	da_nop
2299	53	77	2026-01-08	da_nop
2300	53	78	2026-01-08	da_nop
2301	53	79	2026-01-08	tre_han
2302	53	80	2026-01-08	tre_han
2303	53	81	2026-01-08	tre_han
2304	53	82	2026-01-08	da_nop
2305	53	83	2026-01-08	da_nop
2306	53	84	2026-01-08	da_nop
2307	53	85	2026-01-08	da_nop
2308	53	86	2026-01-08	tre_han
2309	53	87	2026-01-08	da_nop
2310	53	88	2026-01-08	da_nop
2311	53	89	2026-01-08	tre_han
2312	53	90	2026-01-08	da_nop
2313	53	91	2026-01-08	tre_han
2314	53	92	2026-01-08	da_nop
2315	53	93	2026-01-08	da_nop
2316	53	94	2026-01-08	da_nop
2317	53	95	2026-01-08	tre_han
2318	53	96	2026-01-08	da_nop
2319	53	97	2026-01-08	da_nop
2320	53	98	2026-01-08	da_nop
2321	53	99	2026-01-08	da_nop
2322	53	100	2026-01-08	da_nop
2323	53	101	2026-01-08	da_nop
2324	53	102	2026-01-08	da_nop
2325	53	103	2026-01-08	tre_han
2326	53	104	2026-01-08	da_nop
2327	53	105	2026-01-08	da_nop
2328	53	106	2026-01-08	da_nop
2329	53	107	2026-01-08	da_nop
2330	53	108	2026-01-08	da_nop
2331	53	109	2026-01-08	da_nop
2332	53	110	2026-01-08	da_nop
2333	54	67	2026-01-08	da_nop
2334	54	68	2026-01-08	da_nop
2335	54	69	2026-01-08	da_nop
2336	54	70	2026-01-08	da_nop
2337	54	71	2026-01-08	da_nop
2338	54	72	2026-01-08	tre_han
2339	54	73	2026-01-08	da_nop
2340	54	74	2026-01-08	da_nop
2341	54	75	2026-01-08	da_nop
2342	54	76	2026-01-08	da_nop
2343	54	77	2026-01-08	da_nop
2344	54	78	2026-01-08	da_nop
2345	54	79	2026-01-08	da_nop
2346	54	80	2026-01-08	da_nop
2347	54	81	2026-01-08	da_nop
2348	54	82	2026-01-08	da_nop
2349	54	83	2026-01-08	da_nop
2350	54	84	2026-01-08	da_nop
2351	54	85	2026-01-08	da_nop
2352	54	86	2026-01-08	da_nop
2353	54	87	2026-01-08	da_nop
2354	54	88	2026-01-08	tre_han
2355	54	89	2026-01-08	da_nop
2356	54	90	2026-01-08	da_nop
2357	54	91	2026-01-08	da_nop
2358	54	92	2026-01-08	tre_han
2359	54	93	2026-01-08	da_nop
2360	54	94	2026-01-08	da_nop
2361	54	95	2026-01-08	da_nop
2362	54	96	2026-01-08	da_nop
2363	54	97	2026-01-08	da_nop
2364	54	98	2026-01-08	da_nop
2365	54	99	2026-01-08	da_nop
2366	54	100	2026-01-08	da_nop
2367	54	101	2026-01-08	da_nop
2368	54	102	2026-01-08	tre_han
2369	54	103	2026-01-08	da_nop
2370	54	104	2026-01-08	tre_han
2371	54	105	2026-01-08	da_nop
2372	54	106	2026-01-08	da_nop
2373	54	107	2026-01-08	da_nop
2374	54	108	2026-01-08	da_nop
2375	54	109	2026-01-08	da_nop
2376	54	110	2026-01-08	da_nop
2377	55	67	2026-01-08	da_nop
2378	55	68	2026-01-08	da_nop
2379	55	69	2026-01-08	da_nop
2380	55	70	2026-01-08	da_nop
2381	55	71	2026-01-08	da_nop
2382	55	72	2026-01-08	da_nop
2383	55	73	2026-01-08	da_nop
2384	55	74	2026-01-08	da_nop
2385	55	75	2026-01-08	da_nop
2386	55	76	2026-01-08	da_nop
2387	55	77	2026-01-08	da_nop
2388	55	78	2026-01-08	da_nop
2389	55	79	2026-01-08	da_nop
2390	55	80	2026-01-08	da_nop
2391	55	81	2026-01-08	da_nop
2392	55	82	2026-01-08	da_nop
2393	55	83	2026-01-08	da_nop
2394	55	84	2026-01-08	da_nop
2395	55	85	2026-01-08	da_nop
2396	55	86	2026-01-08	da_nop
2397	55	87	2026-01-08	tre_han
2398	55	88	2026-01-08	da_nop
2399	55	89	2026-01-08	tre_han
2400	55	90	2026-01-08	da_nop
2401	55	91	2026-01-08	da_nop
2402	55	92	2026-01-08	da_nop
2403	55	93	2026-01-08	tre_han
2404	55	94	2026-01-08	da_nop
2405	55	95	2026-01-08	tre_han
2406	55	96	2026-01-08	da_nop
2407	55	97	2026-01-08	tre_han
2408	55	98	2026-01-08	da_nop
2409	55	99	2026-01-08	da_nop
2410	55	100	2026-01-08	da_nop
2411	55	101	2026-01-08	da_nop
2412	55	102	2026-01-08	da_nop
2413	55	103	2026-01-08	da_nop
2414	55	104	2026-01-08	da_nop
2415	55	105	2026-01-08	da_nop
2416	55	106	2026-01-08	tre_han
2417	55	107	2026-01-08	da_nop
2418	55	108	2026-01-08	tre_han
2419	55	109	2026-01-08	da_nop
2420	55	110	2026-01-08	da_nop
2421	56	67	2026-01-08	tre_han
2422	56	68	2026-01-08	da_nop
2423	56	69	2026-01-08	tre_han
2424	56	70	2026-01-08	tre_han
2425	56	71	2026-01-08	da_nop
2426	56	72	2026-01-08	tre_han
2427	56	73	2026-01-08	tre_han
2428	56	74	2026-01-08	tre_han
2429	56	75	2026-01-08	da_nop
2430	56	76	2026-01-08	da_nop
2431	56	77	2026-01-08	da_nop
2432	56	78	2026-01-08	da_nop
2433	56	79	2026-01-08	tre_han
2434	56	80	2026-01-08	da_nop
2435	56	81	2026-01-08	da_nop
2436	56	82	2026-01-08	da_nop
2437	56	83	2026-01-08	da_nop
2438	56	84	2026-01-08	da_nop
2439	56	85	2026-01-08	da_nop
2440	56	86	2026-01-08	da_nop
2441	56	87	2026-01-08	da_nop
2442	56	88	2026-01-08	da_nop
2443	56	89	2026-01-08	da_nop
2444	56	90	2026-01-08	da_nop
2445	56	91	2026-01-08	da_nop
2446	56	92	2026-01-08	da_nop
2447	56	93	2026-01-08	tre_han
2448	56	94	2026-01-08	tre_han
2449	56	95	2026-01-08	da_nop
2450	56	96	2026-01-08	da_nop
2451	56	97	2026-01-08	da_nop
2452	56	98	2026-01-08	da_nop
2453	56	99	2026-01-08	tre_han
2454	56	100	2026-01-08	tre_han
2455	56	101	2026-01-08	da_nop
2456	56	102	2026-01-08	da_nop
2457	56	103	2026-01-08	da_nop
2458	56	104	2026-01-08	tre_han
2459	56	105	2026-01-08	tre_han
2460	56	106	2026-01-08	da_nop
2461	56	107	2026-01-08	da_nop
2462	56	108	2026-01-08	tre_han
2463	56	109	2026-01-08	da_nop
2464	56	110	2026-01-08	da_nop
2465	57	67	2026-01-08	da_nop
2466	57	68	2026-01-08	da_nop
2467	57	69	2026-01-08	da_nop
2468	57	70	2026-01-08	da_nop
2469	57	71	2026-01-08	da_nop
2470	57	72	2026-01-08	da_nop
2471	57	73	2026-01-08	da_nop
2472	57	74	2026-01-08	da_nop
2473	57	75	2026-01-08	da_nop
2474	57	76	2026-01-08	da_nop
2475	57	77	2026-01-08	da_nop
2476	57	78	2026-01-08	da_nop
2477	57	79	2026-01-08	da_nop
2478	57	80	2026-01-08	da_nop
2479	57	81	2026-01-08	da_nop
2480	57	82	2026-01-08	da_nop
2481	57	83	2026-01-08	tre_han
2482	57	84	2026-01-08	da_nop
2483	57	85	2026-01-08	tre_han
2484	57	86	2026-01-08	tre_han
2485	57	87	2026-01-08	tre_han
2486	57	88	2026-01-08	da_nop
2487	57	89	2026-01-08	da_nop
2488	57	90	2026-01-08	da_nop
2489	57	91	2026-01-08	da_nop
2490	57	92	2026-01-08	tre_han
2491	57	93	2026-01-08	da_nop
2492	57	94	2026-01-08	da_nop
2493	57	95	2026-01-08	da_nop
2494	57	96	2026-01-08	da_nop
2495	57	97	2026-01-08	da_nop
2496	57	98	2026-01-08	da_nop
2497	57	99	2026-01-08	da_nop
2498	57	100	2026-01-08	da_nop
2499	57	101	2026-01-08	tre_han
2500	57	102	2026-01-08	da_nop
2501	57	103	2026-01-08	da_nop
2502	57	104	2026-01-08	da_nop
2503	57	105	2026-01-08	da_nop
2504	57	106	2026-01-08	da_nop
2505	57	107	2026-01-08	da_nop
2506	57	108	2026-01-08	tre_han
2507	57	109	2026-01-08	da_nop
2508	57	110	2026-01-08	tre_han
2509	58	67	2026-01-08	da_nop
2510	58	68	2026-01-08	tre_han
2511	58	69	2026-01-08	da_nop
2512	58	70	2026-01-08	da_nop
2513	58	71	2026-01-08	da_nop
2514	58	72	2026-01-08	da_nop
2515	58	73	2026-01-08	tre_han
2516	58	74	2026-01-08	da_nop
2517	58	75	2026-01-08	da_nop
2518	58	76	2026-01-08	da_nop
2519	58	77	2026-01-08	tre_han
2520	58	78	2026-01-08	da_nop
2521	58	79	2026-01-08	da_nop
2522	58	80	2026-01-08	tre_han
2523	58	81	2026-01-08	da_nop
2524	58	82	2026-01-08	da_nop
2525	58	83	2026-01-08	tre_han
2526	58	84	2026-01-08	da_nop
2527	58	85	2026-01-08	da_nop
2528	58	86	2026-01-08	da_nop
2529	58	87	2026-01-08	da_nop
2530	58	88	2026-01-08	tre_han
2531	58	89	2026-01-08	da_nop
2532	58	90	2026-01-08	da_nop
2533	58	91	2026-01-08	da_nop
2534	58	92	2026-01-08	da_nop
2535	58	93	2026-01-08	da_nop
2536	58	94	2026-01-08	da_nop
2537	58	95	2026-01-08	da_nop
2538	58	96	2026-01-08	da_nop
2539	58	97	2026-01-08	da_nop
2540	58	98	2026-01-08	da_nop
2541	58	99	2026-01-08	tre_han
2542	58	100	2026-01-08	da_nop
2543	58	101	2026-01-08	da_nop
2544	58	102	2026-01-08	da_nop
2545	58	103	2026-01-08	tre_han
2546	58	104	2026-01-08	tre_han
2547	58	105	2026-01-08	da_nop
2548	58	106	2026-01-08	da_nop
2549	58	107	2026-01-08	tre_han
2550	58	108	2026-01-08	tre_han
2551	58	109	2026-01-08	da_nop
2552	58	110	2026-01-08	da_nop
2553	59	67	2026-01-08	da_nop
2554	59	68	2026-01-08	da_nop
2555	59	69	2026-01-08	da_nop
2556	59	70	2026-01-08	tre_han
2557	59	71	2026-01-08	da_nop
2558	59	72	2026-01-08	tre_han
2559	59	73	2026-01-08	tre_han
2560	59	74	2026-01-08	da_nop
2561	59	75	2026-01-08	da_nop
2562	59	76	2026-01-08	tre_han
2563	59	77	2026-01-08	tre_han
2564	59	78	2026-01-08	da_nop
2565	59	79	2026-01-08	da_nop
2566	59	80	2026-01-08	da_nop
2567	59	81	2026-01-08	da_nop
2568	59	82	2026-01-08	da_nop
2569	59	83	2026-01-08	da_nop
2570	59	84	2026-01-08	tre_han
2571	59	85	2026-01-08	da_nop
2572	59	86	2026-01-08	da_nop
2573	59	87	2026-01-08	da_nop
2574	59	88	2026-01-08	da_nop
2575	59	89	2026-01-08	da_nop
2576	59	90	2026-01-08	da_nop
2577	59	91	2026-01-08	da_nop
2578	59	92	2026-01-08	da_nop
2579	59	93	2026-01-08	da_nop
2580	59	94	2026-01-08	da_nop
2581	59	95	2026-01-08	tre_han
2582	59	96	2026-01-08	da_nop
2583	59	97	2026-01-08	da_nop
2584	59	98	2026-01-08	tre_han
2585	59	99	2026-01-08	da_nop
2586	59	100	2026-01-08	da_nop
2587	59	101	2026-01-08	da_nop
2588	59	102	2026-01-08	tre_han
2589	59	103	2026-01-08	tre_han
2590	59	104	2026-01-08	da_nop
2591	59	105	2026-01-08	da_nop
2592	59	106	2026-01-08	da_nop
2593	59	107	2026-01-08	da_nop
2594	59	108	2026-01-08	da_nop
2595	59	109	2026-01-08	da_nop
2596	59	110	2026-01-08	da_nop
2597	60	67	2026-01-08	da_nop
2598	60	68	2026-01-08	tre_han
2599	60	69	2026-01-08	da_nop
2600	60	70	2026-01-08	tre_han
2601	60	71	2026-01-08	tre_han
2602	60	72	2026-01-08	da_nop
2603	60	73	2026-01-08	da_nop
2604	60	74	2026-01-08	da_nop
2605	60	75	2026-01-08	da_nop
2606	60	76	2026-01-08	da_nop
2607	60	77	2026-01-08	da_nop
2608	60	78	2026-01-08	da_nop
2609	60	79	2026-01-08	da_nop
2610	60	80	2026-01-08	da_nop
2611	60	81	2026-01-08	da_nop
2612	60	82	2026-01-08	tre_han
2613	60	83	2026-01-08	da_nop
2614	60	84	2026-01-08	da_nop
2615	60	85	2026-01-08	da_nop
2616	60	86	2026-01-08	tre_han
2617	60	87	2026-01-08	da_nop
2618	60	88	2026-01-08	da_nop
2619	60	89	2026-01-08	da_nop
2620	60	90	2026-01-08	da_nop
2621	60	91	2026-01-08	da_nop
2622	60	92	2026-01-08	da_nop
2623	60	93	2026-01-08	da_nop
2624	60	94	2026-01-08	da_nop
2625	60	95	2026-01-08	da_nop
2626	60	96	2026-01-08	da_nop
2627	60	97	2026-01-08	da_nop
2628	60	98	2026-01-08	tre_han
2629	60	99	2026-01-08	da_nop
2630	60	100	2026-01-08	da_nop
2631	60	101	2026-01-08	da_nop
2632	60	102	2026-01-08	tre_han
2633	60	103	2026-01-08	da_nop
2634	60	104	2026-01-08	da_nop
2635	60	105	2026-01-08	da_nop
2636	60	106	2026-01-08	da_nop
2637	60	107	2026-01-08	da_nop
2638	60	108	2026-01-08	da_nop
2639	60	109	2026-01-08	tre_han
2640	60	110	2026-01-08	da_nop
2641	61	67	2026-01-08	da_nop
2642	61	68	2026-01-08	da_nop
2643	61	69	2026-01-08	da_nop
2644	61	70	2026-01-08	da_nop
2645	61	71	2026-01-08	da_nop
2646	61	72	2026-01-08	da_nop
2647	61	73	2026-01-08	da_nop
2648	61	74	2026-01-08	da_nop
2649	61	75	2026-01-08	da_nop
2650	61	76	2026-01-08	da_nop
2651	61	77	2026-01-08	da_nop
2652	61	78	2026-01-08	tre_han
2653	61	79	2026-01-08	da_nop
2654	61	80	2026-01-08	tre_han
2655	61	81	2026-01-08	da_nop
2656	61	82	2026-01-08	da_nop
2657	61	83	2026-01-08	da_nop
2658	61	84	2026-01-08	da_nop
2659	61	85	2026-01-08	tre_han
2660	61	86	2026-01-08	da_nop
2661	61	87	2026-01-08	da_nop
2662	61	88	2026-01-08	da_nop
2663	61	89	2026-01-08	da_nop
2664	61	90	2026-01-08	da_nop
2665	61	91	2026-01-08	da_nop
2666	61	92	2026-01-08	da_nop
2667	61	93	2026-01-08	da_nop
2668	61	94	2026-01-08	da_nop
2669	61	95	2026-01-08	da_nop
2670	61	96	2026-01-08	da_nop
2671	61	97	2026-01-08	da_nop
2672	61	98	2026-01-08	da_nop
2673	61	99	2026-01-08	da_nop
2674	61	100	2026-01-08	tre_han
2675	61	101	2026-01-08	da_nop
2676	61	102	2026-01-08	da_nop
2677	61	103	2026-01-08	da_nop
2678	61	104	2026-01-08	tre_han
2679	61	105	2026-01-08	da_nop
2680	61	106	2026-01-08	da_nop
2681	61	107	2026-01-08	da_nop
2682	61	108	2026-01-08	da_nop
2683	61	109	2026-01-08	da_nop
2684	61	110	2026-01-08	da_nop
2685	62	67	2026-01-08	da_nop
2686	62	68	2026-01-08	da_nop
2687	62	69	2026-01-08	da_nop
2688	62	70	2026-01-08	da_nop
2689	62	71	2026-01-08	tre_han
2690	62	72	2026-01-08	tre_han
2691	62	73	2026-01-08	tre_han
2692	62	74	2026-01-08	da_nop
2693	62	75	2026-01-08	tre_han
2694	62	76	2026-01-08	tre_han
2695	62	77	2026-01-08	tre_han
2696	62	78	2026-01-08	tre_han
2697	62	79	2026-01-08	tre_han
2698	62	80	2026-01-08	da_nop
2699	62	81	2026-01-08	da_nop
2700	62	82	2026-01-08	da_nop
2701	62	83	2026-01-08	da_nop
2702	62	84	2026-01-08	da_nop
2703	62	85	2026-01-08	tre_han
2704	62	86	2026-01-08	da_nop
2705	62	87	2026-01-08	da_nop
2706	62	88	2026-01-08	da_nop
2707	62	89	2026-01-08	da_nop
2708	62	90	2026-01-08	da_nop
2709	62	91	2026-01-08	da_nop
2710	62	92	2026-01-08	da_nop
2711	62	93	2026-01-08	tre_han
2712	62	94	2026-01-08	da_nop
2713	62	95	2026-01-08	tre_han
2714	62	96	2026-01-08	da_nop
2715	62	97	2026-01-08	da_nop
2716	62	98	2026-01-08	tre_han
2717	62	99	2026-01-08	da_nop
2718	62	100	2026-01-08	da_nop
2719	62	101	2026-01-08	da_nop
2720	62	102	2026-01-08	da_nop
2721	62	103	2026-01-08	da_nop
2722	62	104	2026-01-08	da_nop
2723	62	105	2026-01-08	da_nop
2724	62	106	2026-01-08	da_nop
2725	62	107	2026-01-08	da_nop
2726	62	108	2026-01-08	da_nop
2727	62	109	2026-01-08	da_nop
2728	62	110	2026-01-08	da_nop
2729	63	67	2026-01-08	da_nop
2730	63	68	2026-01-08	da_nop
2731	63	69	2026-01-08	da_nop
2732	63	70	2026-01-08	da_nop
2733	63	71	2026-01-08	da_nop
2734	63	72	2026-01-08	tre_han
2735	63	73	2026-01-08	da_nop
2736	63	74	2026-01-08	da_nop
2737	63	75	2026-01-08	da_nop
2738	63	76	2026-01-08	da_nop
2739	63	77	2026-01-08	da_nop
2740	63	78	2026-01-08	tre_han
2741	63	79	2026-01-08	da_nop
2742	63	80	2026-01-08	da_nop
2743	63	81	2026-01-08	da_nop
2744	63	82	2026-01-08	tre_han
2745	63	83	2026-01-08	da_nop
2746	63	84	2026-01-08	tre_han
2747	63	85	2026-01-08	da_nop
2748	63	86	2026-01-08	da_nop
2749	63	87	2026-01-08	da_nop
2750	63	88	2026-01-08	da_nop
2751	63	89	2026-01-08	tre_han
2752	63	90	2026-01-08	da_nop
2753	63	91	2026-01-08	da_nop
2754	63	92	2026-01-08	da_nop
2755	63	93	2026-01-08	da_nop
2756	63	94	2026-01-08	da_nop
2757	63	95	2026-01-08	tre_han
2758	63	96	2026-01-08	da_nop
2759	63	97	2026-01-08	da_nop
2760	63	98	2026-01-08	tre_han
2761	63	99	2026-01-08	da_nop
2762	63	100	2026-01-08	da_nop
2763	63	101	2026-01-08	da_nop
2764	63	102	2026-01-08	da_nop
2765	63	103	2026-01-08	tre_han
2766	63	104	2026-01-08	da_nop
2767	63	105	2026-01-08	tre_han
2768	63	106	2026-01-08	da_nop
2769	63	107	2026-01-08	da_nop
2770	63	108	2026-01-08	da_nop
2771	63	109	2026-01-08	tre_han
2772	63	110	2026-01-08	da_nop
2773	64	67	2026-01-08	tre_han
2774	64	68	2026-01-08	da_nop
2775	64	69	2026-01-08	da_nop
2776	64	70	2026-01-08	da_nop
2777	64	71	2026-01-08	da_nop
2778	64	72	2026-01-08	da_nop
2779	64	73	2026-01-08	da_nop
2780	64	74	2026-01-08	da_nop
2781	64	75	2026-01-08	tre_han
2782	64	76	2026-01-08	da_nop
2783	64	77	2026-01-08	da_nop
2784	64	78	2026-01-08	tre_han
2785	64	79	2026-01-08	da_nop
2786	64	80	2026-01-08	da_nop
2787	64	81	2026-01-08	da_nop
2788	64	82	2026-01-08	da_nop
2789	64	83	2026-01-08	da_nop
2790	64	84	2026-01-08	da_nop
2791	64	85	2026-01-08	da_nop
2792	64	86	2026-01-08	da_nop
2793	64	87	2026-01-08	da_nop
2794	64	88	2026-01-08	tre_han
2795	64	89	2026-01-08	da_nop
2796	64	90	2026-01-08	da_nop
2797	64	91	2026-01-08	tre_han
2798	64	92	2026-01-08	da_nop
2799	64	93	2026-01-08	da_nop
2800	64	94	2026-01-08	da_nop
2801	64	95	2026-01-08	da_nop
2802	64	96	2026-01-08	tre_han
2803	64	97	2026-01-08	da_nop
2804	64	98	2026-01-08	da_nop
2805	64	99	2026-01-08	da_nop
2806	64	100	2026-01-08	da_nop
2807	64	101	2026-01-08	da_nop
2808	64	102	2026-01-08	da_nop
2809	64	103	2026-01-08	da_nop
2810	64	104	2026-01-08	da_nop
2811	64	105	2026-01-08	da_nop
2812	64	106	2026-01-08	da_nop
2813	64	107	2026-01-08	da_nop
2814	64	108	2026-01-08	da_nop
2815	64	109	2026-01-08	da_nop
2816	64	110	2026-01-08	tre_han
2817	65	67	2026-01-08	da_nop
2818	65	68	2026-01-08	da_nop
2819	65	69	2026-01-08	da_nop
2820	65	70	2026-01-08	da_nop
2821	65	71	2026-01-08	da_nop
2822	65	72	2026-01-08	da_nop
2823	65	73	2026-01-08	da_nop
2824	65	74	2026-01-08	da_nop
2825	65	75	2026-01-08	da_nop
2826	65	76	2026-01-08	tre_han
2827	65	77	2026-01-08	da_nop
2828	65	78	2026-01-08	da_nop
2829	65	79	2026-01-08	da_nop
2830	65	80	2026-01-08	da_nop
2831	65	81	2026-01-08	da_nop
2832	65	82	2026-01-08	da_nop
2833	65	83	2026-01-08	da_nop
2834	65	84	2026-01-08	da_nop
2835	65	85	2026-01-08	da_nop
2836	65	86	2026-01-08	da_nop
2837	65	87	2026-01-08	da_nop
2838	65	88	2026-01-08	da_nop
2839	65	89	2026-01-08	da_nop
2840	65	90	2026-01-08	da_nop
2841	65	91	2026-01-08	da_nop
2842	65	92	2026-01-08	tre_han
2843	65	93	2026-01-08	da_nop
2844	65	94	2026-01-08	da_nop
2845	65	95	2026-01-08	da_nop
2846	65	96	2026-01-08	tre_han
2847	65	97	2026-01-08	da_nop
2848	65	98	2026-01-08	da_nop
2849	65	99	2026-01-08	da_nop
2850	65	100	2026-01-08	tre_han
2851	65	101	2026-01-08	da_nop
2852	65	102	2026-01-08	da_nop
2853	65	103	2026-01-08	da_nop
2854	65	104	2026-01-08	da_nop
2855	65	105	2026-01-08	da_nop
2856	65	106	2026-01-08	da_nop
2857	65	107	2026-01-08	da_nop
2858	65	108	2026-01-08	da_nop
2859	65	109	2026-01-08	da_nop
2860	65	110	2026-01-08	da_nop
2861	66	67	2026-01-08	da_nop
2862	66	68	2026-01-08	tre_han
2863	66	69	2026-01-08	da_nop
2864	66	70	2026-01-08	da_nop
2865	66	71	2026-01-08	tre_han
2866	66	72	2026-01-08	tre_han
2867	66	73	2026-01-08	tre_han
2868	66	74	2026-01-08	da_nop
2869	66	75	2026-01-08	da_nop
2870	66	76	2026-01-08	da_nop
2871	66	77	2026-01-08	da_nop
2872	66	78	2026-01-08	da_nop
2873	66	79	2026-01-08	da_nop
2874	66	80	2026-01-08	da_nop
2875	66	81	2026-01-08	da_nop
2876	66	82	2026-01-08	tre_han
2877	66	83	2026-01-08	da_nop
2878	66	84	2026-01-08	da_nop
2879	66	85	2026-01-08	da_nop
2880	66	86	2026-01-08	da_nop
2881	66	87	2026-01-08	tre_han
2882	66	88	2026-01-08	da_nop
2883	66	89	2026-01-08	tre_han
2884	66	90	2026-01-08	da_nop
2885	66	91	2026-01-08	da_nop
2886	66	92	2026-01-08	da_nop
2887	66	93	2026-01-08	tre_han
2888	66	94	2026-01-08	da_nop
2889	66	95	2026-01-08	da_nop
2890	66	96	2026-01-08	da_nop
2891	66	97	2026-01-08	da_nop
2892	66	98	2026-01-08	da_nop
2893	66	99	2026-01-08	tre_han
2894	66	100	2026-01-08	da_nop
2895	66	101	2026-01-08	da_nop
2896	66	102	2026-01-08	da_nop
2897	66	103	2026-01-08	tre_han
2898	66	104	2026-01-08	tre_han
2899	66	105	2026-01-08	da_nop
2900	66	106	2026-01-08	da_nop
2901	66	107	2026-01-08	da_nop
2902	66	108	2026-01-08	da_nop
2903	66	109	2026-01-08	tre_han
2904	66	110	2026-01-08	da_nop
2905	67	67	2026-01-08	da_nop
2906	67	68	2026-01-08	da_nop
2907	67	69	2026-01-08	da_nop
2908	67	70	2026-01-08	tre_han
2909	67	71	2026-01-08	da_nop
2910	67	72	2026-01-08	da_nop
2911	67	73	2026-01-08	tre_han
2912	67	74	2026-01-08	da_nop
2913	67	75	2026-01-08	tre_han
2914	67	76	2026-01-08	tre_han
2915	67	77	2026-01-08	da_nop
2916	67	78	2026-01-08	da_nop
2917	67	79	2026-01-08	tre_han
2918	67	80	2026-01-08	da_nop
2919	67	81	2026-01-08	da_nop
2920	67	82	2026-01-08	da_nop
2921	67	83	2026-01-08	da_nop
2922	67	84	2026-01-08	da_nop
2923	67	85	2026-01-08	da_nop
2924	67	86	2026-01-08	da_nop
2925	67	87	2026-01-08	da_nop
2926	67	88	2026-01-08	da_nop
2927	67	89	2026-01-08	da_nop
2928	67	90	2026-01-08	tre_han
2929	67	91	2026-01-08	da_nop
2930	67	92	2026-01-08	da_nop
2931	67	93	2026-01-08	da_nop
2932	67	94	2026-01-08	da_nop
2933	67	95	2026-01-08	tre_han
2934	67	96	2026-01-08	da_nop
2935	67	97	2026-01-08	da_nop
2936	67	98	2026-01-08	da_nop
2937	67	99	2026-01-08	da_nop
2938	67	100	2026-01-08	da_nop
2939	67	101	2026-01-08	da_nop
2940	67	102	2026-01-08	da_nop
2941	67	103	2026-01-08	da_nop
2942	67	104	2026-01-08	da_nop
2943	67	105	2026-01-08	da_nop
2944	67	106	2026-01-08	tre_han
2945	67	107	2026-01-08	tre_han
2946	67	108	2026-01-08	da_nop
2947	67	109	2026-01-08	tre_han
2948	67	110	2026-01-08	tre_han
2949	68	67	2026-01-08	tre_han
2950	68	68	2026-01-08	da_nop
2951	68	69	2026-01-08	da_nop
2952	68	70	2026-01-08	tre_han
2953	68	71	2026-01-08	da_nop
2954	68	72	2026-01-08	da_nop
2955	68	73	2026-01-08	da_nop
2956	68	74	2026-01-08	da_nop
2957	68	75	2026-01-08	tre_han
2958	68	76	2026-01-08	da_nop
2959	68	77	2026-01-08	da_nop
2960	68	78	2026-01-08	da_nop
2961	68	79	2026-01-08	tre_han
2962	68	80	2026-01-08	da_nop
2963	68	81	2026-01-08	da_nop
2964	68	82	2026-01-08	da_nop
2965	68	83	2026-01-08	da_nop
2966	68	84	2026-01-08	da_nop
2967	68	85	2026-01-08	da_nop
2968	68	86	2026-01-08	da_nop
2969	68	87	2026-01-08	da_nop
2970	68	88	2026-01-08	da_nop
2971	68	89	2026-01-08	da_nop
2972	68	90	2026-01-08	da_nop
2973	68	91	2026-01-08	da_nop
2974	68	92	2026-01-08	da_nop
2975	68	93	2026-01-08	tre_han
2976	68	94	2026-01-08	da_nop
2977	68	95	2026-01-08	da_nop
2978	68	96	2026-01-08	tre_han
2979	68	97	2026-01-08	da_nop
2980	68	98	2026-01-08	da_nop
2981	68	99	2026-01-08	da_nop
2982	68	100	2026-01-08	da_nop
2983	68	101	2026-01-08	tre_han
2984	68	102	2026-01-08	da_nop
2985	68	103	2026-01-08	da_nop
2986	68	104	2026-01-08	da_nop
2987	68	105	2026-01-08	da_nop
2988	68	106	2026-01-08	tre_han
2989	68	107	2026-01-08	da_nop
2990	68	108	2026-01-08	da_nop
2991	68	109	2026-01-08	da_nop
2992	68	110	2026-01-08	da_nop
2993	69	67	2026-01-08	da_nop
2994	69	68	2026-01-08	da_nop
2995	69	69	2026-01-08	tre_han
2996	69	70	2026-01-08	da_nop
2997	69	71	2026-01-08	da_nop
2998	69	72	2026-01-08	tre_han
2999	69	73	2026-01-08	da_nop
3000	69	74	2026-01-08	tre_han
3001	69	75	2026-01-08	da_nop
3002	69	76	2026-01-08	da_nop
3003	69	77	2026-01-08	da_nop
3004	69	78	2026-01-08	da_nop
3005	69	79	2026-01-08	da_nop
3006	69	80	2026-01-08	da_nop
3007	69	81	2026-01-08	tre_han
3008	69	82	2026-01-08	tre_han
3009	69	83	2026-01-08	da_nop
3010	69	84	2026-01-08	da_nop
3011	69	85	2026-01-08	da_nop
3012	69	86	2026-01-08	da_nop
3013	69	87	2026-01-08	tre_han
3014	69	88	2026-01-08	da_nop
3015	69	89	2026-01-08	da_nop
3016	69	90	2026-01-08	da_nop
3017	69	91	2026-01-08	da_nop
3018	69	92	2026-01-08	da_nop
3019	69	93	2026-01-08	da_nop
3020	69	94	2026-01-08	tre_han
3021	69	95	2026-01-08	da_nop
3022	69	96	2026-01-08	tre_han
3023	69	97	2026-01-08	da_nop
3024	69	98	2026-01-08	da_nop
3025	69	99	2026-01-08	da_nop
3026	69	100	2026-01-08	da_nop
3027	69	101	2026-01-08	da_nop
3028	69	102	2026-01-08	da_nop
3029	69	103	2026-01-08	da_nop
3030	69	104	2026-01-08	da_nop
3031	69	105	2026-01-08	da_nop
3032	69	106	2026-01-08	da_nop
3033	69	107	2026-01-08	tre_han
3034	69	108	2026-01-08	da_nop
3035	69	109	2026-01-08	da_nop
3036	69	110	2026-01-08	tre_han
3037	70	67	2026-01-08	da_nop
3038	70	68	2026-01-08	da_nop
3039	70	69	2026-01-08	da_nop
3040	70	70	2026-01-08	da_nop
3041	70	71	2026-01-08	da_nop
3042	70	72	2026-01-08	tre_han
3043	70	73	2026-01-08	tre_han
3044	70	74	2026-01-08	tre_han
3045	70	75	2026-01-08	da_nop
3046	70	76	2026-01-08	tre_han
3047	70	77	2026-01-08	da_nop
3048	70	78	2026-01-08	da_nop
3049	70	79	2026-01-08	tre_han
3050	70	80	2026-01-08	tre_han
3051	70	81	2026-01-08	da_nop
3052	70	82	2026-01-08	da_nop
3053	70	83	2026-01-08	tre_han
3054	70	84	2026-01-08	da_nop
3055	70	85	2026-01-08	da_nop
3056	70	86	2026-01-08	da_nop
3057	70	87	2026-01-08	da_nop
3058	70	88	2026-01-08	tre_han
3059	70	89	2026-01-08	tre_han
3060	70	90	2026-01-08	da_nop
3061	70	91	2026-01-08	tre_han
3062	70	92	2026-01-08	da_nop
3063	70	93	2026-01-08	da_nop
3064	70	94	2026-01-08	da_nop
3065	70	95	2026-01-08	da_nop
3066	70	96	2026-01-08	tre_han
3067	70	97	2026-01-08	da_nop
3068	70	98	2026-01-08	da_nop
3069	70	99	2026-01-08	da_nop
3070	70	100	2026-01-08	da_nop
3071	70	101	2026-01-08	da_nop
3072	70	102	2026-01-08	da_nop
3073	70	103	2026-01-08	da_nop
3074	70	104	2026-01-08	da_nop
3075	70	105	2026-01-08	da_nop
3076	70	106	2026-01-08	da_nop
3077	70	107	2026-01-08	da_nop
3078	70	108	2026-01-08	tre_han
3079	70	109	2026-01-08	da_nop
3080	70	110	2026-01-08	da_nop
3081	71	67	2026-01-08	da_nop
3082	71	68	2026-01-08	da_nop
3083	71	69	2026-01-08	da_nop
3084	71	70	2026-01-08	da_nop
3085	71	71	2026-01-08	da_nop
3086	71	72	2026-01-08	tre_han
3087	71	73	2026-01-08	tre_han
3088	71	74	2026-01-08	tre_han
3089	71	75	2026-01-08	da_nop
3090	71	76	2026-01-08	da_nop
3091	71	77	2026-01-08	da_nop
3092	71	78	2026-01-08	tre_han
3093	71	79	2026-01-08	tre_han
3094	71	80	2026-01-08	da_nop
3095	71	81	2026-01-08	da_nop
3096	71	82	2026-01-08	da_nop
3097	71	83	2026-01-08	tre_han
3098	71	84	2026-01-08	tre_han
3099	71	85	2026-01-08	da_nop
3100	71	86	2026-01-08	da_nop
3101	71	87	2026-01-08	da_nop
3102	71	88	2026-01-08	da_nop
3103	71	89	2026-01-08	da_nop
3104	71	90	2026-01-08	da_nop
3105	71	91	2026-01-08	da_nop
3106	71	92	2026-01-08	da_nop
3107	71	93	2026-01-08	tre_han
3108	71	94	2026-01-08	tre_han
3109	71	95	2026-01-08	da_nop
3110	71	96	2026-01-08	da_nop
3111	71	97	2026-01-08	da_nop
3112	71	98	2026-01-08	da_nop
3113	71	99	2026-01-08	da_nop
3114	71	100	2026-01-08	da_nop
3115	71	101	2026-01-08	da_nop
3116	71	102	2026-01-08	da_nop
3117	71	103	2026-01-08	da_nop
3118	71	104	2026-01-08	da_nop
3119	71	105	2026-01-08	da_nop
3120	71	106	2026-01-08	da_nop
3121	71	107	2026-01-08	da_nop
3122	71	108	2026-01-08	da_nop
3123	71	109	2026-01-08	da_nop
3124	71	110	2026-01-08	da_nop
3125	72	67	2026-01-08	da_nop
3126	72	68	2026-01-08	da_nop
3127	72	69	2026-01-08	da_nop
3128	72	70	2026-01-08	da_nop
3129	72	71	2026-01-08	da_nop
3130	72	72	2026-01-08	da_nop
3131	72	73	2026-01-08	da_nop
3132	72	74	2026-01-08	da_nop
3133	72	75	2026-01-08	da_nop
3134	72	76	2026-01-08	da_nop
3135	72	77	2026-01-08	da_nop
3136	72	78	2026-01-08	da_nop
3137	72	79	2026-01-08	da_nop
3138	72	80	2026-01-08	da_nop
3139	72	81	2026-01-08	tre_han
3140	72	82	2026-01-08	da_nop
3141	72	83	2026-01-08	tre_han
3142	72	84	2026-01-08	da_nop
3143	72	85	2026-01-08	da_nop
3144	72	86	2026-01-08	da_nop
3145	72	87	2026-01-08	tre_han
3146	72	88	2026-01-08	da_nop
3147	72	89	2026-01-08	da_nop
3148	72	90	2026-01-08	tre_han
3149	72	91	2026-01-08	da_nop
3150	72	92	2026-01-08	da_nop
3151	72	93	2026-01-08	da_nop
3152	72	94	2026-01-08	da_nop
3153	72	95	2026-01-08	tre_han
3154	72	96	2026-01-08	da_nop
3155	72	97	2026-01-08	da_nop
3156	72	98	2026-01-08	da_nop
3157	72	99	2026-01-08	da_nop
3158	72	100	2026-01-08	da_nop
3159	72	101	2026-01-08	da_nop
3160	72	102	2026-01-08	tre_han
3161	72	103	2026-01-08	da_nop
3162	72	104	2026-01-08	da_nop
3163	72	105	2026-01-08	tre_han
3164	72	106	2026-01-08	tre_han
3165	72	107	2026-01-08	da_nop
3166	72	108	2026-01-08	da_nop
3167	72	109	2026-01-08	da_nop
3168	72	110	2026-01-08	da_nop
3169	73	67	2026-01-08	da_nop
3170	73	68	2026-01-08	da_nop
3171	73	69	2026-01-08	tre_han
3172	73	70	2026-01-08	da_nop
3173	73	71	2026-01-08	da_nop
3174	73	72	2026-01-08	da_nop
3175	73	73	2026-01-08	tre_han
3176	73	74	2026-01-08	da_nop
3177	73	75	2026-01-08	da_nop
3178	73	76	2026-01-08	da_nop
3179	73	77	2026-01-08	tre_han
3180	73	78	2026-01-08	da_nop
3181	73	79	2026-01-08	da_nop
3182	73	80	2026-01-08	da_nop
3183	73	81	2026-01-08	da_nop
3184	73	82	2026-01-08	da_nop
3185	73	83	2026-01-08	da_nop
3186	73	84	2026-01-08	da_nop
3187	73	85	2026-01-08	da_nop
3188	73	86	2026-01-08	da_nop
3189	73	87	2026-01-08	da_nop
3190	73	88	2026-01-08	da_nop
3191	73	89	2026-01-08	da_nop
3192	73	90	2026-01-08	tre_han
3193	73	91	2026-01-08	da_nop
3194	73	92	2026-01-08	tre_han
3195	73	93	2026-01-08	da_nop
3196	73	94	2026-01-08	da_nop
3197	73	95	2026-01-08	da_nop
3198	73	96	2026-01-08	da_nop
3199	73	97	2026-01-08	da_nop
3200	73	98	2026-01-08	da_nop
3201	73	99	2026-01-08	da_nop
3202	73	100	2026-01-08	da_nop
3203	73	101	2026-01-08	da_nop
3204	73	102	2026-01-08	da_nop
3205	73	103	2026-01-08	da_nop
3206	73	104	2026-01-08	da_nop
3207	73	105	2026-01-08	da_nop
3208	73	106	2026-01-08	da_nop
3209	73	107	2026-01-08	tre_han
3210	73	108	2026-01-08	da_nop
3211	73	109	2026-01-08	da_nop
3212	73	110	2026-01-08	da_nop
3213	74	67	2026-01-08	tre_han
3214	74	68	2026-01-08	da_nop
3215	74	69	2026-01-08	da_nop
3216	74	70	2026-01-08	da_nop
3217	74	71	2026-01-08	da_nop
3218	74	72	2026-01-08	tre_han
3219	74	73	2026-01-08	da_nop
3220	74	74	2026-01-08	da_nop
3221	74	75	2026-01-08	da_nop
3222	74	76	2026-01-08	da_nop
3223	74	77	2026-01-08	da_nop
3224	74	78	2026-01-08	da_nop
3225	74	79	2026-01-08	da_nop
3226	74	80	2026-01-08	da_nop
3227	74	81	2026-01-08	da_nop
3228	74	82	2026-01-08	da_nop
3229	74	83	2026-01-08	tre_han
3230	74	84	2026-01-08	da_nop
3231	74	85	2026-01-08	da_nop
3232	74	86	2026-01-08	da_nop
3233	74	87	2026-01-08	da_nop
3234	74	88	2026-01-08	tre_han
3235	74	89	2026-01-08	da_nop
3236	74	90	2026-01-08	tre_han
3237	74	91	2026-01-08	tre_han
3238	74	92	2026-01-08	da_nop
3239	74	93	2026-01-08	da_nop
3240	74	94	2026-01-08	da_nop
3241	74	95	2026-01-08	da_nop
3242	74	96	2026-01-08	da_nop
3243	74	97	2026-01-08	da_nop
3244	74	98	2026-01-08	da_nop
3245	74	99	2026-01-08	da_nop
3246	74	100	2026-01-08	tre_han
3247	74	101	2026-01-08	da_nop
3248	74	102	2026-01-08	da_nop
3249	74	103	2026-01-08	tre_han
3250	74	104	2026-01-08	da_nop
3251	74	105	2026-01-08	da_nop
3252	74	106	2026-01-08	da_nop
3253	74	107	2026-01-08	da_nop
3254	74	108	2026-01-08	da_nop
3255	74	109	2026-01-08	tre_han
3256	74	110	2026-01-08	da_nop
3257	75	67	2026-01-08	da_nop
3258	75	68	2026-01-08	da_nop
3259	75	69	2026-01-08	da_nop
3260	75	70	2026-01-08	da_nop
3261	75	71	2026-01-08	da_nop
3262	75	72	2026-01-08	da_nop
3263	75	73	2026-01-08	da_nop
3264	75	74	2026-01-08	da_nop
3265	75	75	2026-01-08	da_nop
3266	75	76	2026-01-08	da_nop
3267	75	77	2026-01-08	da_nop
3268	75	78	2026-01-08	tre_han
3269	75	79	2026-01-08	tre_han
3270	75	80	2026-01-08	da_nop
3271	75	81	2026-01-08	da_nop
3272	75	82	2026-01-08	da_nop
3273	75	83	2026-01-08	da_nop
3274	75	84	2026-01-08	tre_han
3275	75	85	2026-01-08	tre_han
3276	75	86	2026-01-08	da_nop
3277	75	87	2026-01-08	da_nop
3278	75	88	2026-01-08	da_nop
3279	75	89	2026-01-08	tre_han
3280	75	90	2026-01-08	da_nop
3281	75	91	2026-01-08	da_nop
3282	75	92	2026-01-08	da_nop
3283	75	93	2026-01-08	da_nop
3284	75	94	2026-01-08	da_nop
3285	75	95	2026-01-08	da_nop
3286	75	96	2026-01-08	da_nop
3287	75	97	2026-01-08	da_nop
3288	75	98	2026-01-08	da_nop
3289	75	99	2026-01-08	tre_han
3290	75	100	2026-01-08	da_nop
3291	75	101	2026-01-08	da_nop
3292	75	102	2026-01-08	da_nop
3293	75	103	2026-01-08	da_nop
3294	75	104	2026-01-08	tre_han
3295	75	105	2026-01-08	da_nop
3296	75	106	2026-01-08	da_nop
3297	75	107	2026-01-08	da_nop
3298	75	108	2026-01-08	da_nop
3299	75	109	2026-01-08	da_nop
3300	75	110	2026-01-08	da_nop
3301	76	67	2026-01-08	da_nop
3302	76	68	2026-01-08	tre_han
3303	76	69	2026-01-08	da_nop
3304	76	70	2026-01-08	da_nop
3305	76	71	2026-01-08	da_nop
3306	76	72	2026-01-08	da_nop
3307	76	73	2026-01-08	da_nop
3308	76	74	2026-01-08	da_nop
3309	76	75	2026-01-08	da_nop
3310	76	76	2026-01-08	da_nop
3311	76	77	2026-01-08	da_nop
3312	76	78	2026-01-08	tre_han
3313	76	79	2026-01-08	da_nop
3314	76	80	2026-01-08	da_nop
3315	76	81	2026-01-08	da_nop
3316	76	82	2026-01-08	da_nop
3317	76	83	2026-01-08	da_nop
3318	76	84	2026-01-08	da_nop
3319	76	85	2026-01-08	da_nop
3320	76	86	2026-01-08	da_nop
3321	76	87	2026-01-08	da_nop
3322	76	88	2026-01-08	da_nop
3323	76	89	2026-01-08	tre_han
3324	76	90	2026-01-08	da_nop
3325	76	91	2026-01-08	da_nop
3326	76	92	2026-01-08	tre_han
3327	76	93	2026-01-08	da_nop
3328	76	94	2026-01-08	tre_han
3329	76	95	2026-01-08	tre_han
3330	76	96	2026-01-08	da_nop
3331	76	97	2026-01-08	da_nop
3332	76	98	2026-01-08	da_nop
3333	76	99	2026-01-08	da_nop
3334	76	100	2026-01-08	da_nop
3335	76	101	2026-01-08	tre_han
3336	76	102	2026-01-08	da_nop
3337	76	103	2026-01-08	da_nop
3338	76	104	2026-01-08	da_nop
3339	76	105	2026-01-08	da_nop
3340	76	106	2026-01-08	da_nop
3341	76	107	2026-01-08	tre_han
3342	76	108	2026-01-08	da_nop
3343	76	109	2026-01-08	da_nop
3344	76	110	2026-01-08	da_nop
3345	77	67	2026-01-08	tre_han
3346	77	68	2026-01-08	da_nop
3347	77	69	2026-01-08	da_nop
3348	77	70	2026-01-08	da_nop
3349	77	71	2026-01-08	tre_han
3350	77	72	2026-01-08	da_nop
3351	77	73	2026-01-08	da_nop
3352	77	74	2026-01-08	da_nop
3353	77	75	2026-01-08	da_nop
3354	77	76	2026-01-08	da_nop
3355	77	77	2026-01-08	da_nop
3356	77	78	2026-01-08	da_nop
3357	77	79	2026-01-08	da_nop
3358	77	80	2026-01-08	tre_han
3359	77	81	2026-01-08	da_nop
3360	77	82	2026-01-08	tre_han
3361	77	83	2026-01-08	da_nop
3362	77	84	2026-01-08	da_nop
3363	77	85	2026-01-08	da_nop
3364	77	86	2026-01-08	da_nop
3365	77	87	2026-01-08	da_nop
3366	77	88	2026-01-08	da_nop
3367	77	89	2026-01-08	da_nop
3368	77	90	2026-01-08	da_nop
3369	77	91	2026-01-08	tre_han
3370	77	92	2026-01-08	tre_han
3371	77	93	2026-01-08	tre_han
3372	77	94	2026-01-08	tre_han
3373	77	95	2026-01-08	da_nop
3374	77	96	2026-01-08	da_nop
3375	77	97	2026-01-08	da_nop
3376	77	98	2026-01-08	da_nop
3377	77	99	2026-01-08	tre_han
3378	77	100	2026-01-08	da_nop
3379	77	101	2026-01-08	tre_han
3380	77	102	2026-01-08	da_nop
3381	77	103	2026-01-08	da_nop
3382	77	104	2026-01-08	da_nop
3383	77	105	2026-01-08	da_nop
3384	77	106	2026-01-08	da_nop
3385	77	107	2026-01-08	da_nop
3386	77	108	2026-01-08	da_nop
3387	77	109	2026-01-08	da_nop
3388	77	110	2026-01-08	tre_han
3389	78	67	2026-01-08	da_nop
3390	78	68	2026-01-08	tre_han
3391	78	69	2026-01-08	da_nop
3392	78	70	2026-01-08	da_nop
3393	78	71	2026-01-08	tre_han
3394	78	72	2026-01-08	tre_han
3395	78	73	2026-01-08	da_nop
3396	78	74	2026-01-08	da_nop
3397	78	75	2026-01-08	da_nop
3398	78	76	2026-01-08	da_nop
3399	78	77	2026-01-08	da_nop
3400	78	78	2026-01-08	da_nop
3401	78	79	2026-01-08	da_nop
3402	78	80	2026-01-08	da_nop
3403	78	81	2026-01-08	tre_han
3404	78	82	2026-01-08	da_nop
3405	78	83	2026-01-08	da_nop
3406	78	84	2026-01-08	tre_han
3407	78	85	2026-01-08	da_nop
3408	78	86	2026-01-08	da_nop
3409	78	87	2026-01-08	da_nop
3410	78	88	2026-01-08	da_nop
3411	78	89	2026-01-08	tre_han
3412	78	90	2026-01-08	da_nop
3413	78	91	2026-01-08	da_nop
3414	78	92	2026-01-08	da_nop
3415	78	93	2026-01-08	tre_han
3416	78	94	2026-01-08	da_nop
3417	78	95	2026-01-08	da_nop
3418	78	96	2026-01-08	da_nop
3419	78	97	2026-01-08	tre_han
3420	78	98	2026-01-08	da_nop
3421	78	99	2026-01-08	da_nop
3422	78	100	2026-01-08	da_nop
3423	78	101	2026-01-08	da_nop
3424	78	102	2026-01-08	da_nop
3425	78	103	2026-01-08	tre_han
3426	78	104	2026-01-08	da_nop
3427	78	105	2026-01-08	da_nop
3428	78	106	2026-01-08	da_nop
3429	78	107	2026-01-08	da_nop
3430	78	108	2026-01-08	da_nop
3431	78	109	2026-01-08	tre_han
3432	78	110	2026-01-08	da_nop
3433	79	67	2026-01-08	tre_han
3434	79	68	2026-01-08	tre_han
3435	79	69	2026-01-08	da_nop
3436	79	70	2026-01-08	da_nop
3437	79	71	2026-01-08	da_nop
3438	79	72	2026-01-08	da_nop
3439	79	73	2026-01-08	da_nop
3440	79	74	2026-01-08	da_nop
3441	79	75	2026-01-08	da_nop
3442	79	76	2026-01-08	tre_han
3443	79	77	2026-01-08	da_nop
3444	79	78	2026-01-08	da_nop
3445	79	79	2026-01-08	da_nop
3446	79	80	2026-01-08	da_nop
3447	79	81	2026-01-08	tre_han
3448	79	82	2026-01-08	da_nop
3449	79	83	2026-01-08	tre_han
3450	79	84	2026-01-08	da_nop
3451	79	85	2026-01-08	da_nop
3452	79	86	2026-01-08	da_nop
3453	79	87	2026-01-08	da_nop
3454	79	88	2026-01-08	da_nop
3455	79	89	2026-01-08	da_nop
3456	79	90	2026-01-08	da_nop
3457	79	91	2026-01-08	da_nop
3458	79	92	2026-01-08	da_nop
3459	79	93	2026-01-08	da_nop
3460	79	94	2026-01-08	tre_han
3461	79	95	2026-01-08	da_nop
3462	79	96	2026-01-08	da_nop
3463	79	97	2026-01-08	tre_han
3464	79	98	2026-01-08	tre_han
3465	79	99	2026-01-08	tre_han
3466	79	100	2026-01-08	da_nop
3467	79	101	2026-01-08	da_nop
3468	79	102	2026-01-08	da_nop
3469	79	103	2026-01-08	da_nop
3470	79	104	2026-01-08	tre_han
3471	79	105	2026-01-08	da_nop
3472	79	106	2026-01-08	da_nop
3473	79	107	2026-01-08	da_nop
3474	79	108	2026-01-08	da_nop
3475	79	109	2026-01-08	da_nop
3476	79	110	2026-01-08	da_nop
3477	80	67	2026-01-08	da_nop
3478	80	68	2026-01-08	da_nop
3479	80	69	2026-01-08	da_nop
3480	80	70	2026-01-08	tre_han
3481	80	71	2026-01-08	tre_han
3482	80	72	2026-01-08	tre_han
3483	80	73	2026-01-08	da_nop
3484	80	74	2026-01-08	tre_han
3485	80	75	2026-01-08	da_nop
3486	80	76	2026-01-08	da_nop
3487	80	77	2026-01-08	da_nop
3488	80	78	2026-01-08	da_nop
3489	80	79	2026-01-08	da_nop
3490	80	80	2026-01-08	da_nop
3491	80	81	2026-01-08	da_nop
3492	80	82	2026-01-08	da_nop
3493	80	83	2026-01-08	da_nop
3494	80	84	2026-01-08	da_nop
3495	80	85	2026-01-08	da_nop
3496	80	86	2026-01-08	da_nop
3497	80	87	2026-01-08	da_nop
3498	80	88	2026-01-08	tre_han
3499	80	89	2026-01-08	da_nop
3500	80	90	2026-01-08	da_nop
3501	80	91	2026-01-08	da_nop
3502	80	92	2026-01-08	da_nop
3503	80	93	2026-01-08	da_nop
3504	80	94	2026-01-08	da_nop
3505	80	95	2026-01-08	da_nop
3506	80	96	2026-01-08	da_nop
3507	80	97	2026-01-08	da_nop
3508	80	98	2026-01-08	da_nop
3509	80	99	2026-01-08	tre_han
3510	80	100	2026-01-08	da_nop
3511	80	101	2026-01-08	da_nop
3512	80	102	2026-01-08	da_nop
3513	80	103	2026-01-08	da_nop
3514	80	104	2026-01-08	da_nop
3515	80	105	2026-01-08	da_nop
3516	80	106	2026-01-08	tre_han
3517	80	107	2026-01-08	da_nop
3518	80	108	2026-01-08	da_nop
3519	80	109	2026-01-08	da_nop
3520	80	110	2026-01-08	da_nop
3521	81	67	2026-01-08	da_nop
3522	81	68	2026-01-08	tre_han
3523	81	69	2026-01-08	da_nop
3524	81	70	2026-01-08	tre_han
3525	81	71	2026-01-08	da_nop
3526	81	72	2026-01-08	da_nop
3527	81	73	2026-01-08	da_nop
3528	81	74	2026-01-08	da_nop
3529	81	75	2026-01-08	da_nop
3530	81	76	2026-01-08	da_nop
3531	81	77	2026-01-08	da_nop
3532	81	78	2026-01-08	da_nop
3533	81	79	2026-01-08	da_nop
3534	81	80	2026-01-08	da_nop
3535	81	81	2026-01-08	tre_han
3536	81	82	2026-01-08	da_nop
3537	81	83	2026-01-08	da_nop
3538	81	84	2026-01-08	da_nop
3539	81	85	2026-01-08	da_nop
3540	81	86	2026-01-08	da_nop
3541	81	87	2026-01-08	tre_han
3542	81	88	2026-01-08	tre_han
3543	81	89	2026-01-08	da_nop
3544	81	90	2026-01-08	tre_han
3545	81	91	2026-01-08	da_nop
3546	81	92	2026-01-08	da_nop
3547	81	93	2026-01-08	da_nop
3548	81	94	2026-01-08	da_nop
3549	81	95	2026-01-08	tre_han
3550	81	96	2026-01-08	da_nop
3551	81	97	2026-01-08	da_nop
3552	81	98	2026-01-08	da_nop
3553	81	99	2026-01-08	da_nop
3554	81	100	2026-01-08	da_nop
3555	81	101	2026-01-08	da_nop
3556	81	102	2026-01-08	da_nop
3557	81	103	2026-01-08	tre_han
3558	81	104	2026-01-08	da_nop
3559	81	105	2026-01-08	da_nop
3560	81	106	2026-01-08	da_nop
3561	81	107	2026-01-08	da_nop
3562	81	108	2026-01-08	da_nop
3563	81	109	2026-01-08	da_nop
3564	81	110	2026-01-08	tre_han
3565	82	67	2026-01-08	da_nop
3566	82	68	2026-01-08	da_nop
3567	82	69	2026-01-08	tre_han
3568	82	70	2026-01-08	da_nop
3569	82	71	2026-01-08	da_nop
3570	82	72	2026-01-08	da_nop
3571	82	73	2026-01-08	da_nop
3572	82	74	2026-01-08	tre_han
3573	82	75	2026-01-08	da_nop
3574	82	76	2026-01-08	da_nop
3575	82	77	2026-01-08	tre_han
3576	82	78	2026-01-08	da_nop
3577	82	79	2026-01-08	da_nop
3578	82	80	2026-01-08	da_nop
3579	82	81	2026-01-08	da_nop
3580	82	82	2026-01-08	da_nop
3581	82	83	2026-01-08	da_nop
3582	82	84	2026-01-08	da_nop
3583	82	85	2026-01-08	da_nop
3584	82	86	2026-01-08	da_nop
3585	82	87	2026-01-08	tre_han
3586	82	88	2026-01-08	da_nop
3587	82	89	2026-01-08	da_nop
3588	82	90	2026-01-08	da_nop
3589	82	91	2026-01-08	da_nop
3590	82	92	2026-01-08	tre_han
3591	82	93	2026-01-08	da_nop
3592	82	94	2026-01-08	da_nop
3593	82	95	2026-01-08	tre_han
3594	82	96	2026-01-08	tre_han
3595	82	97	2026-01-08	da_nop
3596	82	98	2026-01-08	da_nop
3597	82	99	2026-01-08	da_nop
3598	82	100	2026-01-08	da_nop
3599	82	101	2026-01-08	da_nop
3600	82	102	2026-01-08	da_nop
3601	82	103	2026-01-08	da_nop
3602	82	104	2026-01-08	da_nop
3603	82	105	2026-01-08	tre_han
3604	82	106	2026-01-08	da_nop
3605	82	107	2026-01-08	da_nop
3606	82	108	2026-01-08	da_nop
3607	82	109	2026-01-08	tre_han
3608	82	110	2026-01-08	da_nop
3609	83	67	2026-01-08	da_nop
3610	83	68	2026-01-08	da_nop
3611	83	69	2026-01-08	da_nop
3612	83	70	2026-01-08	tre_han
3613	83	71	2026-01-08	da_nop
3614	83	72	2026-01-08	da_nop
3615	83	73	2026-01-08	da_nop
3616	83	74	2026-01-08	da_nop
3617	83	75	2026-01-08	tre_han
3618	83	76	2026-01-08	da_nop
3619	83	77	2026-01-08	da_nop
3620	83	78	2026-01-08	da_nop
3621	83	79	2026-01-08	tre_han
3622	83	80	2026-01-08	da_nop
3623	83	81	2026-01-08	tre_han
3624	83	82	2026-01-08	da_nop
3625	83	83	2026-01-08	da_nop
3626	83	84	2026-01-08	tre_han
3627	83	85	2026-01-08	da_nop
3628	83	86	2026-01-08	tre_han
3629	83	87	2026-01-08	da_nop
3630	83	88	2026-01-08	da_nop
3631	83	89	2026-01-08	da_nop
3632	83	90	2026-01-08	da_nop
3633	83	91	2026-01-08	da_nop
3634	83	92	2026-01-08	da_nop
3635	83	93	2026-01-08	da_nop
3636	83	94	2026-01-08	tre_han
3637	83	95	2026-01-08	tre_han
3638	83	96	2026-01-08	da_nop
3639	83	97	2026-01-08	da_nop
3640	83	98	2026-01-08	da_nop
3641	83	99	2026-01-08	tre_han
3642	83	100	2026-01-08	tre_han
3643	83	101	2026-01-08	da_nop
3644	83	102	2026-01-08	tre_han
3645	83	103	2026-01-08	tre_han
3646	83	104	2026-01-08	da_nop
3647	83	105	2026-01-08	da_nop
3648	83	106	2026-01-08	da_nop
3649	83	107	2026-01-08	da_nop
3650	83	108	2026-01-08	da_nop
3651	83	109	2026-01-08	da_nop
3652	83	110	2026-01-08	da_nop
3653	84	67	2026-01-08	da_nop
3654	84	68	2026-01-08	da_nop
3655	84	69	2026-01-08	tre_han
3656	84	70	2026-01-08	da_nop
3657	84	71	2026-01-08	da_nop
3658	84	72	2026-01-08	da_nop
3659	84	73	2026-01-08	da_nop
3660	84	74	2026-01-08	da_nop
3661	84	75	2026-01-08	da_nop
3662	84	76	2026-01-08	da_nop
3663	84	77	2026-01-08	tre_han
3664	84	78	2026-01-08	da_nop
3665	84	79	2026-01-08	tre_han
3666	84	80	2026-01-08	tre_han
3667	84	81	2026-01-08	da_nop
3668	84	82	2026-01-08	tre_han
3669	84	83	2026-01-08	tre_han
3670	84	84	2026-01-08	da_nop
3671	84	85	2026-01-08	da_nop
3672	84	86	2026-01-08	da_nop
3673	84	87	2026-01-08	da_nop
3674	84	88	2026-01-08	da_nop
3675	84	89	2026-01-08	da_nop
3676	84	90	2026-01-08	da_nop
3677	84	91	2026-01-08	da_nop
3678	84	92	2026-01-08	da_nop
3679	84	93	2026-01-08	tre_han
3680	84	94	2026-01-08	da_nop
3681	84	95	2026-01-08	da_nop
3682	84	96	2026-01-08	da_nop
3683	84	97	2026-01-08	da_nop
3684	84	98	2026-01-08	da_nop
3685	84	99	2026-01-08	da_nop
3686	84	100	2026-01-08	da_nop
3687	84	101	2026-01-08	da_nop
3688	84	102	2026-01-08	da_nop
3689	84	103	2026-01-08	da_nop
3690	84	104	2026-01-08	tre_han
3691	84	105	2026-01-08	tre_han
3692	84	106	2026-01-08	da_nop
3693	84	107	2026-01-08	da_nop
3694	84	108	2026-01-08	tre_han
3695	84	109	2026-01-08	da_nop
3696	84	110	2026-01-08	da_nop
3697	85	67	2026-01-08	tre_han
3698	85	68	2026-01-08	da_nop
3699	85	69	2026-01-08	da_nop
3700	85	70	2026-01-08	da_nop
3701	85	71	2026-01-08	tre_han
3702	85	72	2026-01-08	da_nop
3703	85	73	2026-01-08	tre_han
3704	85	74	2026-01-08	da_nop
3705	85	75	2026-01-08	da_nop
3706	85	76	2026-01-08	da_nop
3707	85	77	2026-01-08	tre_han
3708	85	78	2026-01-08	da_nop
3709	85	79	2026-01-08	da_nop
3710	85	80	2026-01-08	da_nop
3711	85	81	2026-01-08	da_nop
3712	85	82	2026-01-08	da_nop
3713	85	83	2026-01-08	tre_han
3714	85	84	2026-01-08	da_nop
3715	85	85	2026-01-08	da_nop
3716	85	86	2026-01-08	da_nop
3717	85	87	2026-01-08	da_nop
3718	85	88	2026-01-08	da_nop
3719	85	89	2026-01-08	tre_han
3720	85	90	2026-01-08	da_nop
3721	85	91	2026-01-08	da_nop
3722	85	92	2026-01-08	da_nop
3723	85	93	2026-01-08	da_nop
3724	85	94	2026-01-08	tre_han
3725	85	95	2026-01-08	da_nop
3726	85	96	2026-01-08	da_nop
3727	85	97	2026-01-08	da_nop
3728	85	98	2026-01-08	da_nop
3729	85	99	2026-01-08	da_nop
3730	85	100	2026-01-08	tre_han
3731	85	101	2026-01-08	da_nop
3732	85	102	2026-01-08	da_nop
3733	85	103	2026-01-08	da_nop
3734	85	104	2026-01-08	da_nop
3735	85	105	2026-01-08	da_nop
3736	85	106	2026-01-08	da_nop
3737	85	107	2026-01-08	tre_han
3738	85	108	2026-01-08	da_nop
3739	85	109	2026-01-08	da_nop
3740	85	110	2026-01-08	da_nop
3741	86	67	2026-01-08	da_nop
3742	86	68	2026-01-08	da_nop
3743	86	69	2026-01-08	da_nop
3744	86	70	2026-01-08	da_nop
3745	86	71	2026-01-08	da_nop
3746	86	72	2026-01-08	da_nop
3747	86	73	2026-01-08	da_nop
3748	86	74	2026-01-08	da_nop
3749	86	75	2026-01-08	da_nop
3750	86	76	2026-01-08	da_nop
3751	86	77	2026-01-08	da_nop
3752	86	78	2026-01-08	da_nop
3753	86	79	2026-01-08	da_nop
3754	86	80	2026-01-08	tre_han
3755	86	81	2026-01-08	da_nop
3756	86	82	2026-01-08	da_nop
3757	86	83	2026-01-08	da_nop
3758	86	84	2026-01-08	da_nop
3759	86	85	2026-01-08	da_nop
3760	86	86	2026-01-08	da_nop
3761	86	87	2026-01-08	da_nop
3762	86	88	2026-01-08	tre_han
3763	86	89	2026-01-08	tre_han
3764	86	90	2026-01-08	da_nop
3765	86	91	2026-01-08	da_nop
3766	86	92	2026-01-08	tre_han
3767	86	93	2026-01-08	da_nop
3768	86	94	2026-01-08	da_nop
3769	86	95	2026-01-08	da_nop
3770	86	96	2026-01-08	da_nop
3771	86	97	2026-01-08	da_nop
3772	86	98	2026-01-08	da_nop
3773	86	99	2026-01-08	da_nop
3774	86	100	2026-01-08	da_nop
3775	86	101	2026-01-08	tre_han
3776	86	102	2026-01-08	da_nop
3777	86	103	2026-01-08	da_nop
3778	86	104	2026-01-08	da_nop
3779	86	105	2026-01-08	tre_han
3780	86	106	2026-01-08	tre_han
3781	86	107	2026-01-08	da_nop
3782	86	108	2026-01-08	da_nop
3783	86	109	2026-01-08	da_nop
3784	86	110	2026-01-08	da_nop
3785	87	67	2026-01-08	da_nop
3786	87	68	2026-01-08	da_nop
3787	87	69	2026-01-08	tre_han
3788	87	70	2026-01-08	da_nop
3789	87	71	2026-01-08	da_nop
3790	87	72	2026-01-08	da_nop
3791	87	73	2026-01-08	da_nop
3792	87	74	2026-01-08	da_nop
3793	87	75	2026-01-08	da_nop
3794	87	76	2026-01-08	da_nop
3795	87	77	2026-01-08	da_nop
3796	87	78	2026-01-08	da_nop
3797	87	79	2026-01-08	da_nop
3798	87	80	2026-01-08	da_nop
3799	87	81	2026-01-08	tre_han
3800	87	82	2026-01-08	da_nop
3801	87	83	2026-01-08	da_nop
3802	87	84	2026-01-08	da_nop
3803	87	85	2026-01-08	da_nop
3804	87	86	2026-01-08	da_nop
3805	87	87	2026-01-08	da_nop
3806	87	88	2026-01-08	da_nop
3807	87	89	2026-01-08	da_nop
3808	87	90	2026-01-08	da_nop
3809	87	91	2026-01-08	da_nop
3810	87	92	2026-01-08	da_nop
3811	87	93	2026-01-08	da_nop
3812	87	94	2026-01-08	da_nop
3813	87	95	2026-01-08	tre_han
3814	87	96	2026-01-08	da_nop
3815	87	97	2026-01-08	da_nop
3816	87	98	2026-01-08	da_nop
3817	87	99	2026-01-08	da_nop
3818	87	100	2026-01-08	tre_han
3819	87	101	2026-01-08	da_nop
3820	87	102	2026-01-08	da_nop
3821	87	103	2026-01-08	da_nop
3822	87	104	2026-01-08	da_nop
3823	87	105	2026-01-08	da_nop
3824	87	106	2026-01-08	da_nop
3825	87	107	2026-01-08	da_nop
3826	87	108	2026-01-08	da_nop
3827	87	109	2026-01-08	da_nop
3828	87	110	2026-01-08	da_nop
3829	88	67	2026-01-08	da_nop
3830	88	68	2026-01-08	da_nop
3831	88	69	2026-01-08	tre_han
3832	88	70	2026-01-08	da_nop
3833	88	71	2026-01-08	da_nop
3834	88	72	2026-01-08	da_nop
3835	88	73	2026-01-08	da_nop
3836	88	74	2026-01-08	da_nop
3837	88	75	2026-01-08	da_nop
3838	88	76	2026-01-08	da_nop
3839	88	77	2026-01-08	da_nop
3840	88	78	2026-01-08	tre_han
3841	88	79	2026-01-08	da_nop
3842	88	80	2026-01-08	da_nop
3843	88	81	2026-01-08	da_nop
3844	88	82	2026-01-08	da_nop
3845	88	83	2026-01-08	da_nop
3846	88	84	2026-01-08	tre_han
3847	88	85	2026-01-08	tre_han
3848	88	86	2026-01-08	da_nop
3849	88	87	2026-01-08	da_nop
3850	88	88	2026-01-08	da_nop
3851	88	89	2026-01-08	da_nop
3852	88	90	2026-01-08	da_nop
3853	88	91	2026-01-08	da_nop
3854	88	92	2026-01-08	da_nop
3855	88	93	2026-01-08	da_nop
3856	88	94	2026-01-08	da_nop
3857	88	95	2026-01-08	da_nop
3858	88	96	2026-01-08	da_nop
3859	88	97	2026-01-08	da_nop
3860	88	98	2026-01-08	da_nop
3861	88	99	2026-01-08	da_nop
3862	88	100	2026-01-08	da_nop
3863	88	101	2026-01-08	da_nop
3864	88	102	2026-01-08	da_nop
3865	88	103	2026-01-08	da_nop
3866	88	104	2026-01-08	da_nop
3867	88	105	2026-01-08	da_nop
3868	88	106	2026-01-08	da_nop
3869	88	107	2026-01-08	da_nop
3870	88	108	2026-01-08	da_nop
3871	88	109	2026-01-08	da_nop
3872	88	110	2026-01-08	tre_han
3873	89	67	2026-01-08	da_nop
3874	89	68	2026-01-08	da_nop
3875	89	69	2026-01-08	da_nop
3876	89	70	2026-01-08	tre_han
3877	89	71	2026-01-08	tre_han
3878	89	72	2026-01-08	da_nop
3879	89	73	2026-01-08	da_nop
3880	89	74	2026-01-08	tre_han
3881	89	75	2026-01-08	tre_han
3882	89	76	2026-01-08	da_nop
3883	89	77	2026-01-08	tre_han
3884	89	78	2026-01-08	da_nop
3885	89	79	2026-01-08	da_nop
3886	89	80	2026-01-08	da_nop
3887	89	81	2026-01-08	da_nop
3888	89	82	2026-01-08	tre_han
3889	89	83	2026-01-08	da_nop
3890	89	84	2026-01-08	da_nop
3891	89	85	2026-01-08	tre_han
3892	89	86	2026-01-08	da_nop
3893	89	87	2026-01-08	da_nop
3894	89	88	2026-01-08	da_nop
3895	89	89	2026-01-08	da_nop
3896	89	90	2026-01-08	tre_han
3897	89	91	2026-01-08	da_nop
3898	89	92	2026-01-08	da_nop
3899	89	93	2026-01-08	tre_han
3900	89	94	2026-01-08	da_nop
3901	89	95	2026-01-08	tre_han
3902	89	96	2026-01-08	tre_han
3903	89	97	2026-01-08	da_nop
3904	89	98	2026-01-08	da_nop
3905	89	99	2026-01-08	da_nop
3906	89	100	2026-01-08	tre_han
3907	89	101	2026-01-08	da_nop
3908	89	102	2026-01-08	da_nop
3909	89	103	2026-01-08	da_nop
3910	89	104	2026-01-08	da_nop
3911	89	105	2026-01-08	da_nop
3912	89	106	2026-01-08	da_nop
3913	89	107	2026-01-08	tre_han
3914	89	108	2026-01-08	tre_han
3915	89	109	2026-01-08	da_nop
3916	89	110	2026-01-08	da_nop
3917	90	67	2026-01-08	da_nop
3918	90	68	2026-01-08	da_nop
3919	90	69	2026-01-08	da_nop
3920	90	70	2026-01-08	da_nop
3921	90	71	2026-01-08	da_nop
3922	90	72	2026-01-08	da_nop
3923	90	73	2026-01-08	da_nop
3924	90	74	2026-01-08	da_nop
3925	90	75	2026-01-08	da_nop
3926	90	76	2026-01-08	da_nop
3927	90	77	2026-01-08	tre_han
3928	90	78	2026-01-08	da_nop
3929	90	79	2026-01-08	da_nop
3930	90	80	2026-01-08	da_nop
3931	90	81	2026-01-08	da_nop
3932	90	82	2026-01-08	da_nop
3933	90	83	2026-01-08	da_nop
3934	90	84	2026-01-08	da_nop
3935	90	85	2026-01-08	tre_han
3936	90	86	2026-01-08	da_nop
3937	90	87	2026-01-08	da_nop
3938	90	88	2026-01-08	da_nop
3939	90	89	2026-01-08	da_nop
3940	90	90	2026-01-08	da_nop
3941	90	91	2026-01-08	da_nop
3942	90	92	2026-01-08	da_nop
3943	90	93	2026-01-08	da_nop
3944	90	94	2026-01-08	da_nop
3945	90	95	2026-01-08	da_nop
3946	90	96	2026-01-08	da_nop
3947	90	97	2026-01-08	da_nop
3948	90	98	2026-01-08	da_nop
3949	90	99	2026-01-08	da_nop
3950	90	100	2026-01-08	da_nop
3951	90	101	2026-01-08	da_nop
3952	90	102	2026-01-08	tre_han
3953	90	103	2026-01-08	da_nop
3954	90	104	2026-01-08	da_nop
3955	90	105	2026-01-08	da_nop
3956	90	106	2026-01-08	da_nop
3957	90	107	2026-01-08	da_nop
3958	90	108	2026-01-08	da_nop
3959	90	109	2026-01-08	da_nop
3960	90	110	2026-01-08	da_nop
3961	91	67	2026-01-08	tre_han
3962	91	68	2026-01-08	da_nop
3963	91	69	2026-01-08	da_nop
3964	91	70	2026-01-08	da_nop
3965	91	71	2026-01-08	da_nop
3966	91	72	2026-01-08	da_nop
3967	91	73	2026-01-08	da_nop
3968	91	74	2026-01-08	da_nop
3969	91	75	2026-01-08	da_nop
3970	91	76	2026-01-08	da_nop
3971	91	77	2026-01-08	da_nop
3972	91	78	2026-01-08	da_nop
3973	91	79	2026-01-08	da_nop
3974	91	80	2026-01-08	tre_han
3975	91	81	2026-01-08	da_nop
3976	91	82	2026-01-08	da_nop
3977	91	83	2026-01-08	da_nop
3978	91	84	2026-01-08	da_nop
3979	91	85	2026-01-08	da_nop
3980	91	86	2026-01-08	da_nop
3981	91	87	2026-01-08	da_nop
3982	91	88	2026-01-08	da_nop
3983	91	89	2026-01-08	da_nop
3984	91	90	2026-01-08	da_nop
3985	91	91	2026-01-08	tre_han
3986	91	92	2026-01-08	da_nop
3987	91	93	2026-01-08	da_nop
3988	91	94	2026-01-08	da_nop
3989	91	95	2026-01-08	da_nop
3990	91	96	2026-01-08	da_nop
3991	91	97	2026-01-08	da_nop
3992	91	98	2026-01-08	da_nop
3993	91	99	2026-01-08	da_nop
3994	91	100	2026-01-08	da_nop
3995	91	101	2026-01-08	tre_han
3996	91	102	2026-01-08	da_nop
3997	91	103	2026-01-08	da_nop
3998	91	104	2026-01-08	da_nop
3999	91	105	2026-01-08	da_nop
4000	91	106	2026-01-08	da_nop
4001	91	107	2026-01-08	da_nop
4002	91	108	2026-01-08	da_nop
4003	91	109	2026-01-08	da_nop
4004	91	110	2026-01-08	da_nop
4005	92	67	2026-01-08	tre_han
4006	92	68	2026-01-08	da_nop
4007	92	69	2026-01-08	tre_han
4008	92	70	2026-01-08	da_nop
4009	92	71	2026-01-08	da_nop
4010	92	72	2026-01-08	da_nop
4011	92	73	2026-01-08	tre_han
4012	92	74	2026-01-08	da_nop
4013	92	75	2026-01-08	da_nop
4014	92	76	2026-01-08	da_nop
4015	92	77	2026-01-08	da_nop
4016	92	78	2026-01-08	da_nop
4017	92	79	2026-01-08	da_nop
4018	92	80	2026-01-08	tre_han
4019	92	81	2026-01-08	da_nop
4020	92	82	2026-01-08	da_nop
4021	92	83	2026-01-08	da_nop
4022	92	84	2026-01-08	da_nop
4023	92	85	2026-01-08	da_nop
4024	92	86	2026-01-08	da_nop
4025	92	87	2026-01-08	da_nop
4026	92	88	2026-01-08	da_nop
4027	92	89	2026-01-08	da_nop
4028	92	90	2026-01-08	tre_han
4029	92	91	2026-01-08	da_nop
4030	92	92	2026-01-08	da_nop
4031	92	93	2026-01-08	da_nop
4032	92	94	2026-01-08	tre_han
4033	92	95	2026-01-08	da_nop
4034	92	96	2026-01-08	da_nop
4035	92	97	2026-01-08	da_nop
4036	92	98	2026-01-08	tre_han
4037	92	99	2026-01-08	da_nop
4038	92	100	2026-01-08	tre_han
4039	92	101	2026-01-08	da_nop
4040	92	102	2026-01-08	da_nop
4041	92	103	2026-01-08	tre_han
4042	92	104	2026-01-08	da_nop
4043	92	105	2026-01-08	da_nop
4044	92	106	2026-01-08	da_nop
4045	92	107	2026-01-08	da_nop
4046	92	108	2026-01-08	da_nop
4047	92	109	2026-01-08	da_nop
4048	92	110	2026-01-08	da_nop
4049	93	67	2026-01-08	da_nop
4050	93	68	2026-01-08	tre_han
4051	93	69	2026-01-08	da_nop
4052	93	70	2026-01-08	da_nop
4053	93	71	2026-01-08	da_nop
4054	93	72	2026-01-08	tre_han
4055	93	73	2026-01-08	tre_han
4056	93	74	2026-01-08	da_nop
4057	93	75	2026-01-08	da_nop
4058	93	76	2026-01-08	tre_han
4059	93	77	2026-01-08	da_nop
4060	93	78	2026-01-08	da_nop
4061	93	79	2026-01-08	tre_han
4062	93	80	2026-01-08	da_nop
4063	93	81	2026-01-08	tre_han
4064	93	82	2026-01-08	tre_han
4065	93	83	2026-01-08	tre_han
4066	93	84	2026-01-08	da_nop
4067	93	85	2026-01-08	tre_han
4068	93	86	2026-01-08	da_nop
4069	93	87	2026-01-08	tre_han
4070	93	88	2026-01-08	da_nop
4071	93	89	2026-01-08	da_nop
4072	93	90	2026-01-08	da_nop
4073	93	91	2026-01-08	tre_han
4074	93	92	2026-01-08	tre_han
4075	93	93	2026-01-08	tre_han
4076	93	94	2026-01-08	da_nop
4077	93	95	2026-01-08	da_nop
4078	93	96	2026-01-08	da_nop
4079	93	97	2026-01-08	da_nop
4080	93	98	2026-01-08	tre_han
4081	93	99	2026-01-08	da_nop
4082	93	100	2026-01-08	da_nop
4083	93	101	2026-01-08	da_nop
4084	93	102	2026-01-08	da_nop
4085	93	103	2026-01-08	tre_han
4086	93	104	2026-01-08	da_nop
4087	93	105	2026-01-08	da_nop
4088	93	106	2026-01-08	tre_han
4089	93	107	2026-01-08	tre_han
4090	93	108	2026-01-08	tre_han
4091	93	109	2026-01-08	tre_han
4092	93	110	2026-01-08	da_nop
4093	94	67	2026-01-08	da_nop
4094	94	68	2026-01-08	da_nop
4095	94	69	2026-01-08	da_nop
4096	94	70	2026-01-08	tre_han
4097	94	71	2026-01-08	tre_han
4098	94	72	2026-01-08	da_nop
4099	94	73	2026-01-08	da_nop
4100	94	74	2026-01-08	da_nop
4101	94	75	2026-01-08	da_nop
4102	94	76	2026-01-08	da_nop
4103	94	77	2026-01-08	da_nop
4104	94	78	2026-01-08	da_nop
4105	94	79	2026-01-08	da_nop
4106	94	80	2026-01-08	tre_han
4107	94	81	2026-01-08	tre_han
4108	94	82	2026-01-08	da_nop
4109	94	83	2026-01-08	da_nop
4110	94	84	2026-01-08	tre_han
4111	94	85	2026-01-08	tre_han
4112	94	86	2026-01-08	da_nop
4113	94	87	2026-01-08	da_nop
4114	94	88	2026-01-08	tre_han
4115	94	89	2026-01-08	da_nop
4116	94	90	2026-01-08	da_nop
4117	94	91	2026-01-08	da_nop
4118	94	92	2026-01-08	da_nop
4119	94	93	2026-01-08	tre_han
4120	94	94	2026-01-08	da_nop
4121	94	95	2026-01-08	da_nop
4122	94	96	2026-01-08	tre_han
4123	94	97	2026-01-08	da_nop
4124	94	98	2026-01-08	da_nop
4125	94	99	2026-01-08	tre_han
4126	94	100	2026-01-08	da_nop
4127	94	101	2026-01-08	tre_han
4128	94	102	2026-01-08	tre_han
4129	94	103	2026-01-08	da_nop
4130	94	104	2026-01-08	da_nop
4131	94	105	2026-01-08	tre_han
4132	94	106	2026-01-08	da_nop
4133	94	107	2026-01-08	da_nop
4134	94	108	2026-01-08	da_nop
4135	94	109	2026-01-08	tre_han
4136	94	110	2026-01-08	da_nop
4137	95	67	2026-01-08	da_nop
4138	95	68	2026-01-08	da_nop
4139	95	69	2026-01-08	da_nop
4140	95	70	2026-01-08	tre_han
4141	95	71	2026-01-08	da_nop
4142	95	72	2026-01-08	da_nop
4143	95	73	2026-01-08	da_nop
4144	95	74	2026-01-08	da_nop
4145	95	75	2026-01-08	da_nop
4146	95	76	2026-01-08	tre_han
4147	95	77	2026-01-08	da_nop
4148	95	78	2026-01-08	da_nop
4149	95	79	2026-01-08	da_nop
4150	95	80	2026-01-08	da_nop
4151	95	81	2026-01-08	tre_han
4152	95	82	2026-01-08	da_nop
4153	95	83	2026-01-08	da_nop
4154	95	84	2026-01-08	da_nop
4155	95	85	2026-01-08	da_nop
4156	95	86	2026-01-08	tre_han
4157	95	87	2026-01-08	da_nop
4158	95	88	2026-01-08	da_nop
4159	95	89	2026-01-08	tre_han
4160	95	90	2026-01-08	tre_han
4161	95	91	2026-01-08	da_nop
4162	95	92	2026-01-08	da_nop
4163	95	93	2026-01-08	da_nop
4164	95	94	2026-01-08	da_nop
4165	95	95	2026-01-08	da_nop
4166	95	96	2026-01-08	da_nop
4167	95	97	2026-01-08	da_nop
4168	95	98	2026-01-08	tre_han
4169	95	99	2026-01-08	tre_han
4170	95	100	2026-01-08	da_nop
4171	95	101	2026-01-08	da_nop
4172	95	102	2026-01-08	tre_han
4173	95	103	2026-01-08	da_nop
4174	95	104	2026-01-08	da_nop
4175	95	105	2026-01-08	da_nop
4176	95	106	2026-01-08	tre_han
4177	95	107	2026-01-08	tre_han
4178	95	108	2026-01-08	da_nop
4179	95	109	2026-01-08	da_nop
4180	95	110	2026-01-08	da_nop
4181	96	67	2026-01-08	da_nop
4182	96	68	2026-01-08	da_nop
4183	96	69	2026-01-08	da_nop
4184	96	70	2026-01-08	tre_han
4185	96	71	2026-01-08	tre_han
4186	96	72	2026-01-08	da_nop
4187	96	73	2026-01-08	da_nop
4188	96	74	2026-01-08	da_nop
4189	96	75	2026-01-08	tre_han
4190	96	76	2026-01-08	da_nop
4191	96	77	2026-01-08	da_nop
4192	96	78	2026-01-08	da_nop
4193	96	79	2026-01-08	da_nop
4194	96	80	2026-01-08	tre_han
4195	96	81	2026-01-08	da_nop
4196	96	82	2026-01-08	da_nop
4197	96	83	2026-01-08	da_nop
4198	96	84	2026-01-08	da_nop
4199	96	85	2026-01-08	da_nop
4200	96	86	2026-01-08	da_nop
4201	96	87	2026-01-08	da_nop
4202	96	88	2026-01-08	da_nop
4203	96	89	2026-01-08	da_nop
4204	96	90	2026-01-08	da_nop
4205	96	91	2026-01-08	da_nop
4206	96	92	2026-01-08	da_nop
4207	96	93	2026-01-08	da_nop
4208	96	94	2026-01-08	da_nop
4209	96	95	2026-01-08	da_nop
4210	96	96	2026-01-08	da_nop
4211	96	97	2026-01-08	da_nop
4212	96	98	2026-01-08	da_nop
4213	96	99	2026-01-08	tre_han
4214	96	100	2026-01-08	tre_han
4215	96	101	2026-01-08	da_nop
4216	96	102	2026-01-08	da_nop
4217	96	103	2026-01-08	da_nop
4218	96	104	2026-01-08	da_nop
4219	96	105	2026-01-08	da_nop
4220	96	106	2026-01-08	da_nop
4221	96	107	2026-01-08	da_nop
4222	96	108	2026-01-08	da_nop
4223	96	109	2026-01-08	da_nop
4224	96	110	2026-01-08	da_nop
4225	97	67	2026-01-08	tre_han
4226	97	68	2026-01-08	da_nop
4227	97	69	2026-01-08	da_nop
4228	97	70	2026-01-08	da_nop
4229	97	71	2026-01-08	tre_han
4230	97	72	2026-01-08	da_nop
4231	97	73	2026-01-08	da_nop
4232	97	74	2026-01-08	da_nop
4233	97	75	2026-01-08	da_nop
4234	97	76	2026-01-08	da_nop
4235	97	77	2026-01-08	da_nop
4236	97	78	2026-01-08	da_nop
4237	97	79	2026-01-08	da_nop
4238	97	80	2026-01-08	da_nop
4239	97	81	2026-01-08	da_nop
4240	97	82	2026-01-08	tre_han
4241	97	83	2026-01-08	da_nop
4242	97	84	2026-01-08	da_nop
4243	97	85	2026-01-08	tre_han
4244	97	86	2026-01-08	da_nop
4245	97	87	2026-01-08	da_nop
4246	97	88	2026-01-08	da_nop
4247	97	89	2026-01-08	da_nop
4248	97	90	2026-01-08	da_nop
4249	97	91	2026-01-08	da_nop
4250	97	92	2026-01-08	tre_han
4251	97	93	2026-01-08	tre_han
4252	97	94	2026-01-08	da_nop
4253	97	95	2026-01-08	da_nop
4254	97	96	2026-01-08	da_nop
4255	97	97	2026-01-08	da_nop
4256	97	98	2026-01-08	tre_han
4257	97	99	2026-01-08	da_nop
4258	97	100	2026-01-08	da_nop
4259	97	101	2026-01-08	da_nop
4260	97	102	2026-01-08	tre_han
4261	97	103	2026-01-08	da_nop
4262	97	104	2026-01-08	da_nop
4263	97	105	2026-01-08	da_nop
4264	97	106	2026-01-08	da_nop
4265	97	107	2026-01-08	da_nop
4266	97	108	2026-01-08	tre_han
4267	97	109	2026-01-08	da_nop
4268	97	110	2026-01-08	da_nop
4269	98	67	2026-01-08	da_nop
4270	98	68	2026-01-08	tre_han
4271	98	69	2026-01-08	da_nop
4272	98	70	2026-01-08	da_nop
4273	98	71	2026-01-08	da_nop
4274	98	72	2026-01-08	da_nop
4275	98	73	2026-01-08	tre_han
4276	98	74	2026-01-08	da_nop
4277	98	75	2026-01-08	da_nop
4278	98	76	2026-01-08	da_nop
4279	98	77	2026-01-08	tre_han
4280	98	78	2026-01-08	tre_han
4281	98	79	2026-01-08	da_nop
4282	98	80	2026-01-08	tre_han
4283	98	81	2026-01-08	tre_han
4284	98	82	2026-01-08	da_nop
4285	98	83	2026-01-08	da_nop
4286	98	84	2026-01-08	tre_han
4287	98	85	2026-01-08	da_nop
4288	98	86	2026-01-08	tre_han
4289	98	87	2026-01-08	da_nop
4290	98	88	2026-01-08	da_nop
4291	98	89	2026-01-08	da_nop
4292	98	90	2026-01-08	tre_han
4293	98	91	2026-01-08	da_nop
4294	98	92	2026-01-08	da_nop
4295	98	93	2026-01-08	da_nop
4296	98	94	2026-01-08	da_nop
4297	98	95	2026-01-08	tre_han
4298	98	96	2026-01-08	da_nop
4299	98	97	2026-01-08	da_nop
4300	98	98	2026-01-08	da_nop
4301	98	99	2026-01-08	da_nop
4302	98	100	2026-01-08	da_nop
4303	98	101	2026-01-08	da_nop
4304	98	102	2026-01-08	da_nop
4305	98	103	2026-01-08	da_nop
4306	98	104	2026-01-08	da_nop
4307	98	105	2026-01-08	da_nop
4308	98	106	2026-01-08	da_nop
4309	98	107	2026-01-08	da_nop
4310	98	108	2026-01-08	da_nop
4311	98	109	2026-01-08	tre_han
4312	98	110	2026-01-08	da_nop
4313	99	67	2026-01-08	da_nop
4314	99	68	2026-01-08	da_nop
4315	99	69	2026-01-08	da_nop
4316	99	70	2026-01-08	tre_han
4317	99	71	2026-01-08	da_nop
4318	99	72	2026-01-08	da_nop
4319	99	73	2026-01-08	da_nop
4320	99	74	2026-01-08	da_nop
4321	99	75	2026-01-08	da_nop
4322	99	76	2026-01-08	tre_han
4323	99	77	2026-01-08	da_nop
4324	99	78	2026-01-08	tre_han
4325	99	79	2026-01-08	da_nop
4326	99	80	2026-01-08	da_nop
4327	99	81	2026-01-08	tre_han
4328	99	82	2026-01-08	da_nop
4329	99	83	2026-01-08	tre_han
4330	99	84	2026-01-08	da_nop
4331	99	85	2026-01-08	tre_han
4332	99	86	2026-01-08	tre_han
4333	99	87	2026-01-08	da_nop
4334	99	88	2026-01-08	tre_han
4335	99	89	2026-01-08	da_nop
4336	99	90	2026-01-08	da_nop
4337	99	91	2026-01-08	da_nop
4338	99	92	2026-01-08	tre_han
4339	99	93	2026-01-08	da_nop
4340	99	94	2026-01-08	da_nop
4341	99	95	2026-01-08	da_nop
4342	99	96	2026-01-08	da_nop
4343	99	97	2026-01-08	da_nop
4344	99	98	2026-01-08	da_nop
4345	99	99	2026-01-08	tre_han
4346	99	100	2026-01-08	da_nop
4347	99	101	2026-01-08	da_nop
4348	99	102	2026-01-08	da_nop
4349	99	103	2026-01-08	tre_han
4350	99	104	2026-01-08	tre_han
4351	99	105	2026-01-08	da_nop
4352	99	106	2026-01-08	da_nop
4353	99	107	2026-01-08	da_nop
4354	99	108	2026-01-08	da_nop
4355	99	109	2026-01-08	da_nop
4356	99	110	2026-01-08	da_nop
4357	100	67	2026-01-08	tre_han
4358	100	68	2026-01-08	da_nop
4359	100	69	2026-01-08	tre_han
4360	100	70	2026-01-08	tre_han
4361	100	71	2026-01-08	tre_han
4362	100	72	2026-01-08	da_nop
4363	100	73	2026-01-08	da_nop
4364	100	74	2026-01-08	da_nop
4365	100	75	2026-01-08	tre_han
4366	100	76	2026-01-08	tre_han
4367	100	77	2026-01-08	da_nop
4368	100	78	2026-01-08	da_nop
4369	100	79	2026-01-08	da_nop
4370	100	80	2026-01-08	da_nop
4371	100	81	2026-01-08	da_nop
4372	100	82	2026-01-08	da_nop
4373	100	83	2026-01-08	da_nop
4374	100	84	2026-01-08	da_nop
4375	100	85	2026-01-08	da_nop
4376	100	86	2026-01-08	da_nop
4377	100	87	2026-01-08	da_nop
4378	100	88	2026-01-08	da_nop
4379	100	89	2026-01-08	da_nop
4380	100	90	2026-01-08	da_nop
4381	100	91	2026-01-08	da_nop
4382	100	92	2026-01-08	da_nop
4383	100	93	2026-01-08	da_nop
4384	100	94	2026-01-08	tre_han
4385	100	95	2026-01-08	da_nop
4386	100	96	2026-01-08	da_nop
4387	100	97	2026-01-08	da_nop
4388	100	98	2026-01-08	da_nop
4389	100	99	2026-01-08	da_nop
4390	100	100	2026-01-08	da_nop
4391	100	101	2026-01-08	da_nop
4392	100	102	2026-01-08	da_nop
4393	100	103	2026-01-08	tre_han
4394	100	104	2026-01-08	da_nop
4395	100	105	2026-01-08	tre_han
4396	100	106	2026-01-08	da_nop
4397	100	107	2026-01-08	da_nop
4398	100	108	2026-01-08	da_nop
4399	100	109	2026-01-08	da_nop
4400	100	110	2026-01-08	tre_han
4401	101	67	2026-01-08	da_nop
4402	101	68	2026-01-08	da_nop
4403	101	69	2026-01-08	da_nop
4404	101	70	2026-01-08	da_nop
4405	101	71	2026-01-08	tre_han
4406	101	72	2026-01-08	da_nop
4407	101	73	2026-01-08	da_nop
4408	101	74	2026-01-08	da_nop
4409	101	75	2026-01-08	da_nop
4410	101	76	2026-01-08	da_nop
4411	101	77	2026-01-08	da_nop
4412	101	78	2026-01-08	tre_han
4413	101	79	2026-01-08	da_nop
4414	101	80	2026-01-08	da_nop
4415	101	81	2026-01-08	da_nop
4416	101	82	2026-01-08	da_nop
4417	101	83	2026-01-08	da_nop
4418	101	84	2026-01-08	da_nop
4419	101	85	2026-01-08	da_nop
4420	101	86	2026-01-08	tre_han
4421	101	87	2026-01-08	tre_han
4422	101	88	2026-01-08	da_nop
4423	101	89	2026-01-08	da_nop
4424	101	90	2026-01-08	da_nop
4425	101	91	2026-01-08	da_nop
4426	101	92	2026-01-08	da_nop
4427	101	93	2026-01-08	da_nop
4428	101	94	2026-01-08	da_nop
4429	101	95	2026-01-08	da_nop
4430	101	96	2026-01-08	da_nop
4431	101	97	2026-01-08	tre_han
4432	101	98	2026-01-08	da_nop
4433	101	99	2026-01-08	da_nop
4434	101	100	2026-01-08	tre_han
4435	101	101	2026-01-08	tre_han
4436	101	102	2026-01-08	da_nop
4437	101	103	2026-01-08	tre_han
4438	101	104	2026-01-08	da_nop
4439	101	105	2026-01-08	tre_han
4440	101	106	2026-01-08	da_nop
4441	101	107	2026-01-08	da_nop
4442	101	108	2026-01-08	da_nop
4443	101	109	2026-01-08	da_nop
4444	101	110	2026-01-08	da_nop
4445	102	67	2026-01-08	tre_han
4446	102	68	2026-01-08	da_nop
4447	102	69	2026-01-08	da_nop
4448	102	70	2026-01-08	tre_han
4449	102	71	2026-01-08	da_nop
4450	102	72	2026-01-08	tre_han
4451	102	73	2026-01-08	da_nop
4452	102	74	2026-01-08	da_nop
4453	102	75	2026-01-08	da_nop
4454	102	76	2026-01-08	da_nop
4455	102	77	2026-01-08	da_nop
4456	102	78	2026-01-08	da_nop
4457	102	79	2026-01-08	da_nop
4458	102	80	2026-01-08	da_nop
4459	102	81	2026-01-08	tre_han
4460	102	82	2026-01-08	da_nop
4461	102	83	2026-01-08	da_nop
4462	102	84	2026-01-08	da_nop
4463	102	85	2026-01-08	da_nop
4464	102	86	2026-01-08	da_nop
4465	102	87	2026-01-08	da_nop
4466	102	88	2026-01-08	tre_han
4467	102	89	2026-01-08	da_nop
4468	102	90	2026-01-08	da_nop
4469	102	91	2026-01-08	da_nop
4470	102	92	2026-01-08	da_nop
4471	102	93	2026-01-08	tre_han
4472	102	94	2026-01-08	da_nop
4473	102	95	2026-01-08	da_nop
4474	102	96	2026-01-08	da_nop
4475	102	97	2026-01-08	tre_han
4476	102	98	2026-01-08	da_nop
4477	102	99	2026-01-08	tre_han
4478	102	100	2026-01-08	da_nop
4479	102	101	2026-01-08	da_nop
4480	102	102	2026-01-08	da_nop
4481	102	103	2026-01-08	da_nop
4482	102	104	2026-01-08	da_nop
4483	102	105	2026-01-08	da_nop
4484	102	106	2026-01-08	da_nop
4485	102	107	2026-01-08	tre_han
4486	102	108	2026-01-08	tre_han
4487	102	109	2026-01-08	da_nop
4488	102	110	2026-01-08	da_nop
4489	103	67	2026-01-08	tre_han
4490	103	68	2026-01-08	da_nop
4491	103	69	2026-01-08	da_nop
4492	103	70	2026-01-08	da_nop
4493	103	71	2026-01-08	da_nop
4494	103	72	2026-01-08	da_nop
4495	103	73	2026-01-08	da_nop
4496	103	74	2026-01-08	da_nop
4497	103	75	2026-01-08	da_nop
4498	103	76	2026-01-08	da_nop
4499	103	77	2026-01-08	da_nop
4500	103	78	2026-01-08	da_nop
4501	103	79	2026-01-08	da_nop
4502	103	80	2026-01-08	da_nop
4503	103	81	2026-01-08	da_nop
4504	103	82	2026-01-08	da_nop
4505	103	83	2026-01-08	tre_han
4506	103	84	2026-01-08	da_nop
4507	103	85	2026-01-08	da_nop
4508	103	86	2026-01-08	da_nop
4509	103	87	2026-01-08	da_nop
4510	103	88	2026-01-08	da_nop
4511	103	89	2026-01-08	da_nop
4512	103	90	2026-01-08	da_nop
4513	103	91	2026-01-08	da_nop
4514	103	92	2026-01-08	tre_han
4515	103	93	2026-01-08	tre_han
4516	103	94	2026-01-08	tre_han
4517	103	95	2026-01-08	da_nop
4518	103	96	2026-01-08	da_nop
4519	103	97	2026-01-08	da_nop
4520	103	98	2026-01-08	da_nop
4521	103	99	2026-01-08	da_nop
4522	103	100	2026-01-08	da_nop
4523	103	101	2026-01-08	da_nop
4524	103	102	2026-01-08	da_nop
4525	103	103	2026-01-08	da_nop
4526	103	104	2026-01-08	da_nop
4527	103	105	2026-01-08	da_nop
4528	103	106	2026-01-08	da_nop
4529	103	107	2026-01-08	da_nop
4530	103	108	2026-01-08	da_nop
4531	103	109	2026-01-08	da_nop
4532	103	110	2026-01-08	tre_han
4533	104	67	2026-01-08	da_nop
4534	104	68	2026-01-08	tre_han
4535	104	69	2026-01-08	da_nop
4536	104	70	2026-01-08	tre_han
4537	104	71	2026-01-08	da_nop
4538	104	72	2026-01-08	da_nop
4539	104	73	2026-01-08	da_nop
4540	104	74	2026-01-08	tre_han
4541	104	75	2026-01-08	da_nop
4542	104	76	2026-01-08	da_nop
4543	104	77	2026-01-08	tre_han
4544	104	78	2026-01-08	da_nop
4545	104	79	2026-01-08	da_nop
4546	104	80	2026-01-08	da_nop
4547	104	81	2026-01-08	da_nop
4548	104	82	2026-01-08	da_nop
4549	104	83	2026-01-08	da_nop
4550	104	84	2026-01-08	da_nop
4551	104	85	2026-01-08	tre_han
4552	104	86	2026-01-08	da_nop
4553	104	87	2026-01-08	da_nop
4554	104	88	2026-01-08	da_nop
4555	104	89	2026-01-08	da_nop
4556	104	90	2026-01-08	da_nop
4557	104	91	2026-01-08	da_nop
4558	104	92	2026-01-08	da_nop
4559	104	93	2026-01-08	da_nop
4560	104	94	2026-01-08	da_nop
4561	104	95	2026-01-08	da_nop
4562	104	96	2026-01-08	tre_han
4563	104	97	2026-01-08	da_nop
4564	104	98	2026-01-08	tre_han
4565	104	99	2026-01-08	da_nop
4566	104	100	2026-01-08	da_nop
4567	104	101	2026-01-08	da_nop
4568	104	102	2026-01-08	da_nop
4569	104	103	2026-01-08	da_nop
4570	104	104	2026-01-08	da_nop
4571	104	105	2026-01-08	da_nop
4572	104	106	2026-01-08	da_nop
4573	104	107	2026-01-08	tre_han
4574	104	108	2026-01-08	da_nop
4575	104	109	2026-01-08	da_nop
4576	104	110	2026-01-08	da_nop
4577	105	67	2026-01-08	tre_han
4578	105	68	2026-01-08	da_nop
4579	105	69	2026-01-08	da_nop
4580	105	70	2026-01-08	da_nop
4581	105	71	2026-01-08	tre_han
4582	105	72	2026-01-08	da_nop
4583	105	73	2026-01-08	tre_han
4584	105	74	2026-01-08	da_nop
4585	105	75	2026-01-08	da_nop
4586	105	76	2026-01-08	da_nop
4587	105	77	2026-01-08	da_nop
4588	105	78	2026-01-08	da_nop
4589	105	79	2026-01-08	tre_han
4590	105	80	2026-01-08	da_nop
4591	105	81	2026-01-08	da_nop
4592	105	82	2026-01-08	da_nop
4593	105	83	2026-01-08	da_nop
4594	105	84	2026-01-08	da_nop
4595	105	85	2026-01-08	da_nop
4596	105	86	2026-01-08	da_nop
4597	105	87	2026-01-08	da_nop
4598	105	88	2026-01-08	tre_han
4599	105	89	2026-01-08	tre_han
4600	105	90	2026-01-08	da_nop
4601	105	91	2026-01-08	da_nop
4602	105	92	2026-01-08	da_nop
4603	105	93	2026-01-08	tre_han
4604	105	94	2026-01-08	da_nop
4605	105	95	2026-01-08	da_nop
4606	105	96	2026-01-08	da_nop
4607	105	97	2026-01-08	da_nop
4608	105	98	2026-01-08	tre_han
4609	105	99	2026-01-08	da_nop
4610	105	100	2026-01-08	da_nop
4611	105	101	2026-01-08	da_nop
4612	105	102	2026-01-08	da_nop
4613	105	103	2026-01-08	da_nop
4614	105	104	2026-01-08	da_nop
4615	105	105	2026-01-08	da_nop
4616	105	106	2026-01-08	tre_han
4617	105	107	2026-01-08	da_nop
4618	105	108	2026-01-08	da_nop
4619	105	109	2026-01-08	da_nop
4620	105	110	2026-01-08	tre_han
4621	106	67	2026-01-08	da_nop
4622	106	68	2026-01-08	da_nop
4623	106	69	2026-01-08	da_nop
4624	106	70	2026-01-08	da_nop
4625	106	71	2026-01-08	da_nop
4626	106	72	2026-01-08	da_nop
4627	106	73	2026-01-08	da_nop
4628	106	74	2026-01-08	da_nop
4629	106	75	2026-01-08	tre_han
4630	106	76	2026-01-08	da_nop
4631	106	77	2026-01-08	da_nop
4632	106	78	2026-01-08	da_nop
4633	106	79	2026-01-08	da_nop
4634	106	80	2026-01-08	da_nop
4635	106	81	2026-01-08	tre_han
4636	106	82	2026-01-08	da_nop
4637	106	83	2026-01-08	da_nop
4638	106	84	2026-01-08	tre_han
4639	106	85	2026-01-08	da_nop
4640	106	86	2026-01-08	da_nop
4641	106	87	2026-01-08	da_nop
4642	106	88	2026-01-08	da_nop
4643	106	89	2026-01-08	da_nop
4644	106	90	2026-01-08	da_nop
4645	106	91	2026-01-08	da_nop
4646	106	92	2026-01-08	da_nop
4647	106	93	2026-01-08	da_nop
4648	106	94	2026-01-08	tre_han
4649	106	95	2026-01-08	da_nop
4650	106	96	2026-01-08	da_nop
4651	106	97	2026-01-08	da_nop
4652	106	98	2026-01-08	tre_han
4653	106	99	2026-01-08	da_nop
4654	106	100	2026-01-08	tre_han
4655	106	101	2026-01-08	da_nop
4656	106	102	2026-01-08	da_nop
4657	106	103	2026-01-08	da_nop
4658	106	104	2026-01-08	tre_han
4659	106	105	2026-01-08	tre_han
4660	106	106	2026-01-08	da_nop
4661	106	107	2026-01-08	tre_han
4662	106	108	2026-01-08	da_nop
4663	106	109	2026-01-08	da_nop
4664	106	110	2026-01-08	tre_han
4665	107	67	2026-01-08	tre_han
4666	107	68	2026-01-08	da_nop
4667	107	69	2026-01-08	da_nop
4668	107	70	2026-01-08	da_nop
4669	107	71	2026-01-08	da_nop
4670	107	72	2026-01-08	da_nop
4671	107	73	2026-01-08	da_nop
4672	107	74	2026-01-08	tre_han
4673	107	75	2026-01-08	da_nop
4674	107	76	2026-01-08	tre_han
4675	107	77	2026-01-08	da_nop
4676	107	78	2026-01-08	da_nop
4677	107	79	2026-01-08	tre_han
4678	107	80	2026-01-08	da_nop
4679	107	81	2026-01-08	da_nop
4680	107	82	2026-01-08	tre_han
4681	107	83	2026-01-08	da_nop
4682	107	84	2026-01-08	da_nop
4683	107	85	2026-01-08	da_nop
4684	107	86	2026-01-08	da_nop
4685	107	87	2026-01-08	da_nop
4686	107	88	2026-01-08	da_nop
4687	107	89	2026-01-08	tre_han
4688	107	90	2026-01-08	da_nop
4689	107	91	2026-01-08	da_nop
4690	107	92	2026-01-08	da_nop
4691	107	93	2026-01-08	da_nop
4692	107	94	2026-01-08	tre_han
4693	107	95	2026-01-08	da_nop
4694	107	96	2026-01-08	da_nop
4695	107	97	2026-01-08	da_nop
4696	107	98	2026-01-08	da_nop
4697	107	99	2026-01-08	da_nop
4698	107	100	2026-01-08	da_nop
4699	107	101	2026-01-08	tre_han
4700	107	102	2026-01-08	da_nop
4701	107	103	2026-01-08	tre_han
4702	107	104	2026-01-08	da_nop
4703	107	105	2026-01-08	da_nop
4704	107	106	2026-01-08	da_nop
4705	107	107	2026-01-08	da_nop
4706	107	108	2026-01-08	tre_han
4707	107	109	2026-01-08	da_nop
4708	107	110	2026-01-08	da_nop
4709	108	67	2026-01-08	da_nop
4710	108	68	2026-01-08	da_nop
4711	108	69	2026-01-08	tre_han
4712	108	70	2026-01-08	tre_han
4713	108	71	2026-01-08	da_nop
4714	108	72	2026-01-08	tre_han
4715	108	73	2026-01-08	da_nop
4716	108	74	2026-01-08	tre_han
4717	108	75	2026-01-08	da_nop
4718	108	76	2026-01-08	da_nop
4719	108	77	2026-01-08	da_nop
4720	108	78	2026-01-08	tre_han
4721	108	79	2026-01-08	da_nop
4722	108	80	2026-01-08	da_nop
4723	108	81	2026-01-08	da_nop
4724	108	82	2026-01-08	tre_han
4725	108	83	2026-01-08	da_nop
4726	108	84	2026-01-08	da_nop
4727	108	85	2026-01-08	da_nop
4728	108	86	2026-01-08	da_nop
4729	108	87	2026-01-08	da_nop
4730	108	88	2026-01-08	da_nop
4731	108	89	2026-01-08	da_nop
4732	108	90	2026-01-08	da_nop
4733	108	91	2026-01-08	tre_han
4734	108	92	2026-01-08	da_nop
4735	108	93	2026-01-08	da_nop
4736	108	94	2026-01-08	tre_han
4737	108	95	2026-01-08	da_nop
4738	108	96	2026-01-08	da_nop
4739	108	97	2026-01-08	tre_han
4740	108	98	2026-01-08	da_nop
4741	108	99	2026-01-08	da_nop
4742	108	100	2026-01-08	tre_han
4743	108	101	2026-01-08	tre_han
4744	108	102	2026-01-08	da_nop
4745	108	103	2026-01-08	da_nop
4746	108	104	2026-01-08	da_nop
4747	108	105	2026-01-08	tre_han
4748	108	106	2026-01-08	da_nop
4749	108	107	2026-01-08	da_nop
4750	108	108	2026-01-08	da_nop
4751	108	109	2026-01-08	da_nop
4752	108	110	2026-01-08	da_nop
4753	109	67	2026-01-08	da_nop
4754	109	68	2026-01-08	da_nop
4755	109	69	2026-01-08	da_nop
4756	109	70	2026-01-08	da_nop
4757	109	71	2026-01-08	tre_han
4758	109	72	2026-01-08	da_nop
4759	109	73	2026-01-08	da_nop
4760	109	74	2026-01-08	da_nop
4761	109	75	2026-01-08	da_nop
4762	109	76	2026-01-08	da_nop
4763	109	77	2026-01-08	da_nop
4764	109	78	2026-01-08	da_nop
4765	109	79	2026-01-08	da_nop
4766	109	80	2026-01-08	da_nop
4767	109	81	2026-01-08	da_nop
4768	109	82	2026-01-08	da_nop
4769	109	83	2026-01-08	da_nop
4770	109	84	2026-01-08	da_nop
4771	109	85	2026-01-08	tre_han
4772	109	86	2026-01-08	tre_han
4773	109	87	2026-01-08	da_nop
4774	109	88	2026-01-08	da_nop
4775	109	89	2026-01-08	da_nop
4776	109	90	2026-01-08	da_nop
4777	109	91	2026-01-08	da_nop
4778	109	92	2026-01-08	da_nop
4779	109	93	2026-01-08	da_nop
4780	109	94	2026-01-08	da_nop
4781	109	95	2026-01-08	da_nop
4782	109	96	2026-01-08	da_nop
4783	109	97	2026-01-08	da_nop
4784	109	98	2026-01-08	da_nop
4785	109	99	2026-01-08	da_nop
4786	109	100	2026-01-08	tre_han
4787	109	101	2026-01-08	da_nop
4788	109	102	2026-01-08	da_nop
4789	109	103	2026-01-08	da_nop
4790	109	104	2026-01-08	da_nop
4791	109	105	2026-01-08	da_nop
4792	109	106	2026-01-08	tre_han
4793	109	107	2026-01-08	tre_han
4794	109	108	2026-01-08	da_nop
4795	109	109	2026-01-08	da_nop
4796	109	110	2026-01-08	da_nop
4797	110	67	2026-01-08	da_nop
4798	110	68	2026-01-08	da_nop
4799	110	69	2026-01-08	da_nop
4800	110	70	2026-01-08	da_nop
4801	110	71	2026-01-08	da_nop
4802	110	72	2026-01-08	da_nop
4803	110	73	2026-01-08	da_nop
4804	110	74	2026-01-08	tre_han
4805	110	75	2026-01-08	da_nop
4806	110	76	2026-01-08	da_nop
4807	110	77	2026-01-08	tre_han
4808	110	78	2026-01-08	da_nop
4809	110	79	2026-01-08	da_nop
4810	110	80	2026-01-08	tre_han
4811	110	81	2026-01-08	tre_han
4812	110	82	2026-01-08	da_nop
4813	110	83	2026-01-08	tre_han
4814	110	84	2026-01-08	tre_han
4815	110	85	2026-01-08	tre_han
4816	110	86	2026-01-08	da_nop
4817	110	87	2026-01-08	da_nop
4818	110	88	2026-01-08	da_nop
4819	110	89	2026-01-08	da_nop
4820	110	90	2026-01-08	da_nop
4821	110	91	2026-01-08	da_nop
4822	110	92	2026-01-08	da_nop
4823	110	93	2026-01-08	da_nop
4824	110	94	2026-01-08	da_nop
4825	110	95	2026-01-08	tre_han
4826	110	96	2026-01-08	da_nop
4827	110	97	2026-01-08	da_nop
4828	110	98	2026-01-08	tre_han
4829	110	99	2026-01-08	tre_han
4830	110	100	2026-01-08	da_nop
4831	110	101	2026-01-08	da_nop
4832	110	102	2026-01-08	da_nop
4833	110	103	2026-01-08	tre_han
4834	110	104	2026-01-08	da_nop
4835	110	105	2026-01-08	da_nop
4836	110	106	2026-01-08	da_nop
4837	110	107	2026-01-08	da_nop
4838	110	108	2026-01-08	da_nop
4839	110	109	2026-01-08	da_nop
4840	110	110	2026-01-08	da_nop
4841	111	67	2026-01-08	da_nop
4842	111	68	2026-01-08	da_nop
4843	111	69	2026-01-08	da_nop
4844	111	70	2026-01-08	da_nop
4845	111	71	2026-01-08	da_nop
4846	111	72	2026-01-08	tre_han
4847	111	73	2026-01-08	da_nop
4848	111	74	2026-01-08	da_nop
4849	111	75	2026-01-08	da_nop
4850	111	76	2026-01-08	da_nop
4851	111	77	2026-01-08	da_nop
4852	111	78	2026-01-08	da_nop
4853	111	79	2026-01-08	da_nop
4854	111	80	2026-01-08	tre_han
4855	111	81	2026-01-08	da_nop
4856	111	82	2026-01-08	da_nop
4857	111	83	2026-01-08	da_nop
4858	111	84	2026-01-08	da_nop
4859	111	85	2026-01-08	da_nop
4860	111	86	2026-01-08	tre_han
4861	111	87	2026-01-08	da_nop
4862	111	88	2026-01-08	da_nop
4863	111	89	2026-01-08	da_nop
4864	111	90	2026-01-08	da_nop
4865	111	91	2026-01-08	da_nop
4866	111	92	2026-01-08	da_nop
4867	111	93	2026-01-08	da_nop
4868	111	94	2026-01-08	da_nop
4869	111	95	2026-01-08	da_nop
4870	111	96	2026-01-08	da_nop
4871	111	97	2026-01-08	da_nop
4872	111	98	2026-01-08	da_nop
4873	111	99	2026-01-08	tre_han
4874	111	100	2026-01-08	da_nop
4875	111	101	2026-01-08	da_nop
4876	111	102	2026-01-08	da_nop
4877	111	103	2026-01-08	da_nop
4878	111	104	2026-01-08	da_nop
4879	111	105	2026-01-08	tre_han
4880	111	106	2026-01-08	da_nop
4881	111	107	2026-01-08	da_nop
4882	111	108	2026-01-08	da_nop
4883	111	109	2026-01-08	da_nop
4884	111	110	2026-01-08	da_nop
4885	112	67	2026-01-08	tre_han
4886	112	68	2026-01-08	da_nop
4887	112	69	2026-01-08	da_nop
4888	112	70	2026-01-08	da_nop
4889	112	71	2026-01-08	da_nop
4890	112	72	2026-01-08	tre_han
4891	112	73	2026-01-08	da_nop
4892	112	74	2026-01-08	tre_han
4893	112	75	2026-01-08	da_nop
4894	112	76	2026-01-08	tre_han
4895	112	77	2026-01-08	da_nop
4896	112	78	2026-01-08	tre_han
4897	112	79	2026-01-08	da_nop
4898	112	80	2026-01-08	da_nop
4899	112	81	2026-01-08	da_nop
4900	112	82	2026-01-08	da_nop
4901	112	83	2026-01-08	da_nop
4902	112	84	2026-01-08	da_nop
4903	112	85	2026-01-08	tre_han
4904	112	86	2026-01-08	da_nop
4905	112	87	2026-01-08	da_nop
4906	112	88	2026-01-08	tre_han
4907	112	89	2026-01-08	da_nop
4908	112	90	2026-01-08	da_nop
4909	112	91	2026-01-08	da_nop
4910	112	92	2026-01-08	da_nop
4911	112	93	2026-01-08	da_nop
4912	112	94	2026-01-08	tre_han
4913	112	95	2026-01-08	da_nop
4914	112	96	2026-01-08	da_nop
4915	112	97	2026-01-08	da_nop
4916	112	98	2026-01-08	tre_han
4917	112	99	2026-01-08	da_nop
4918	112	100	2026-01-08	tre_han
4919	112	101	2026-01-08	da_nop
4920	112	102	2026-01-08	da_nop
4921	112	103	2026-01-08	da_nop
4922	112	104	2026-01-08	da_nop
4923	112	105	2026-01-08	da_nop
4924	112	106	2026-01-08	da_nop
4925	112	107	2026-01-08	da_nop
4926	112	108	2026-01-08	da_nop
4927	112	109	2026-01-08	da_nop
4928	112	110	2026-01-08	da_nop
4929	113	67	2026-01-08	da_nop
4930	113	68	2026-01-08	da_nop
4931	113	69	2026-01-08	da_nop
4932	113	70	2026-01-08	tre_han
4933	113	71	2026-01-08	da_nop
4934	113	72	2026-01-08	da_nop
4935	113	73	2026-01-08	da_nop
4936	113	74	2026-01-08	da_nop
4937	113	75	2026-01-08	da_nop
4938	113	76	2026-01-08	da_nop
4939	113	77	2026-01-08	tre_han
4940	113	78	2026-01-08	da_nop
4941	113	79	2026-01-08	da_nop
4942	113	80	2026-01-08	da_nop
4943	113	81	2026-01-08	da_nop
4944	113	82	2026-01-08	tre_han
4945	113	83	2026-01-08	tre_han
4946	113	84	2026-01-08	da_nop
4947	113	85	2026-01-08	tre_han
4948	113	86	2026-01-08	da_nop
4949	113	87	2026-01-08	da_nop
4950	113	88	2026-01-08	da_nop
4951	113	89	2026-01-08	da_nop
4952	113	90	2026-01-08	da_nop
4953	113	91	2026-01-08	da_nop
4954	113	92	2026-01-08	tre_han
4955	113	93	2026-01-08	da_nop
4956	113	94	2026-01-08	da_nop
4957	113	95	2026-01-08	tre_han
4958	113	96	2026-01-08	da_nop
4959	113	97	2026-01-08	da_nop
4960	113	98	2026-01-08	tre_han
4961	113	99	2026-01-08	da_nop
4962	113	100	2026-01-08	da_nop
4963	113	101	2026-01-08	tre_han
4964	113	102	2026-01-08	tre_han
4965	113	103	2026-01-08	da_nop
4966	113	104	2026-01-08	da_nop
4967	113	105	2026-01-08	da_nop
4968	113	106	2026-01-08	da_nop
4969	113	107	2026-01-08	da_nop
4970	113	108	2026-01-08	da_nop
4971	113	109	2026-01-08	tre_han
4972	113	110	2026-01-08	da_nop
4973	114	67	2026-01-08	da_nop
4974	114	68	2026-01-08	tre_han
4975	114	69	2026-01-08	da_nop
4976	114	70	2026-01-08	da_nop
4977	114	71	2026-01-08	tre_han
4978	114	72	2026-01-08	da_nop
4979	114	73	2026-01-08	da_nop
4980	114	74	2026-01-08	tre_han
4981	114	75	2026-01-08	da_nop
4982	114	76	2026-01-08	da_nop
4983	114	77	2026-01-08	da_nop
4984	114	78	2026-01-08	da_nop
4985	114	79	2026-01-08	da_nop
4986	114	80	2026-01-08	tre_han
4987	114	81	2026-01-08	tre_han
4988	114	82	2026-01-08	da_nop
4989	114	83	2026-01-08	da_nop
4990	114	84	2026-01-08	da_nop
4991	114	85	2026-01-08	da_nop
4992	114	86	2026-01-08	da_nop
4993	114	87	2026-01-08	da_nop
4994	114	88	2026-01-08	da_nop
4995	114	89	2026-01-08	da_nop
4996	114	90	2026-01-08	da_nop
4997	114	91	2026-01-08	da_nop
4998	114	92	2026-01-08	tre_han
4999	114	93	2026-01-08	da_nop
5000	114	94	2026-01-08	da_nop
5001	114	95	2026-01-08	da_nop
5002	114	96	2026-01-08	da_nop
5003	114	97	2026-01-08	da_nop
5004	114	98	2026-01-08	tre_han
5005	114	99	2026-01-08	da_nop
5006	114	100	2026-01-08	da_nop
5007	114	101	2026-01-08	da_nop
5008	114	102	2026-01-08	da_nop
5009	114	103	2026-01-08	tre_han
5010	114	104	2026-01-08	da_nop
5011	114	105	2026-01-08	tre_han
5012	114	106	2026-01-08	tre_han
5013	114	107	2026-01-08	da_nop
5014	114	108	2026-01-08	da_nop
5015	114	109	2026-01-08	tre_han
5016	114	110	2026-01-08	da_nop
5017	115	67	2026-01-08	da_nop
5018	115	68	2026-01-08	da_nop
5019	115	69	2026-01-08	da_nop
5020	115	70	2026-01-08	da_nop
5021	115	71	2026-01-08	da_nop
5022	115	72	2026-01-08	tre_han
5023	115	73	2026-01-08	tre_han
5024	115	74	2026-01-08	da_nop
5025	115	75	2026-01-08	tre_han
5026	115	76	2026-01-08	da_nop
5027	115	77	2026-01-08	da_nop
5028	115	78	2026-01-08	da_nop
5029	115	79	2026-01-08	da_nop
5030	115	80	2026-01-08	da_nop
5031	115	81	2026-01-08	da_nop
5032	115	82	2026-01-08	tre_han
5033	115	83	2026-01-08	da_nop
5034	115	84	2026-01-08	da_nop
5035	115	85	2026-01-08	da_nop
5036	115	86	2026-01-08	da_nop
5037	115	87	2026-01-08	da_nop
5038	115	88	2026-01-08	da_nop
5039	115	89	2026-01-08	da_nop
5040	115	90	2026-01-08	da_nop
5041	115	91	2026-01-08	da_nop
5042	115	92	2026-01-08	da_nop
5043	115	93	2026-01-08	da_nop
5044	115	94	2026-01-08	da_nop
5045	115	95	2026-01-08	da_nop
5046	115	96	2026-01-08	da_nop
5047	115	97	2026-01-08	da_nop
5048	115	98	2026-01-08	da_nop
5049	115	99	2026-01-08	da_nop
5050	115	100	2026-01-08	da_nop
5051	115	101	2026-01-08	da_nop
5052	115	102	2026-01-08	da_nop
5053	115	103	2026-01-08	da_nop
5054	115	104	2026-01-08	da_nop
5055	115	105	2026-01-08	da_nop
5056	115	106	2026-01-08	tre_han
5057	115	107	2026-01-08	da_nop
5058	115	108	2026-01-08	tre_han
5059	115	109	2026-01-08	da_nop
5060	115	110	2026-01-08	da_nop
5061	116	67	2026-01-08	da_nop
5062	116	68	2026-01-08	da_nop
5063	116	69	2026-01-08	da_nop
5064	116	70	2026-01-08	da_nop
5065	116	71	2026-01-08	da_nop
5066	116	72	2026-01-08	tre_han
5067	116	73	2026-01-08	da_nop
5068	116	74	2026-01-08	da_nop
5069	116	75	2026-01-08	da_nop
5070	116	76	2026-01-08	da_nop
5071	116	77	2026-01-08	da_nop
5072	116	78	2026-01-08	da_nop
5073	116	79	2026-01-08	da_nop
5074	116	80	2026-01-08	da_nop
5075	116	81	2026-01-08	da_nop
5076	116	82	2026-01-08	tre_han
5077	116	83	2026-01-08	tre_han
5078	116	84	2026-01-08	da_nop
5079	116	85	2026-01-08	da_nop
5080	116	86	2026-01-08	tre_han
5081	116	87	2026-01-08	da_nop
5082	116	88	2026-01-08	tre_han
5083	116	89	2026-01-08	da_nop
5084	116	90	2026-01-08	da_nop
5085	116	91	2026-01-08	da_nop
5086	116	92	2026-01-08	da_nop
5087	116	93	2026-01-08	da_nop
5088	116	94	2026-01-08	da_nop
5089	116	95	2026-01-08	da_nop
5090	116	96	2026-01-08	da_nop
5091	116	97	2026-01-08	da_nop
5092	116	98	2026-01-08	da_nop
5093	116	99	2026-01-08	da_nop
5094	116	100	2026-01-08	da_nop
5095	116	101	2026-01-08	tre_han
5096	116	102	2026-01-08	da_nop
5097	116	103	2026-01-08	da_nop
5098	116	104	2026-01-08	da_nop
5099	116	105	2026-01-08	da_nop
5100	116	106	2026-01-08	da_nop
5101	116	107	2026-01-08	da_nop
5102	116	108	2026-01-08	da_nop
5103	116	109	2026-01-08	da_nop
5104	116	110	2026-01-08	da_nop
5105	117	67	2026-01-08	da_nop
5106	117	68	2026-01-08	da_nop
5107	117	69	2026-01-08	da_nop
5108	117	70	2026-01-08	da_nop
5109	117	71	2026-01-08	da_nop
5110	117	72	2026-01-08	da_nop
5111	117	73	2026-01-08	da_nop
5112	117	74	2026-01-08	da_nop
5113	117	75	2026-01-08	da_nop
5114	117	76	2026-01-08	da_nop
5115	117	77	2026-01-08	da_nop
5116	117	78	2026-01-08	da_nop
5117	117	79	2026-01-08	da_nop
5118	117	80	2026-01-08	da_nop
5119	117	81	2026-01-08	da_nop
5120	117	82	2026-01-08	tre_han
5121	117	83	2026-01-08	da_nop
5122	117	84	2026-01-08	da_nop
5123	117	85	2026-01-08	da_nop
5124	117	86	2026-01-08	da_nop
5125	117	87	2026-01-08	da_nop
5126	117	88	2026-01-08	tre_han
5127	117	89	2026-01-08	da_nop
5128	117	90	2026-01-08	da_nop
5129	117	91	2026-01-08	da_nop
5130	117	92	2026-01-08	tre_han
5131	117	93	2026-01-08	tre_han
5132	117	94	2026-01-08	tre_han
5133	117	95	2026-01-08	tre_han
5134	117	96	2026-01-08	tre_han
5135	117	97	2026-01-08	tre_han
5136	117	98	2026-01-08	da_nop
5137	117	99	2026-01-08	da_nop
5138	117	100	2026-01-08	da_nop
5139	117	101	2026-01-08	da_nop
5140	117	102	2026-01-08	da_nop
5141	117	103	2026-01-08	tre_han
5142	117	104	2026-01-08	da_nop
5143	117	105	2026-01-08	da_nop
5144	117	106	2026-01-08	da_nop
5145	117	107	2026-01-08	da_nop
5146	117	108	2026-01-08	da_nop
5147	117	109	2026-01-08	tre_han
5148	117	110	2026-01-08	tre_han
5149	118	67	2026-01-08	da_nop
5150	118	68	2026-01-08	da_nop
5151	118	69	2026-01-08	da_nop
5152	118	70	2026-01-08	da_nop
5153	118	71	2026-01-08	da_nop
5154	118	72	2026-01-08	tre_han
5155	118	73	2026-01-08	da_nop
5156	118	74	2026-01-08	da_nop
5157	118	75	2026-01-08	tre_han
5158	118	76	2026-01-08	da_nop
5159	118	77	2026-01-08	tre_han
5160	118	78	2026-01-08	tre_han
5161	118	79	2026-01-08	da_nop
5162	118	80	2026-01-08	da_nop
5163	118	81	2026-01-08	da_nop
5164	118	82	2026-01-08	da_nop
5165	118	83	2026-01-08	da_nop
5166	118	84	2026-01-08	da_nop
5167	118	85	2026-01-08	da_nop
5168	118	86	2026-01-08	da_nop
5169	118	87	2026-01-08	da_nop
5170	118	88	2026-01-08	da_nop
5171	118	89	2026-01-08	da_nop
5172	118	90	2026-01-08	da_nop
5173	118	91	2026-01-08	da_nop
5174	118	92	2026-01-08	da_nop
5175	118	93	2026-01-08	da_nop
5176	118	94	2026-01-08	tre_han
5177	118	95	2026-01-08	da_nop
5178	118	96	2026-01-08	da_nop
5179	118	97	2026-01-08	da_nop
5180	118	98	2026-01-08	da_nop
5181	118	99	2026-01-08	da_nop
5182	118	100	2026-01-08	da_nop
5183	118	101	2026-01-08	da_nop
5184	118	102	2026-01-08	da_nop
5185	118	103	2026-01-08	da_nop
5186	118	104	2026-01-08	da_nop
5187	118	105	2026-01-08	da_nop
5188	118	106	2026-01-08	tre_han
5189	118	107	2026-01-08	da_nop
5190	118	108	2026-01-08	tre_han
5191	118	109	2026-01-08	da_nop
5192	118	110	2026-01-08	da_nop
5193	119	67	2026-01-08	tre_han
5194	119	68	2026-01-08	da_nop
5195	119	69	2026-01-08	tre_han
5196	119	70	2026-01-08	da_nop
5197	119	71	2026-01-08	tre_han
5198	119	72	2026-01-08	da_nop
5199	119	73	2026-01-08	da_nop
5200	119	74	2026-01-08	da_nop
5201	119	75	2026-01-08	tre_han
5202	119	76	2026-01-08	tre_han
5203	119	77	2026-01-08	da_nop
5204	119	78	2026-01-08	tre_han
5205	119	79	2026-01-08	da_nop
5206	119	80	2026-01-08	tre_han
5207	119	81	2026-01-08	tre_han
5208	119	82	2026-01-08	da_nop
5209	119	83	2026-01-08	tre_han
5210	119	84	2026-01-08	da_nop
5211	119	85	2026-01-08	da_nop
5212	119	86	2026-01-08	da_nop
5213	119	87	2026-01-08	da_nop
5214	119	88	2026-01-08	da_nop
5215	119	89	2026-01-08	tre_han
5216	119	90	2026-01-08	da_nop
5217	119	91	2026-01-08	da_nop
5218	119	92	2026-01-08	tre_han
5219	119	93	2026-01-08	da_nop
5220	119	94	2026-01-08	tre_han
5221	119	95	2026-01-08	da_nop
5222	119	96	2026-01-08	da_nop
5223	119	97	2026-01-08	da_nop
5224	119	98	2026-01-08	da_nop
5225	119	99	2026-01-08	tre_han
5226	119	100	2026-01-08	da_nop
5227	119	101	2026-01-08	da_nop
5228	119	102	2026-01-08	da_nop
5229	119	103	2026-01-08	da_nop
5230	119	104	2026-01-08	da_nop
5231	119	105	2026-01-08	da_nop
5232	119	106	2026-01-08	tre_han
5233	119	107	2026-01-08	da_nop
5234	119	108	2026-01-08	da_nop
5235	119	109	2026-01-08	tre_han
5236	119	110	2026-01-08	da_nop
5237	120	67	2026-01-08	da_nop
5238	120	68	2026-01-08	tre_han
5239	120	69	2026-01-08	da_nop
5240	120	70	2026-01-08	da_nop
5241	120	71	2026-01-08	da_nop
5242	120	72	2026-01-08	tre_han
5243	120	73	2026-01-08	da_nop
5244	120	74	2026-01-08	da_nop
5245	120	75	2026-01-08	tre_han
5246	120	76	2026-01-08	da_nop
5247	120	77	2026-01-08	tre_han
5248	120	78	2026-01-08	tre_han
5249	120	79	2026-01-08	tre_han
5250	120	80	2026-01-08	tre_han
5251	120	81	2026-01-08	da_nop
5252	120	82	2026-01-08	da_nop
5253	120	83	2026-01-08	da_nop
5254	120	84	2026-01-08	da_nop
5255	120	85	2026-01-08	tre_han
5256	120	86	2026-01-08	da_nop
5257	120	87	2026-01-08	da_nop
5258	120	88	2026-01-08	da_nop
5259	120	89	2026-01-08	da_nop
5260	120	90	2026-01-08	da_nop
5261	120	91	2026-01-08	da_nop
5262	120	92	2026-01-08	da_nop
5263	120	93	2026-01-08	da_nop
5264	120	94	2026-01-08	da_nop
5265	120	95	2026-01-08	da_nop
5266	120	96	2026-01-08	da_nop
5267	120	97	2026-01-08	da_nop
5268	120	98	2026-01-08	da_nop
5269	120	99	2026-01-08	da_nop
5270	120	100	2026-01-08	tre_han
5271	120	101	2026-01-08	da_nop
5272	120	102	2026-01-08	tre_han
5273	120	103	2026-01-08	da_nop
5274	120	104	2026-01-08	da_nop
5275	120	105	2026-01-08	tre_han
5276	120	106	2026-01-08	da_nop
5277	120	107	2026-01-08	da_nop
5278	120	108	2026-01-08	da_nop
5279	120	109	2026-01-08	da_nop
5280	120	110	2026-01-08	da_nop
5281	121	67	2026-01-08	da_nop
5282	121	68	2026-01-08	da_nop
5283	121	69	2026-01-08	da_nop
5284	121	70	2026-01-08	da_nop
5285	121	71	2026-01-08	tre_han
5286	121	72	2026-01-08	da_nop
5287	121	73	2026-01-08	da_nop
5288	121	74	2026-01-08	tre_han
5289	121	75	2026-01-08	da_nop
5290	121	76	2026-01-08	da_nop
5291	121	77	2026-01-08	tre_han
5292	121	78	2026-01-08	tre_han
5293	121	79	2026-01-08	da_nop
5294	121	80	2026-01-08	da_nop
5295	121	81	2026-01-08	da_nop
5296	121	82	2026-01-08	da_nop
5297	121	83	2026-01-08	da_nop
5298	121	84	2026-01-08	da_nop
5299	121	85	2026-01-08	da_nop
5300	121	86	2026-01-08	da_nop
5301	121	87	2026-01-08	da_nop
5302	121	88	2026-01-08	da_nop
5303	121	89	2026-01-08	tre_han
5304	121	90	2026-01-08	tre_han
5305	121	91	2026-01-08	da_nop
5306	121	92	2026-01-08	da_nop
5307	121	93	2026-01-08	da_nop
5308	121	94	2026-01-08	da_nop
5309	121	95	2026-01-08	da_nop
5310	121	96	2026-01-08	da_nop
5311	121	97	2026-01-08	da_nop
5312	121	98	2026-01-08	tre_han
5313	121	99	2026-01-08	da_nop
5314	121	100	2026-01-08	da_nop
5315	121	101	2026-01-08	da_nop
5316	121	102	2026-01-08	da_nop
5317	121	103	2026-01-08	da_nop
5318	121	104	2026-01-08	tre_han
5319	121	105	2026-01-08	da_nop
5320	121	106	2026-01-08	da_nop
5321	121	107	2026-01-08	tre_han
5322	121	108	2026-01-08	tre_han
5323	121	109	2026-01-08	da_nop
5324	121	110	2026-01-08	da_nop
5325	122	67	2026-01-08	da_nop
5326	122	68	2026-01-08	da_nop
5327	122	69	2026-01-08	da_nop
5328	122	70	2026-01-08	tre_han
5329	122	71	2026-01-08	da_nop
5330	122	72	2026-01-08	tre_han
5331	122	73	2026-01-08	da_nop
5332	122	74	2026-01-08	da_nop
5333	122	75	2026-01-08	tre_han
5334	122	76	2026-01-08	da_nop
5335	122	77	2026-01-08	da_nop
5336	122	78	2026-01-08	tre_han
5337	122	79	2026-01-08	da_nop
5338	122	80	2026-01-08	tre_han
5339	122	81	2026-01-08	da_nop
5340	122	82	2026-01-08	da_nop
5341	122	83	2026-01-08	da_nop
5342	122	84	2026-01-08	da_nop
5343	122	85	2026-01-08	da_nop
5344	122	86	2026-01-08	da_nop
5345	122	87	2026-01-08	da_nop
5346	122	88	2026-01-08	da_nop
5347	122	89	2026-01-08	tre_han
5348	122	90	2026-01-08	da_nop
5349	122	91	2026-01-08	da_nop
5350	122	92	2026-01-08	da_nop
5351	122	93	2026-01-08	da_nop
5352	122	94	2026-01-08	da_nop
5353	122	95	2026-01-08	tre_han
5354	122	96	2026-01-08	tre_han
5355	122	97	2026-01-08	da_nop
5356	122	98	2026-01-08	da_nop
5357	122	99	2026-01-08	da_nop
5358	122	100	2026-01-08	da_nop
5359	122	101	2026-01-08	da_nop
5360	122	102	2026-01-08	da_nop
5361	122	103	2026-01-08	da_nop
5362	122	104	2026-01-08	da_nop
5363	122	105	2026-01-08	da_nop
5364	122	106	2026-01-08	da_nop
5365	122	107	2026-01-08	da_nop
5366	122	108	2026-01-08	tre_han
5367	122	109	2026-01-08	da_nop
5368	122	110	2026-01-08	da_nop
5369	123	67	2026-01-08	da_nop
5370	123	68	2026-01-08	da_nop
5371	123	69	2026-01-08	da_nop
5372	123	70	2026-01-08	da_nop
5373	123	71	2026-01-08	da_nop
5374	123	72	2026-01-08	da_nop
5375	123	73	2026-01-08	da_nop
5376	123	74	2026-01-08	da_nop
5377	123	75	2026-01-08	da_nop
5378	123	76	2026-01-08	da_nop
5379	123	77	2026-01-08	da_nop
5380	123	78	2026-01-08	da_nop
5381	123	79	2026-01-08	da_nop
5382	123	80	2026-01-08	da_nop
5383	123	81	2026-01-08	da_nop
5384	123	82	2026-01-08	da_nop
5385	123	83	2026-01-08	da_nop
5386	123	84	2026-01-08	da_nop
5387	123	85	2026-01-08	da_nop
5388	123	86	2026-01-08	da_nop
5389	123	87	2026-01-08	da_nop
5390	123	88	2026-01-08	da_nop
5391	123	89	2026-01-08	da_nop
5392	123	90	2026-01-08	da_nop
5393	123	91	2026-01-08	tre_han
5394	123	92	2026-01-08	tre_han
5395	123	93	2026-01-08	da_nop
5396	123	94	2026-01-08	da_nop
5397	123	95	2026-01-08	tre_han
5398	123	96	2026-01-08	da_nop
5399	123	97	2026-01-08	da_nop
5400	123	98	2026-01-08	da_nop
5401	123	99	2026-01-08	da_nop
5402	123	100	2026-01-08	da_nop
5403	123	101	2026-01-08	da_nop
5404	123	102	2026-01-08	da_nop
5405	123	103	2026-01-08	da_nop
5406	123	104	2026-01-08	da_nop
5407	123	105	2026-01-08	da_nop
5408	123	106	2026-01-08	tre_han
5409	123	107	2026-01-08	da_nop
5410	123	108	2026-01-08	da_nop
5411	123	109	2026-01-08	da_nop
5412	123	110	2026-01-08	da_nop
5413	124	67	2026-01-08	da_nop
5414	124	68	2026-01-08	tre_han
5415	124	69	2026-01-08	tre_han
5416	124	70	2026-01-08	da_nop
5417	124	71	2026-01-08	da_nop
5418	124	72	2026-01-08	da_nop
5419	124	73	2026-01-08	da_nop
5420	124	74	2026-01-08	da_nop
5421	124	75	2026-01-08	da_nop
5422	124	76	2026-01-08	da_nop
5423	124	77	2026-01-08	tre_han
5424	124	78	2026-01-08	da_nop
5425	124	79	2026-01-08	da_nop
5426	124	80	2026-01-08	da_nop
5427	124	81	2026-01-08	da_nop
5428	124	82	2026-01-08	da_nop
5429	124	83	2026-01-08	da_nop
5430	124	84	2026-01-08	da_nop
5431	124	85	2026-01-08	da_nop
5432	124	86	2026-01-08	tre_han
5433	124	87	2026-01-08	da_nop
5434	124	88	2026-01-08	da_nop
5435	124	89	2026-01-08	da_nop
5436	124	90	2026-01-08	da_nop
5437	124	91	2026-01-08	tre_han
5438	124	92	2026-01-08	da_nop
5439	124	93	2026-01-08	da_nop
5440	124	94	2026-01-08	tre_han
5441	124	95	2026-01-08	tre_han
5442	124	96	2026-01-08	da_nop
5443	124	97	2026-01-08	da_nop
5444	124	98	2026-01-08	da_nop
5445	124	99	2026-01-08	tre_han
5446	124	100	2026-01-08	da_nop
5447	124	101	2026-01-08	da_nop
5448	124	102	2026-01-08	da_nop
5449	124	103	2026-01-08	da_nop
5450	124	104	2026-01-08	da_nop
5451	124	105	2026-01-08	tre_han
5452	124	106	2026-01-08	da_nop
5453	124	107	2026-01-08	da_nop
5454	124	108	2026-01-08	da_nop
5455	124	109	2026-01-08	da_nop
5456	124	110	2026-01-08	da_nop
5457	125	67	2026-01-08	da_nop
5458	125	68	2026-01-08	da_nop
5459	125	69	2026-01-08	tre_han
5460	125	70	2026-01-08	da_nop
5461	125	71	2026-01-08	da_nop
5462	125	72	2026-01-08	da_nop
5463	125	73	2026-01-08	da_nop
5464	125	74	2026-01-08	da_nop
5465	125	75	2026-01-08	da_nop
5466	125	76	2026-01-08	da_nop
5467	125	77	2026-01-08	tre_han
5468	125	78	2026-01-08	da_nop
5469	125	79	2026-01-08	da_nop
5470	125	80	2026-01-08	da_nop
5471	125	81	2026-01-08	da_nop
5472	125	82	2026-01-08	da_nop
5473	125	83	2026-01-08	tre_han
5474	125	84	2026-01-08	da_nop
5475	125	85	2026-01-08	da_nop
5476	125	86	2026-01-08	da_nop
5477	125	87	2026-01-08	da_nop
5478	125	88	2026-01-08	da_nop
5479	125	89	2026-01-08	da_nop
5480	125	90	2026-01-08	da_nop
5481	125	91	2026-01-08	da_nop
5482	125	92	2026-01-08	da_nop
5483	125	93	2026-01-08	tre_han
5484	125	94	2026-01-08	tre_han
5485	125	95	2026-01-08	da_nop
5486	125	96	2026-01-08	da_nop
5487	125	97	2026-01-08	da_nop
5488	125	98	2026-01-08	tre_han
5489	125	99	2026-01-08	da_nop
5490	125	100	2026-01-08	tre_han
5491	125	101	2026-01-08	da_nop
5492	125	102	2026-01-08	da_nop
5493	125	103	2026-01-08	tre_han
5494	125	104	2026-01-08	da_nop
5495	125	105	2026-01-08	tre_han
5496	125	106	2026-01-08	da_nop
5497	125	107	2026-01-08	da_nop
5498	125	108	2026-01-08	da_nop
5499	125	109	2026-01-08	da_nop
5500	125	110	2026-01-08	da_nop
5501	126	67	2026-01-08	da_nop
5502	126	68	2026-01-08	da_nop
5503	126	69	2026-01-08	da_nop
5504	126	70	2026-01-08	da_nop
5505	126	71	2026-01-08	da_nop
5506	126	72	2026-01-08	da_nop
5507	126	73	2026-01-08	tre_han
5508	126	74	2026-01-08	tre_han
5509	126	75	2026-01-08	tre_han
5510	126	76	2026-01-08	da_nop
5511	126	77	2026-01-08	da_nop
5512	126	78	2026-01-08	da_nop
5513	126	79	2026-01-08	da_nop
5514	126	80	2026-01-08	da_nop
5515	126	81	2026-01-08	da_nop
5516	126	82	2026-01-08	tre_han
5517	126	83	2026-01-08	da_nop
5518	126	84	2026-01-08	da_nop
5519	126	85	2026-01-08	da_nop
5520	126	86	2026-01-08	tre_han
5521	126	87	2026-01-08	tre_han
5522	126	88	2026-01-08	da_nop
5523	126	89	2026-01-08	da_nop
5524	126	90	2026-01-08	da_nop
5525	126	91	2026-01-08	da_nop
5526	126	92	2026-01-08	tre_han
5527	126	93	2026-01-08	tre_han
5528	126	94	2026-01-08	tre_han
5529	126	95	2026-01-08	da_nop
5530	126	96	2026-01-08	da_nop
5531	126	97	2026-01-08	da_nop
5532	126	98	2026-01-08	da_nop
5533	126	99	2026-01-08	da_nop
5534	126	100	2026-01-08	da_nop
5535	126	101	2026-01-08	da_nop
5536	126	102	2026-01-08	da_nop
5537	126	103	2026-01-08	da_nop
5538	126	104	2026-01-08	da_nop
5539	126	105	2026-01-08	da_nop
5540	126	106	2026-01-08	da_nop
5541	126	107	2026-01-08	tre_han
5542	126	108	2026-01-08	da_nop
5543	126	109	2026-01-08	da_nop
5544	126	110	2026-01-08	da_nop
5545	127	67	2026-01-08	da_nop
5546	127	68	2026-01-08	da_nop
5547	127	69	2026-01-08	tre_han
5548	127	70	2026-01-08	da_nop
5549	127	71	2026-01-08	da_nop
5550	127	72	2026-01-08	da_nop
5551	127	73	2026-01-08	da_nop
5552	127	74	2026-01-08	da_nop
5553	127	75	2026-01-08	da_nop
5554	127	76	2026-01-08	da_nop
5555	127	77	2026-01-08	da_nop
5556	127	78	2026-01-08	da_nop
5557	127	79	2026-01-08	da_nop
5558	127	80	2026-01-08	da_nop
5559	127	81	2026-01-08	da_nop
5560	127	82	2026-01-08	da_nop
5561	127	83	2026-01-08	da_nop
5562	127	84	2026-01-08	da_nop
5563	127	85	2026-01-08	tre_han
5564	127	86	2026-01-08	da_nop
5565	127	87	2026-01-08	da_nop
5566	127	88	2026-01-08	tre_han
5567	127	89	2026-01-08	da_nop
5568	127	90	2026-01-08	da_nop
5569	127	91	2026-01-08	tre_han
5570	127	92	2026-01-08	tre_han
5571	127	93	2026-01-08	da_nop
5572	127	94	2026-01-08	da_nop
5573	127	95	2026-01-08	da_nop
5574	127	96	2026-01-08	da_nop
5575	127	97	2026-01-08	da_nop
5576	127	98	2026-01-08	da_nop
5577	127	99	2026-01-08	da_nop
5578	127	100	2026-01-08	da_nop
5579	127	101	2026-01-08	tre_han
5580	127	102	2026-01-08	da_nop
5581	127	103	2026-01-08	da_nop
5582	127	104	2026-01-08	da_nop
5583	127	105	2026-01-08	da_nop
5584	127	106	2026-01-08	tre_han
5585	127	107	2026-01-08	da_nop
5586	127	108	2026-01-08	da_nop
5587	127	109	2026-01-08	da_nop
5588	127	110	2026-01-08	da_nop
5589	128	67	2026-01-08	da_nop
5590	128	68	2026-01-08	da_nop
5591	128	69	2026-01-08	tre_han
5592	128	70	2026-01-08	da_nop
5593	128	71	2026-01-08	da_nop
5594	128	72	2026-01-08	da_nop
5595	128	73	2026-01-08	tre_han
5596	128	74	2026-01-08	da_nop
5597	128	75	2026-01-08	tre_han
5598	128	76	2026-01-08	da_nop
5599	128	77	2026-01-08	da_nop
5600	128	78	2026-01-08	da_nop
5601	128	79	2026-01-08	tre_han
5602	128	80	2026-01-08	da_nop
5603	128	81	2026-01-08	da_nop
5604	128	82	2026-01-08	da_nop
5605	128	83	2026-01-08	tre_han
5606	128	84	2026-01-08	da_nop
5607	128	85	2026-01-08	da_nop
5608	128	86	2026-01-08	tre_han
5609	128	87	2026-01-08	da_nop
5610	128	88	2026-01-08	da_nop
5611	128	89	2026-01-08	da_nop
5612	128	90	2026-01-08	da_nop
5613	128	91	2026-01-08	da_nop
5614	128	92	2026-01-08	da_nop
5615	128	93	2026-01-08	da_nop
5616	128	94	2026-01-08	da_nop
5617	128	95	2026-01-08	da_nop
5618	128	96	2026-01-08	da_nop
5619	128	97	2026-01-08	tre_han
5620	128	98	2026-01-08	da_nop
5621	128	99	2026-01-08	da_nop
5622	128	100	2026-01-08	da_nop
5623	128	101	2026-01-08	da_nop
5624	128	102	2026-01-08	tre_han
5625	128	103	2026-01-08	tre_han
5626	128	104	2026-01-08	tre_han
5627	128	105	2026-01-08	tre_han
5628	128	106	2026-01-08	da_nop
5629	128	107	2026-01-08	tre_han
5630	128	108	2026-01-08	da_nop
5631	128	109	2026-01-08	da_nop
5632	128	110	2026-01-08	da_nop
5633	129	67	2026-01-08	da_nop
5634	129	68	2026-01-08	da_nop
5635	129	69	2026-01-08	da_nop
5636	129	70	2026-01-08	da_nop
5637	129	71	2026-01-08	da_nop
5638	129	72	2026-01-08	tre_han
5639	129	73	2026-01-08	da_nop
5640	129	74	2026-01-08	da_nop
5641	129	75	2026-01-08	da_nop
5642	129	76	2026-01-08	da_nop
5643	129	77	2026-01-08	da_nop
5644	129	78	2026-01-08	da_nop
5645	129	79	2026-01-08	da_nop
5646	129	80	2026-01-08	tre_han
5647	129	81	2026-01-08	da_nop
5648	129	82	2026-01-08	da_nop
5649	129	83	2026-01-08	tre_han
5650	129	84	2026-01-08	da_nop
5651	129	85	2026-01-08	tre_han
5652	129	86	2026-01-08	da_nop
5653	129	87	2026-01-08	da_nop
5654	129	88	2026-01-08	tre_han
5655	129	89	2026-01-08	da_nop
5656	129	90	2026-01-08	da_nop
5657	129	91	2026-01-08	da_nop
5658	129	92	2026-01-08	da_nop
5659	129	93	2026-01-08	tre_han
5660	129	94	2026-01-08	tre_han
5661	129	95	2026-01-08	da_nop
5662	129	96	2026-01-08	tre_han
5663	129	97	2026-01-08	da_nop
5664	129	98	2026-01-08	da_nop
5665	129	99	2026-01-08	da_nop
5666	129	100	2026-01-08	da_nop
5667	129	101	2026-01-08	da_nop
5668	129	102	2026-01-08	da_nop
5669	129	103	2026-01-08	da_nop
5670	129	104	2026-01-08	da_nop
5671	129	105	2026-01-08	da_nop
5672	129	106	2026-01-08	da_nop
5673	129	107	2026-01-08	da_nop
5674	129	108	2026-01-08	da_nop
5675	129	109	2026-01-08	da_nop
5676	129	110	2026-01-08	da_nop
5677	130	67	2026-01-08	da_nop
5678	130	68	2026-01-08	tre_han
5679	130	69	2026-01-08	da_nop
5680	130	70	2026-01-08	tre_han
5681	130	71	2026-01-08	da_nop
5682	130	72	2026-01-08	da_nop
5683	130	73	2026-01-08	da_nop
5684	130	74	2026-01-08	tre_han
5685	130	75	2026-01-08	da_nop
5686	130	76	2026-01-08	da_nop
5687	130	77	2026-01-08	da_nop
5688	130	78	2026-01-08	da_nop
5689	130	79	2026-01-08	da_nop
5690	130	80	2026-01-08	da_nop
5691	130	81	2026-01-08	da_nop
5692	130	82	2026-01-08	da_nop
5693	130	83	2026-01-08	da_nop
5694	130	84	2026-01-08	da_nop
5695	130	85	2026-01-08	da_nop
5696	130	86	2026-01-08	da_nop
5697	130	87	2026-01-08	da_nop
5698	130	88	2026-01-08	da_nop
5699	130	89	2026-01-08	da_nop
5700	130	90	2026-01-08	tre_han
5701	130	91	2026-01-08	da_nop
5702	130	92	2026-01-08	da_nop
5703	130	93	2026-01-08	da_nop
5704	130	94	2026-01-08	tre_han
5705	130	95	2026-01-08	da_nop
5706	130	96	2026-01-08	da_nop
5707	130	97	2026-01-08	tre_han
5708	130	98	2026-01-08	da_nop
5709	130	99	2026-01-08	da_nop
5710	130	100	2026-01-08	da_nop
5711	130	101	2026-01-08	da_nop
5712	130	102	2026-01-08	da_nop
5713	130	103	2026-01-08	tre_han
5714	130	104	2026-01-08	da_nop
5715	130	105	2026-01-08	da_nop
5716	130	106	2026-01-08	da_nop
5717	130	107	2026-01-08	da_nop
5718	130	108	2026-01-08	da_nop
5719	130	109	2026-01-08	da_nop
5720	130	110	2026-01-08	tre_han
5721	131	67	2026-01-08	da_nop
5722	131	68	2026-01-08	da_nop
5723	131	69	2026-01-08	da_nop
5724	131	70	2026-01-08	da_nop
5725	131	71	2026-01-08	da_nop
5726	131	72	2026-01-08	tre_han
5727	131	73	2026-01-08	da_nop
5728	131	74	2026-01-08	da_nop
5729	131	75	2026-01-08	da_nop
5730	131	76	2026-01-08	da_nop
5731	131	77	2026-01-08	da_nop
5732	131	78	2026-01-08	da_nop
5733	131	79	2026-01-08	da_nop
5734	131	80	2026-01-08	tre_han
5735	131	81	2026-01-08	tre_han
5736	131	82	2026-01-08	da_nop
5737	131	83	2026-01-08	da_nop
5738	131	84	2026-01-08	da_nop
5739	131	85	2026-01-08	da_nop
5740	131	86	2026-01-08	tre_han
5741	131	87	2026-01-08	da_nop
5742	131	88	2026-01-08	da_nop
5743	131	89	2026-01-08	da_nop
5744	131	90	2026-01-08	da_nop
5745	131	91	2026-01-08	tre_han
5746	131	92	2026-01-08	da_nop
5747	131	93	2026-01-08	da_nop
5748	131	94	2026-01-08	da_nop
5749	131	95	2026-01-08	da_nop
5750	131	96	2026-01-08	da_nop
5751	131	97	2026-01-08	tre_han
5752	131	98	2026-01-08	da_nop
5753	131	99	2026-01-08	da_nop
5754	131	100	2026-01-08	da_nop
5755	131	101	2026-01-08	da_nop
5756	131	102	2026-01-08	tre_han
5757	131	103	2026-01-08	da_nop
5758	131	104	2026-01-08	da_nop
5759	131	105	2026-01-08	tre_han
5760	131	106	2026-01-08	da_nop
5761	131	107	2026-01-08	da_nop
5762	131	108	2026-01-08	da_nop
5763	131	109	2026-01-08	tre_han
5764	131	110	2026-01-08	da_nop
5765	132	67	2026-01-08	tre_han
5766	132	68	2026-01-08	da_nop
5767	132	69	2026-01-08	da_nop
5768	132	70	2026-01-08	da_nop
5769	132	71	2026-01-08	tre_han
5770	132	72	2026-01-08	da_nop
5771	132	73	2026-01-08	tre_han
5772	132	74	2026-01-08	da_nop
5773	132	75	2026-01-08	da_nop
5774	132	76	2026-01-08	da_nop
5775	132	77	2026-01-08	da_nop
5776	132	78	2026-01-08	da_nop
5777	132	79	2026-01-08	tre_han
5778	132	80	2026-01-08	da_nop
5779	132	81	2026-01-08	da_nop
5780	132	82	2026-01-08	da_nop
5781	132	83	2026-01-08	da_nop
5782	132	84	2026-01-08	da_nop
5783	132	85	2026-01-08	tre_han
5784	132	86	2026-01-08	da_nop
5785	132	87	2026-01-08	da_nop
5786	132	88	2026-01-08	tre_han
5787	132	89	2026-01-08	da_nop
5788	132	90	2026-01-08	da_nop
5789	132	91	2026-01-08	da_nop
5790	132	92	2026-01-08	da_nop
5791	132	93	2026-01-08	da_nop
5792	132	94	2026-01-08	da_nop
5793	132	95	2026-01-08	da_nop
5794	132	96	2026-01-08	tre_han
5795	132	97	2026-01-08	tre_han
5796	132	98	2026-01-08	da_nop
5797	132	99	2026-01-08	da_nop
5798	132	100	2026-01-08	da_nop
5799	132	101	2026-01-08	da_nop
5800	132	102	2026-01-08	da_nop
5801	132	103	2026-01-08	da_nop
5802	132	104	2026-01-08	da_nop
5803	132	105	2026-01-08	tre_han
5804	132	106	2026-01-08	da_nop
5805	132	107	2026-01-08	da_nop
5806	132	108	2026-01-08	da_nop
5807	132	109	2026-01-08	da_nop
5808	132	110	2026-01-08	da_nop
5809	133	67	2026-01-08	da_nop
5810	133	68	2026-01-08	da_nop
5811	133	69	2026-01-08	da_nop
5812	133	70	2026-01-08	da_nop
5813	133	71	2026-01-08	da_nop
5814	133	72	2026-01-08	tre_han
5815	133	73	2026-01-08	da_nop
5816	133	74	2026-01-08	da_nop
5817	133	75	2026-01-08	da_nop
5818	133	76	2026-01-08	da_nop
5819	133	77	2026-01-08	da_nop
5820	133	78	2026-01-08	da_nop
5821	133	79	2026-01-08	da_nop
5822	133	80	2026-01-08	da_nop
5823	133	81	2026-01-08	da_nop
5824	133	82	2026-01-08	da_nop
5825	133	83	2026-01-08	da_nop
5826	133	84	2026-01-08	da_nop
5827	133	85	2026-01-08	da_nop
5828	133	86	2026-01-08	da_nop
5829	133	87	2026-01-08	da_nop
5830	133	88	2026-01-08	da_nop
5831	133	89	2026-01-08	da_nop
5832	133	90	2026-01-08	da_nop
5833	133	91	2026-01-08	tre_han
5834	133	92	2026-01-08	da_nop
5835	133	93	2026-01-08	da_nop
5836	133	94	2026-01-08	da_nop
5837	133	95	2026-01-08	da_nop
5838	133	96	2026-01-08	tre_han
5839	133	97	2026-01-08	da_nop
5840	133	98	2026-01-08	da_nop
5841	133	99	2026-01-08	da_nop
5842	133	100	2026-01-08	tre_han
5843	133	101	2026-01-08	da_nop
5844	133	102	2026-01-08	da_nop
5845	133	103	2026-01-08	tre_han
5846	133	104	2026-01-08	da_nop
5847	133	105	2026-01-08	da_nop
5848	133	106	2026-01-08	da_nop
5849	133	107	2026-01-08	da_nop
5850	133	108	2026-01-08	da_nop
5851	133	109	2026-01-08	da_nop
5852	133	110	2026-01-08	tre_han
5853	134	67	2026-01-08	da_nop
5854	134	68	2026-01-08	da_nop
5855	134	69	2026-01-08	da_nop
5856	134	70	2026-01-08	tre_han
5857	134	71	2026-01-08	da_nop
5858	134	72	2026-01-08	da_nop
5859	134	73	2026-01-08	tre_han
5860	134	74	2026-01-08	da_nop
5861	134	75	2026-01-08	tre_han
5862	134	76	2026-01-08	tre_han
5863	134	77	2026-01-08	da_nop
5864	134	78	2026-01-08	da_nop
5865	134	79	2026-01-08	da_nop
5866	134	80	2026-01-08	da_nop
5867	134	81	2026-01-08	da_nop
5868	134	82	2026-01-08	da_nop
5869	134	83	2026-01-08	tre_han
5870	134	84	2026-01-08	da_nop
5871	134	85	2026-01-08	da_nop
5872	134	86	2026-01-08	da_nop
5873	134	87	2026-01-08	da_nop
5874	134	88	2026-01-08	da_nop
5875	134	89	2026-01-08	da_nop
5876	134	90	2026-01-08	da_nop
5877	134	91	2026-01-08	tre_han
5878	134	92	2026-01-08	da_nop
5879	134	93	2026-01-08	da_nop
5880	134	94	2026-01-08	da_nop
5881	134	95	2026-01-08	da_nop
5882	134	96	2026-01-08	da_nop
5883	134	97	2026-01-08	da_nop
5884	134	98	2026-01-08	da_nop
5885	134	99	2026-01-08	da_nop
5886	134	100	2026-01-08	da_nop
5887	134	101	2026-01-08	tre_han
5888	134	102	2026-01-08	da_nop
5889	134	103	2026-01-08	da_nop
5890	134	104	2026-01-08	da_nop
5891	134	105	2026-01-08	da_nop
5892	134	106	2026-01-08	da_nop
5893	134	107	2026-01-08	tre_han
5894	134	108	2026-01-08	da_nop
5895	134	109	2026-01-08	da_nop
5896	134	110	2026-01-08	da_nop
5897	135	67	2026-01-08	da_nop
5898	135	68	2026-01-08	da_nop
5899	135	69	2026-01-08	da_nop
5900	135	70	2026-01-08	da_nop
5901	135	71	2026-01-08	da_nop
5902	135	72	2026-01-08	tre_han
5903	135	73	2026-01-08	da_nop
5904	135	74	2026-01-08	tre_han
5905	135	75	2026-01-08	da_nop
5906	135	76	2026-01-08	da_nop
5907	135	77	2026-01-08	da_nop
5908	135	78	2026-01-08	da_nop
5909	135	79	2026-01-08	da_nop
5910	135	80	2026-01-08	da_nop
5911	135	81	2026-01-08	da_nop
5912	135	82	2026-01-08	tre_han
5913	135	83	2026-01-08	da_nop
5914	135	84	2026-01-08	tre_han
5915	135	85	2026-01-08	da_nop
5916	135	86	2026-01-08	da_nop
5917	135	87	2026-01-08	da_nop
5918	135	88	2026-01-08	da_nop
5919	135	89	2026-01-08	da_nop
5920	135	90	2026-01-08	da_nop
5921	135	91	2026-01-08	da_nop
5922	135	92	2026-01-08	da_nop
5923	135	93	2026-01-08	da_nop
5924	135	94	2026-01-08	tre_han
5925	135	95	2026-01-08	da_nop
5926	135	96	2026-01-08	da_nop
5927	135	97	2026-01-08	tre_han
5928	135	98	2026-01-08	da_nop
5929	135	99	2026-01-08	da_nop
5930	135	100	2026-01-08	da_nop
5931	135	101	2026-01-08	da_nop
5932	135	102	2026-01-08	da_nop
5933	135	103	2026-01-08	da_nop
5934	135	104	2026-01-08	da_nop
5935	135	105	2026-01-08	da_nop
5936	135	106	2026-01-08	da_nop
5937	135	107	2026-01-08	tre_han
5938	135	108	2026-01-08	da_nop
5939	135	109	2026-01-08	da_nop
5940	135	110	2026-01-08	da_nop
5941	136	67	2026-01-08	da_nop
5942	136	68	2026-01-08	da_nop
5943	136	69	2026-01-08	da_nop
5944	136	70	2026-01-08	da_nop
5945	136	71	2026-01-08	da_nop
5946	136	72	2026-01-08	da_nop
5947	136	73	2026-01-08	da_nop
5948	136	74	2026-01-08	da_nop
5949	136	75	2026-01-08	da_nop
5950	136	76	2026-01-08	tre_han
5951	136	77	2026-01-08	tre_han
5952	136	78	2026-01-08	da_nop
5953	136	79	2026-01-08	da_nop
5954	136	80	2026-01-08	da_nop
5955	136	81	2026-01-08	da_nop
5956	136	82	2026-01-08	tre_han
5957	136	83	2026-01-08	da_nop
5958	136	84	2026-01-08	tre_han
5959	136	85	2026-01-08	tre_han
5960	136	86	2026-01-08	da_nop
5961	136	87	2026-01-08	da_nop
5962	136	88	2026-01-08	da_nop
5963	136	89	2026-01-08	tre_han
5964	136	90	2026-01-08	da_nop
5965	136	91	2026-01-08	tre_han
5966	136	92	2026-01-08	da_nop
5967	136	93	2026-01-08	da_nop
5968	136	94	2026-01-08	da_nop
5969	136	95	2026-01-08	da_nop
5970	136	96	2026-01-08	da_nop
5971	136	97	2026-01-08	da_nop
5972	136	98	2026-01-08	tre_han
5973	136	99	2026-01-08	da_nop
5974	136	100	2026-01-08	da_nop
5975	136	101	2026-01-08	da_nop
5976	136	102	2026-01-08	da_nop
5977	136	103	2026-01-08	da_nop
5978	136	104	2026-01-08	da_nop
5979	136	105	2026-01-08	tre_han
5980	136	106	2026-01-08	da_nop
5981	136	107	2026-01-08	da_nop
5982	136	108	2026-01-08	da_nop
5983	136	109	2026-01-08	tre_han
5984	136	110	2026-01-08	da_nop
5985	137	67	2026-01-08	da_nop
5986	137	68	2026-01-08	da_nop
5987	137	69	2026-01-08	da_nop
5988	137	70	2026-01-08	da_nop
5989	137	71	2026-01-08	tre_han
5990	137	72	2026-01-08	da_nop
5991	137	73	2026-01-08	da_nop
5992	137	74	2026-01-08	da_nop
5993	137	75	2026-01-08	da_nop
5994	137	76	2026-01-08	da_nop
5995	137	77	2026-01-08	da_nop
5996	137	78	2026-01-08	tre_han
5997	137	79	2026-01-08	da_nop
5998	137	80	2026-01-08	da_nop
5999	137	81	2026-01-08	da_nop
6000	137	82	2026-01-08	da_nop
6001	137	83	2026-01-08	da_nop
6002	137	84	2026-01-08	da_nop
6003	137	85	2026-01-08	da_nop
6004	137	86	2026-01-08	tre_han
6005	137	87	2026-01-08	da_nop
6006	137	88	2026-01-08	da_nop
6007	137	89	2026-01-08	da_nop
6008	137	90	2026-01-08	da_nop
6009	137	91	2026-01-08	da_nop
6010	137	92	2026-01-08	da_nop
6011	137	93	2026-01-08	da_nop
6012	137	94	2026-01-08	da_nop
6013	137	95	2026-01-08	da_nop
6014	137	96	2026-01-08	tre_han
6015	137	97	2026-01-08	da_nop
6016	137	98	2026-01-08	da_nop
6017	137	99	2026-01-08	da_nop
6018	137	100	2026-01-08	tre_han
6019	137	101	2026-01-08	da_nop
6020	137	102	2026-01-08	da_nop
6021	137	103	2026-01-08	da_nop
6022	137	104	2026-01-08	da_nop
6023	137	105	2026-01-08	da_nop
6024	137	106	2026-01-08	tre_han
6025	137	107	2026-01-08	da_nop
6026	137	108	2026-01-08	da_nop
6027	137	109	2026-01-08	da_nop
6028	137	110	2026-01-08	tre_han
6029	138	67	2026-01-08	da_nop
6030	138	68	2026-01-08	da_nop
6031	138	69	2026-01-08	da_nop
6032	138	70	2026-01-08	da_nop
6033	138	71	2026-01-08	tre_han
6034	138	72	2026-01-08	da_nop
6035	138	73	2026-01-08	da_nop
6036	138	74	2026-01-08	da_nop
6037	138	75	2026-01-08	da_nop
6038	138	76	2026-01-08	tre_han
6039	138	77	2026-01-08	da_nop
6040	138	78	2026-01-08	da_nop
6041	138	79	2026-01-08	da_nop
6042	138	80	2026-01-08	tre_han
6043	138	81	2026-01-08	da_nop
6044	138	82	2026-01-08	da_nop
6045	138	83	2026-01-08	da_nop
6046	138	84	2026-01-08	tre_han
6047	138	85	2026-01-08	da_nop
6048	138	86	2026-01-08	tre_han
6049	138	87	2026-01-08	da_nop
6050	138	88	2026-01-08	da_nop
6051	138	89	2026-01-08	da_nop
6052	138	90	2026-01-08	tre_han
6053	138	91	2026-01-08	da_nop
6054	138	92	2026-01-08	da_nop
6055	138	93	2026-01-08	da_nop
6056	138	94	2026-01-08	tre_han
6057	138	95	2026-01-08	da_nop
6058	138	96	2026-01-08	da_nop
6059	138	97	2026-01-08	da_nop
6060	138	98	2026-01-08	da_nop
6061	138	99	2026-01-08	da_nop
6062	138	100	2026-01-08	da_nop
6063	138	101	2026-01-08	da_nop
6064	138	102	2026-01-08	da_nop
6065	138	103	2026-01-08	tre_han
6066	138	104	2026-01-08	da_nop
6067	138	105	2026-01-08	tre_han
6068	138	106	2026-01-08	da_nop
6069	138	107	2026-01-08	tre_han
6070	138	108	2026-01-08	da_nop
6071	138	109	2026-01-08	da_nop
6072	138	110	2026-01-08	da_nop
6073	139	67	2026-01-08	da_nop
6074	139	68	2026-01-08	da_nop
6075	139	69	2026-01-08	da_nop
6076	139	70	2026-01-08	da_nop
6077	139	71	2026-01-08	tre_han
6078	139	72	2026-01-08	da_nop
6079	139	73	2026-01-08	da_nop
6080	139	74	2026-01-08	da_nop
6081	139	75	2026-01-08	da_nop
6082	139	76	2026-01-08	tre_han
6083	139	77	2026-01-08	da_nop
6084	139	78	2026-01-08	da_nop
6085	139	79	2026-01-08	da_nop
6086	139	80	2026-01-08	da_nop
6087	139	81	2026-01-08	da_nop
6088	139	82	2026-01-08	da_nop
6089	139	83	2026-01-08	da_nop
6090	139	84	2026-01-08	da_nop
6091	139	85	2026-01-08	tre_han
6092	139	86	2026-01-08	da_nop
6093	139	87	2026-01-08	da_nop
6094	139	88	2026-01-08	da_nop
6095	139	89	2026-01-08	da_nop
6096	139	90	2026-01-08	tre_han
6097	139	91	2026-01-08	da_nop
6098	139	92	2026-01-08	tre_han
6099	139	93	2026-01-08	da_nop
6100	139	94	2026-01-08	da_nop
6101	139	95	2026-01-08	da_nop
6102	139	96	2026-01-08	tre_han
6103	139	97	2026-01-08	da_nop
6104	139	98	2026-01-08	da_nop
6105	139	99	2026-01-08	tre_han
6106	139	100	2026-01-08	tre_han
6107	139	101	2026-01-08	da_nop
6108	139	102	2026-01-08	tre_han
6109	139	103	2026-01-08	da_nop
6110	139	104	2026-01-08	tre_han
6111	139	105	2026-01-08	da_nop
6112	139	106	2026-01-08	da_nop
6113	139	107	2026-01-08	da_nop
6114	139	108	2026-01-08	da_nop
6115	139	109	2026-01-08	da_nop
6116	139	110	2026-01-08	da_nop
6117	140	67	2026-01-08	da_nop
6118	140	68	2026-01-08	tre_han
6119	140	69	2026-01-08	tre_han
6120	140	70	2026-01-08	da_nop
6121	140	71	2026-01-08	da_nop
6122	140	72	2026-01-08	da_nop
6123	140	73	2026-01-08	da_nop
6124	140	74	2026-01-08	da_nop
6125	140	75	2026-01-08	da_nop
6126	140	76	2026-01-08	tre_han
6127	140	77	2026-01-08	da_nop
6128	140	78	2026-01-08	da_nop
6129	140	79	2026-01-08	tre_han
6130	140	80	2026-01-08	da_nop
6131	140	81	2026-01-08	da_nop
6132	140	82	2026-01-08	da_nop
6133	140	83	2026-01-08	tre_han
6134	140	84	2026-01-08	tre_han
6135	140	85	2026-01-08	da_nop
6136	140	86	2026-01-08	da_nop
6137	140	87	2026-01-08	da_nop
6138	140	88	2026-01-08	da_nop
6139	140	89	2026-01-08	da_nop
6140	140	90	2026-01-08	da_nop
6141	140	91	2026-01-08	da_nop
6142	140	92	2026-01-08	da_nop
6143	140	93	2026-01-08	tre_han
6144	140	94	2026-01-08	da_nop
6145	140	95	2026-01-08	da_nop
6146	140	96	2026-01-08	da_nop
6147	140	97	2026-01-08	da_nop
6148	140	98	2026-01-08	da_nop
6149	140	99	2026-01-08	da_nop
6150	140	100	2026-01-08	da_nop
6151	140	101	2026-01-08	tre_han
6152	140	102	2026-01-08	tre_han
6153	140	103	2026-01-08	tre_han
6154	140	104	2026-01-08	da_nop
6155	140	105	2026-01-08	da_nop
6156	140	106	2026-01-08	da_nop
6157	140	107	2026-01-08	da_nop
6158	140	108	2026-01-08	da_nop
6159	140	109	2026-01-08	da_nop
6160	140	110	2026-01-08	da_nop
6161	141	67	2026-01-08	da_nop
6162	141	68	2026-01-08	tre_han
6163	141	69	2026-01-08	da_nop
6164	141	70	2026-01-08	da_nop
6165	141	71	2026-01-08	da_nop
6166	141	72	2026-01-08	da_nop
6167	141	73	2026-01-08	tre_han
6168	141	74	2026-01-08	da_nop
6169	141	75	2026-01-08	da_nop
6170	141	76	2026-01-08	da_nop
6171	141	77	2026-01-08	da_nop
6172	141	78	2026-01-08	da_nop
6173	141	79	2026-01-08	da_nop
6174	141	80	2026-01-08	da_nop
6175	141	81	2026-01-08	da_nop
6176	141	82	2026-01-08	da_nop
6177	141	83	2026-01-08	da_nop
6178	141	84	2026-01-08	da_nop
6179	141	85	2026-01-08	da_nop
6180	141	86	2026-01-08	da_nop
6181	141	87	2026-01-08	da_nop
6182	141	88	2026-01-08	tre_han
6183	141	89	2026-01-08	da_nop
6184	141	90	2026-01-08	da_nop
6185	141	91	2026-01-08	tre_han
6186	141	92	2026-01-08	da_nop
6187	141	93	2026-01-08	da_nop
6188	141	94	2026-01-08	tre_han
6189	141	95	2026-01-08	da_nop
6190	141	96	2026-01-08	da_nop
6191	141	97	2026-01-08	da_nop
6192	141	98	2026-01-08	da_nop
6193	141	99	2026-01-08	da_nop
6194	141	100	2026-01-08	da_nop
6195	141	101	2026-01-08	da_nop
6196	141	102	2026-01-08	da_nop
6197	141	103	2026-01-08	da_nop
6198	141	104	2026-01-08	da_nop
6199	141	105	2026-01-08	da_nop
6200	141	106	2026-01-08	da_nop
6201	141	107	2026-01-08	da_nop
6202	141	108	2026-01-08	da_nop
6203	141	109	2026-01-08	da_nop
6204	141	110	2026-01-08	tre_han
6205	142	67	2026-01-08	da_nop
6206	142	68	2026-01-08	da_nop
6207	142	69	2026-01-08	da_nop
6208	142	70	2026-01-08	da_nop
6209	142	71	2026-01-08	da_nop
6210	142	72	2026-01-08	da_nop
6211	142	73	2026-01-08	da_nop
6212	142	74	2026-01-08	tre_han
6213	142	75	2026-01-08	da_nop
6214	142	76	2026-01-08	da_nop
6215	142	77	2026-01-08	da_nop
6216	142	78	2026-01-08	da_nop
6217	142	79	2026-01-08	da_nop
6218	142	80	2026-01-08	da_nop
6219	142	81	2026-01-08	da_nop
6220	142	82	2026-01-08	da_nop
6221	142	83	2026-01-08	da_nop
6222	142	84	2026-01-08	tre_han
6223	142	85	2026-01-08	da_nop
6224	142	86	2026-01-08	da_nop
6225	142	87	2026-01-08	da_nop
6226	142	88	2026-01-08	da_nop
6227	142	89	2026-01-08	da_nop
6228	142	90	2026-01-08	da_nop
6229	142	91	2026-01-08	da_nop
6230	142	92	2026-01-08	tre_han
6231	142	93	2026-01-08	da_nop
6232	142	94	2026-01-08	da_nop
6233	142	95	2026-01-08	da_nop
6234	142	96	2026-01-08	da_nop
6235	142	97	2026-01-08	da_nop
6236	142	98	2026-01-08	da_nop
6237	142	99	2026-01-08	da_nop
6238	142	100	2026-01-08	da_nop
6239	142	101	2026-01-08	da_nop
6240	142	102	2026-01-08	tre_han
6241	142	103	2026-01-08	da_nop
6242	142	104	2026-01-08	da_nop
6243	142	105	2026-01-08	da_nop
6244	142	106	2026-01-08	da_nop
6245	142	107	2026-01-08	tre_han
6246	142	108	2026-01-08	da_nop
6247	142	109	2026-01-08	tre_han
6248	142	110	2026-01-08	da_nop
6249	143	67	2026-01-08	da_nop
6250	143	68	2026-01-08	tre_han
6251	143	69	2026-01-08	da_nop
6252	143	70	2026-01-08	da_nop
6253	143	71	2026-01-08	da_nop
6254	143	72	2026-01-08	tre_han
6255	143	73	2026-01-08	tre_han
6256	143	74	2026-01-08	da_nop
6257	143	75	2026-01-08	tre_han
6258	143	76	2026-01-08	da_nop
6259	143	77	2026-01-08	da_nop
6260	143	78	2026-01-08	da_nop
6261	143	79	2026-01-08	da_nop
6262	143	80	2026-01-08	da_nop
6263	143	81	2026-01-08	da_nop
6264	143	82	2026-01-08	da_nop
6265	143	83	2026-01-08	tre_han
6266	143	84	2026-01-08	da_nop
6267	143	85	2026-01-08	da_nop
6268	143	86	2026-01-08	da_nop
6269	143	87	2026-01-08	da_nop
6270	143	88	2026-01-08	tre_han
6271	143	89	2026-01-08	da_nop
6272	143	90	2026-01-08	da_nop
6273	143	91	2026-01-08	da_nop
6274	143	92	2026-01-08	da_nop
6275	143	93	2026-01-08	da_nop
6276	143	94	2026-01-08	da_nop
6277	143	95	2026-01-08	da_nop
6278	143	96	2026-01-08	da_nop
6279	143	97	2026-01-08	da_nop
6280	143	98	2026-01-08	da_nop
6281	143	99	2026-01-08	da_nop
6282	143	100	2026-01-08	da_nop
6283	143	101	2026-01-08	da_nop
6284	143	102	2026-01-08	da_nop
6285	143	103	2026-01-08	da_nop
6286	143	104	2026-01-08	da_nop
6287	143	105	2026-01-08	tre_han
6288	143	106	2026-01-08	da_nop
6289	143	107	2026-01-08	da_nop
6290	143	108	2026-01-08	tre_han
6291	143	109	2026-01-08	da_nop
6292	143	110	2026-01-08	da_nop
6293	144	67	2026-01-08	da_nop
6294	144	68	2026-01-08	da_nop
6295	144	69	2026-01-08	da_nop
6296	144	70	2026-01-08	da_nop
6297	144	71	2026-01-08	tre_han
6298	144	72	2026-01-08	tre_han
6299	144	73	2026-01-08	tre_han
6300	144	74	2026-01-08	da_nop
6301	144	75	2026-01-08	da_nop
6302	144	76	2026-01-08	da_nop
6303	144	77	2026-01-08	tre_han
6304	144	78	2026-01-08	da_nop
6305	144	79	2026-01-08	da_nop
6306	144	80	2026-01-08	da_nop
6307	144	81	2026-01-08	da_nop
6308	144	82	2026-01-08	da_nop
6309	144	83	2026-01-08	da_nop
6310	144	84	2026-01-08	da_nop
6311	144	85	2026-01-08	da_nop
6312	144	86	2026-01-08	da_nop
6313	144	87	2026-01-08	tre_han
6314	144	88	2026-01-08	tre_han
6315	144	89	2026-01-08	da_nop
6316	144	90	2026-01-08	tre_han
6317	144	91	2026-01-08	da_nop
6318	144	92	2026-01-08	tre_han
6319	144	93	2026-01-08	da_nop
6320	144	94	2026-01-08	da_nop
6321	144	95	2026-01-08	da_nop
6322	144	96	2026-01-08	da_nop
6323	144	97	2026-01-08	da_nop
6324	144	98	2026-01-08	da_nop
6325	144	99	2026-01-08	da_nop
6326	144	100	2026-01-08	da_nop
6327	144	101	2026-01-08	da_nop
6328	144	102	2026-01-08	tre_han
6329	144	103	2026-01-08	da_nop
6330	144	104	2026-01-08	da_nop
6331	144	105	2026-01-08	da_nop
6332	144	106	2026-01-08	da_nop
6333	144	107	2026-01-08	da_nop
6334	144	108	2026-01-08	da_nop
6335	144	109	2026-01-08	tre_han
6336	144	110	2026-01-08	tre_han
6337	145	67	2026-01-08	tre_han
6338	145	68	2026-01-08	da_nop
6339	145	69	2026-01-08	da_nop
6340	145	70	2026-01-08	da_nop
6341	145	71	2026-01-08	da_nop
6342	145	72	2026-01-08	da_nop
6343	145	73	2026-01-08	da_nop
6344	145	74	2026-01-08	da_nop
6345	145	75	2026-01-08	da_nop
6346	145	76	2026-01-08	da_nop
6347	145	77	2026-01-08	da_nop
6348	145	78	2026-01-08	da_nop
6349	145	79	2026-01-08	da_nop
6350	145	80	2026-01-08	da_nop
6351	145	81	2026-01-08	tre_han
6352	145	82	2026-01-08	da_nop
6353	145	83	2026-01-08	tre_han
6354	145	84	2026-01-08	tre_han
6355	145	85	2026-01-08	da_nop
6356	145	86	2026-01-08	da_nop
6357	145	87	2026-01-08	da_nop
6358	145	88	2026-01-08	da_nop
6359	145	89	2026-01-08	da_nop
6360	145	90	2026-01-08	da_nop
6361	145	91	2026-01-08	tre_han
6362	145	92	2026-01-08	tre_han
6363	145	93	2026-01-08	da_nop
6364	145	94	2026-01-08	da_nop
6365	145	95	2026-01-08	da_nop
6366	145	96	2026-01-08	da_nop
6367	145	97	2026-01-08	da_nop
6368	145	98	2026-01-08	tre_han
6369	145	99	2026-01-08	tre_han
6370	145	100	2026-01-08	da_nop
6371	145	101	2026-01-08	da_nop
6372	145	102	2026-01-08	da_nop
6373	145	103	2026-01-08	da_nop
6374	145	104	2026-01-08	da_nop
6375	145	105	2026-01-08	da_nop
6376	145	106	2026-01-08	da_nop
6377	145	107	2026-01-08	da_nop
6378	145	108	2026-01-08	da_nop
6379	145	109	2026-01-08	da_nop
6380	145	110	2026-01-08	da_nop
6381	146	67	2026-01-08	da_nop
6382	146	68	2026-01-08	tre_han
6383	146	69	2026-01-08	da_nop
6384	146	70	2026-01-08	da_nop
6385	146	71	2026-01-08	da_nop
6386	146	72	2026-01-08	da_nop
6387	146	73	2026-01-08	da_nop
6388	146	74	2026-01-08	tre_han
6389	146	75	2026-01-08	da_nop
6390	146	76	2026-01-08	da_nop
6391	146	77	2026-01-08	da_nop
6392	146	78	2026-01-08	da_nop
6393	146	79	2026-01-08	da_nop
6394	146	80	2026-01-08	da_nop
6395	146	81	2026-01-08	da_nop
6396	146	82	2026-01-08	da_nop
6397	146	83	2026-01-08	da_nop
6398	146	84	2026-01-08	tre_han
6399	146	85	2026-01-08	da_nop
6400	146	86	2026-01-08	da_nop
6401	146	87	2026-01-08	da_nop
6402	146	88	2026-01-08	da_nop
6403	146	89	2026-01-08	da_nop
6404	146	90	2026-01-08	da_nop
6405	146	91	2026-01-08	da_nop
6406	146	92	2026-01-08	da_nop
6407	146	93	2026-01-08	da_nop
6408	146	94	2026-01-08	da_nop
6409	146	95	2026-01-08	da_nop
6410	146	96	2026-01-08	tre_han
6411	146	97	2026-01-08	da_nop
6412	146	98	2026-01-08	tre_han
6413	146	99	2026-01-08	da_nop
6414	146	100	2026-01-08	da_nop
6415	146	101	2026-01-08	da_nop
6416	146	102	2026-01-08	da_nop
6417	146	103	2026-01-08	da_nop
6418	146	104	2026-01-08	da_nop
6419	146	105	2026-01-08	da_nop
6420	146	106	2026-01-08	da_nop
6421	146	107	2026-01-08	da_nop
6422	146	108	2026-01-08	da_nop
6423	146	109	2026-01-08	da_nop
6424	146	110	2026-01-08	da_nop
6425	147	67	2026-01-08	da_nop
6426	147	68	2026-01-08	da_nop
6427	147	69	2026-01-08	da_nop
6428	147	70	2026-01-08	da_nop
6429	147	71	2026-01-08	tre_han
6430	147	72	2026-01-08	tre_han
6431	147	73	2026-01-08	da_nop
6432	147	74	2026-01-08	tre_han
6433	147	75	2026-01-08	da_nop
6434	147	76	2026-01-08	da_nop
6435	147	77	2026-01-08	da_nop
6436	147	78	2026-01-08	da_nop
6437	147	79	2026-01-08	da_nop
6438	147	80	2026-01-08	da_nop
6439	147	81	2026-01-08	da_nop
6440	147	82	2026-01-08	da_nop
6441	147	83	2026-01-08	da_nop
6442	147	84	2026-01-08	da_nop
6443	147	85	2026-01-08	da_nop
6444	147	86	2026-01-08	da_nop
6445	147	87	2026-01-08	da_nop
6446	147	88	2026-01-08	da_nop
6447	147	89	2026-01-08	da_nop
6448	147	90	2026-01-08	da_nop
6449	147	91	2026-01-08	da_nop
6450	147	92	2026-01-08	da_nop
6451	147	93	2026-01-08	tre_han
6452	147	94	2026-01-08	tre_han
6453	147	95	2026-01-08	tre_han
6454	147	96	2026-01-08	da_nop
6455	147	97	2026-01-08	da_nop
6456	147	98	2026-01-08	da_nop
6457	147	99	2026-01-08	da_nop
6458	147	100	2026-01-08	tre_han
6459	147	101	2026-01-08	da_nop
6460	147	102	2026-01-08	da_nop
6461	147	103	2026-01-08	da_nop
6462	147	104	2026-01-08	da_nop
6463	147	105	2026-01-08	da_nop
6464	147	106	2026-01-08	tre_han
6465	147	107	2026-01-08	da_nop
6466	147	108	2026-01-08	da_nop
6467	147	109	2026-01-08	da_nop
6468	147	110	2026-01-08	tre_han
6469	148	67	2026-01-08	da_nop
6470	148	68	2026-01-08	tre_han
6471	148	69	2026-01-08	da_nop
6472	148	70	2026-01-08	tre_han
6473	148	71	2026-01-08	da_nop
6474	148	72	2026-01-08	da_nop
6475	148	73	2026-01-08	da_nop
6476	148	74	2026-01-08	tre_han
6477	148	75	2026-01-08	da_nop
6478	148	76	2026-01-08	da_nop
6479	148	77	2026-01-08	da_nop
6480	148	78	2026-01-08	da_nop
6481	148	79	2026-01-08	da_nop
6482	148	80	2026-01-08	tre_han
6483	148	81	2026-01-08	da_nop
6484	148	82	2026-01-08	da_nop
6485	148	83	2026-01-08	da_nop
6486	148	84	2026-01-08	da_nop
6487	148	85	2026-01-08	tre_han
6488	148	86	2026-01-08	da_nop
6489	148	87	2026-01-08	da_nop
6490	148	88	2026-01-08	da_nop
6491	148	89	2026-01-08	da_nop
6492	148	90	2026-01-08	da_nop
6493	148	91	2026-01-08	da_nop
6494	148	92	2026-01-08	tre_han
6495	148	93	2026-01-08	tre_han
6496	148	94	2026-01-08	da_nop
6497	148	95	2026-01-08	da_nop
6498	148	96	2026-01-08	da_nop
6499	148	97	2026-01-08	da_nop
6500	148	98	2026-01-08	tre_han
6501	148	99	2026-01-08	da_nop
6502	148	100	2026-01-08	da_nop
6503	148	101	2026-01-08	da_nop
6504	148	102	2026-01-08	da_nop
6505	148	103	2026-01-08	tre_han
6506	148	104	2026-01-08	tre_han
6507	148	105	2026-01-08	da_nop
6508	148	106	2026-01-08	da_nop
6509	148	107	2026-01-08	tre_han
6510	148	108	2026-01-08	da_nop
6511	148	109	2026-01-08	da_nop
6512	148	110	2026-01-08	da_nop
6513	149	67	2026-01-08	tre_han
6514	149	68	2026-01-08	da_nop
6515	149	69	2026-01-08	da_nop
6516	149	70	2026-01-08	tre_han
6517	149	71	2026-01-08	da_nop
6518	149	72	2026-01-08	da_nop
6519	149	73	2026-01-08	da_nop
6520	149	74	2026-01-08	tre_han
6521	149	75	2026-01-08	da_nop
6522	149	76	2026-01-08	da_nop
6523	149	77	2026-01-08	da_nop
6524	149	78	2026-01-08	da_nop
6525	149	79	2026-01-08	da_nop
6526	149	80	2026-01-08	da_nop
6527	149	81	2026-01-08	tre_han
6528	149	82	2026-01-08	da_nop
6529	149	83	2026-01-08	tre_han
6530	149	84	2026-01-08	da_nop
6531	149	85	2026-01-08	da_nop
6532	149	86	2026-01-08	da_nop
6533	149	87	2026-01-08	da_nop
6534	149	88	2026-01-08	da_nop
6535	149	89	2026-01-08	tre_han
6536	149	90	2026-01-08	da_nop
6537	149	91	2026-01-08	tre_han
6538	149	92	2026-01-08	da_nop
6539	149	93	2026-01-08	da_nop
6540	149	94	2026-01-08	da_nop
6541	149	95	2026-01-08	da_nop
6542	149	96	2026-01-08	da_nop
6543	149	97	2026-01-08	tre_han
6544	149	98	2026-01-08	da_nop
6545	149	99	2026-01-08	da_nop
6546	149	100	2026-01-08	da_nop
6547	149	101	2026-01-08	da_nop
6548	149	102	2026-01-08	da_nop
6549	149	103	2026-01-08	da_nop
6550	149	104	2026-01-08	da_nop
6551	149	105	2026-01-08	da_nop
6552	149	106	2026-01-08	tre_han
6553	149	107	2026-01-08	da_nop
6554	149	108	2026-01-08	da_nop
6555	149	109	2026-01-08	da_nop
6556	149	110	2026-01-08	da_nop
6557	150	67	2026-01-08	da_nop
6558	150	68	2026-01-08	da_nop
6559	150	69	2026-01-08	da_nop
6560	150	70	2026-01-08	da_nop
6561	150	71	2026-01-08	da_nop
6562	150	72	2026-01-08	da_nop
6563	150	73	2026-01-08	da_nop
6564	150	74	2026-01-08	da_nop
6565	150	75	2026-01-08	da_nop
6566	150	76	2026-01-08	tre_han
6567	150	77	2026-01-08	da_nop
6568	150	78	2026-01-08	da_nop
6569	150	79	2026-01-08	da_nop
6570	150	80	2026-01-08	da_nop
6571	150	81	2026-01-08	da_nop
6572	150	82	2026-01-08	da_nop
6573	150	83	2026-01-08	da_nop
6574	150	84	2026-01-08	tre_han
6575	150	85	2026-01-08	da_nop
6576	150	86	2026-01-08	tre_han
6577	150	87	2026-01-08	da_nop
6578	150	88	2026-01-08	da_nop
6579	150	89	2026-01-08	da_nop
6580	150	90	2026-01-08	da_nop
6581	150	91	2026-01-08	da_nop
6582	150	92	2026-01-08	da_nop
6583	150	93	2026-01-08	da_nop
6584	150	94	2026-01-08	da_nop
6585	150	95	2026-01-08	da_nop
6586	150	96	2026-01-08	tre_han
6587	150	97	2026-01-08	da_nop
6588	150	98	2026-01-08	da_nop
6589	150	99	2026-01-08	da_nop
6590	150	100	2026-01-08	tre_han
6591	150	101	2026-01-08	da_nop
6592	150	102	2026-01-08	da_nop
6593	150	103	2026-01-08	da_nop
6594	150	104	2026-01-08	da_nop
6595	150	105	2026-01-08	da_nop
6596	150	106	2026-01-08	da_nop
6597	150	107	2026-01-08	da_nop
6598	150	108	2026-01-08	tre_han
6599	150	109	2026-01-08	tre_han
6600	150	110	2026-01-08	da_nop
6601	151	67	2026-01-08	da_nop
6602	151	68	2026-01-08	da_nop
6603	151	69	2026-01-08	da_nop
6604	151	70	2026-01-08	da_nop
6605	151	71	2026-01-08	da_nop
6606	151	72	2026-01-08	tre_han
6607	151	73	2026-01-08	da_nop
6608	151	74	2026-01-08	da_nop
6609	151	75	2026-01-08	da_nop
6610	151	76	2026-01-08	tre_han
6611	151	77	2026-01-08	da_nop
6612	151	78	2026-01-08	da_nop
6613	151	79	2026-01-08	tre_han
6614	151	80	2026-01-08	da_nop
6615	151	81	2026-01-08	tre_han
6616	151	82	2026-01-08	da_nop
6617	151	83	2026-01-08	da_nop
6618	151	84	2026-01-08	da_nop
6619	151	85	2026-01-08	da_nop
6620	151	86	2026-01-08	da_nop
6621	151	87	2026-01-08	da_nop
6622	151	88	2026-01-08	da_nop
6623	151	89	2026-01-08	da_nop
6624	151	90	2026-01-08	da_nop
6625	151	91	2026-01-08	da_nop
6626	151	92	2026-01-08	da_nop
6627	151	93	2026-01-08	da_nop
6628	151	94	2026-01-08	da_nop
6629	151	95	2026-01-08	tre_han
6630	151	96	2026-01-08	da_nop
6631	151	97	2026-01-08	da_nop
6632	151	98	2026-01-08	tre_han
6633	151	99	2026-01-08	da_nop
6634	151	100	2026-01-08	da_nop
6635	151	101	2026-01-08	da_nop
6636	151	102	2026-01-08	tre_han
6637	151	103	2026-01-08	tre_han
6638	151	104	2026-01-08	da_nop
6639	151	105	2026-01-08	da_nop
6640	151	106	2026-01-08	da_nop
6641	151	107	2026-01-08	da_nop
6642	151	108	2026-01-08	da_nop
6643	151	109	2026-01-08	da_nop
6644	151	110	2026-01-08	da_nop
6645	152	67	2026-01-08	da_nop
6646	152	68	2026-01-08	da_nop
6647	152	69	2026-01-08	da_nop
6648	152	70	2026-01-08	da_nop
6649	152	71	2026-01-08	da_nop
6650	152	72	2026-01-08	da_nop
6651	152	73	2026-01-08	da_nop
6652	152	74	2026-01-08	da_nop
6653	152	75	2026-01-08	da_nop
6654	152	76	2026-01-08	da_nop
6655	152	77	2026-01-08	da_nop
6656	152	78	2026-01-08	da_nop
6657	152	79	2026-01-08	da_nop
6658	152	80	2026-01-08	da_nop
6659	152	81	2026-01-08	da_nop
6660	152	82	2026-01-08	da_nop
6661	152	83	2026-01-08	da_nop
6662	152	84	2026-01-08	da_nop
6663	152	85	2026-01-08	da_nop
6664	152	86	2026-01-08	da_nop
6665	152	87	2026-01-08	tre_han
6666	152	88	2026-01-08	da_nop
6667	152	89	2026-01-08	da_nop
6668	152	90	2026-01-08	da_nop
6669	152	91	2026-01-08	da_nop
6670	152	92	2026-01-08	da_nop
6671	152	93	2026-01-08	da_nop
6672	152	94	2026-01-08	tre_han
6673	152	95	2026-01-08	da_nop
6674	152	96	2026-01-08	da_nop
6675	152	97	2026-01-08	da_nop
6676	152	98	2026-01-08	da_nop
6677	152	99	2026-01-08	tre_han
6678	152	100	2026-01-08	da_nop
6679	152	101	2026-01-08	da_nop
6680	152	102	2026-01-08	tre_han
6681	152	103	2026-01-08	da_nop
6682	152	104	2026-01-08	da_nop
6683	152	105	2026-01-08	da_nop
6684	152	106	2026-01-08	da_nop
6685	152	107	2026-01-08	da_nop
6686	152	108	2026-01-08	da_nop
6687	152	109	2026-01-08	da_nop
6688	152	110	2026-01-08	da_nop
6689	153	67	2026-01-08	da_nop
6690	153	68	2026-01-08	da_nop
6691	153	69	2026-01-08	da_nop
6692	153	70	2026-01-08	tre_han
6693	153	71	2026-01-08	da_nop
6694	153	72	2026-01-08	tre_han
6695	153	73	2026-01-08	da_nop
6696	153	74	2026-01-08	da_nop
6697	153	75	2026-01-08	da_nop
6698	153	76	2026-01-08	da_nop
6699	153	77	2026-01-08	da_nop
6700	153	78	2026-01-08	tre_han
6701	153	79	2026-01-08	da_nop
6702	153	80	2026-01-08	da_nop
6703	153	81	2026-01-08	tre_han
6704	153	82	2026-01-08	da_nop
6705	153	83	2026-01-08	tre_han
6706	153	84	2026-01-08	da_nop
6707	153	85	2026-01-08	da_nop
6708	153	86	2026-01-08	da_nop
6709	153	87	2026-01-08	da_nop
6710	153	88	2026-01-08	da_nop
6711	153	89	2026-01-08	da_nop
6712	153	90	2026-01-08	tre_han
6713	153	91	2026-01-08	da_nop
6714	153	92	2026-01-08	da_nop
6715	153	93	2026-01-08	da_nop
6716	153	94	2026-01-08	da_nop
6717	153	95	2026-01-08	da_nop
6718	153	96	2026-01-08	da_nop
6719	153	97	2026-01-08	da_nop
6720	153	98	2026-01-08	da_nop
6721	153	99	2026-01-08	da_nop
6722	153	100	2026-01-08	da_nop
6723	153	101	2026-01-08	da_nop
6724	153	102	2026-01-08	da_nop
6725	153	103	2026-01-08	da_nop
6726	153	104	2026-01-08	da_nop
6727	153	105	2026-01-08	da_nop
6728	153	106	2026-01-08	tre_han
6729	153	107	2026-01-08	da_nop
6730	153	108	2026-01-08	da_nop
6731	153	109	2026-01-08	tre_han
6732	153	110	2026-01-08	da_nop
6733	154	67	2026-01-08	da_nop
6734	154	68	2026-01-08	da_nop
6735	154	69	2026-01-08	da_nop
6736	154	70	2026-01-08	da_nop
6737	154	71	2026-01-08	tre_han
6738	154	72	2026-01-08	da_nop
6739	154	73	2026-01-08	da_nop
6740	154	74	2026-01-08	tre_han
6741	154	75	2026-01-08	tre_han
6742	154	76	2026-01-08	da_nop
6743	154	77	2026-01-08	da_nop
6744	154	78	2026-01-08	da_nop
6745	154	79	2026-01-08	da_nop
6746	154	80	2026-01-08	da_nop
6747	154	81	2026-01-08	da_nop
6748	154	82	2026-01-08	da_nop
6749	154	83	2026-01-08	da_nop
6750	154	84	2026-01-08	tre_han
6751	154	85	2026-01-08	da_nop
6752	154	86	2026-01-08	da_nop
6753	154	87	2026-01-08	da_nop
6754	154	88	2026-01-08	da_nop
6755	154	89	2026-01-08	da_nop
6756	154	90	2026-01-08	da_nop
6757	154	91	2026-01-08	tre_han
6758	154	92	2026-01-08	da_nop
6759	154	93	2026-01-08	da_nop
6760	154	94	2026-01-08	da_nop
6761	154	95	2026-01-08	tre_han
6762	154	96	2026-01-08	da_nop
6763	154	97	2026-01-08	da_nop
6764	154	98	2026-01-08	da_nop
6765	154	99	2026-01-08	tre_han
6766	154	100	2026-01-08	tre_han
6767	154	101	2026-01-08	da_nop
6768	154	102	2026-01-08	da_nop
6769	154	103	2026-01-08	da_nop
6770	154	104	2026-01-08	da_nop
6771	154	105	2026-01-08	da_nop
6772	154	106	2026-01-08	da_nop
6773	154	107	2026-01-08	da_nop
6774	154	108	2026-01-08	da_nop
6775	154	109	2026-01-08	da_nop
6776	154	110	2026-01-08	tre_han
6777	155	67	2026-01-08	da_nop
6778	155	68	2026-01-08	da_nop
6779	155	69	2026-01-08	da_nop
6780	155	70	2026-01-08	da_nop
6781	155	71	2026-01-08	da_nop
6782	155	72	2026-01-08	da_nop
6783	155	73	2026-01-08	tre_han
6784	155	74	2026-01-08	da_nop
6785	155	75	2026-01-08	da_nop
6786	155	76	2026-01-08	da_nop
6787	155	77	2026-01-08	da_nop
6788	155	78	2026-01-08	da_nop
6789	155	79	2026-01-08	da_nop
6790	155	80	2026-01-08	tre_han
6791	155	81	2026-01-08	da_nop
6792	155	82	2026-01-08	da_nop
6793	155	83	2026-01-08	da_nop
6794	155	84	2026-01-08	da_nop
6795	155	85	2026-01-08	da_nop
6796	155	86	2026-01-08	da_nop
6797	155	87	2026-01-08	da_nop
6798	155	88	2026-01-08	da_nop
6799	155	89	2026-01-08	da_nop
6800	155	90	2026-01-08	da_nop
6801	155	91	2026-01-08	da_nop
6802	155	92	2026-01-08	da_nop
6803	155	93	2026-01-08	da_nop
6804	155	94	2026-01-08	da_nop
6805	155	95	2026-01-08	da_nop
6806	155	96	2026-01-08	da_nop
6807	155	97	2026-01-08	da_nop
6808	155	98	2026-01-08	da_nop
6809	155	99	2026-01-08	da_nop
6810	155	100	2026-01-08	da_nop
6811	155	101	2026-01-08	da_nop
6812	155	102	2026-01-08	da_nop
6813	155	103	2026-01-08	da_nop
6814	155	104	2026-01-08	da_nop
6815	155	105	2026-01-08	da_nop
6816	155	106	2026-01-08	tre_han
6817	155	107	2026-01-08	da_nop
6818	155	108	2026-01-08	da_nop
6819	155	109	2026-01-08	da_nop
6820	155	110	2026-01-08	tre_han
6821	156	67	2026-01-08	da_nop
6822	156	68	2026-01-08	da_nop
6823	156	69	2026-01-08	da_nop
6824	156	70	2026-01-08	tre_han
6825	156	71	2026-01-08	da_nop
6826	156	72	2026-01-08	da_nop
6827	156	73	2026-01-08	da_nop
6828	156	74	2026-01-08	da_nop
6829	156	75	2026-01-08	da_nop
6830	156	76	2026-01-08	da_nop
6831	156	77	2026-01-08	da_nop
6832	156	78	2026-01-08	da_nop
6833	156	79	2026-01-08	da_nop
6834	156	80	2026-01-08	da_nop
6835	156	81	2026-01-08	tre_han
6836	156	82	2026-01-08	da_nop
6837	156	83	2026-01-08	da_nop
6838	156	84	2026-01-08	tre_han
6839	156	85	2026-01-08	da_nop
6840	156	86	2026-01-08	da_nop
6841	156	87	2026-01-08	da_nop
6842	156	88	2026-01-08	da_nop
6843	156	89	2026-01-08	da_nop
6844	156	90	2026-01-08	da_nop
6845	156	91	2026-01-08	da_nop
6846	156	92	2026-01-08	da_nop
6847	156	93	2026-01-08	da_nop
6848	156	94	2026-01-08	da_nop
6849	156	95	2026-01-08	tre_han
6850	156	96	2026-01-08	da_nop
6851	156	97	2026-01-08	tre_han
6852	156	98	2026-01-08	da_nop
6853	156	99	2026-01-08	da_nop
6854	156	100	2026-01-08	da_nop
6855	156	101	2026-01-08	da_nop
6856	156	102	2026-01-08	da_nop
6857	156	103	2026-01-08	da_nop
6858	156	104	2026-01-08	tre_han
6859	156	105	2026-01-08	da_nop
6860	156	106	2026-01-08	da_nop
6861	156	107	2026-01-08	da_nop
6862	156	108	2026-01-08	da_nop
6863	156	109	2026-01-08	da_nop
6864	156	110	2026-01-08	da_nop
6865	157	67	2026-01-08	da_nop
6866	157	68	2026-01-08	da_nop
6867	157	69	2026-01-08	da_nop
6868	157	70	2026-01-08	tre_han
6869	157	71	2026-01-08	tre_han
6870	157	72	2026-01-08	da_nop
6871	157	73	2026-01-08	da_nop
6872	157	74	2026-01-08	da_nop
6873	157	75	2026-01-08	tre_han
6874	157	76	2026-01-08	da_nop
6875	157	77	2026-01-08	tre_han
6876	157	78	2026-01-08	tre_han
6877	157	79	2026-01-08	da_nop
6878	157	80	2026-01-08	da_nop
6879	157	81	2026-01-08	da_nop
6880	157	82	2026-01-08	da_nop
6881	157	83	2026-01-08	tre_han
6882	157	84	2026-01-08	da_nop
6883	157	85	2026-01-08	tre_han
6884	157	86	2026-01-08	da_nop
6885	157	87	2026-01-08	tre_han
6886	157	88	2026-01-08	da_nop
6887	157	89	2026-01-08	da_nop
6888	157	90	2026-01-08	da_nop
6889	157	91	2026-01-08	da_nop
6890	157	92	2026-01-08	da_nop
6891	157	93	2026-01-08	da_nop
6892	157	94	2026-01-08	da_nop
6893	157	95	2026-01-08	da_nop
6894	157	96	2026-01-08	da_nop
6895	157	97	2026-01-08	da_nop
6896	157	98	2026-01-08	da_nop
6897	157	99	2026-01-08	da_nop
6898	157	100	2026-01-08	da_nop
6899	157	101	2026-01-08	tre_han
6900	157	102	2026-01-08	da_nop
6901	157	103	2026-01-08	da_nop
6902	157	104	2026-01-08	da_nop
6903	157	105	2026-01-08	da_nop
6904	157	106	2026-01-08	da_nop
6905	157	107	2026-01-08	da_nop
6906	157	108	2026-01-08	da_nop
6907	157	109	2026-01-08	da_nop
6908	157	110	2026-01-08	da_nop
6909	158	67	2026-01-08	da_nop
6910	158	68	2026-01-08	da_nop
6911	158	69	2026-01-08	da_nop
6912	158	70	2026-01-08	da_nop
6913	158	71	2026-01-08	da_nop
6914	158	72	2026-01-08	da_nop
6915	158	73	2026-01-08	da_nop
6916	158	74	2026-01-08	da_nop
6917	158	75	2026-01-08	da_nop
6918	158	76	2026-01-08	da_nop
6919	158	77	2026-01-08	tre_han
6920	158	78	2026-01-08	da_nop
6921	158	79	2026-01-08	da_nop
6922	158	80	2026-01-08	da_nop
6923	158	81	2026-01-08	da_nop
6924	158	82	2026-01-08	da_nop
6925	158	83	2026-01-08	tre_han
6926	158	84	2026-01-08	tre_han
6927	158	85	2026-01-08	da_nop
6928	158	86	2026-01-08	da_nop
6929	158	87	2026-01-08	da_nop
6930	158	88	2026-01-08	tre_han
6931	158	89	2026-01-08	da_nop
6932	158	90	2026-01-08	da_nop
6933	158	91	2026-01-08	da_nop
6934	158	92	2026-01-08	da_nop
6935	158	93	2026-01-08	da_nop
6936	158	94	2026-01-08	da_nop
6937	158	95	2026-01-08	da_nop
6938	158	96	2026-01-08	tre_han
6939	158	97	2026-01-08	da_nop
6940	158	98	2026-01-08	da_nop
6941	158	99	2026-01-08	da_nop
6942	158	100	2026-01-08	da_nop
6943	158	101	2026-01-08	da_nop
6944	158	102	2026-01-08	da_nop
6945	158	103	2026-01-08	da_nop
6946	158	104	2026-01-08	da_nop
6947	158	105	2026-01-08	da_nop
6948	158	106	2026-01-08	da_nop
6949	158	107	2026-01-08	da_nop
6950	158	108	2026-01-08	da_nop
6951	158	109	2026-01-08	tre_han
6952	158	110	2026-01-08	tre_han
6953	159	67	2026-01-08	da_nop
6954	159	68	2026-01-08	da_nop
6955	159	69	2026-01-08	tre_han
6956	159	70	2026-01-08	da_nop
6957	159	71	2026-01-08	da_nop
6958	159	72	2026-01-08	da_nop
6959	159	73	2026-01-08	da_nop
6960	159	74	2026-01-08	da_nop
6961	159	75	2026-01-08	da_nop
6962	159	76	2026-01-08	da_nop
6963	159	77	2026-01-08	da_nop
6964	159	78	2026-01-08	da_nop
6965	159	79	2026-01-08	tre_han
6966	159	80	2026-01-08	tre_han
6967	159	81	2026-01-08	da_nop
6968	159	82	2026-01-08	tre_han
6969	159	83	2026-01-08	da_nop
6970	159	84	2026-01-08	tre_han
6971	159	85	2026-01-08	da_nop
6972	159	86	2026-01-08	tre_han
6973	159	87	2026-01-08	da_nop
6974	159	88	2026-01-08	da_nop
6975	159	89	2026-01-08	da_nop
6976	159	90	2026-01-08	da_nop
6977	159	91	2026-01-08	da_nop
6978	159	92	2026-01-08	da_nop
6979	159	93	2026-01-08	tre_han
6980	159	94	2026-01-08	tre_han
6981	159	95	2026-01-08	da_nop
6982	159	96	2026-01-08	da_nop
6983	159	97	2026-01-08	da_nop
6984	159	98	2026-01-08	tre_han
6985	159	99	2026-01-08	tre_han
6986	159	100	2026-01-08	da_nop
6987	159	101	2026-01-08	da_nop
6988	159	102	2026-01-08	tre_han
6989	159	103	2026-01-08	da_nop
6990	159	104	2026-01-08	da_nop
6991	159	105	2026-01-08	da_nop
6992	159	106	2026-01-08	tre_han
6993	159	107	2026-01-08	tre_han
6994	159	108	2026-01-08	da_nop
6995	159	109	2026-01-08	da_nop
6996	159	110	2026-01-08	da_nop
6997	160	67	2026-01-08	tre_han
6998	160	68	2026-01-08	da_nop
6999	160	69	2026-01-08	tre_han
7000	160	70	2026-01-08	da_nop
7001	160	71	2026-01-08	da_nop
7002	160	72	2026-01-08	da_nop
7003	160	73	2026-01-08	da_nop
7004	160	74	2026-01-08	da_nop
7005	160	75	2026-01-08	da_nop
7006	160	76	2026-01-08	tre_han
7007	160	77	2026-01-08	da_nop
7008	160	78	2026-01-08	da_nop
7009	160	79	2026-01-08	da_nop
7010	160	80	2026-01-08	tre_han
7011	160	81	2026-01-08	tre_han
7012	160	82	2026-01-08	da_nop
7013	160	83	2026-01-08	da_nop
7014	160	84	2026-01-08	da_nop
7015	160	85	2026-01-08	da_nop
7016	160	86	2026-01-08	da_nop
7017	160	87	2026-01-08	da_nop
7018	160	88	2026-01-08	da_nop
7019	160	89	2026-01-08	da_nop
7020	160	90	2026-01-08	tre_han
7021	160	91	2026-01-08	da_nop
7022	160	92	2026-01-08	da_nop
7023	160	93	2026-01-08	da_nop
7024	160	94	2026-01-08	da_nop
7025	160	95	2026-01-08	da_nop
7026	160	96	2026-01-08	tre_han
7027	160	97	2026-01-08	da_nop
7028	160	98	2026-01-08	tre_han
7029	160	99	2026-01-08	da_nop
7030	160	100	2026-01-08	da_nop
7031	160	101	2026-01-08	da_nop
7032	160	102	2026-01-08	da_nop
7033	160	103	2026-01-08	da_nop
7034	160	104	2026-01-08	da_nop
7035	160	105	2026-01-08	da_nop
7036	160	106	2026-01-08	da_nop
7037	160	107	2026-01-08	da_nop
7038	160	108	2026-01-08	tre_han
7039	160	109	2026-01-08	da_nop
7040	160	110	2026-01-08	da_nop
7041	161	67	2026-01-08	da_nop
7042	161	68	2026-01-08	da_nop
7043	161	69	2026-01-08	da_nop
7044	161	70	2026-01-08	da_nop
7045	161	71	2026-01-08	da_nop
7046	161	72	2026-01-08	da_nop
7047	161	73	2026-01-08	da_nop
7048	161	74	2026-01-08	tre_han
7049	161	75	2026-01-08	tre_han
7050	161	76	2026-01-08	da_nop
7051	161	77	2026-01-08	da_nop
7052	161	78	2026-01-08	da_nop
7053	161	79	2026-01-08	da_nop
7054	161	80	2026-01-08	da_nop
7055	161	81	2026-01-08	da_nop
7056	161	82	2026-01-08	da_nop
7057	161	83	2026-01-08	tre_han
7058	161	84	2026-01-08	da_nop
7059	161	85	2026-01-08	da_nop
7060	161	86	2026-01-08	da_nop
7061	161	87	2026-01-08	da_nop
7062	161	88	2026-01-08	da_nop
7063	161	89	2026-01-08	da_nop
7064	161	90	2026-01-08	da_nop
7065	161	91	2026-01-08	da_nop
7066	161	92	2026-01-08	da_nop
7067	161	93	2026-01-08	da_nop
7068	161	94	2026-01-08	da_nop
7069	161	95	2026-01-08	da_nop
7070	161	96	2026-01-08	da_nop
7071	161	97	2026-01-08	da_nop
7072	161	98	2026-01-08	da_nop
7073	161	99	2026-01-08	da_nop
7074	161	100	2026-01-08	da_nop
7075	161	101	2026-01-08	da_nop
7076	161	102	2026-01-08	da_nop
7077	161	103	2026-01-08	da_nop
7078	161	104	2026-01-08	da_nop
7079	161	105	2026-01-08	da_nop
7080	161	106	2026-01-08	da_nop
7081	161	107	2026-01-08	da_nop
7082	161	108	2026-01-08	da_nop
7083	161	109	2026-01-08	da_nop
7084	161	110	2026-01-08	da_nop
7085	162	67	2026-01-08	da_nop
7086	162	68	2026-01-08	da_nop
7087	162	69	2026-01-08	da_nop
7088	162	70	2026-01-08	da_nop
7089	162	71	2026-01-08	da_nop
7090	162	72	2026-01-08	da_nop
7091	162	73	2026-01-08	da_nop
7092	162	74	2026-01-08	da_nop
7093	162	75	2026-01-08	da_nop
7094	162	76	2026-01-08	da_nop
7095	162	77	2026-01-08	da_nop
7096	162	78	2026-01-08	da_nop
7097	162	79	2026-01-08	da_nop
7098	162	80	2026-01-08	da_nop
7099	162	81	2026-01-08	tre_han
7100	162	82	2026-01-08	da_nop
7101	162	83	2026-01-08	da_nop
7102	162	84	2026-01-08	da_nop
7103	162	85	2026-01-08	da_nop
7104	162	86	2026-01-08	da_nop
7105	162	87	2026-01-08	da_nop
7106	162	88	2026-01-08	da_nop
7107	162	89	2026-01-08	da_nop
7108	162	90	2026-01-08	da_nop
7109	162	91	2026-01-08	da_nop
7110	162	92	2026-01-08	da_nop
7111	162	93	2026-01-08	da_nop
7112	162	94	2026-01-08	da_nop
7113	162	95	2026-01-08	da_nop
7114	162	96	2026-01-08	tre_han
7115	162	97	2026-01-08	da_nop
7116	162	98	2026-01-08	da_nop
7117	162	99	2026-01-08	da_nop
7118	162	100	2026-01-08	da_nop
7119	162	101	2026-01-08	da_nop
7120	162	102	2026-01-08	tre_han
7121	162	103	2026-01-08	da_nop
7122	162	104	2026-01-08	da_nop
7123	162	105	2026-01-08	da_nop
7124	162	106	2026-01-08	da_nop
7125	162	107	2026-01-08	tre_han
7126	162	108	2026-01-08	tre_han
7127	162	109	2026-01-08	tre_han
7128	162	110	2026-01-08	da_nop
7129	163	67	2026-01-08	tre_han
7130	163	68	2026-01-08	da_nop
7131	163	69	2026-01-08	da_nop
7132	163	70	2026-01-08	da_nop
7133	163	71	2026-01-08	da_nop
7134	163	72	2026-01-08	tre_han
7135	163	73	2026-01-08	da_nop
7136	163	74	2026-01-08	da_nop
7137	163	75	2026-01-08	tre_han
7138	163	76	2026-01-08	da_nop
7139	163	77	2026-01-08	da_nop
7140	163	78	2026-01-08	da_nop
7141	163	79	2026-01-08	da_nop
7142	163	80	2026-01-08	da_nop
7143	163	81	2026-01-08	da_nop
7144	163	82	2026-01-08	da_nop
7145	163	83	2026-01-08	da_nop
7146	163	84	2026-01-08	da_nop
7147	163	85	2026-01-08	da_nop
7148	163	86	2026-01-08	da_nop
7149	163	87	2026-01-08	da_nop
7150	163	88	2026-01-08	da_nop
7151	163	89	2026-01-08	da_nop
7152	163	90	2026-01-08	da_nop
7153	163	91	2026-01-08	tre_han
7154	163	92	2026-01-08	tre_han
7155	163	93	2026-01-08	da_nop
7156	163	94	2026-01-08	tre_han
7157	163	95	2026-01-08	da_nop
7158	163	96	2026-01-08	da_nop
7159	163	97	2026-01-08	da_nop
7160	163	98	2026-01-08	da_nop
7161	163	99	2026-01-08	tre_han
7162	163	100	2026-01-08	da_nop
7163	163	101	2026-01-08	da_nop
7164	163	102	2026-01-08	da_nop
7165	163	103	2026-01-08	da_nop
7166	163	104	2026-01-08	tre_han
7167	163	105	2026-01-08	da_nop
7168	163	106	2026-01-08	da_nop
7169	163	107	2026-01-08	da_nop
7170	163	108	2026-01-08	da_nop
7171	163	109	2026-01-08	da_nop
7172	163	110	2026-01-08	da_nop
7173	164	67	2026-01-08	da_nop
7174	164	68	2026-01-08	da_nop
7175	164	69	2026-01-08	da_nop
7176	164	70	2026-01-08	da_nop
7177	164	71	2026-01-08	da_nop
7178	164	72	2026-01-08	da_nop
7179	164	73	2026-01-08	da_nop
7180	164	74	2026-01-08	da_nop
7181	164	75	2026-01-08	tre_han
7182	164	76	2026-01-08	da_nop
7183	164	77	2026-01-08	da_nop
7184	164	78	2026-01-08	da_nop
7185	164	79	2026-01-08	da_nop
7186	164	80	2026-01-08	da_nop
7187	164	81	2026-01-08	da_nop
7188	164	82	2026-01-08	da_nop
7189	164	83	2026-01-08	tre_han
7190	164	84	2026-01-08	da_nop
7191	164	85	2026-01-08	da_nop
7192	164	86	2026-01-08	da_nop
7193	164	87	2026-01-08	da_nop
7194	164	88	2026-01-08	tre_han
7195	164	89	2026-01-08	da_nop
7196	164	90	2026-01-08	da_nop
7197	164	91	2026-01-08	da_nop
7198	164	92	2026-01-08	da_nop
7199	164	93	2026-01-08	da_nop
7200	164	94	2026-01-08	tre_han
7201	164	95	2026-01-08	da_nop
7202	164	96	2026-01-08	da_nop
7203	164	97	2026-01-08	da_nop
7204	164	98	2026-01-08	da_nop
7205	164	99	2026-01-08	da_nop
7206	164	100	2026-01-08	tre_han
7207	164	101	2026-01-08	da_nop
7208	164	102	2026-01-08	da_nop
7209	164	103	2026-01-08	da_nop
7210	164	104	2026-01-08	da_nop
7211	164	105	2026-01-08	tre_han
7212	164	106	2026-01-08	da_nop
7213	164	107	2026-01-08	da_nop
7214	164	108	2026-01-08	da_nop
7215	164	109	2026-01-08	da_nop
7216	164	110	2026-01-08	da_nop
7217	165	67	2026-01-08	da_nop
7218	165	68	2026-01-08	tre_han
7219	165	69	2026-01-08	da_nop
7220	165	70	2026-01-08	da_nop
7221	165	71	2026-01-08	da_nop
7222	165	72	2026-01-08	da_nop
7223	165	73	2026-01-08	tre_han
7224	165	74	2026-01-08	da_nop
7225	165	75	2026-01-08	da_nop
7226	165	76	2026-01-08	tre_han
7227	165	77	2026-01-08	da_nop
7228	165	78	2026-01-08	da_nop
7229	165	79	2026-01-08	da_nop
7230	165	80	2026-01-08	tre_han
7231	165	81	2026-01-08	da_nop
7232	165	82	2026-01-08	da_nop
7233	165	83	2026-01-08	da_nop
7234	165	84	2026-01-08	da_nop
7235	165	85	2026-01-08	tre_han
7236	165	86	2026-01-08	da_nop
7237	165	87	2026-01-08	da_nop
7238	165	88	2026-01-08	da_nop
7239	165	89	2026-01-08	tre_han
7240	165	90	2026-01-08	da_nop
7241	165	91	2026-01-08	tre_han
7242	165	92	2026-01-08	da_nop
7243	165	93	2026-01-08	da_nop
7244	165	94	2026-01-08	da_nop
7245	165	95	2026-01-08	da_nop
7246	165	96	2026-01-08	tre_han
7247	165	97	2026-01-08	da_nop
7248	165	98	2026-01-08	da_nop
7249	165	99	2026-01-08	da_nop
7250	165	100	2026-01-08	tre_han
7251	165	101	2026-01-08	tre_han
7252	165	102	2026-01-08	da_nop
7253	165	103	2026-01-08	da_nop
7254	165	104	2026-01-08	da_nop
7255	165	105	2026-01-08	da_nop
7256	165	106	2026-01-08	da_nop
7257	165	107	2026-01-08	da_nop
7258	165	108	2026-01-08	da_nop
7259	165	109	2026-01-08	da_nop
7260	165	110	2026-01-08	da_nop
7261	166	67	2026-01-08	da_nop
7262	166	68	2026-01-08	tre_han
7263	166	69	2026-01-08	tre_han
7264	166	70	2026-01-08	da_nop
7265	166	71	2026-01-08	da_nop
7266	166	72	2026-01-08	da_nop
7267	166	73	2026-01-08	da_nop
7268	166	74	2026-01-08	tre_han
7269	166	75	2026-01-08	da_nop
7270	166	76	2026-01-08	da_nop
7271	166	77	2026-01-08	da_nop
7272	166	78	2026-01-08	da_nop
7273	166	79	2026-01-08	da_nop
7274	166	80	2026-01-08	da_nop
7275	166	81	2026-01-08	da_nop
7276	166	82	2026-01-08	da_nop
7277	166	83	2026-01-08	da_nop
7278	166	84	2026-01-08	tre_han
7279	166	85	2026-01-08	tre_han
7280	166	86	2026-01-08	da_nop
7281	166	87	2026-01-08	da_nop
7282	166	88	2026-01-08	da_nop
7283	166	89	2026-01-08	da_nop
7284	166	90	2026-01-08	da_nop
7285	166	91	2026-01-08	da_nop
7286	166	92	2026-01-08	da_nop
7287	166	93	2026-01-08	da_nop
7288	166	94	2026-01-08	da_nop
7289	166	95	2026-01-08	da_nop
7290	166	96	2026-01-08	da_nop
7291	166	97	2026-01-08	da_nop
7292	166	98	2026-01-08	tre_han
7293	166	99	2026-01-08	da_nop
7294	166	100	2026-01-08	da_nop
7295	166	101	2026-01-08	da_nop
7296	166	102	2026-01-08	da_nop
7297	166	103	2026-01-08	da_nop
7298	166	104	2026-01-08	da_nop
7299	166	105	2026-01-08	da_nop
7300	166	106	2026-01-08	da_nop
7301	166	107	2026-01-08	da_nop
7302	166	108	2026-01-08	da_nop
7303	166	109	2026-01-08	da_nop
7304	166	110	2026-01-08	tre_han
7305	167	67	2026-01-08	da_nop
7306	167	68	2026-01-08	tre_han
7307	167	69	2026-01-08	da_nop
7308	167	70	2026-01-08	da_nop
7309	167	71	2026-01-08	da_nop
7310	167	72	2026-01-08	da_nop
7311	167	73	2026-01-08	da_nop
7312	167	74	2026-01-08	da_nop
7313	167	75	2026-01-08	da_nop
7314	167	76	2026-01-08	da_nop
7315	167	77	2026-01-08	da_nop
7316	167	78	2026-01-08	da_nop
7317	167	79	2026-01-08	da_nop
7318	167	80	2026-01-08	da_nop
7319	167	81	2026-01-08	da_nop
7320	167	82	2026-01-08	da_nop
7321	167	83	2026-01-08	da_nop
7322	167	84	2026-01-08	da_nop
7323	167	85	2026-01-08	da_nop
7324	167	86	2026-01-08	da_nop
7325	167	87	2026-01-08	tre_han
7326	167	88	2026-01-08	da_nop
7327	167	89	2026-01-08	da_nop
7328	167	90	2026-01-08	tre_han
7329	167	91	2026-01-08	da_nop
7330	167	92	2026-01-08	da_nop
7331	167	93	2026-01-08	da_nop
7332	167	94	2026-01-08	da_nop
7333	167	95	2026-01-08	da_nop
7334	167	96	2026-01-08	da_nop
7335	167	97	2026-01-08	da_nop
7336	167	98	2026-01-08	da_nop
7337	167	99	2026-01-08	da_nop
7338	167	100	2026-01-08	da_nop
7339	167	101	2026-01-08	da_nop
7340	167	102	2026-01-08	da_nop
7341	167	103	2026-01-08	tre_han
7342	167	104	2026-01-08	da_nop
7343	167	105	2026-01-08	da_nop
7344	167	106	2026-01-08	da_nop
7345	167	107	2026-01-08	tre_han
7346	167	108	2026-01-08	da_nop
7347	167	109	2026-01-08	da_nop
7348	167	110	2026-01-08	tre_han
7349	168	67	2026-01-08	da_nop
7350	168	68	2026-01-08	tre_han
7351	168	69	2026-01-08	da_nop
7352	168	70	2026-01-08	da_nop
7353	168	71	2026-01-08	da_nop
7354	168	72	2026-01-08	da_nop
7355	168	73	2026-01-08	da_nop
7356	168	74	2026-01-08	da_nop
7357	168	75	2026-01-08	da_nop
7358	168	76	2026-01-08	da_nop
7359	168	77	2026-01-08	da_nop
7360	168	78	2026-01-08	da_nop
7361	168	79	2026-01-08	da_nop
7362	168	80	2026-01-08	da_nop
7363	168	81	2026-01-08	da_nop
7364	168	82	2026-01-08	tre_han
7365	168	83	2026-01-08	da_nop
7366	168	84	2026-01-08	tre_han
7367	168	85	2026-01-08	da_nop
7368	168	86	2026-01-08	da_nop
7369	168	87	2026-01-08	da_nop
7370	168	88	2026-01-08	da_nop
7371	168	89	2026-01-08	tre_han
7372	168	90	2026-01-08	tre_han
7373	168	91	2026-01-08	da_nop
7374	168	92	2026-01-08	da_nop
7375	168	93	2026-01-08	da_nop
7376	168	94	2026-01-08	tre_han
7377	168	95	2026-01-08	da_nop
7378	168	96	2026-01-08	tre_han
7379	168	97	2026-01-08	da_nop
7380	168	98	2026-01-08	da_nop
7381	168	99	2026-01-08	da_nop
7382	168	100	2026-01-08	da_nop
7383	168	101	2026-01-08	da_nop
7384	168	102	2026-01-08	da_nop
7385	168	103	2026-01-08	da_nop
7386	168	104	2026-01-08	da_nop
7387	168	105	2026-01-08	tre_han
7388	168	106	2026-01-08	tre_han
7389	168	107	2026-01-08	da_nop
7390	168	108	2026-01-08	tre_han
7391	168	109	2026-01-08	da_nop
7392	168	110	2026-01-08	da_nop
7393	169	67	2026-01-08	da_nop
7394	169	68	2026-01-08	tre_han
7395	169	69	2026-01-08	da_nop
7396	169	70	2026-01-08	tre_han
7397	169	71	2026-01-08	da_nop
7398	169	72	2026-01-08	da_nop
7399	169	73	2026-01-08	da_nop
7400	169	74	2026-01-08	da_nop
7401	169	75	2026-01-08	da_nop
7402	169	76	2026-01-08	da_nop
7403	169	77	2026-01-08	da_nop
7404	169	78	2026-01-08	da_nop
7405	169	79	2026-01-08	da_nop
7406	169	80	2026-01-08	da_nop
7407	169	81	2026-01-08	da_nop
7408	169	82	2026-01-08	da_nop
7409	169	83	2026-01-08	da_nop
7410	169	84	2026-01-08	da_nop
7411	169	85	2026-01-08	da_nop
7412	169	86	2026-01-08	da_nop
7413	169	87	2026-01-08	da_nop
7414	169	88	2026-01-08	da_nop
7415	169	89	2026-01-08	da_nop
7416	169	90	2026-01-08	da_nop
7417	169	91	2026-01-08	da_nop
7418	169	92	2026-01-08	da_nop
7419	169	93	2026-01-08	da_nop
7420	169	94	2026-01-08	da_nop
7421	169	95	2026-01-08	da_nop
7422	169	96	2026-01-08	da_nop
7423	169	97	2026-01-08	da_nop
7424	169	98	2026-01-08	da_nop
7425	169	99	2026-01-08	tre_han
7426	169	100	2026-01-08	da_nop
7427	169	101	2026-01-08	tre_han
7428	169	102	2026-01-08	da_nop
7429	169	103	2026-01-08	da_nop
7430	169	104	2026-01-08	da_nop
7431	169	105	2026-01-08	da_nop
7432	169	106	2026-01-08	da_nop
7433	169	107	2026-01-08	tre_han
7434	169	108	2026-01-08	da_nop
7435	169	109	2026-01-08	da_nop
7436	169	110	2026-01-08	da_nop
7437	170	67	2026-01-08	da_nop
7438	170	68	2026-01-08	da_nop
7439	170	69	2026-01-08	da_nop
7440	170	70	2026-01-08	da_nop
7441	170	71	2026-01-08	da_nop
7442	170	72	2026-01-08	tre_han
7443	170	73	2026-01-08	da_nop
7444	170	74	2026-01-08	da_nop
7445	170	75	2026-01-08	da_nop
7446	170	76	2026-01-08	tre_han
7447	170	77	2026-01-08	da_nop
7448	170	78	2026-01-08	da_nop
7449	170	79	2026-01-08	da_nop
7450	170	80	2026-01-08	da_nop
7451	170	81	2026-01-08	da_nop
7452	170	82	2026-01-08	tre_han
7453	170	83	2026-01-08	da_nop
7454	170	84	2026-01-08	da_nop
7455	170	85	2026-01-08	da_nop
7456	170	86	2026-01-08	da_nop
7457	170	87	2026-01-08	da_nop
7458	170	88	2026-01-08	da_nop
7459	170	89	2026-01-08	da_nop
7460	170	90	2026-01-08	da_nop
7461	170	91	2026-01-08	tre_han
7462	170	92	2026-01-08	da_nop
7463	170	93	2026-01-08	da_nop
7464	170	94	2026-01-08	da_nop
7465	170	95	2026-01-08	da_nop
7466	170	96	2026-01-08	da_nop
7467	170	97	2026-01-08	da_nop
7468	170	98	2026-01-08	tre_han
7469	170	99	2026-01-08	tre_han
7470	170	100	2026-01-08	da_nop
7471	170	101	2026-01-08	da_nop
7472	170	102	2026-01-08	da_nop
7473	170	103	2026-01-08	da_nop
7474	170	104	2026-01-08	da_nop
7475	170	105	2026-01-08	da_nop
7476	170	106	2026-01-08	tre_han
7477	170	107	2026-01-08	da_nop
7478	170	108	2026-01-08	tre_han
7479	170	109	2026-01-08	da_nop
7480	170	110	2026-01-08	da_nop
7481	171	67	2026-01-08	tre_han
7482	171	68	2026-01-08	da_nop
7483	171	69	2026-01-08	da_nop
7484	171	70	2026-01-08	da_nop
7485	171	71	2026-01-08	da_nop
7486	171	72	2026-01-08	da_nop
7487	171	73	2026-01-08	da_nop
7488	171	74	2026-01-08	da_nop
7489	171	75	2026-01-08	da_nop
7490	171	76	2026-01-08	da_nop
7491	171	77	2026-01-08	da_nop
7492	171	78	2026-01-08	da_nop
7493	171	79	2026-01-08	da_nop
7494	171	80	2026-01-08	da_nop
7495	171	81	2026-01-08	da_nop
7496	171	82	2026-01-08	da_nop
7497	171	83	2026-01-08	da_nop
7498	171	84	2026-01-08	tre_han
7499	171	85	2026-01-08	tre_han
7500	171	86	2026-01-08	da_nop
7501	171	87	2026-01-08	da_nop
7502	171	88	2026-01-08	da_nop
7503	171	89	2026-01-08	da_nop
7504	171	90	2026-01-08	da_nop
7505	171	91	2026-01-08	da_nop
7506	171	92	2026-01-08	tre_han
7507	171	93	2026-01-08	da_nop
7508	171	94	2026-01-08	da_nop
7509	171	95	2026-01-08	tre_han
7510	171	96	2026-01-08	da_nop
7511	171	97	2026-01-08	da_nop
7512	171	98	2026-01-08	da_nop
7513	171	99	2026-01-08	da_nop
7514	171	100	2026-01-08	da_nop
7515	171	101	2026-01-08	tre_han
7516	171	102	2026-01-08	da_nop
7517	171	103	2026-01-08	da_nop
7518	171	104	2026-01-08	da_nop
7519	171	105	2026-01-08	tre_han
7520	171	106	2026-01-08	tre_han
7521	171	107	2026-01-08	da_nop
7522	171	108	2026-01-08	da_nop
7523	171	109	2026-01-08	da_nop
7524	171	110	2026-01-08	da_nop
7525	172	67	2026-01-08	da_nop
7526	172	68	2026-01-08	da_nop
7527	172	69	2026-01-08	da_nop
7528	172	70	2026-01-08	da_nop
7529	172	71	2026-01-08	da_nop
7530	172	72	2026-01-08	tre_han
7531	172	73	2026-01-08	da_nop
7532	172	74	2026-01-08	da_nop
7533	172	75	2026-01-08	da_nop
7534	172	76	2026-01-08	da_nop
7535	172	77	2026-01-08	da_nop
7536	172	78	2026-01-08	da_nop
7537	172	79	2026-01-08	da_nop
7538	172	80	2026-01-08	da_nop
7539	172	81	2026-01-08	tre_han
7540	172	82	2026-01-08	da_nop
7541	172	83	2026-01-08	da_nop
7542	172	84	2026-01-08	tre_han
7543	172	85	2026-01-08	da_nop
7544	172	86	2026-01-08	da_nop
7545	172	87	2026-01-08	da_nop
7546	172	88	2026-01-08	da_nop
7547	172	89	2026-01-08	da_nop
7548	172	90	2026-01-08	tre_han
7549	172	91	2026-01-08	da_nop
7550	172	92	2026-01-08	da_nop
7551	172	93	2026-01-08	da_nop
7552	172	94	2026-01-08	tre_han
7553	172	95	2026-01-08	tre_han
7554	172	96	2026-01-08	tre_han
7555	172	97	2026-01-08	da_nop
7556	172	98	2026-01-08	da_nop
7557	172	99	2026-01-08	da_nop
7558	172	100	2026-01-08	tre_han
7559	172	101	2026-01-08	tre_han
7560	172	102	2026-01-08	da_nop
7561	172	103	2026-01-08	da_nop
7562	172	104	2026-01-08	da_nop
7563	172	105	2026-01-08	da_nop
7564	172	106	2026-01-08	da_nop
7565	172	107	2026-01-08	da_nop
7566	172	108	2026-01-08	da_nop
7567	172	109	2026-01-08	da_nop
7568	172	110	2026-01-08	da_nop
7569	173	67	2026-01-08	da_nop
7570	173	68	2026-01-08	da_nop
7571	173	69	2026-01-08	da_nop
7572	173	70	2026-01-08	da_nop
7573	173	71	2026-01-08	tre_han
7574	173	72	2026-01-08	da_nop
7575	173	73	2026-01-08	da_nop
7576	173	74	2026-01-08	da_nop
7577	173	75	2026-01-08	da_nop
7578	173	76	2026-01-08	da_nop
7579	173	77	2026-01-08	da_nop
7580	173	78	2026-01-08	da_nop
7581	173	79	2026-01-08	tre_han
7582	173	80	2026-01-08	da_nop
7583	173	81	2026-01-08	da_nop
7584	173	82	2026-01-08	da_nop
7585	173	83	2026-01-08	da_nop
7586	173	84	2026-01-08	da_nop
7587	173	85	2026-01-08	da_nop
7588	173	86	2026-01-08	da_nop
7589	173	87	2026-01-08	da_nop
7590	173	88	2026-01-08	da_nop
7591	173	89	2026-01-08	da_nop
7592	173	90	2026-01-08	da_nop
7593	173	91	2026-01-08	da_nop
7594	173	92	2026-01-08	da_nop
7595	173	93	2026-01-08	da_nop
7596	173	94	2026-01-08	da_nop
7597	173	95	2026-01-08	da_nop
7598	173	96	2026-01-08	tre_han
7599	173	97	2026-01-08	tre_han
7600	173	98	2026-01-08	da_nop
7601	173	99	2026-01-08	da_nop
7602	173	100	2026-01-08	da_nop
7603	173	101	2026-01-08	da_nop
7604	173	102	2026-01-08	da_nop
7605	173	103	2026-01-08	da_nop
7606	173	104	2026-01-08	da_nop
7607	173	105	2026-01-08	da_nop
7608	173	106	2026-01-08	da_nop
7609	173	107	2026-01-08	da_nop
7610	173	108	2026-01-08	da_nop
7611	173	109	2026-01-08	da_nop
7612	173	110	2026-01-08	da_nop
7613	174	67	2026-01-08	tre_han
7614	174	68	2026-01-08	da_nop
7615	174	69	2026-01-08	da_nop
7616	174	70	2026-01-08	da_nop
7617	174	71	2026-01-08	da_nop
7618	174	72	2026-01-08	da_nop
7619	174	73	2026-01-08	da_nop
7620	174	74	2026-01-08	da_nop
7621	174	75	2026-01-08	da_nop
7622	174	76	2026-01-08	da_nop
7623	174	77	2026-01-08	da_nop
7624	174	78	2026-01-08	da_nop
7625	174	79	2026-01-08	da_nop
7626	174	80	2026-01-08	da_nop
7627	174	81	2026-01-08	da_nop
7628	174	82	2026-01-08	da_nop
7629	174	83	2026-01-08	da_nop
7630	174	84	2026-01-08	da_nop
7631	174	85	2026-01-08	da_nop
7632	174	86	2026-01-08	da_nop
7633	174	87	2026-01-08	tre_han
7634	174	88	2026-01-08	da_nop
7635	174	89	2026-01-08	da_nop
7636	174	90	2026-01-08	tre_han
7637	174	91	2026-01-08	da_nop
7638	174	92	2026-01-08	da_nop
7639	174	93	2026-01-08	da_nop
7640	174	94	2026-01-08	da_nop
7641	174	95	2026-01-08	da_nop
7642	174	96	2026-01-08	da_nop
7643	174	97	2026-01-08	da_nop
7644	174	98	2026-01-08	tre_han
7645	174	99	2026-01-08	da_nop
7646	174	100	2026-01-08	da_nop
7647	174	101	2026-01-08	tre_han
7648	174	102	2026-01-08	da_nop
7649	174	103	2026-01-08	tre_han
7650	174	104	2026-01-08	da_nop
7651	174	105	2026-01-08	da_nop
7652	174	106	2026-01-08	tre_han
7653	174	107	2026-01-08	da_nop
7654	174	108	2026-01-08	tre_han
7655	174	109	2026-01-08	da_nop
7656	174	110	2026-01-08	da_nop
7657	175	67	2026-01-08	tre_han
7658	175	68	2026-01-08	tre_han
7659	175	69	2026-01-08	da_nop
7660	175	70	2026-01-08	da_nop
7661	175	71	2026-01-08	da_nop
7662	175	72	2026-01-08	da_nop
7663	175	73	2026-01-08	tre_han
7664	175	74	2026-01-08	tre_han
7665	175	75	2026-01-08	da_nop
7666	175	76	2026-01-08	da_nop
7667	175	77	2026-01-08	da_nop
7668	175	78	2026-01-08	tre_han
7669	175	79	2026-01-08	da_nop
7670	175	80	2026-01-08	da_nop
7671	175	81	2026-01-08	da_nop
7672	175	82	2026-01-08	tre_han
7673	175	83	2026-01-08	da_nop
7674	175	84	2026-01-08	tre_han
7675	175	85	2026-01-08	da_nop
7676	175	86	2026-01-08	da_nop
7677	175	87	2026-01-08	da_nop
7678	175	88	2026-01-08	da_nop
7679	175	89	2026-01-08	da_nop
7680	175	90	2026-01-08	da_nop
7681	175	91	2026-01-08	da_nop
7682	175	92	2026-01-08	da_nop
7683	175	93	2026-01-08	da_nop
7684	175	94	2026-01-08	da_nop
7685	175	95	2026-01-08	da_nop
7686	175	96	2026-01-08	da_nop
7687	175	97	2026-01-08	da_nop
7688	175	98	2026-01-08	tre_han
7689	175	99	2026-01-08	tre_han
7690	175	100	2026-01-08	da_nop
7691	175	101	2026-01-08	da_nop
7692	175	102	2026-01-08	da_nop
7693	175	103	2026-01-08	da_nop
7694	175	104	2026-01-08	da_nop
7695	175	105	2026-01-08	da_nop
7696	175	106	2026-01-08	da_nop
7697	175	107	2026-01-08	da_nop
7698	175	108	2026-01-08	da_nop
7699	175	109	2026-01-08	da_nop
7700	175	110	2026-01-08	tre_han
7701	176	67	2026-01-08	da_nop
7702	176	68	2026-01-08	da_nop
7703	176	69	2026-01-08	da_nop
7704	176	70	2026-01-08	da_nop
7705	176	71	2026-01-08	da_nop
7706	176	72	2026-01-08	da_nop
7707	176	73	2026-01-08	da_nop
7708	176	74	2026-01-08	da_nop
7709	176	75	2026-01-08	da_nop
7710	176	76	2026-01-08	da_nop
7711	176	77	2026-01-08	da_nop
7712	176	78	2026-01-08	tre_han
7713	176	79	2026-01-08	da_nop
7714	176	80	2026-01-08	da_nop
7715	176	81	2026-01-08	da_nop
7716	176	82	2026-01-08	da_nop
7717	176	83	2026-01-08	tre_han
7718	176	84	2026-01-08	da_nop
7719	176	85	2026-01-08	tre_han
7720	176	86	2026-01-08	da_nop
7721	176	87	2026-01-08	da_nop
7722	176	88	2026-01-08	da_nop
7723	176	89	2026-01-08	da_nop
7724	176	90	2026-01-08	da_nop
7725	176	91	2026-01-08	da_nop
7726	176	92	2026-01-08	da_nop
7727	176	93	2026-01-08	da_nop
7728	176	94	2026-01-08	da_nop
7729	176	95	2026-01-08	da_nop
7730	176	96	2026-01-08	da_nop
7731	176	97	2026-01-08	tre_han
7732	176	98	2026-01-08	da_nop
7733	176	99	2026-01-08	da_nop
7734	176	100	2026-01-08	da_nop
7735	176	101	2026-01-08	da_nop
7736	176	102	2026-01-08	tre_han
7737	176	103	2026-01-08	da_nop
7738	176	104	2026-01-08	da_nop
7739	176	105	2026-01-08	tre_han
7740	176	106	2026-01-08	da_nop
7741	176	107	2026-01-08	da_nop
7742	176	108	2026-01-08	da_nop
7743	176	109	2026-01-08	da_nop
7744	176	110	2026-01-08	da_nop
7745	177	67	2026-01-08	da_nop
7746	177	68	2026-01-08	tre_han
7747	177	69	2026-01-08	da_nop
7748	177	70	2026-01-08	tre_han
7749	177	71	2026-01-08	da_nop
7750	177	72	2026-01-08	da_nop
7751	177	73	2026-01-08	da_nop
7752	177	74	2026-01-08	da_nop
7753	177	75	2026-01-08	da_nop
7754	177	76	2026-01-08	da_nop
7755	177	77	2026-01-08	da_nop
7756	177	78	2026-01-08	da_nop
7757	177	79	2026-01-08	tre_han
7758	177	80	2026-01-08	da_nop
7759	177	81	2026-01-08	tre_han
7760	177	82	2026-01-08	da_nop
7761	177	83	2026-01-08	da_nop
7762	177	84	2026-01-08	da_nop
7763	177	85	2026-01-08	da_nop
7764	177	86	2026-01-08	da_nop
7765	177	87	2026-01-08	tre_han
7766	177	88	2026-01-08	tre_han
7767	177	89	2026-01-08	da_nop
7768	177	90	2026-01-08	tre_han
7769	177	91	2026-01-08	da_nop
7770	177	92	2026-01-08	da_nop
7771	177	93	2026-01-08	da_nop
7772	177	94	2026-01-08	da_nop
7773	177	95	2026-01-08	tre_han
7774	177	96	2026-01-08	tre_han
7775	177	97	2026-01-08	da_nop
7776	177	98	2026-01-08	da_nop
7777	177	99	2026-01-08	da_nop
7778	177	100	2026-01-08	da_nop
7779	177	101	2026-01-08	da_nop
7780	177	102	2026-01-08	da_nop
7781	177	103	2026-01-08	da_nop
7782	177	104	2026-01-08	da_nop
7783	177	105	2026-01-08	da_nop
7784	177	106	2026-01-08	da_nop
7785	177	107	2026-01-08	da_nop
7786	177	108	2026-01-08	da_nop
7787	177	109	2026-01-08	tre_han
7788	177	110	2026-01-08	da_nop
7789	178	67	2026-01-08	da_nop
7790	178	68	2026-01-08	da_nop
7791	178	69	2026-01-08	da_nop
7792	178	70	2026-01-08	da_nop
7793	178	71	2026-01-08	da_nop
7794	178	72	2026-01-08	da_nop
7795	178	73	2026-01-08	da_nop
7796	178	74	2026-01-08	tre_han
7797	178	75	2026-01-08	da_nop
7798	178	76	2026-01-08	da_nop
7799	178	77	2026-01-08	da_nop
7800	178	78	2026-01-08	da_nop
7801	178	79	2026-01-08	da_nop
7802	178	80	2026-01-08	da_nop
7803	178	81	2026-01-08	da_nop
7804	178	82	2026-01-08	da_nop
7805	178	83	2026-01-08	da_nop
7806	178	84	2026-01-08	da_nop
7807	178	85	2026-01-08	da_nop
7808	178	86	2026-01-08	da_nop
7809	178	87	2026-01-08	da_nop
7810	178	88	2026-01-08	da_nop
7811	178	89	2026-01-08	da_nop
7812	178	90	2026-01-08	da_nop
7813	178	91	2026-01-08	da_nop
7814	178	92	2026-01-08	da_nop
7815	178	93	2026-01-08	da_nop
7816	178	94	2026-01-08	da_nop
7817	178	95	2026-01-08	da_nop
7818	178	96	2026-01-08	da_nop
7819	178	97	2026-01-08	da_nop
7820	178	98	2026-01-08	da_nop
7821	178	99	2026-01-08	da_nop
7822	178	100	2026-01-08	da_nop
7823	178	101	2026-01-08	da_nop
7824	178	102	2026-01-08	da_nop
7825	178	103	2026-01-08	da_nop
7826	178	104	2026-01-08	da_nop
7827	178	105	2026-01-08	da_nop
7828	178	106	2026-01-08	da_nop
7829	178	107	2026-01-08	da_nop
7830	178	108	2026-01-08	da_nop
7831	178	109	2026-01-08	da_nop
7832	178	110	2026-01-08	da_nop
7833	179	67	2026-01-08	da_nop
7834	179	68	2026-01-08	da_nop
7835	179	69	2026-01-08	da_nop
7836	179	70	2026-01-08	da_nop
7837	179	71	2026-01-08	da_nop
7838	179	72	2026-01-08	da_nop
7839	179	73	2026-01-08	da_nop
7840	179	74	2026-01-08	da_nop
7841	179	75	2026-01-08	tre_han
7842	179	76	2026-01-08	da_nop
7843	179	77	2026-01-08	tre_han
7844	179	78	2026-01-08	tre_han
7845	179	79	2026-01-08	da_nop
7846	179	80	2026-01-08	tre_han
7847	179	81	2026-01-08	da_nop
7848	179	82	2026-01-08	da_nop
7849	179	83	2026-01-08	tre_han
7850	179	84	2026-01-08	da_nop
7851	179	85	2026-01-08	da_nop
7852	179	86	2026-01-08	da_nop
7853	179	87	2026-01-08	da_nop
7854	179	88	2026-01-08	da_nop
7855	179	89	2026-01-08	da_nop
7856	179	90	2026-01-08	da_nop
7857	179	91	2026-01-08	da_nop
7858	179	92	2026-01-08	da_nop
7859	179	93	2026-01-08	da_nop
7860	179	94	2026-01-08	da_nop
7861	179	95	2026-01-08	da_nop
7862	179	96	2026-01-08	da_nop
7863	179	97	2026-01-08	da_nop
7864	179	98	2026-01-08	da_nop
7865	179	99	2026-01-08	da_nop
7866	179	100	2026-01-08	da_nop
7867	179	101	2026-01-08	da_nop
7868	179	102	2026-01-08	da_nop
7869	179	103	2026-01-08	da_nop
7870	179	104	2026-01-08	da_nop
7871	179	105	2026-01-08	da_nop
7872	179	106	2026-01-08	tre_han
7873	179	107	2026-01-08	da_nop
7874	179	108	2026-01-08	tre_han
7875	179	109	2026-01-08	da_nop
7876	179	110	2026-01-08	da_nop
7877	180	67	2026-01-08	tre_han
7878	180	68	2026-01-08	da_nop
7879	180	69	2026-01-08	da_nop
7880	180	70	2026-01-08	da_nop
7881	180	71	2026-01-08	tre_han
7882	180	72	2026-01-08	da_nop
7883	180	73	2026-01-08	da_nop
7884	180	74	2026-01-08	da_nop
7885	180	75	2026-01-08	da_nop
7886	180	76	2026-01-08	da_nop
7887	180	77	2026-01-08	tre_han
7888	180	78	2026-01-08	da_nop
7889	180	79	2026-01-08	da_nop
7890	180	80	2026-01-08	da_nop
7891	180	81	2026-01-08	tre_han
7892	180	82	2026-01-08	tre_han
7893	180	83	2026-01-08	tre_han
7894	180	84	2026-01-08	da_nop
7895	180	85	2026-01-08	da_nop
7896	180	86	2026-01-08	da_nop
7897	180	87	2026-01-08	da_nop
7898	180	88	2026-01-08	da_nop
7899	180	89	2026-01-08	da_nop
7900	180	90	2026-01-08	da_nop
7901	180	91	2026-01-08	da_nop
7902	180	92	2026-01-08	da_nop
7903	180	93	2026-01-08	da_nop
7904	180	94	2026-01-08	da_nop
7905	180	95	2026-01-08	da_nop
7906	180	96	2026-01-08	da_nop
7907	180	97	2026-01-08	da_nop
7908	180	98	2026-01-08	tre_han
7909	180	99	2026-01-08	tre_han
7910	180	100	2026-01-08	da_nop
7911	180	101	2026-01-08	da_nop
7912	180	102	2026-01-08	da_nop
7913	180	103	2026-01-08	da_nop
7914	180	104	2026-01-08	da_nop
7915	180	105	2026-01-08	da_nop
7916	180	106	2026-01-08	da_nop
7917	180	107	2026-01-08	da_nop
7918	180	108	2026-01-08	da_nop
7919	180	109	2026-01-08	da_nop
7920	180	110	2026-01-08	tre_han
7921	181	67	2026-01-08	da_nop
7922	181	68	2026-01-08	da_nop
7923	181	69	2026-01-08	da_nop
7924	181	70	2026-01-08	da_nop
7925	181	71	2026-01-08	tre_han
7926	181	72	2026-01-08	da_nop
7927	181	73	2026-01-08	da_nop
7928	181	74	2026-01-08	da_nop
7929	181	75	2026-01-08	da_nop
7930	181	76	2026-01-08	da_nop
7931	181	77	2026-01-08	da_nop
7932	181	78	2026-01-08	da_nop
7933	181	79	2026-01-08	da_nop
7934	181	80	2026-01-08	da_nop
7935	181	81	2026-01-08	da_nop
7936	181	82	2026-01-08	da_nop
7937	181	83	2026-01-08	da_nop
7938	181	84	2026-01-08	da_nop
7939	181	85	2026-01-08	da_nop
7940	181	86	2026-01-08	tre_han
7941	181	87	2026-01-08	da_nop
7942	181	88	2026-01-08	da_nop
7943	181	89	2026-01-08	da_nop
7944	181	90	2026-01-08	da_nop
7945	181	91	2026-01-08	da_nop
7946	181	92	2026-01-08	tre_han
7947	181	93	2026-01-08	da_nop
7948	181	94	2026-01-08	da_nop
7949	181	95	2026-01-08	da_nop
7950	181	96	2026-01-08	da_nop
7951	181	97	2026-01-08	tre_han
7952	181	98	2026-01-08	da_nop
7953	181	99	2026-01-08	da_nop
7954	181	100	2026-01-08	tre_han
7955	181	101	2026-01-08	da_nop
7956	181	102	2026-01-08	da_nop
7957	181	103	2026-01-08	da_nop
7958	181	104	2026-01-08	da_nop
7959	181	105	2026-01-08	da_nop
7960	181	106	2026-01-08	da_nop
7961	181	107	2026-01-08	tre_han
7962	181	108	2026-01-08	da_nop
7963	181	109	2026-01-08	da_nop
7964	181	110	2026-01-08	da_nop
7965	182	67	2026-01-08	da_nop
7966	182	68	2026-01-08	da_nop
7967	182	69	2026-01-08	da_nop
7968	182	70	2026-01-08	da_nop
7969	182	71	2026-01-08	da_nop
7970	182	72	2026-01-08	da_nop
7971	182	73	2026-01-08	da_nop
7972	182	74	2026-01-08	da_nop
7973	182	75	2026-01-08	da_nop
7974	182	76	2026-01-08	da_nop
7975	182	77	2026-01-08	da_nop
7976	182	78	2026-01-08	da_nop
7977	182	79	2026-01-08	da_nop
7978	182	80	2026-01-08	da_nop
7979	182	81	2026-01-08	tre_han
7980	182	82	2026-01-08	da_nop
7981	182	83	2026-01-08	da_nop
7982	182	84	2026-01-08	da_nop
7983	182	85	2026-01-08	da_nop
7984	182	86	2026-01-08	da_nop
7985	182	87	2026-01-08	tre_han
7986	182	88	2026-01-08	tre_han
7987	182	89	2026-01-08	da_nop
7988	182	90	2026-01-08	da_nop
7989	182	91	2026-01-08	da_nop
7990	182	92	2026-01-08	da_nop
7991	182	93	2026-01-08	da_nop
7992	182	94	2026-01-08	tre_han
7993	182	95	2026-01-08	da_nop
7994	182	96	2026-01-08	da_nop
7995	182	97	2026-01-08	da_nop
7996	182	98	2026-01-08	tre_han
7997	182	99	2026-01-08	da_nop
7998	182	100	2026-01-08	da_nop
7999	182	101	2026-01-08	da_nop
8000	182	102	2026-01-08	da_nop
8001	182	103	2026-01-08	da_nop
8002	182	104	2026-01-08	da_nop
8003	182	105	2026-01-08	da_nop
8004	182	106	2026-01-08	da_nop
8005	182	107	2026-01-08	da_nop
8006	182	108	2026-01-08	da_nop
8007	182	109	2026-01-08	tre_han
8008	182	110	2026-01-08	da_nop
8009	183	67	2026-01-08	da_nop
8010	183	68	2026-01-08	tre_han
8011	183	69	2026-01-08	da_nop
8012	183	70	2026-01-08	tre_han
8013	183	71	2026-01-08	da_nop
8014	183	72	2026-01-08	da_nop
8015	183	73	2026-01-08	da_nop
8016	183	74	2026-01-08	tre_han
8017	183	75	2026-01-08	da_nop
8018	183	76	2026-01-08	da_nop
8019	183	77	2026-01-08	da_nop
8020	183	78	2026-01-08	da_nop
8021	183	79	2026-01-08	da_nop
8022	183	80	2026-01-08	tre_han
8023	183	81	2026-01-08	da_nop
8024	183	82	2026-01-08	da_nop
8025	183	83	2026-01-08	tre_han
8026	183	84	2026-01-08	tre_han
8027	183	85	2026-01-08	da_nop
8028	183	86	2026-01-08	da_nop
8029	183	87	2026-01-08	da_nop
8030	183	88	2026-01-08	da_nop
8031	183	89	2026-01-08	tre_han
8032	183	90	2026-01-08	tre_han
8033	183	91	2026-01-08	da_nop
8034	183	92	2026-01-08	tre_han
8035	183	93	2026-01-08	da_nop
8036	183	94	2026-01-08	da_nop
8037	183	95	2026-01-08	da_nop
8038	183	96	2026-01-08	da_nop
8039	183	97	2026-01-08	da_nop
8040	183	98	2026-01-08	da_nop
8041	183	99	2026-01-08	da_nop
8042	183	100	2026-01-08	da_nop
8043	183	101	2026-01-08	tre_han
8044	183	102	2026-01-08	da_nop
8045	183	103	2026-01-08	tre_han
8046	183	104	2026-01-08	da_nop
8047	183	105	2026-01-08	tre_han
8048	183	106	2026-01-08	da_nop
8049	183	107	2026-01-08	da_nop
8050	183	108	2026-01-08	da_nop
8051	183	109	2026-01-08	da_nop
8052	183	110	2026-01-08	da_nop
8053	184	67	2026-01-08	da_nop
8054	184	68	2026-01-08	da_nop
8055	184	69	2026-01-08	da_nop
8056	184	70	2026-01-08	da_nop
8057	184	71	2026-01-08	da_nop
8058	184	72	2026-01-08	da_nop
8059	184	73	2026-01-08	da_nop
8060	184	74	2026-01-08	da_nop
8061	184	75	2026-01-08	tre_han
8062	184	76	2026-01-08	tre_han
8063	184	77	2026-01-08	tre_han
8064	184	78	2026-01-08	da_nop
8065	184	79	2026-01-08	tre_han
8066	184	80	2026-01-08	da_nop
8067	184	81	2026-01-08	da_nop
8068	184	82	2026-01-08	da_nop
8069	184	83	2026-01-08	da_nop
8070	184	84	2026-01-08	da_nop
8071	184	85	2026-01-08	da_nop
8072	184	86	2026-01-08	tre_han
8073	184	87	2026-01-08	da_nop
8074	184	88	2026-01-08	da_nop
8075	184	89	2026-01-08	tre_han
8076	184	90	2026-01-08	da_nop
8077	184	91	2026-01-08	tre_han
8078	184	92	2026-01-08	da_nop
8079	184	93	2026-01-08	da_nop
8080	184	94	2026-01-08	da_nop
8081	184	95	2026-01-08	da_nop
8082	184	96	2026-01-08	da_nop
8083	184	97	2026-01-08	da_nop
8084	184	98	2026-01-08	tre_han
8085	184	99	2026-01-08	tre_han
8086	184	100	2026-01-08	da_nop
8087	184	101	2026-01-08	da_nop
8088	184	102	2026-01-08	da_nop
8089	184	103	2026-01-08	tre_han
8090	184	104	2026-01-08	tre_han
8091	184	105	2026-01-08	da_nop
8092	184	106	2026-01-08	da_nop
8093	184	107	2026-01-08	da_nop
8094	184	108	2026-01-08	da_nop
8095	184	109	2026-01-08	da_nop
8096	184	110	2026-01-08	da_nop
8097	185	67	2026-01-08	da_nop
8098	185	68	2026-01-08	da_nop
8099	185	69	2026-01-08	da_nop
8100	185	70	2026-01-08	da_nop
8101	185	71	2026-01-08	tre_han
8102	185	72	2026-01-08	da_nop
8103	185	73	2026-01-08	da_nop
8104	185	74	2026-01-08	da_nop
8105	185	75	2026-01-08	da_nop
8106	185	76	2026-01-08	da_nop
8107	185	77	2026-01-08	da_nop
8108	185	78	2026-01-08	da_nop
8109	185	79	2026-01-08	da_nop
8110	185	80	2026-01-08	da_nop
8111	185	81	2026-01-08	da_nop
8112	185	82	2026-01-08	da_nop
8113	185	83	2026-01-08	da_nop
8114	185	84	2026-01-08	da_nop
8115	185	85	2026-01-08	da_nop
8116	185	86	2026-01-08	tre_han
8117	185	87	2026-01-08	da_nop
8118	185	88	2026-01-08	da_nop
8119	185	89	2026-01-08	da_nop
8120	185	90	2026-01-08	da_nop
8121	185	91	2026-01-08	da_nop
8122	185	92	2026-01-08	da_nop
8123	185	93	2026-01-08	da_nop
8124	185	94	2026-01-08	da_nop
8125	185	95	2026-01-08	da_nop
8126	185	96	2026-01-08	da_nop
8127	185	97	2026-01-08	da_nop
8128	185	98	2026-01-08	da_nop
8129	185	99	2026-01-08	tre_han
8130	185	100	2026-01-08	da_nop
8131	185	101	2026-01-08	da_nop
8132	185	102	2026-01-08	da_nop
8133	185	103	2026-01-08	da_nop
8134	185	104	2026-01-08	da_nop
8135	185	105	2026-01-08	da_nop
8136	185	106	2026-01-08	da_nop
8137	185	107	2026-01-08	da_nop
8138	185	108	2026-01-08	da_nop
8139	185	109	2026-01-08	da_nop
8140	185	110	2026-01-08	da_nop
8141	186	67	2026-01-08	da_nop
8142	186	68	2026-01-08	da_nop
8143	186	69	2026-01-08	da_nop
8144	186	70	2026-01-08	da_nop
8145	186	71	2026-01-08	da_nop
8146	186	72	2026-01-08	da_nop
8147	186	73	2026-01-08	da_nop
8148	186	74	2026-01-08	da_nop
8149	186	75	2026-01-08	da_nop
8150	186	76	2026-01-08	da_nop
8151	186	77	2026-01-08	da_nop
8152	186	78	2026-01-08	da_nop
8153	186	79	2026-01-08	da_nop
8154	186	80	2026-01-08	tre_han
8155	186	81	2026-01-08	da_nop
8156	186	82	2026-01-08	da_nop
8157	186	83	2026-01-08	tre_han
8158	186	84	2026-01-08	da_nop
8159	186	85	2026-01-08	da_nop
8160	186	86	2026-01-08	da_nop
8161	186	87	2026-01-08	da_nop
8162	186	88	2026-01-08	da_nop
8163	186	89	2026-01-08	da_nop
8164	186	90	2026-01-08	da_nop
8165	186	91	2026-01-08	da_nop
8166	186	92	2026-01-08	da_nop
8167	186	93	2026-01-08	da_nop
8168	186	94	2026-01-08	da_nop
8169	186	95	2026-01-08	da_nop
8170	186	96	2026-01-08	da_nop
8171	186	97	2026-01-08	tre_han
8172	186	98	2026-01-08	da_nop
8173	186	99	2026-01-08	tre_han
8174	186	100	2026-01-08	da_nop
8175	186	101	2026-01-08	da_nop
8176	186	102	2026-01-08	da_nop
8177	186	103	2026-01-08	da_nop
8178	186	104	2026-01-08	da_nop
8179	186	105	2026-01-08	da_nop
8180	186	106	2026-01-08	da_nop
8181	186	107	2026-01-08	da_nop
8182	186	108	2026-01-08	da_nop
8183	186	109	2026-01-08	da_nop
8184	186	110	2026-01-08	tre_han
8185	187	67	2026-01-08	da_nop
8186	187	68	2026-01-08	da_nop
8187	187	69	2026-01-08	tre_han
8188	187	70	2026-01-08	da_nop
8189	187	71	2026-01-08	da_nop
8190	187	72	2026-01-08	da_nop
8191	187	73	2026-01-08	da_nop
8192	187	74	2026-01-08	tre_han
8193	187	75	2026-01-08	da_nop
8194	187	76	2026-01-08	da_nop
8195	187	77	2026-01-08	da_nop
8196	187	78	2026-01-08	tre_han
8197	187	79	2026-01-08	da_nop
8198	187	80	2026-01-08	da_nop
8199	187	81	2026-01-08	tre_han
8200	187	82	2026-01-08	da_nop
8201	187	83	2026-01-08	da_nop
8202	187	84	2026-01-08	da_nop
8203	187	85	2026-01-08	da_nop
8204	187	86	2026-01-08	da_nop
8205	187	87	2026-01-08	da_nop
8206	187	88	2026-01-08	da_nop
8207	187	89	2026-01-08	da_nop
8208	187	90	2026-01-08	tre_han
8209	187	91	2026-01-08	tre_han
8210	187	92	2026-01-08	da_nop
8211	187	93	2026-01-08	da_nop
8212	187	94	2026-01-08	da_nop
8213	187	95	2026-01-08	da_nop
8214	187	96	2026-01-08	da_nop
8215	187	97	2026-01-08	tre_han
8216	187	98	2026-01-08	da_nop
8217	187	99	2026-01-08	da_nop
8218	187	100	2026-01-08	da_nop
8219	187	101	2026-01-08	da_nop
8220	187	102	2026-01-08	da_nop
8221	187	103	2026-01-08	da_nop
8222	187	104	2026-01-08	da_nop
8223	187	105	2026-01-08	da_nop
8224	187	106	2026-01-08	da_nop
8225	187	107	2026-01-08	tre_han
8226	187	108	2026-01-08	da_nop
8227	187	109	2026-01-08	da_nop
8228	187	110	2026-01-08	tre_han
8229	188	67	2026-01-08	da_nop
8230	188	68	2026-01-08	da_nop
8231	188	69	2026-01-08	da_nop
8232	188	70	2026-01-08	da_nop
8233	188	71	2026-01-08	da_nop
8234	188	72	2026-01-08	da_nop
8235	188	73	2026-01-08	tre_han
8236	188	74	2026-01-08	da_nop
8237	188	75	2026-01-08	tre_han
8238	188	76	2026-01-08	da_nop
8239	188	77	2026-01-08	da_nop
8240	188	78	2026-01-08	da_nop
8241	188	79	2026-01-08	tre_han
8242	188	80	2026-01-08	da_nop
8243	188	81	2026-01-08	da_nop
8244	188	82	2026-01-08	tre_han
8245	188	83	2026-01-08	da_nop
8246	188	84	2026-01-08	da_nop
8247	188	85	2026-01-08	da_nop
8248	188	86	2026-01-08	da_nop
8249	188	87	2026-01-08	da_nop
8250	188	88	2026-01-08	tre_han
8251	188	89	2026-01-08	da_nop
8252	188	90	2026-01-08	da_nop
8253	188	91	2026-01-08	da_nop
8254	188	92	2026-01-08	da_nop
8255	188	93	2026-01-08	da_nop
8256	188	94	2026-01-08	da_nop
8257	188	95	2026-01-08	tre_han
8258	188	96	2026-01-08	da_nop
8259	188	97	2026-01-08	da_nop
8260	188	98	2026-01-08	tre_han
8261	188	99	2026-01-08	da_nop
8262	188	100	2026-01-08	tre_han
8263	188	101	2026-01-08	tre_han
8264	188	102	2026-01-08	tre_han
8265	188	103	2026-01-08	da_nop
8266	188	104	2026-01-08	da_nop
8267	188	105	2026-01-08	tre_han
8268	188	106	2026-01-08	da_nop
8269	188	107	2026-01-08	da_nop
8270	188	108	2026-01-08	da_nop
8271	188	109	2026-01-08	da_nop
8272	188	110	2026-01-08	tre_han
8273	189	67	2026-01-08	tre_han
8274	189	68	2026-01-08	da_nop
8275	189	69	2026-01-08	da_nop
8276	189	70	2026-01-08	da_nop
8277	189	71	2026-01-08	tre_han
8278	189	72	2026-01-08	da_nop
8279	189	73	2026-01-08	da_nop
8280	189	74	2026-01-08	da_nop
8281	189	75	2026-01-08	tre_han
8282	189	76	2026-01-08	da_nop
8283	189	77	2026-01-08	da_nop
8284	189	78	2026-01-08	tre_han
8285	189	79	2026-01-08	da_nop
8286	189	80	2026-01-08	da_nop
8287	189	81	2026-01-08	da_nop
8288	189	82	2026-01-08	tre_han
8289	189	83	2026-01-08	da_nop
8290	189	84	2026-01-08	tre_han
8291	189	85	2026-01-08	da_nop
8292	189	86	2026-01-08	da_nop
8293	189	87	2026-01-08	tre_han
8294	189	88	2026-01-08	tre_han
8295	189	89	2026-01-08	da_nop
8296	189	90	2026-01-08	da_nop
8297	189	91	2026-01-08	da_nop
8298	189	92	2026-01-08	da_nop
8299	189	93	2026-01-08	da_nop
8300	189	94	2026-01-08	da_nop
8301	189	95	2026-01-08	tre_han
8302	189	96	2026-01-08	da_nop
8303	189	97	2026-01-08	da_nop
8304	189	98	2026-01-08	da_nop
8305	189	99	2026-01-08	da_nop
8306	189	100	2026-01-08	da_nop
8307	189	101	2026-01-08	da_nop
8308	189	102	2026-01-08	da_nop
8309	189	103	2026-01-08	tre_han
8310	189	104	2026-01-08	da_nop
8311	189	105	2026-01-08	da_nop
8312	189	106	2026-01-08	da_nop
8313	189	107	2026-01-08	da_nop
8314	189	108	2026-01-08	da_nop
8315	189	109	2026-01-08	da_nop
8316	189	110	2026-01-08	da_nop
8317	190	67	2026-01-08	da_nop
8318	190	68	2026-01-08	da_nop
8319	190	69	2026-01-08	da_nop
8320	190	70	2026-01-08	da_nop
8321	190	71	2026-01-08	da_nop
8322	190	72	2026-01-08	da_nop
8323	190	73	2026-01-08	da_nop
8324	190	74	2026-01-08	da_nop
8325	190	75	2026-01-08	da_nop
8326	190	76	2026-01-08	da_nop
8327	190	77	2026-01-08	da_nop
8328	190	78	2026-01-08	tre_han
8329	190	79	2026-01-08	da_nop
8330	190	80	2026-01-08	da_nop
8331	190	81	2026-01-08	da_nop
8332	190	82	2026-01-08	da_nop
8333	190	83	2026-01-08	da_nop
8334	190	84	2026-01-08	da_nop
8335	190	85	2026-01-08	da_nop
8336	190	86	2026-01-08	da_nop
8337	190	87	2026-01-08	tre_han
8338	190	88	2026-01-08	da_nop
8339	190	89	2026-01-08	da_nop
8340	190	90	2026-01-08	da_nop
8341	190	91	2026-01-08	da_nop
8342	190	92	2026-01-08	da_nop
8343	190	93	2026-01-08	da_nop
8344	190	94	2026-01-08	da_nop
8345	190	95	2026-01-08	da_nop
8346	190	96	2026-01-08	tre_han
8347	190	97	2026-01-08	da_nop
8348	190	98	2026-01-08	da_nop
8349	190	99	2026-01-08	da_nop
8350	190	100	2026-01-08	da_nop
8351	190	101	2026-01-08	da_nop
8352	190	102	2026-01-08	da_nop
8353	190	103	2026-01-08	da_nop
8354	190	104	2026-01-08	da_nop
8355	190	105	2026-01-08	tre_han
8356	190	106	2026-01-08	da_nop
8357	190	107	2026-01-08	da_nop
8358	190	108	2026-01-08	da_nop
8359	190	109	2026-01-08	tre_han
8360	190	110	2026-01-08	tre_han
8361	191	67	2026-01-08	da_nop
8362	191	68	2026-01-08	da_nop
8363	191	69	2026-01-08	da_nop
8364	191	70	2026-01-08	da_nop
8365	191	71	2026-01-08	da_nop
8366	191	72	2026-01-08	da_nop
8367	191	73	2026-01-08	tre_han
8368	191	74	2026-01-08	da_nop
8369	191	75	2026-01-08	da_nop
8370	191	76	2026-01-08	da_nop
8371	191	77	2026-01-08	da_nop
8372	191	78	2026-01-08	da_nop
8373	191	79	2026-01-08	da_nop
8374	191	80	2026-01-08	da_nop
8375	191	81	2026-01-08	tre_han
8376	191	82	2026-01-08	da_nop
8377	191	83	2026-01-08	da_nop
8378	191	84	2026-01-08	da_nop
8379	191	85	2026-01-08	da_nop
8380	191	86	2026-01-08	da_nop
8381	191	87	2026-01-08	tre_han
8382	191	88	2026-01-08	tre_han
8383	191	89	2026-01-08	da_nop
8384	191	90	2026-01-08	da_nop
8385	191	91	2026-01-08	da_nop
8386	191	92	2026-01-08	da_nop
8387	191	93	2026-01-08	da_nop
8388	191	94	2026-01-08	da_nop
8389	191	95	2026-01-08	da_nop
8390	191	96	2026-01-08	da_nop
8391	191	97	2026-01-08	da_nop
8392	191	98	2026-01-08	da_nop
8393	191	99	2026-01-08	tre_han
8394	191	100	2026-01-08	da_nop
8395	191	101	2026-01-08	tre_han
8396	191	102	2026-01-08	da_nop
8397	191	103	2026-01-08	da_nop
8398	191	104	2026-01-08	da_nop
8399	191	105	2026-01-08	da_nop
8400	191	106	2026-01-08	da_nop
8401	191	107	2026-01-08	da_nop
8402	191	108	2026-01-08	da_nop
8403	191	109	2026-01-08	tre_han
8404	191	110	2026-01-08	da_nop
8405	192	67	2026-01-08	tre_han
8406	192	68	2026-01-08	da_nop
8407	192	69	2026-01-08	da_nop
8408	192	70	2026-01-08	da_nop
8409	192	71	2026-01-08	da_nop
8410	192	72	2026-01-08	da_nop
8411	192	73	2026-01-08	tre_han
8412	192	74	2026-01-08	da_nop
8413	192	75	2026-01-08	da_nop
8414	192	76	2026-01-08	da_nop
8415	192	77	2026-01-08	da_nop
8416	192	78	2026-01-08	da_nop
8417	192	79	2026-01-08	da_nop
8418	192	80	2026-01-08	da_nop
8419	192	81	2026-01-08	tre_han
8420	192	82	2026-01-08	tre_han
8421	192	83	2026-01-08	da_nop
8422	192	84	2026-01-08	da_nop
8423	192	85	2026-01-08	da_nop
8424	192	86	2026-01-08	da_nop
8425	192	87	2026-01-08	da_nop
8426	192	88	2026-01-08	tre_han
8427	192	89	2026-01-08	da_nop
8428	192	90	2026-01-08	da_nop
8429	192	91	2026-01-08	da_nop
8430	192	92	2026-01-08	da_nop
8431	192	93	2026-01-08	da_nop
8432	192	94	2026-01-08	da_nop
8433	192	95	2026-01-08	tre_han
8434	192	96	2026-01-08	tre_han
8435	192	97	2026-01-08	da_nop
8436	192	98	2026-01-08	da_nop
8437	192	99	2026-01-08	da_nop
8438	192	100	2026-01-08	da_nop
8439	192	101	2026-01-08	da_nop
8440	192	102	2026-01-08	da_nop
8441	192	103	2026-01-08	da_nop
8442	192	104	2026-01-08	da_nop
8443	192	105	2026-01-08	da_nop
8444	192	106	2026-01-08	da_nop
8445	192	107	2026-01-08	da_nop
8446	192	108	2026-01-08	tre_han
8447	192	109	2026-01-08	da_nop
8448	192	110	2026-01-08	tre_han
8449	193	67	2026-01-08	da_nop
8450	193	68	2026-01-08	da_nop
8451	193	69	2026-01-08	da_nop
8452	193	70	2026-01-08	da_nop
8453	193	71	2026-01-08	tre_han
8454	193	72	2026-01-08	da_nop
8455	193	73	2026-01-08	da_nop
8456	193	74	2026-01-08	da_nop
8457	193	75	2026-01-08	da_nop
8458	193	76	2026-01-08	da_nop
8459	193	77	2026-01-08	da_nop
8460	193	78	2026-01-08	da_nop
8461	193	79	2026-01-08	da_nop
8462	193	80	2026-01-08	da_nop
8463	193	81	2026-01-08	tre_han
8464	193	82	2026-01-08	da_nop
8465	193	83	2026-01-08	da_nop
8466	193	84	2026-01-08	tre_han
8467	193	85	2026-01-08	da_nop
8468	193	86	2026-01-08	da_nop
8469	193	87	2026-01-08	da_nop
8470	193	88	2026-01-08	da_nop
8471	193	89	2026-01-08	da_nop
8472	193	90	2026-01-08	tre_han
8473	193	91	2026-01-08	da_nop
8474	193	92	2026-01-08	da_nop
8475	193	93	2026-01-08	da_nop
8476	193	94	2026-01-08	da_nop
8477	193	95	2026-01-08	da_nop
8478	193	96	2026-01-08	da_nop
8479	193	97	2026-01-08	da_nop
8480	193	98	2026-01-08	da_nop
8481	193	99	2026-01-08	da_nop
8482	193	100	2026-01-08	da_nop
8483	193	101	2026-01-08	tre_han
8484	193	102	2026-01-08	da_nop
8485	193	103	2026-01-08	da_nop
8486	193	104	2026-01-08	da_nop
8487	193	105	2026-01-08	da_nop
8488	193	106	2026-01-08	da_nop
8489	193	107	2026-01-08	da_nop
8490	193	108	2026-01-08	da_nop
8491	193	109	2026-01-08	da_nop
8492	193	110	2026-01-08	da_nop
8493	194	67	2026-01-08	da_nop
8494	194	68	2026-01-08	da_nop
8495	194	69	2026-01-08	da_nop
8496	194	70	2026-01-08	da_nop
8497	194	71	2026-01-08	tre_han
8498	194	72	2026-01-08	tre_han
8499	194	73	2026-01-08	da_nop
8500	194	74	2026-01-08	da_nop
8501	194	75	2026-01-08	da_nop
8502	194	76	2026-01-08	da_nop
8503	194	77	2026-01-08	da_nop
8504	194	78	2026-01-08	da_nop
8505	194	79	2026-01-08	da_nop
8506	194	80	2026-01-08	da_nop
8507	194	81	2026-01-08	da_nop
8508	194	82	2026-01-08	da_nop
8509	194	83	2026-01-08	da_nop
8510	194	84	2026-01-08	tre_han
8511	194	85	2026-01-08	da_nop
8512	194	86	2026-01-08	da_nop
8513	194	87	2026-01-08	tre_han
8514	194	88	2026-01-08	da_nop
8515	194	89	2026-01-08	da_nop
8516	194	90	2026-01-08	tre_han
8517	194	91	2026-01-08	tre_han
8518	194	92	2026-01-08	da_nop
8519	194	93	2026-01-08	da_nop
8520	194	94	2026-01-08	da_nop
8521	194	95	2026-01-08	tre_han
8522	194	96	2026-01-08	da_nop
8523	194	97	2026-01-08	da_nop
8524	194	98	2026-01-08	da_nop
8525	194	99	2026-01-08	da_nop
8526	194	100	2026-01-08	tre_han
8527	194	101	2026-01-08	da_nop
8528	194	102	2026-01-08	tre_han
8529	194	103	2026-01-08	da_nop
8530	194	104	2026-01-08	da_nop
8531	194	105	2026-01-08	da_nop
8532	194	106	2026-01-08	da_nop
8533	194	107	2026-01-08	da_nop
8534	194	108	2026-01-08	da_nop
8535	194	109	2026-01-08	da_nop
8536	194	110	2026-01-08	da_nop
8537	195	67	2026-01-08	da_nop
8538	195	68	2026-01-08	da_nop
8539	195	69	2026-01-08	da_nop
8540	195	70	2026-01-08	da_nop
8541	195	71	2026-01-08	tre_han
8542	195	72	2026-01-08	da_nop
8543	195	73	2026-01-08	tre_han
8544	195	74	2026-01-08	da_nop
8545	195	75	2026-01-08	da_nop
8546	195	76	2026-01-08	da_nop
8547	195	77	2026-01-08	da_nop
8548	195	78	2026-01-08	da_nop
8549	195	79	2026-01-08	da_nop
8550	195	80	2026-01-08	da_nop
8551	195	81	2026-01-08	da_nop
8552	195	82	2026-01-08	da_nop
8553	195	83	2026-01-08	da_nop
8554	195	84	2026-01-08	da_nop
8555	195	85	2026-01-08	da_nop
8556	195	86	2026-01-08	da_nop
8557	195	87	2026-01-08	da_nop
8558	195	88	2026-01-08	tre_han
8559	195	89	2026-01-08	da_nop
8560	195	90	2026-01-08	da_nop
8561	195	91	2026-01-08	da_nop
8562	195	92	2026-01-08	da_nop
8563	195	93	2026-01-08	tre_han
8564	195	94	2026-01-08	da_nop
8565	195	95	2026-01-08	da_nop
8566	195	96	2026-01-08	da_nop
8567	195	97	2026-01-08	da_nop
8568	195	98	2026-01-08	da_nop
8569	195	99	2026-01-08	tre_han
8570	195	100	2026-01-08	da_nop
8571	195	101	2026-01-08	tre_han
8572	195	102	2026-01-08	tre_han
8573	195	103	2026-01-08	da_nop
8574	195	104	2026-01-08	da_nop
8575	195	105	2026-01-08	da_nop
8576	195	106	2026-01-08	da_nop
8577	195	107	2026-01-08	da_nop
8578	195	108	2026-01-08	da_nop
8579	195	109	2026-01-08	da_nop
8580	195	110	2026-01-08	da_nop
8581	196	67	2026-01-08	da_nop
8582	196	68	2026-01-08	da_nop
8583	196	69	2026-01-08	da_nop
8584	196	70	2026-01-08	tre_han
8585	196	71	2026-01-08	da_nop
8586	196	72	2026-01-08	tre_han
8587	196	73	2026-01-08	da_nop
8588	196	74	2026-01-08	da_nop
8589	196	75	2026-01-08	tre_han
8590	196	76	2026-01-08	da_nop
8591	196	77	2026-01-08	tre_han
8592	196	78	2026-01-08	da_nop
8593	196	79	2026-01-08	da_nop
8594	196	80	2026-01-08	da_nop
8595	196	81	2026-01-08	da_nop
8596	196	82	2026-01-08	da_nop
8597	196	83	2026-01-08	tre_han
8598	196	84	2026-01-08	da_nop
8599	196	85	2026-01-08	da_nop
8600	196	86	2026-01-08	da_nop
8601	196	87	2026-01-08	da_nop
8602	196	88	2026-01-08	da_nop
8603	196	89	2026-01-08	da_nop
8604	196	90	2026-01-08	da_nop
8605	196	91	2026-01-08	da_nop
8606	196	92	2026-01-08	da_nop
8607	196	93	2026-01-08	tre_han
8608	196	94	2026-01-08	tre_han
8609	196	95	2026-01-08	da_nop
8610	196	96	2026-01-08	da_nop
8611	196	97	2026-01-08	da_nop
8612	196	98	2026-01-08	da_nop
8613	196	99	2026-01-08	da_nop
8614	196	100	2026-01-08	da_nop
8615	196	101	2026-01-08	da_nop
8616	196	102	2026-01-08	tre_han
8617	196	103	2026-01-08	da_nop
8618	196	104	2026-01-08	da_nop
8619	196	105	2026-01-08	da_nop
8620	196	106	2026-01-08	tre_han
8621	196	107	2026-01-08	da_nop
8622	196	108	2026-01-08	da_nop
8623	196	109	2026-01-08	da_nop
8624	196	110	2026-01-08	da_nop
8625	197	67	2026-01-08	da_nop
8626	197	68	2026-01-08	tre_han
8627	197	69	2026-01-08	tre_han
8628	197	70	2026-01-08	tre_han
8629	197	71	2026-01-08	da_nop
8630	197	72	2026-01-08	da_nop
8631	197	73	2026-01-08	da_nop
8632	197	74	2026-01-08	da_nop
8633	197	75	2026-01-08	tre_han
8634	197	76	2026-01-08	da_nop
8635	197	77	2026-01-08	da_nop
8636	197	78	2026-01-08	da_nop
8637	197	79	2026-01-08	da_nop
8638	197	80	2026-01-08	da_nop
8639	197	81	2026-01-08	da_nop
8640	197	82	2026-01-08	da_nop
8641	197	83	2026-01-08	da_nop
8642	197	84	2026-01-08	da_nop
8643	197	85	2026-01-08	da_nop
8644	197	86	2026-01-08	da_nop
8645	197	87	2026-01-08	da_nop
8646	197	88	2026-01-08	da_nop
8647	197	89	2026-01-08	da_nop
8648	197	90	2026-01-08	tre_han
8649	197	91	2026-01-08	da_nop
8650	197	92	2026-01-08	da_nop
8651	197	93	2026-01-08	da_nop
8652	197	94	2026-01-08	tre_han
8653	197	95	2026-01-08	da_nop
8654	197	96	2026-01-08	da_nop
8655	197	97	2026-01-08	tre_han
8656	197	98	2026-01-08	da_nop
8657	197	99	2026-01-08	tre_han
8658	197	100	2026-01-08	da_nop
8659	197	101	2026-01-08	da_nop
8660	197	102	2026-01-08	da_nop
8661	197	103	2026-01-08	da_nop
8662	197	104	2026-01-08	tre_han
8663	197	105	2026-01-08	da_nop
8664	197	106	2026-01-08	da_nop
8665	197	107	2026-01-08	da_nop
8666	197	108	2026-01-08	da_nop
8667	197	109	2026-01-08	tre_han
8668	197	110	2026-01-08	tre_han
8669	198	67	2026-01-08	da_nop
8670	198	68	2026-01-08	tre_han
8671	198	69	2026-01-08	da_nop
8672	198	70	2026-01-08	da_nop
8673	198	71	2026-01-08	da_nop
8674	198	72	2026-01-08	tre_han
8675	198	73	2026-01-08	da_nop
8676	198	74	2026-01-08	da_nop
8677	198	75	2026-01-08	da_nop
8678	198	76	2026-01-08	da_nop
8679	198	77	2026-01-08	da_nop
8680	198	78	2026-01-08	da_nop
8681	198	79	2026-01-08	da_nop
8682	198	80	2026-01-08	tre_han
8683	198	81	2026-01-08	da_nop
8684	198	82	2026-01-08	tre_han
8685	198	83	2026-01-08	da_nop
8686	198	84	2026-01-08	tre_han
8687	198	85	2026-01-08	da_nop
8688	198	86	2026-01-08	da_nop
8689	198	87	2026-01-08	da_nop
8690	198	88	2026-01-08	da_nop
8691	198	89	2026-01-08	da_nop
8692	198	90	2026-01-08	da_nop
8693	198	91	2026-01-08	da_nop
8694	198	92	2026-01-08	da_nop
8695	198	93	2026-01-08	da_nop
8696	198	94	2026-01-08	da_nop
8697	198	95	2026-01-08	da_nop
8698	198	96	2026-01-08	da_nop
8699	198	97	2026-01-08	da_nop
8700	198	98	2026-01-08	da_nop
8701	198	99	2026-01-08	da_nop
8702	198	100	2026-01-08	tre_han
8703	198	101	2026-01-08	tre_han
8704	198	102	2026-01-08	da_nop
8705	198	103	2026-01-08	da_nop
8706	198	104	2026-01-08	da_nop
8707	198	105	2026-01-08	da_nop
8708	198	106	2026-01-08	tre_han
8709	198	107	2026-01-08	da_nop
8710	198	108	2026-01-08	da_nop
8711	198	109	2026-01-08	tre_han
8712	198	110	2026-01-08	da_nop
8713	199	67	2026-01-08	da_nop
8714	199	68	2026-01-08	tre_han
8715	199	69	2026-01-08	tre_han
8716	199	70	2026-01-08	da_nop
8717	199	71	2026-01-08	da_nop
8718	199	72	2026-01-08	da_nop
8719	199	73	2026-01-08	da_nop
8720	199	74	2026-01-08	da_nop
8721	199	75	2026-01-08	da_nop
8722	199	76	2026-01-08	da_nop
8723	199	77	2026-01-08	da_nop
8724	199	78	2026-01-08	da_nop
8725	199	79	2026-01-08	da_nop
8726	199	80	2026-01-08	da_nop
8727	199	81	2026-01-08	da_nop
8728	199	82	2026-01-08	da_nop
8729	199	83	2026-01-08	da_nop
8730	199	84	2026-01-08	da_nop
8731	199	85	2026-01-08	tre_han
8732	199	86	2026-01-08	tre_han
8733	199	87	2026-01-08	da_nop
8734	199	88	2026-01-08	da_nop
8735	199	89	2026-01-08	da_nop
8736	199	90	2026-01-08	da_nop
8737	199	91	2026-01-08	da_nop
8738	199	92	2026-01-08	da_nop
8739	199	93	2026-01-08	tre_han
8740	199	94	2026-01-08	da_nop
8741	199	95	2026-01-08	tre_han
8742	199	96	2026-01-08	da_nop
8743	199	97	2026-01-08	da_nop
8744	199	98	2026-01-08	da_nop
8745	199	99	2026-01-08	da_nop
8746	199	100	2026-01-08	da_nop
8747	199	101	2026-01-08	da_nop
8748	199	102	2026-01-08	da_nop
8749	199	103	2026-01-08	da_nop
8750	199	104	2026-01-08	da_nop
8751	199	105	2026-01-08	da_nop
8752	199	106	2026-01-08	tre_han
8753	199	107	2026-01-08	da_nop
8754	199	108	2026-01-08	da_nop
8755	199	109	2026-01-08	da_nop
8756	199	110	2026-01-08	da_nop
8757	200	67	2026-01-08	tre_han
8758	200	68	2026-01-08	tre_han
8759	200	69	2026-01-08	tre_han
8760	200	70	2026-01-08	da_nop
8761	200	71	2026-01-08	da_nop
8762	200	72	2026-01-08	da_nop
8763	200	73	2026-01-08	da_nop
8764	200	74	2026-01-08	da_nop
8765	200	75	2026-01-08	da_nop
8766	200	76	2026-01-08	tre_han
8767	200	77	2026-01-08	da_nop
8768	200	78	2026-01-08	da_nop
8769	200	79	2026-01-08	da_nop
8770	200	80	2026-01-08	da_nop
8771	200	81	2026-01-08	tre_han
8772	200	82	2026-01-08	da_nop
8773	200	83	2026-01-08	tre_han
8774	200	84	2026-01-08	da_nop
8775	200	85	2026-01-08	da_nop
8776	200	86	2026-01-08	da_nop
8777	200	87	2026-01-08	da_nop
8778	200	88	2026-01-08	da_nop
8779	200	89	2026-01-08	tre_han
8780	200	90	2026-01-08	da_nop
8781	200	91	2026-01-08	tre_han
8782	200	92	2026-01-08	tre_han
8783	200	93	2026-01-08	tre_han
8784	200	94	2026-01-08	da_nop
8785	200	95	2026-01-08	da_nop
8786	200	96	2026-01-08	da_nop
8787	200	97	2026-01-08	tre_han
8788	200	98	2026-01-08	tre_han
8789	200	99	2026-01-08	da_nop
8790	200	100	2026-01-08	da_nop
8791	200	101	2026-01-08	da_nop
8792	200	102	2026-01-08	da_nop
8793	200	103	2026-01-08	tre_han
8794	200	104	2026-01-08	tre_han
8795	200	105	2026-01-08	tre_han
8796	200	106	2026-01-08	da_nop
8797	200	107	2026-01-08	da_nop
8798	200	108	2026-01-08	da_nop
8799	200	109	2026-01-08	da_nop
8800	200	110	2026-01-08	da_nop
8801	201	67	2026-01-08	da_nop
8802	201	68	2026-01-08	tre_han
8803	201	69	2026-01-08	da_nop
8804	201	70	2026-01-08	da_nop
8805	201	71	2026-01-08	da_nop
8806	201	72	2026-01-08	da_nop
8807	201	73	2026-01-08	da_nop
8808	201	74	2026-01-08	da_nop
8809	201	75	2026-01-08	da_nop
8810	201	76	2026-01-08	da_nop
8811	201	77	2026-01-08	da_nop
8812	201	78	2026-01-08	da_nop
8813	201	79	2026-01-08	da_nop
8814	201	80	2026-01-08	da_nop
8815	201	81	2026-01-08	tre_han
8816	201	82	2026-01-08	da_nop
8817	201	83	2026-01-08	tre_han
8818	201	84	2026-01-08	tre_han
8819	201	85	2026-01-08	da_nop
8820	201	86	2026-01-08	da_nop
8821	201	87	2026-01-08	da_nop
8822	201	88	2026-01-08	da_nop
8823	201	89	2026-01-08	tre_han
8824	201	90	2026-01-08	da_nop
8825	201	91	2026-01-08	da_nop
8826	201	92	2026-01-08	da_nop
8827	201	93	2026-01-08	tre_han
8828	201	94	2026-01-08	da_nop
8829	201	95	2026-01-08	da_nop
8830	201	96	2026-01-08	da_nop
8831	201	97	2026-01-08	da_nop
8832	201	98	2026-01-08	da_nop
8833	201	99	2026-01-08	tre_han
8834	201	100	2026-01-08	tre_han
8835	201	101	2026-01-08	da_nop
8836	201	102	2026-01-08	da_nop
8837	201	103	2026-01-08	da_nop
8838	201	104	2026-01-08	da_nop
8839	201	105	2026-01-08	da_nop
8840	201	106	2026-01-08	tre_han
8841	201	107	2026-01-08	da_nop
8842	201	108	2026-01-08	da_nop
8843	201	109	2026-01-08	da_nop
8844	201	110	2026-01-08	da_nop
8845	202	67	2026-01-08	da_nop
8846	202	68	2026-01-08	da_nop
8847	202	69	2026-01-08	da_nop
8848	202	70	2026-01-08	da_nop
8849	202	71	2026-01-08	da_nop
8850	202	72	2026-01-08	da_nop
8851	202	73	2026-01-08	tre_han
8852	202	74	2026-01-08	da_nop
8853	202	75	2026-01-08	da_nop
8854	202	76	2026-01-08	da_nop
8855	202	77	2026-01-08	da_nop
8856	202	78	2026-01-08	da_nop
8857	202	79	2026-01-08	da_nop
8858	202	80	2026-01-08	da_nop
8859	202	81	2026-01-08	da_nop
8860	202	82	2026-01-08	da_nop
8861	202	83	2026-01-08	da_nop
8862	202	84	2026-01-08	tre_han
8863	202	85	2026-01-08	tre_han
8864	202	86	2026-01-08	da_nop
8865	202	87	2026-01-08	da_nop
8866	202	88	2026-01-08	da_nop
8867	202	89	2026-01-08	da_nop
8868	202	90	2026-01-08	da_nop
8869	202	91	2026-01-08	da_nop
8870	202	92	2026-01-08	da_nop
8871	202	93	2026-01-08	tre_han
8872	202	94	2026-01-08	tre_han
8873	202	95	2026-01-08	da_nop
8874	202	96	2026-01-08	da_nop
8875	202	97	2026-01-08	tre_han
8876	202	98	2026-01-08	da_nop
8877	202	99	2026-01-08	da_nop
8878	202	100	2026-01-08	da_nop
8879	202	101	2026-01-08	da_nop
8880	202	102	2026-01-08	da_nop
8881	202	103	2026-01-08	da_nop
8882	202	104	2026-01-08	da_nop
8883	202	105	2026-01-08	da_nop
8884	202	106	2026-01-08	da_nop
8885	202	107	2026-01-08	da_nop
8886	202	108	2026-01-08	da_nop
8887	202	109	2026-01-08	da_nop
8888	202	110	2026-01-08	tre_han
8889	203	67	2026-01-08	da_nop
8890	203	68	2026-01-08	da_nop
8891	203	69	2026-01-08	da_nop
8892	203	70	2026-01-08	tre_han
8893	203	71	2026-01-08	da_nop
8894	203	72	2026-01-08	da_nop
8895	203	73	2026-01-08	da_nop
8896	203	74	2026-01-08	da_nop
8897	203	75	2026-01-08	da_nop
8898	203	76	2026-01-08	da_nop
8899	203	77	2026-01-08	da_nop
8900	203	78	2026-01-08	da_nop
8901	203	79	2026-01-08	da_nop
8902	203	80	2026-01-08	da_nop
8903	203	81	2026-01-08	da_nop
8904	203	82	2026-01-08	da_nop
8905	203	83	2026-01-08	da_nop
8906	203	84	2026-01-08	da_nop
8907	203	85	2026-01-08	da_nop
8908	203	86	2026-01-08	da_nop
8909	203	87	2026-01-08	da_nop
8910	203	88	2026-01-08	tre_han
8911	203	89	2026-01-08	da_nop
8912	203	90	2026-01-08	da_nop
8913	203	91	2026-01-08	da_nop
8914	203	92	2026-01-08	da_nop
8915	203	93	2026-01-08	da_nop
8916	203	94	2026-01-08	da_nop
8917	203	95	2026-01-08	da_nop
8918	203	96	2026-01-08	da_nop
8919	203	97	2026-01-08	da_nop
8920	203	98	2026-01-08	da_nop
8921	203	99	2026-01-08	tre_han
8922	203	100	2026-01-08	da_nop
8923	203	101	2026-01-08	da_nop
8924	203	102	2026-01-08	da_nop
8925	203	103	2026-01-08	da_nop
8926	203	104	2026-01-08	da_nop
8927	203	105	2026-01-08	da_nop
8928	203	106	2026-01-08	da_nop
8929	203	107	2026-01-08	da_nop
8930	203	108	2026-01-08	da_nop
8931	203	109	2026-01-08	da_nop
8932	203	110	2026-01-08	da_nop
8933	204	67	2026-01-08	da_nop
8934	204	68	2026-01-08	da_nop
8935	204	69	2026-01-08	da_nop
8936	204	70	2026-01-08	da_nop
8937	204	71	2026-01-08	da_nop
8938	204	72	2026-01-08	da_nop
8939	204	73	2026-01-08	tre_han
8940	204	74	2026-01-08	da_nop
8941	204	75	2026-01-08	tre_han
8942	204	76	2026-01-08	da_nop
8943	204	77	2026-01-08	tre_han
8944	204	78	2026-01-08	da_nop
8945	204	79	2026-01-08	da_nop
8946	204	80	2026-01-08	da_nop
8947	204	81	2026-01-08	tre_han
8948	204	82	2026-01-08	da_nop
8949	204	83	2026-01-08	da_nop
8950	204	84	2026-01-08	tre_han
8951	204	85	2026-01-08	da_nop
8952	204	86	2026-01-08	da_nop
8953	204	87	2026-01-08	da_nop
8954	204	88	2026-01-08	da_nop
8955	204	89	2026-01-08	da_nop
8956	204	90	2026-01-08	tre_han
8957	204	91	2026-01-08	tre_han
8958	204	92	2026-01-08	da_nop
8959	204	93	2026-01-08	da_nop
8960	204	94	2026-01-08	tre_han
8961	204	95	2026-01-08	da_nop
8962	204	96	2026-01-08	tre_han
8963	204	97	2026-01-08	tre_han
8964	204	98	2026-01-08	da_nop
8965	204	99	2026-01-08	tre_han
8966	204	100	2026-01-08	tre_han
8967	204	101	2026-01-08	tre_han
8968	204	102	2026-01-08	da_nop
8969	204	103	2026-01-08	da_nop
8970	204	104	2026-01-08	da_nop
8971	204	105	2026-01-08	da_nop
8972	204	106	2026-01-08	da_nop
8973	204	107	2026-01-08	da_nop
8974	204	108	2026-01-08	da_nop
8975	204	109	2026-01-08	da_nop
8976	204	110	2026-01-08	tre_han
8977	205	67	2026-01-08	da_nop
8978	205	68	2026-01-08	da_nop
8979	205	69	2026-01-08	da_nop
8980	205	70	2026-01-08	da_nop
8981	205	71	2026-01-08	da_nop
8982	205	72	2026-01-08	da_nop
8983	205	73	2026-01-08	da_nop
8984	205	74	2026-01-08	tre_han
8985	205	75	2026-01-08	da_nop
8986	205	76	2026-01-08	da_nop
8987	205	77	2026-01-08	da_nop
8988	205	78	2026-01-08	da_nop
8989	205	79	2026-01-08	da_nop
8990	205	80	2026-01-08	da_nop
8991	205	81	2026-01-08	da_nop
8992	205	82	2026-01-08	da_nop
8993	205	83	2026-01-08	da_nop
8994	205	84	2026-01-08	da_nop
8995	205	85	2026-01-08	da_nop
8996	205	86	2026-01-08	da_nop
8997	205	87	2026-01-08	da_nop
8998	205	88	2026-01-08	da_nop
8999	205	89	2026-01-08	da_nop
9000	205	90	2026-01-08	da_nop
9001	205	91	2026-01-08	da_nop
9002	205	92	2026-01-08	da_nop
9003	205	93	2026-01-08	da_nop
9004	205	94	2026-01-08	tre_han
9005	205	95	2026-01-08	da_nop
9006	205	96	2026-01-08	da_nop
9007	205	97	2026-01-08	da_nop
9008	205	98	2026-01-08	da_nop
9009	205	99	2026-01-08	da_nop
9010	205	100	2026-01-08	da_nop
9011	205	101	2026-01-08	da_nop
9012	205	102	2026-01-08	da_nop
9013	205	103	2026-01-08	da_nop
9014	205	104	2026-01-08	da_nop
9015	205	105	2026-01-08	tre_han
9016	205	106	2026-01-08	tre_han
9017	205	107	2026-01-08	da_nop
9018	205	108	2026-01-08	tre_han
9019	205	109	2026-01-08	tre_han
9020	205	110	2026-01-08	da_nop
9021	206	67	2026-01-08	tre_han
9022	206	68	2026-01-08	da_nop
9023	206	69	2026-01-08	da_nop
9024	206	70	2026-01-08	da_nop
9025	206	71	2026-01-08	da_nop
9026	206	72	2026-01-08	da_nop
9027	206	73	2026-01-08	da_nop
9028	206	74	2026-01-08	da_nop
9029	206	75	2026-01-08	da_nop
9030	206	76	2026-01-08	da_nop
9031	206	77	2026-01-08	da_nop
9032	206	78	2026-01-08	da_nop
9033	206	79	2026-01-08	da_nop
9034	206	80	2026-01-08	tre_han
9035	206	81	2026-01-08	da_nop
9036	206	82	2026-01-08	da_nop
9037	206	83	2026-01-08	da_nop
9038	206	84	2026-01-08	da_nop
9039	206	85	2026-01-08	da_nop
9040	206	86	2026-01-08	da_nop
9041	206	87	2026-01-08	tre_han
9042	206	88	2026-01-08	da_nop
9043	206	89	2026-01-08	tre_han
9044	206	90	2026-01-08	da_nop
9045	206	91	2026-01-08	da_nop
9046	206	92	2026-01-08	da_nop
9047	206	93	2026-01-08	da_nop
9048	206	94	2026-01-08	tre_han
9049	206	95	2026-01-08	da_nop
9050	206	96	2026-01-08	da_nop
9051	206	97	2026-01-08	da_nop
9052	206	98	2026-01-08	da_nop
9053	206	99	2026-01-08	tre_han
9054	206	100	2026-01-08	da_nop
9055	206	101	2026-01-08	da_nop
9056	206	102	2026-01-08	da_nop
9057	206	103	2026-01-08	tre_han
9058	206	104	2026-01-08	tre_han
9059	206	105	2026-01-08	da_nop
9060	206	106	2026-01-08	da_nop
9061	206	107	2026-01-08	da_nop
9062	206	108	2026-01-08	da_nop
9063	206	109	2026-01-08	da_nop
9064	206	110	2026-01-08	da_nop
9065	207	67	2026-01-08	tre_han
9066	207	68	2026-01-08	tre_han
9067	207	69	2026-01-08	da_nop
9068	207	70	2026-01-08	da_nop
9069	207	71	2026-01-08	tre_han
9070	207	72	2026-01-08	tre_han
9071	207	73	2026-01-08	da_nop
9072	207	74	2026-01-08	da_nop
9073	207	75	2026-01-08	da_nop
9074	207	76	2026-01-08	da_nop
9075	207	77	2026-01-08	da_nop
9076	207	78	2026-01-08	da_nop
9077	207	79	2026-01-08	da_nop
9078	207	80	2026-01-08	tre_han
9079	207	81	2026-01-08	da_nop
9080	207	82	2026-01-08	da_nop
9081	207	83	2026-01-08	da_nop
9082	207	84	2026-01-08	da_nop
9083	207	85	2026-01-08	da_nop
9084	207	86	2026-01-08	da_nop
9085	207	87	2026-01-08	da_nop
9086	207	88	2026-01-08	da_nop
9087	207	89	2026-01-08	da_nop
9088	207	90	2026-01-08	tre_han
9089	207	91	2026-01-08	da_nop
9090	207	92	2026-01-08	da_nop
9091	207	93	2026-01-08	tre_han
9092	207	94	2026-01-08	da_nop
9093	207	95	2026-01-08	da_nop
9094	207	96	2026-01-08	da_nop
9095	207	97	2026-01-08	da_nop
9096	207	98	2026-01-08	da_nop
9097	207	99	2026-01-08	da_nop
9098	207	100	2026-01-08	tre_han
9099	207	101	2026-01-08	tre_han
9100	207	102	2026-01-08	da_nop
9101	207	103	2026-01-08	da_nop
9102	207	104	2026-01-08	da_nop
9103	207	105	2026-01-08	da_nop
9104	207	106	2026-01-08	da_nop
9105	207	107	2026-01-08	da_nop
9106	207	108	2026-01-08	da_nop
9107	207	109	2026-01-08	da_nop
9108	207	110	2026-01-08	da_nop
9109	208	67	2026-01-08	da_nop
9110	208	68	2026-01-08	da_nop
9111	208	69	2026-01-08	da_nop
9112	208	70	2026-01-08	tre_han
9113	208	71	2026-01-08	tre_han
9114	208	72	2026-01-08	da_nop
9115	208	73	2026-01-08	da_nop
9116	208	74	2026-01-08	da_nop
9117	208	75	2026-01-08	da_nop
9118	208	76	2026-01-08	da_nop
9119	208	77	2026-01-08	da_nop
9120	208	78	2026-01-08	da_nop
9121	208	79	2026-01-08	da_nop
9122	208	80	2026-01-08	da_nop
9123	208	81	2026-01-08	da_nop
9124	208	82	2026-01-08	da_nop
9125	208	83	2026-01-08	da_nop
9126	208	84	2026-01-08	da_nop
9127	208	85	2026-01-08	tre_han
9128	208	86	2026-01-08	da_nop
9129	208	87	2026-01-08	da_nop
9130	208	88	2026-01-08	da_nop
9131	208	89	2026-01-08	da_nop
9132	208	90	2026-01-08	da_nop
9133	208	91	2026-01-08	da_nop
9134	208	92	2026-01-08	da_nop
9135	208	93	2026-01-08	da_nop
9136	208	94	2026-01-08	da_nop
9137	208	95	2026-01-08	da_nop
9138	208	96	2026-01-08	tre_han
9139	208	97	2026-01-08	tre_han
9140	208	98	2026-01-08	da_nop
9141	208	99	2026-01-08	tre_han
9142	208	100	2026-01-08	tre_han
9143	208	101	2026-01-08	da_nop
9144	208	102	2026-01-08	da_nop
9145	208	103	2026-01-08	da_nop
9146	208	104	2026-01-08	da_nop
9147	208	105	2026-01-08	da_nop
9148	208	106	2026-01-08	da_nop
9149	208	107	2026-01-08	da_nop
9150	208	108	2026-01-08	tre_han
9151	208	109	2026-01-08	da_nop
9152	208	110	2026-01-08	da_nop
9153	209	67	2026-01-08	da_nop
9154	209	68	2026-01-08	tre_han
9155	209	69	2026-01-08	da_nop
9156	209	70	2026-01-08	da_nop
9157	209	71	2026-01-08	da_nop
9158	209	72	2026-01-08	da_nop
9159	209	73	2026-01-08	da_nop
9160	209	74	2026-01-08	da_nop
9161	209	75	2026-01-08	da_nop
9162	209	76	2026-01-08	da_nop
9163	209	77	2026-01-08	da_nop
9164	209	78	2026-01-08	da_nop
9165	209	79	2026-01-08	da_nop
9166	209	80	2026-01-08	da_nop
9167	209	81	2026-01-08	da_nop
9168	209	82	2026-01-08	da_nop
9169	209	83	2026-01-08	tre_han
9170	209	84	2026-01-08	da_nop
9171	209	85	2026-01-08	da_nop
9172	209	86	2026-01-08	tre_han
9173	209	87	2026-01-08	tre_han
9174	209	88	2026-01-08	da_nop
9175	209	89	2026-01-08	da_nop
9176	209	90	2026-01-08	da_nop
9177	209	91	2026-01-08	da_nop
9178	209	92	2026-01-08	da_nop
9179	209	93	2026-01-08	da_nop
9180	209	94	2026-01-08	da_nop
9181	209	95	2026-01-08	tre_han
9182	209	96	2026-01-08	da_nop
9183	209	97	2026-01-08	da_nop
9184	209	98	2026-01-08	da_nop
9185	209	99	2026-01-08	da_nop
9186	209	100	2026-01-08	da_nop
9187	209	101	2026-01-08	da_nop
9188	209	102	2026-01-08	da_nop
9189	209	103	2026-01-08	da_nop
9190	209	104	2026-01-08	da_nop
9191	209	105	2026-01-08	da_nop
9192	209	106	2026-01-08	da_nop
9193	209	107	2026-01-08	da_nop
9194	209	108	2026-01-08	da_nop
9195	209	109	2026-01-08	tre_han
9196	209	110	2026-01-08	da_nop
9197	210	67	2026-01-08	da_nop
9198	210	68	2026-01-08	da_nop
9199	210	69	2026-01-08	da_nop
9200	210	70	2026-01-08	da_nop
9201	210	71	2026-01-08	da_nop
9202	210	72	2026-01-08	da_nop
9203	210	73	2026-01-08	da_nop
9204	210	74	2026-01-08	da_nop
9205	210	75	2026-01-08	tre_han
9206	210	76	2026-01-08	da_nop
9207	210	77	2026-01-08	da_nop
9208	210	78	2026-01-08	da_nop
9209	210	79	2026-01-08	tre_han
9210	210	80	2026-01-08	tre_han
9211	210	81	2026-01-08	da_nop
9212	210	82	2026-01-08	da_nop
9213	210	83	2026-01-08	da_nop
9214	210	84	2026-01-08	da_nop
9215	210	85	2026-01-08	da_nop
9216	210	86	2026-01-08	tre_han
9217	210	87	2026-01-08	da_nop
9218	210	88	2026-01-08	da_nop
9219	210	89	2026-01-08	tre_han
9220	210	90	2026-01-08	da_nop
9221	210	91	2026-01-08	da_nop
9222	210	92	2026-01-08	tre_han
9223	210	93	2026-01-08	da_nop
9224	210	94	2026-01-08	da_nop
9225	210	95	2026-01-08	da_nop
9226	210	96	2026-01-08	tre_han
9227	210	97	2026-01-08	da_nop
9228	210	98	2026-01-08	da_nop
9229	210	99	2026-01-08	da_nop
9230	210	100	2026-01-08	da_nop
9231	210	101	2026-01-08	da_nop
9232	210	102	2026-01-08	da_nop
9233	210	103	2026-01-08	tre_han
9234	210	104	2026-01-08	da_nop
9235	210	105	2026-01-08	da_nop
9236	210	106	2026-01-08	da_nop
9237	210	107	2026-01-08	da_nop
9238	210	108	2026-01-08	tre_han
9239	210	109	2026-01-08	da_nop
9240	210	110	2026-01-08	tre_han
9241	211	67	2026-01-08	da_nop
9242	211	68	2026-01-08	da_nop
9243	211	69	2026-01-08	tre_han
9244	211	70	2026-01-08	da_nop
9245	211	71	2026-01-08	da_nop
9246	211	72	2026-01-08	tre_han
9247	211	73	2026-01-08	da_nop
9248	211	74	2026-01-08	da_nop
9249	211	75	2026-01-08	da_nop
9250	211	76	2026-01-08	da_nop
9251	211	77	2026-01-08	da_nop
9252	211	78	2026-01-08	tre_han
9253	211	79	2026-01-08	da_nop
9254	211	80	2026-01-08	da_nop
9255	211	81	2026-01-08	da_nop
9256	211	82	2026-01-08	tre_han
9257	211	83	2026-01-08	da_nop
9258	211	84	2026-01-08	da_nop
9259	211	85	2026-01-08	da_nop
9260	211	86	2026-01-08	da_nop
9261	211	87	2026-01-08	da_nop
9262	211	88	2026-01-08	tre_han
9263	211	89	2026-01-08	da_nop
9264	211	90	2026-01-08	da_nop
9265	211	91	2026-01-08	da_nop
9266	211	92	2026-01-08	da_nop
9267	211	93	2026-01-08	da_nop
9268	211	94	2026-01-08	da_nop
9269	211	95	2026-01-08	da_nop
9270	211	96	2026-01-08	da_nop
9271	211	97	2026-01-08	da_nop
9272	211	98	2026-01-08	da_nop
9273	211	99	2026-01-08	tre_han
9274	211	100	2026-01-08	da_nop
9275	211	101	2026-01-08	da_nop
9276	211	102	2026-01-08	da_nop
9277	211	103	2026-01-08	tre_han
9278	211	104	2026-01-08	da_nop
9279	211	105	2026-01-08	da_nop
9280	211	106	2026-01-08	da_nop
9281	211	107	2026-01-08	da_nop
9282	211	108	2026-01-08	da_nop
9283	211	109	2026-01-08	da_nop
9284	211	110	2026-01-08	da_nop
9285	212	67	2026-01-08	da_nop
9286	212	68	2026-01-08	tre_han
9287	212	69	2026-01-08	da_nop
9288	212	70	2026-01-08	da_nop
9289	212	71	2026-01-08	da_nop
9290	212	72	2026-01-08	da_nop
9291	212	73	2026-01-08	da_nop
9292	212	74	2026-01-08	da_nop
9293	212	75	2026-01-08	tre_han
9294	212	76	2026-01-08	da_nop
9295	212	77	2026-01-08	da_nop
9296	212	78	2026-01-08	da_nop
9297	212	79	2026-01-08	da_nop
9298	212	80	2026-01-08	tre_han
9299	212	81	2026-01-08	da_nop
9300	212	82	2026-01-08	da_nop
9301	212	83	2026-01-08	da_nop
9302	212	84	2026-01-08	da_nop
9303	212	85	2026-01-08	da_nop
9304	212	86	2026-01-08	da_nop
9305	212	87	2026-01-08	da_nop
9306	212	88	2026-01-08	da_nop
9307	212	89	2026-01-08	da_nop
9308	212	90	2026-01-08	tre_han
9309	212	91	2026-01-08	da_nop
9310	212	92	2026-01-08	da_nop
9311	212	93	2026-01-08	da_nop
9312	212	94	2026-01-08	da_nop
9313	212	95	2026-01-08	da_nop
9314	212	96	2026-01-08	da_nop
9315	212	97	2026-01-08	da_nop
9316	212	98	2026-01-08	da_nop
9317	212	99	2026-01-08	da_nop
9318	212	100	2026-01-08	da_nop
9319	212	101	2026-01-08	tre_han
9320	212	102	2026-01-08	da_nop
9321	212	103	2026-01-08	da_nop
9322	212	104	2026-01-08	da_nop
9323	212	105	2026-01-08	da_nop
9324	212	106	2026-01-08	da_nop
9325	212	107	2026-01-08	da_nop
9326	212	108	2026-01-08	da_nop
9327	212	109	2026-01-08	da_nop
9328	212	110	2026-01-08	tre_han
9329	213	67	2026-01-08	da_nop
9330	213	68	2026-01-08	tre_han
9331	213	69	2026-01-08	tre_han
9332	213	70	2026-01-08	tre_han
9333	213	71	2026-01-08	tre_han
9334	213	72	2026-01-08	da_nop
9335	213	73	2026-01-08	da_nop
9336	213	74	2026-01-08	tre_han
9337	213	75	2026-01-08	da_nop
9338	213	76	2026-01-08	tre_han
9339	213	77	2026-01-08	da_nop
9340	213	78	2026-01-08	tre_han
9341	213	79	2026-01-08	da_nop
9342	213	80	2026-01-08	da_nop
9343	213	81	2026-01-08	da_nop
9344	213	82	2026-01-08	da_nop
9345	213	83	2026-01-08	da_nop
9346	213	84	2026-01-08	tre_han
9347	213	85	2026-01-08	tre_han
9348	213	86	2026-01-08	da_nop
9349	213	87	2026-01-08	da_nop
9350	213	88	2026-01-08	da_nop
9351	213	89	2026-01-08	tre_han
9352	213	90	2026-01-08	da_nop
9353	213	91	2026-01-08	da_nop
9354	213	92	2026-01-08	da_nop
9355	213	93	2026-01-08	da_nop
9356	213	94	2026-01-08	da_nop
9357	213	95	2026-01-08	da_nop
9358	213	96	2026-01-08	da_nop
9359	213	97	2026-01-08	tre_han
9360	213	98	2026-01-08	da_nop
9361	213	99	2026-01-08	da_nop
9362	213	100	2026-01-08	da_nop
9363	213	101	2026-01-08	da_nop
9364	213	102	2026-01-08	da_nop
9365	213	103	2026-01-08	da_nop
9366	213	104	2026-01-08	tre_han
9367	213	105	2026-01-08	da_nop
9368	213	106	2026-01-08	da_nop
9369	213	107	2026-01-08	da_nop
9370	213	108	2026-01-08	da_nop
9371	213	109	2026-01-08	da_nop
9372	213	110	2026-01-08	da_nop
9373	214	67	2026-01-08	tre_han
9374	214	68	2026-01-08	da_nop
9375	214	69	2026-01-08	da_nop
9376	214	70	2026-01-08	tre_han
9377	214	71	2026-01-08	da_nop
9378	214	72	2026-01-08	da_nop
9379	214	73	2026-01-08	da_nop
9380	214	74	2026-01-08	da_nop
9381	214	75	2026-01-08	da_nop
9382	214	76	2026-01-08	da_nop
9383	214	77	2026-01-08	da_nop
9384	214	78	2026-01-08	da_nop
9385	214	79	2026-01-08	da_nop
9386	214	80	2026-01-08	tre_han
9387	214	81	2026-01-08	da_nop
9388	214	82	2026-01-08	tre_han
9389	214	83	2026-01-08	tre_han
9390	214	84	2026-01-08	da_nop
9391	214	85	2026-01-08	da_nop
9392	214	86	2026-01-08	da_nop
9393	214	87	2026-01-08	da_nop
9394	214	88	2026-01-08	tre_han
9395	214	89	2026-01-08	da_nop
9396	214	90	2026-01-08	tre_han
9397	214	91	2026-01-08	da_nop
9398	214	92	2026-01-08	da_nop
9399	214	93	2026-01-08	da_nop
9400	214	94	2026-01-08	da_nop
9401	214	95	2026-01-08	da_nop
9402	214	96	2026-01-08	da_nop
9403	214	97	2026-01-08	da_nop
9404	214	98	2026-01-08	tre_han
9405	214	99	2026-01-08	da_nop
9406	214	100	2026-01-08	da_nop
9407	214	101	2026-01-08	tre_han
9408	214	102	2026-01-08	tre_han
9409	214	103	2026-01-08	da_nop
9410	214	104	2026-01-08	da_nop
9411	214	105	2026-01-08	tre_han
9412	214	106	2026-01-08	tre_han
9413	214	107	2026-01-08	da_nop
9414	214	108	2026-01-08	tre_han
9415	214	109	2026-01-08	da_nop
9416	214	110	2026-01-08	tre_han
9417	215	67	2026-01-08	da_nop
9418	215	68	2026-01-08	da_nop
9419	215	69	2026-01-08	tre_han
9420	215	70	2026-01-08	da_nop
9421	215	71	2026-01-08	da_nop
9422	215	72	2026-01-08	da_nop
9423	215	73	2026-01-08	tre_han
9424	215	74	2026-01-08	da_nop
9425	215	75	2026-01-08	da_nop
9426	215	76	2026-01-08	da_nop
9427	215	77	2026-01-08	da_nop
9428	215	78	2026-01-08	tre_han
9429	215	79	2026-01-08	da_nop
9430	215	80	2026-01-08	tre_han
9431	215	81	2026-01-08	da_nop
9432	215	82	2026-01-08	da_nop
9433	215	83	2026-01-08	da_nop
9434	215	84	2026-01-08	da_nop
9435	215	85	2026-01-08	tre_han
9436	215	86	2026-01-08	tre_han
9437	215	87	2026-01-08	da_nop
9438	215	88	2026-01-08	da_nop
9439	215	89	2026-01-08	da_nop
9440	215	90	2026-01-08	da_nop
9441	215	91	2026-01-08	da_nop
9442	215	92	2026-01-08	tre_han
9443	215	93	2026-01-08	da_nop
9444	215	94	2026-01-08	da_nop
9445	215	95	2026-01-08	da_nop
9446	215	96	2026-01-08	da_nop
9447	215	97	2026-01-08	da_nop
9448	215	98	2026-01-08	tre_han
9449	215	99	2026-01-08	da_nop
9450	215	100	2026-01-08	da_nop
9451	215	101	2026-01-08	da_nop
9452	215	102	2026-01-08	da_nop
9453	215	103	2026-01-08	tre_han
9454	215	104	2026-01-08	tre_han
9455	215	105	2026-01-08	da_nop
9456	215	106	2026-01-08	da_nop
9457	215	107	2026-01-08	tre_han
9458	215	108	2026-01-08	da_nop
9459	215	109	2026-01-08	da_nop
9460	215	110	2026-01-08	da_nop
9461	216	67	2026-01-08	tre_han
9462	216	68	2026-01-08	da_nop
9463	216	69	2026-01-08	da_nop
9464	216	70	2026-01-08	tre_han
9465	216	71	2026-01-08	da_nop
9466	216	72	2026-01-08	da_nop
9467	216	73	2026-01-08	da_nop
9468	216	74	2026-01-08	da_nop
9469	216	75	2026-01-08	da_nop
9470	216	76	2026-01-08	da_nop
9471	216	77	2026-01-08	da_nop
9472	216	78	2026-01-08	da_nop
9473	216	79	2026-01-08	da_nop
9474	216	80	2026-01-08	tre_han
9475	216	81	2026-01-08	da_nop
9476	216	82	2026-01-08	da_nop
9477	216	83	2026-01-08	tre_han
9478	216	84	2026-01-08	da_nop
9479	216	85	2026-01-08	da_nop
9480	216	86	2026-01-08	da_nop
9481	216	87	2026-01-08	da_nop
9482	216	88	2026-01-08	da_nop
9483	216	89	2026-01-08	da_nop
9484	216	90	2026-01-08	tre_han
9485	216	91	2026-01-08	da_nop
9486	216	92	2026-01-08	tre_han
9487	216	93	2026-01-08	da_nop
9488	216	94	2026-01-08	da_nop
9489	216	95	2026-01-08	da_nop
9490	216	96	2026-01-08	da_nop
9491	216	97	2026-01-08	da_nop
9492	216	98	2026-01-08	da_nop
9493	216	99	2026-01-08	da_nop
9494	216	100	2026-01-08	da_nop
9495	216	101	2026-01-08	da_nop
9496	216	102	2026-01-08	da_nop
9497	216	103	2026-01-08	tre_han
9498	216	104	2026-01-08	da_nop
9499	216	105	2026-01-08	da_nop
9500	216	106	2026-01-08	da_nop
9501	216	107	2026-01-08	da_nop
9502	216	108	2026-01-08	da_nop
9503	216	109	2026-01-08	da_nop
9504	216	110	2026-01-08	tre_han
9505	217	67	2026-01-08	tre_han
9506	217	68	2026-01-08	da_nop
9507	217	69	2026-01-08	tre_han
9508	217	70	2026-01-08	da_nop
9509	217	71	2026-01-08	da_nop
9510	217	72	2026-01-08	da_nop
9511	217	73	2026-01-08	da_nop
9512	217	74	2026-01-08	da_nop
9513	217	75	2026-01-08	da_nop
9514	217	76	2026-01-08	da_nop
9515	217	77	2026-01-08	da_nop
9516	217	78	2026-01-08	da_nop
9517	217	79	2026-01-08	tre_han
9518	217	80	2026-01-08	da_nop
9519	217	81	2026-01-08	da_nop
9520	217	82	2026-01-08	da_nop
9521	217	83	2026-01-08	da_nop
9522	217	84	2026-01-08	tre_han
9523	217	85	2026-01-08	da_nop
9524	217	86	2026-01-08	da_nop
9525	217	87	2026-01-08	tre_han
9526	217	88	2026-01-08	da_nop
9527	217	89	2026-01-08	tre_han
9528	217	90	2026-01-08	da_nop
9529	217	91	2026-01-08	tre_han
9530	217	92	2026-01-08	da_nop
9531	217	93	2026-01-08	da_nop
9532	217	94	2026-01-08	da_nop
9533	217	95	2026-01-08	da_nop
9534	217	96	2026-01-08	tre_han
9535	217	97	2026-01-08	tre_han
9536	217	98	2026-01-08	tre_han
9537	217	99	2026-01-08	da_nop
9538	217	100	2026-01-08	da_nop
9539	217	101	2026-01-08	tre_han
9540	217	102	2026-01-08	da_nop
9541	217	103	2026-01-08	tre_han
9542	217	104	2026-01-08	da_nop
9543	217	105	2026-01-08	tre_han
9544	217	106	2026-01-08	da_nop
9545	217	107	2026-01-08	da_nop
9546	217	108	2026-01-08	da_nop
9547	217	109	2026-01-08	tre_han
9548	217	110	2026-01-08	da_nop
9549	218	67	2026-01-08	da_nop
9550	218	68	2026-01-08	da_nop
9551	218	69	2026-01-08	da_nop
9552	218	70	2026-01-08	tre_han
9553	218	71	2026-01-08	da_nop
9554	218	72	2026-01-08	da_nop
9555	218	73	2026-01-08	da_nop
9556	218	74	2026-01-08	da_nop
9557	218	75	2026-01-08	da_nop
9558	218	76	2026-01-08	da_nop
9559	218	77	2026-01-08	da_nop
9560	218	78	2026-01-08	da_nop
9561	218	79	2026-01-08	da_nop
9562	218	80	2026-01-08	da_nop
9563	218	81	2026-01-08	da_nop
9564	218	82	2026-01-08	da_nop
9565	218	83	2026-01-08	da_nop
9566	218	84	2026-01-08	da_nop
9567	218	85	2026-01-08	da_nop
9568	218	86	2026-01-08	da_nop
9569	218	87	2026-01-08	da_nop
9570	218	88	2026-01-08	da_nop
9571	218	89	2026-01-08	da_nop
9572	218	90	2026-01-08	da_nop
9573	218	91	2026-01-08	da_nop
9574	218	92	2026-01-08	da_nop
9575	218	93	2026-01-08	da_nop
9576	218	94	2026-01-08	tre_han
9577	218	95	2026-01-08	da_nop
9578	218	96	2026-01-08	tre_han
9579	218	97	2026-01-08	tre_han
9580	218	98	2026-01-08	da_nop
9581	218	99	2026-01-08	da_nop
9582	218	100	2026-01-08	da_nop
9583	218	101	2026-01-08	da_nop
9584	218	102	2026-01-08	tre_han
9585	218	103	2026-01-08	da_nop
9586	218	104	2026-01-08	da_nop
9587	218	105	2026-01-08	da_nop
9588	218	106	2026-01-08	tre_han
9589	218	107	2026-01-08	da_nop
9590	218	108	2026-01-08	tre_han
9591	218	109	2026-01-08	da_nop
9592	218	110	2026-01-08	da_nop
9593	219	67	2026-01-08	da_nop
9594	219	68	2026-01-08	tre_han
9595	219	69	2026-01-08	da_nop
9596	219	70	2026-01-08	tre_han
9597	219	71	2026-01-08	da_nop
9598	219	72	2026-01-08	da_nop
9599	219	73	2026-01-08	da_nop
9600	219	74	2026-01-08	da_nop
9601	219	75	2026-01-08	da_nop
9602	219	76	2026-01-08	da_nop
9603	219	77	2026-01-08	da_nop
9604	219	78	2026-01-08	da_nop
9605	219	79	2026-01-08	tre_han
9606	219	80	2026-01-08	da_nop
9607	219	81	2026-01-08	tre_han
9608	219	82	2026-01-08	tre_han
9609	219	83	2026-01-08	da_nop
9610	219	84	2026-01-08	da_nop
9611	219	85	2026-01-08	da_nop
9612	219	86	2026-01-08	da_nop
9613	219	87	2026-01-08	da_nop
9614	219	88	2026-01-08	da_nop
9615	219	89	2026-01-08	da_nop
9616	219	90	2026-01-08	da_nop
9617	219	91	2026-01-08	da_nop
9618	219	92	2026-01-08	tre_han
9619	219	93	2026-01-08	da_nop
9620	219	94	2026-01-08	tre_han
9621	219	95	2026-01-08	da_nop
9622	219	96	2026-01-08	da_nop
9623	219	97	2026-01-08	da_nop
9624	219	98	2026-01-08	da_nop
9625	219	99	2026-01-08	tre_han
9626	219	100	2026-01-08	tre_han
9627	219	101	2026-01-08	da_nop
9628	219	102	2026-01-08	da_nop
9629	219	103	2026-01-08	da_nop
9630	219	104	2026-01-08	tre_han
9631	219	105	2026-01-08	tre_han
9632	219	106	2026-01-08	da_nop
9633	219	107	2026-01-08	tre_han
9634	219	108	2026-01-08	da_nop
9635	219	109	2026-01-08	tre_han
9636	219	110	2026-01-08	da_nop
9637	220	67	2026-01-08	tre_han
9638	220	68	2026-01-08	da_nop
9639	220	69	2026-01-08	da_nop
9640	220	70	2026-01-08	da_nop
9641	220	71	2026-01-08	tre_han
9642	220	72	2026-01-08	da_nop
9643	220	73	2026-01-08	da_nop
9644	220	74	2026-01-08	da_nop
9645	220	75	2026-01-08	da_nop
9646	220	76	2026-01-08	da_nop
9647	220	77	2026-01-08	da_nop
9648	220	78	2026-01-08	da_nop
9649	220	79	2026-01-08	da_nop
9650	220	80	2026-01-08	da_nop
9651	220	81	2026-01-08	tre_han
9652	220	82	2026-01-08	da_nop
9653	220	83	2026-01-08	da_nop
9654	220	84	2026-01-08	tre_han
9655	220	85	2026-01-08	da_nop
9656	220	86	2026-01-08	da_nop
9657	220	87	2026-01-08	da_nop
9658	220	88	2026-01-08	da_nop
9659	220	89	2026-01-08	da_nop
9660	220	90	2026-01-08	tre_han
9661	220	91	2026-01-08	da_nop
9662	220	92	2026-01-08	da_nop
9663	220	93	2026-01-08	da_nop
9664	220	94	2026-01-08	da_nop
9665	220	95	2026-01-08	da_nop
9666	220	96	2026-01-08	tre_han
9667	220	97	2026-01-08	da_nop
9668	220	98	2026-01-08	da_nop
9669	220	99	2026-01-08	da_nop
9670	220	100	2026-01-08	da_nop
9671	220	101	2026-01-08	tre_han
9672	220	102	2026-01-08	da_nop
9673	220	103	2026-01-08	da_nop
9674	220	104	2026-01-08	da_nop
9675	220	105	2026-01-08	da_nop
9676	220	106	2026-01-08	da_nop
9677	220	107	2026-01-08	da_nop
9678	220	108	2026-01-08	da_nop
9679	220	109	2026-01-08	da_nop
9680	220	110	2026-01-08	da_nop
9681	221	67	2026-01-08	da_nop
9682	221	68	2026-01-08	da_nop
9683	221	69	2026-01-08	da_nop
9684	221	70	2026-01-08	da_nop
9685	221	71	2026-01-08	da_nop
9686	221	72	2026-01-08	da_nop
9687	221	73	2026-01-08	da_nop
9688	221	74	2026-01-08	da_nop
9689	221	75	2026-01-08	da_nop
9690	221	76	2026-01-08	da_nop
9691	221	77	2026-01-08	da_nop
9692	221	78	2026-01-08	da_nop
9693	221	79	2026-01-08	tre_han
9694	221	80	2026-01-08	da_nop
9695	221	81	2026-01-08	tre_han
9696	221	82	2026-01-08	da_nop
9697	221	83	2026-01-08	da_nop
9698	221	84	2026-01-08	da_nop
9699	221	85	2026-01-08	da_nop
9700	221	86	2026-01-08	da_nop
9701	221	87	2026-01-08	tre_han
9702	221	88	2026-01-08	tre_han
9703	221	89	2026-01-08	da_nop
9704	221	90	2026-01-08	da_nop
9705	221	91	2026-01-08	da_nop
9706	221	92	2026-01-08	da_nop
9707	221	93	2026-01-08	da_nop
9708	221	94	2026-01-08	da_nop
9709	221	95	2026-01-08	tre_han
9710	221	96	2026-01-08	da_nop
9711	221	97	2026-01-08	da_nop
9712	221	98	2026-01-08	da_nop
9713	221	99	2026-01-08	da_nop
9714	221	100	2026-01-08	tre_han
9715	221	101	2026-01-08	tre_han
9716	221	102	2026-01-08	tre_han
9717	221	103	2026-01-08	da_nop
9718	221	104	2026-01-08	da_nop
9719	221	105	2026-01-08	da_nop
9720	221	106	2026-01-08	tre_han
9721	221	107	2026-01-08	da_nop
9722	221	108	2026-01-08	da_nop
9723	221	109	2026-01-08	da_nop
9724	221	110	2026-01-08	da_nop
9725	222	67	2026-01-08	tre_han
9726	222	68	2026-01-08	da_nop
9727	222	69	2026-01-08	da_nop
9728	222	70	2026-01-08	da_nop
9729	222	71	2026-01-08	da_nop
9730	222	72	2026-01-08	da_nop
9731	222	73	2026-01-08	da_nop
9732	222	74	2026-01-08	da_nop
9733	222	75	2026-01-08	da_nop
9734	222	76	2026-01-08	da_nop
9735	222	77	2026-01-08	da_nop
9736	222	78	2026-01-08	da_nop
9737	222	79	2026-01-08	da_nop
9738	222	80	2026-01-08	da_nop
9739	222	81	2026-01-08	da_nop
9740	222	82	2026-01-08	da_nop
9741	222	83	2026-01-08	da_nop
9742	222	84	2026-01-08	da_nop
9743	222	85	2026-01-08	da_nop
9744	222	86	2026-01-08	tre_han
9745	222	87	2026-01-08	tre_han
9746	222	88	2026-01-08	da_nop
9747	222	89	2026-01-08	da_nop
9748	222	90	2026-01-08	tre_han
9749	222	91	2026-01-08	da_nop
9750	222	92	2026-01-08	da_nop
9751	222	93	2026-01-08	da_nop
9752	222	94	2026-01-08	da_nop
9753	222	95	2026-01-08	da_nop
9754	222	96	2026-01-08	tre_han
9755	222	97	2026-01-08	da_nop
9756	222	98	2026-01-08	da_nop
9757	222	99	2026-01-08	da_nop
9758	222	100	2026-01-08	da_nop
9759	222	101	2026-01-08	da_nop
9760	222	102	2026-01-08	tre_han
9761	222	103	2026-01-08	da_nop
9762	222	104	2026-01-08	da_nop
9763	222	105	2026-01-08	tre_han
9764	222	106	2026-01-08	da_nop
9765	222	107	2026-01-08	da_nop
9766	222	108	2026-01-08	da_nop
9767	222	109	2026-01-08	da_nop
9768	222	110	2026-01-08	da_nop
9769	223	67	2026-01-08	da_nop
9770	223	68	2026-01-08	da_nop
9771	223	69	2026-01-08	da_nop
9772	223	70	2026-01-08	tre_han
9773	223	71	2026-01-08	da_nop
9774	223	72	2026-01-08	tre_han
9775	223	73	2026-01-08	tre_han
9776	223	74	2026-01-08	da_nop
9777	223	75	2026-01-08	tre_han
9778	223	76	2026-01-08	da_nop
9779	223	77	2026-01-08	da_nop
9780	223	78	2026-01-08	da_nop
9781	223	79	2026-01-08	da_nop
9782	223	80	2026-01-08	da_nop
9783	223	81	2026-01-08	da_nop
9784	223	82	2026-01-08	da_nop
9785	223	83	2026-01-08	da_nop
9786	223	84	2026-01-08	da_nop
9787	223	85	2026-01-08	da_nop
9788	223	86	2026-01-08	tre_han
9789	223	87	2026-01-08	da_nop
9790	223	88	2026-01-08	da_nop
9791	223	89	2026-01-08	da_nop
9792	223	90	2026-01-08	da_nop
9793	223	91	2026-01-08	da_nop
9794	223	92	2026-01-08	da_nop
9795	223	93	2026-01-08	da_nop
9796	223	94	2026-01-08	da_nop
9797	223	95	2026-01-08	da_nop
9798	223	96	2026-01-08	da_nop
9799	223	97	2026-01-08	da_nop
9800	223	98	2026-01-08	da_nop
9801	223	99	2026-01-08	tre_han
9802	223	100	2026-01-08	da_nop
9803	223	101	2026-01-08	da_nop
9804	223	102	2026-01-08	da_nop
9805	223	103	2026-01-08	da_nop
9806	223	104	2026-01-08	tre_han
9807	223	105	2026-01-08	da_nop
9808	223	106	2026-01-08	da_nop
9809	223	107	2026-01-08	tre_han
9810	223	108	2026-01-08	da_nop
9811	223	109	2026-01-08	da_nop
9812	223	110	2026-01-08	tre_han
9813	224	67	2026-01-08	da_nop
9814	224	68	2026-01-08	da_nop
9815	224	69	2026-01-08	da_nop
9816	224	70	2026-01-08	tre_han
9817	224	71	2026-01-08	da_nop
9818	224	72	2026-01-08	da_nop
9819	224	73	2026-01-08	tre_han
9820	224	74	2026-01-08	da_nop
9821	224	75	2026-01-08	da_nop
9822	224	76	2026-01-08	da_nop
9823	224	77	2026-01-08	da_nop
9824	224	78	2026-01-08	da_nop
9825	224	79	2026-01-08	tre_han
9826	224	80	2026-01-08	da_nop
9827	224	81	2026-01-08	da_nop
9828	224	82	2026-01-08	da_nop
9829	224	83	2026-01-08	da_nop
9830	224	84	2026-01-08	da_nop
9831	224	85	2026-01-08	da_nop
9832	224	86	2026-01-08	da_nop
9833	224	87	2026-01-08	da_nop
9834	224	88	2026-01-08	da_nop
9835	224	89	2026-01-08	da_nop
9836	224	90	2026-01-08	da_nop
9837	224	91	2026-01-08	da_nop
9838	224	92	2026-01-08	da_nop
9839	224	93	2026-01-08	da_nop
9840	224	94	2026-01-08	da_nop
9841	224	95	2026-01-08	da_nop
9842	224	96	2026-01-08	tre_han
9843	224	97	2026-01-08	da_nop
9844	224	98	2026-01-08	da_nop
9845	224	99	2026-01-08	tre_han
9846	224	100	2026-01-08	da_nop
9847	224	101	2026-01-08	da_nop
9848	224	102	2026-01-08	da_nop
9849	224	103	2026-01-08	da_nop
9850	224	104	2026-01-08	da_nop
9851	224	105	2026-01-08	da_nop
9852	224	106	2026-01-08	da_nop
9853	224	107	2026-01-08	da_nop
9854	224	108	2026-01-08	da_nop
9855	224	109	2026-01-08	da_nop
9856	224	110	2026-01-08	tre_han
9857	225	67	2026-01-08	da_nop
9858	225	68	2026-01-08	da_nop
9859	225	69	2026-01-08	da_nop
9860	225	70	2026-01-08	da_nop
9861	225	71	2026-01-08	da_nop
9862	225	72	2026-01-08	tre_han
9863	225	73	2026-01-08	da_nop
9864	225	74	2026-01-08	da_nop
9865	225	75	2026-01-08	tre_han
9866	225	76	2026-01-08	da_nop
9867	225	77	2026-01-08	da_nop
9868	225	78	2026-01-08	da_nop
9869	225	79	2026-01-08	da_nop
9870	225	80	2026-01-08	da_nop
9871	225	81	2026-01-08	da_nop
9872	225	82	2026-01-08	da_nop
9873	225	83	2026-01-08	tre_han
9874	225	84	2026-01-08	da_nop
9875	225	85	2026-01-08	da_nop
9876	225	86	2026-01-08	da_nop
9877	225	87	2026-01-08	da_nop
9878	225	88	2026-01-08	da_nop
9879	225	89	2026-01-08	da_nop
9880	225	90	2026-01-08	da_nop
9881	225	91	2026-01-08	tre_han
9882	225	92	2026-01-08	da_nop
9883	225	93	2026-01-08	da_nop
9884	225	94	2026-01-08	da_nop
9885	225	95	2026-01-08	da_nop
9886	225	96	2026-01-08	tre_han
9887	225	97	2026-01-08	tre_han
9888	225	98	2026-01-08	tre_han
9889	225	99	2026-01-08	da_nop
9890	225	100	2026-01-08	da_nop
9891	225	101	2026-01-08	da_nop
9892	225	102	2026-01-08	da_nop
9893	225	103	2026-01-08	da_nop
9894	225	104	2026-01-08	da_nop
9895	225	105	2026-01-08	da_nop
9896	225	106	2026-01-08	da_nop
9897	225	107	2026-01-08	da_nop
9898	225	108	2026-01-08	da_nop
9899	225	109	2026-01-08	da_nop
9900	225	110	2026-01-08	tre_han
9901	226	67	2026-01-08	tre_han
9902	226	68	2026-01-08	da_nop
9903	226	69	2026-01-08	tre_han
9904	226	70	2026-01-08	da_nop
9905	226	71	2026-01-08	da_nop
9906	226	72	2026-01-08	da_nop
9907	226	73	2026-01-08	da_nop
9908	226	74	2026-01-08	da_nop
9909	226	75	2026-01-08	da_nop
9910	226	76	2026-01-08	da_nop
9911	226	77	2026-01-08	da_nop
9912	226	78	2026-01-08	da_nop
9913	226	79	2026-01-08	da_nop
9914	226	80	2026-01-08	tre_han
9915	226	81	2026-01-08	da_nop
9916	226	82	2026-01-08	tre_han
9917	226	83	2026-01-08	tre_han
9918	226	84	2026-01-08	da_nop
9919	226	85	2026-01-08	da_nop
9920	226	86	2026-01-08	da_nop
9921	226	87	2026-01-08	da_nop
9922	226	88	2026-01-08	da_nop
9923	226	89	2026-01-08	da_nop
9924	226	90	2026-01-08	da_nop
9925	226	91	2026-01-08	da_nop
9926	226	92	2026-01-08	da_nop
9927	226	93	2026-01-08	tre_han
9928	226	94	2026-01-08	da_nop
9929	226	95	2026-01-08	da_nop
9930	226	96	2026-01-08	da_nop
9931	226	97	2026-01-08	da_nop
9932	226	98	2026-01-08	da_nop
9933	226	99	2026-01-08	tre_han
9934	226	100	2026-01-08	tre_han
9935	226	101	2026-01-08	da_nop
9936	226	102	2026-01-08	tre_han
9937	226	103	2026-01-08	da_nop
9938	226	104	2026-01-08	da_nop
9939	226	105	2026-01-08	da_nop
9940	226	106	2026-01-08	da_nop
9941	226	107	2026-01-08	da_nop
9942	226	108	2026-01-08	da_nop
9943	226	109	2026-01-08	da_nop
9944	226	110	2026-01-08	da_nop
9945	227	67	2026-01-08	da_nop
9946	227	68	2026-01-08	da_nop
9947	227	69	2026-01-08	da_nop
9948	227	70	2026-01-08	da_nop
9949	227	71	2026-01-08	da_nop
9950	227	72	2026-01-08	tre_han
9951	227	73	2026-01-08	da_nop
9952	227	74	2026-01-08	da_nop
9953	227	75	2026-01-08	da_nop
9954	227	76	2026-01-08	tre_han
9955	227	77	2026-01-08	da_nop
9956	227	78	2026-01-08	da_nop
9957	227	79	2026-01-08	tre_han
9958	227	80	2026-01-08	da_nop
9959	227	81	2026-01-08	da_nop
9960	227	82	2026-01-08	da_nop
9961	227	83	2026-01-08	da_nop
9962	227	84	2026-01-08	da_nop
9963	227	85	2026-01-08	da_nop
9964	227	86	2026-01-08	tre_han
9965	227	87	2026-01-08	da_nop
9966	227	88	2026-01-08	da_nop
9967	227	89	2026-01-08	da_nop
9968	227	90	2026-01-08	da_nop
9969	227	91	2026-01-08	da_nop
9970	227	92	2026-01-08	da_nop
9971	227	93	2026-01-08	da_nop
9972	227	94	2026-01-08	da_nop
9973	227	95	2026-01-08	da_nop
9974	227	96	2026-01-08	da_nop
9975	227	97	2026-01-08	da_nop
9976	227	98	2026-01-08	da_nop
9977	227	99	2026-01-08	da_nop
9978	227	100	2026-01-08	da_nop
9979	227	101	2026-01-08	da_nop
9980	227	102	2026-01-08	tre_han
9981	227	103	2026-01-08	tre_han
9982	227	104	2026-01-08	da_nop
9983	227	105	2026-01-08	da_nop
9984	227	106	2026-01-08	da_nop
9985	227	107	2026-01-08	da_nop
9986	227	108	2026-01-08	da_nop
9987	227	109	2026-01-08	da_nop
9988	227	110	2026-01-08	tre_han
9989	228	67	2026-01-08	da_nop
9990	228	68	2026-01-08	tre_han
9991	228	69	2026-01-08	da_nop
9992	228	70	2026-01-08	da_nop
9993	228	71	2026-01-08	da_nop
9994	228	72	2026-01-08	da_nop
9995	228	73	2026-01-08	da_nop
9996	228	74	2026-01-08	da_nop
9997	228	75	2026-01-08	da_nop
9998	228	76	2026-01-08	tre_han
9999	228	77	2026-01-08	da_nop
10000	228	78	2026-01-08	da_nop
10001	228	79	2026-01-08	tre_han
10002	228	80	2026-01-08	tre_han
10003	228	81	2026-01-08	da_nop
10004	228	82	2026-01-08	da_nop
10005	228	83	2026-01-08	da_nop
10006	228	84	2026-01-08	tre_han
10007	228	85	2026-01-08	da_nop
10008	228	86	2026-01-08	da_nop
10009	228	87	2026-01-08	da_nop
10010	228	88	2026-01-08	da_nop
10011	228	89	2026-01-08	da_nop
10012	228	90	2026-01-08	da_nop
10013	228	91	2026-01-08	da_nop
10014	228	92	2026-01-08	da_nop
10015	228	93	2026-01-08	da_nop
10016	228	94	2026-01-08	da_nop
10017	228	95	2026-01-08	da_nop
10018	228	96	2026-01-08	da_nop
10019	228	97	2026-01-08	tre_han
10020	228	98	2026-01-08	da_nop
10021	228	99	2026-01-08	da_nop
10022	228	100	2026-01-08	da_nop
10023	228	101	2026-01-08	da_nop
10024	228	102	2026-01-08	da_nop
10025	228	103	2026-01-08	da_nop
10026	228	104	2026-01-08	da_nop
10027	228	105	2026-01-08	da_nop
10028	228	106	2026-01-08	da_nop
10029	228	107	2026-01-08	tre_han
10030	228	108	2026-01-08	da_nop
10031	228	109	2026-01-08	da_nop
10032	228	110	2026-01-08	da_nop
10033	229	67	2026-01-08	da_nop
10034	229	68	2026-01-08	tre_han
10035	229	69	2026-01-08	da_nop
10036	229	70	2026-01-08	da_nop
10037	229	71	2026-01-08	da_nop
10038	229	72	2026-01-08	tre_han
10039	229	73	2026-01-08	da_nop
10040	229	74	2026-01-08	da_nop
10041	229	75	2026-01-08	da_nop
10042	229	76	2026-01-08	da_nop
10043	229	77	2026-01-08	da_nop
10044	229	78	2026-01-08	da_nop
10045	229	79	2026-01-08	da_nop
10046	229	80	2026-01-08	da_nop
10047	229	81	2026-01-08	da_nop
10048	229	82	2026-01-08	tre_han
10049	229	83	2026-01-08	da_nop
10050	229	84	2026-01-08	da_nop
10051	229	85	2026-01-08	da_nop
10052	229	86	2026-01-08	da_nop
10053	229	87	2026-01-08	da_nop
10054	229	88	2026-01-08	da_nop
10055	229	89	2026-01-08	da_nop
10056	229	90	2026-01-08	da_nop
10057	229	91	2026-01-08	da_nop
10058	229	92	2026-01-08	da_nop
10059	229	93	2026-01-08	da_nop
10060	229	94	2026-01-08	tre_han
10061	229	95	2026-01-08	da_nop
10062	229	96	2026-01-08	da_nop
10063	229	97	2026-01-08	da_nop
10064	229	98	2026-01-08	da_nop
10065	229	99	2026-01-08	da_nop
10066	229	100	2026-01-08	da_nop
10067	229	101	2026-01-08	da_nop
10068	229	102	2026-01-08	da_nop
10069	229	103	2026-01-08	tre_han
10070	229	104	2026-01-08	da_nop
10071	229	105	2026-01-08	da_nop
10072	229	106	2026-01-08	tre_han
10073	229	107	2026-01-08	da_nop
10074	229	108	2026-01-08	da_nop
10075	229	109	2026-01-08	da_nop
10076	229	110	2026-01-08	tre_han
10077	230	67	2026-01-08	da_nop
10078	230	68	2026-01-08	da_nop
10079	230	69	2026-01-08	da_nop
10080	230	70	2026-01-08	da_nop
10081	230	71	2026-01-08	tre_han
10082	230	72	2026-01-08	da_nop
10083	230	73	2026-01-08	da_nop
10084	230	74	2026-01-08	da_nop
10085	230	75	2026-01-08	da_nop
10086	230	76	2026-01-08	tre_han
10087	230	77	2026-01-08	da_nop
10088	230	78	2026-01-08	da_nop
10089	230	79	2026-01-08	da_nop
10090	230	80	2026-01-08	da_nop
10091	230	81	2026-01-08	da_nop
10092	230	82	2026-01-08	tre_han
10093	230	83	2026-01-08	da_nop
10094	230	84	2026-01-08	tre_han
10095	230	85	2026-01-08	da_nop
10096	230	86	2026-01-08	da_nop
10097	230	87	2026-01-08	da_nop
10098	230	88	2026-01-08	da_nop
10099	230	89	2026-01-08	da_nop
10100	230	90	2026-01-08	da_nop
10101	230	91	2026-01-08	da_nop
10102	230	92	2026-01-08	da_nop
10103	230	93	2026-01-08	da_nop
10104	230	94	2026-01-08	da_nop
10105	230	95	2026-01-08	da_nop
10106	230	96	2026-01-08	da_nop
10107	230	97	2026-01-08	da_nop
10108	230	98	2026-01-08	da_nop
10109	230	99	2026-01-08	da_nop
10110	230	100	2026-01-08	da_nop
10111	230	101	2026-01-08	da_nop
10112	230	102	2026-01-08	tre_han
10113	230	103	2026-01-08	tre_han
10114	230	104	2026-01-08	da_nop
10115	230	105	2026-01-08	da_nop
10116	230	106	2026-01-08	da_nop
10117	230	107	2026-01-08	da_nop
10118	230	108	2026-01-08	da_nop
10119	230	109	2026-01-08	da_nop
10120	230	110	2026-01-08	tre_han
10121	231	67	2026-01-08	da_nop
10122	231	68	2026-01-08	da_nop
10123	231	69	2026-01-08	tre_han
10124	231	70	2026-01-08	da_nop
10125	231	71	2026-01-08	da_nop
10126	231	72	2026-01-08	da_nop
10127	231	73	2026-01-08	da_nop
10128	231	74	2026-01-08	da_nop
10129	231	75	2026-01-08	da_nop
10130	231	76	2026-01-08	da_nop
10131	231	77	2026-01-08	da_nop
10132	231	78	2026-01-08	da_nop
10133	231	79	2026-01-08	da_nop
10134	231	80	2026-01-08	da_nop
10135	231	81	2026-01-08	tre_han
10136	231	82	2026-01-08	da_nop
10137	231	83	2026-01-08	da_nop
10138	231	84	2026-01-08	da_nop
10139	231	85	2026-01-08	da_nop
10140	231	86	2026-01-08	tre_han
10141	231	87	2026-01-08	da_nop
10142	231	88	2026-01-08	da_nop
10143	231	89	2026-01-08	tre_han
10144	231	90	2026-01-08	da_nop
10145	231	91	2026-01-08	da_nop
10146	231	92	2026-01-08	da_nop
10147	231	93	2026-01-08	da_nop
10148	231	94	2026-01-08	da_nop
10149	231	95	2026-01-08	da_nop
10150	231	96	2026-01-08	da_nop
10151	231	97	2026-01-08	da_nop
10152	231	98	2026-01-08	da_nop
10153	231	99	2026-01-08	da_nop
10154	231	100	2026-01-08	da_nop
10155	231	101	2026-01-08	tre_han
10156	231	102	2026-01-08	tre_han
10157	231	103	2026-01-08	da_nop
10158	231	104	2026-01-08	da_nop
10159	231	105	2026-01-08	da_nop
10160	231	106	2026-01-08	da_nop
10161	231	107	2026-01-08	da_nop
10162	231	108	2026-01-08	da_nop
10163	231	109	2026-01-08	da_nop
10164	231	110	2026-01-08	da_nop
10165	232	67	2026-01-08	da_nop
10166	232	68	2026-01-08	da_nop
10167	232	69	2026-01-08	da_nop
10168	232	70	2026-01-08	da_nop
10169	232	71	2026-01-08	da_nop
10170	232	72	2026-01-08	da_nop
10171	232	73	2026-01-08	da_nop
10172	232	74	2026-01-08	da_nop
10173	232	75	2026-01-08	da_nop
10174	232	76	2026-01-08	da_nop
10175	232	77	2026-01-08	da_nop
10176	232	78	2026-01-08	da_nop
10177	232	79	2026-01-08	tre_han
10178	232	80	2026-01-08	da_nop
10179	232	81	2026-01-08	tre_han
10180	232	82	2026-01-08	da_nop
10181	232	83	2026-01-08	da_nop
10182	232	84	2026-01-08	da_nop
10183	232	85	2026-01-08	da_nop
10184	232	86	2026-01-08	da_nop
10185	232	87	2026-01-08	da_nop
10186	232	88	2026-01-08	da_nop
10187	232	89	2026-01-08	da_nop
10188	232	90	2026-01-08	da_nop
10189	232	91	2026-01-08	da_nop
10190	232	92	2026-01-08	da_nop
10191	232	93	2026-01-08	da_nop
10192	232	94	2026-01-08	da_nop
10193	232	95	2026-01-08	da_nop
10194	232	96	2026-01-08	tre_han
10195	232	97	2026-01-08	da_nop
10196	232	98	2026-01-08	da_nop
10197	232	99	2026-01-08	da_nop
10198	232	100	2026-01-08	da_nop
10199	232	101	2026-01-08	da_nop
10200	232	102	2026-01-08	da_nop
10201	232	103	2026-01-08	da_nop
10202	232	104	2026-01-08	da_nop
10203	232	105	2026-01-08	da_nop
10204	232	106	2026-01-08	da_nop
10205	232	107	2026-01-08	da_nop
10206	232	108	2026-01-08	da_nop
10207	232	109	2026-01-08	da_nop
10208	232	110	2026-01-08	da_nop
10209	233	67	2026-01-08	da_nop
10210	233	68	2026-01-08	da_nop
10211	233	69	2026-01-08	da_nop
10212	233	70	2026-01-08	tre_han
10213	233	71	2026-01-08	tre_han
10214	233	72	2026-01-08	tre_han
10215	233	73	2026-01-08	da_nop
10216	233	74	2026-01-08	da_nop
10217	233	75	2026-01-08	da_nop
10218	233	76	2026-01-08	tre_han
10219	233	77	2026-01-08	da_nop
10220	233	78	2026-01-08	da_nop
10221	233	79	2026-01-08	da_nop
10222	233	80	2026-01-08	da_nop
10223	233	81	2026-01-08	da_nop
10224	233	82	2026-01-08	tre_han
10225	233	83	2026-01-08	da_nop
10226	233	84	2026-01-08	tre_han
10227	233	85	2026-01-08	da_nop
10228	233	86	2026-01-08	da_nop
10229	233	87	2026-01-08	da_nop
10230	233	88	2026-01-08	da_nop
10231	233	89	2026-01-08	da_nop
10232	233	90	2026-01-08	da_nop
10233	233	91	2026-01-08	tre_han
10234	233	92	2026-01-08	da_nop
10235	233	93	2026-01-08	da_nop
10236	233	94	2026-01-08	da_nop
10237	233	95	2026-01-08	da_nop
10238	233	96	2026-01-08	da_nop
10239	233	97	2026-01-08	da_nop
10240	233	98	2026-01-08	tre_han
10241	233	99	2026-01-08	tre_han
10242	233	100	2026-01-08	tre_han
10243	233	101	2026-01-08	da_nop
10244	233	102	2026-01-08	da_nop
10245	233	103	2026-01-08	tre_han
10246	233	104	2026-01-08	da_nop
10247	233	105	2026-01-08	tre_han
10248	233	106	2026-01-08	da_nop
10249	233	107	2026-01-08	da_nop
10250	233	108	2026-01-08	da_nop
10251	233	109	2026-01-08	da_nop
10252	233	110	2026-01-08	da_nop
10253	234	67	2026-01-08	da_nop
10254	234	68	2026-01-08	da_nop
10255	234	69	2026-01-08	da_nop
10256	234	70	2026-01-08	da_nop
10257	234	71	2026-01-08	da_nop
10258	234	72	2026-01-08	da_nop
10259	234	73	2026-01-08	da_nop
10260	234	74	2026-01-08	tre_han
10261	234	75	2026-01-08	da_nop
10262	234	76	2026-01-08	tre_han
10263	234	77	2026-01-08	tre_han
10264	234	78	2026-01-08	da_nop
10265	234	79	2026-01-08	da_nop
10266	234	80	2026-01-08	da_nop
10267	234	81	2026-01-08	da_nop
10268	234	82	2026-01-08	tre_han
10269	234	83	2026-01-08	da_nop
10270	234	84	2026-01-08	da_nop
10271	234	85	2026-01-08	da_nop
10272	234	86	2026-01-08	da_nop
10273	234	87	2026-01-08	da_nop
10274	234	88	2026-01-08	tre_han
10275	234	89	2026-01-08	da_nop
10276	234	90	2026-01-08	da_nop
10277	234	91	2026-01-08	da_nop
10278	234	92	2026-01-08	da_nop
10279	234	93	2026-01-08	da_nop
10280	234	94	2026-01-08	tre_han
10281	234	95	2026-01-08	da_nop
10282	234	96	2026-01-08	da_nop
10283	234	97	2026-01-08	da_nop
10284	234	98	2026-01-08	tre_han
10285	234	99	2026-01-08	da_nop
10286	234	100	2026-01-08	da_nop
10287	234	101	2026-01-08	da_nop
10288	234	102	2026-01-08	tre_han
10289	234	103	2026-01-08	tre_han
10290	234	104	2026-01-08	tre_han
10291	234	105	2026-01-08	da_nop
10292	234	106	2026-01-08	da_nop
10293	234	107	2026-01-08	da_nop
10294	234	108	2026-01-08	da_nop
10295	234	109	2026-01-08	da_nop
10296	234	110	2026-01-08	da_nop
10297	235	67	2026-01-08	da_nop
10298	235	68	2026-01-08	da_nop
10299	235	69	2026-01-08	da_nop
10300	235	70	2026-01-08	da_nop
10301	235	71	2026-01-08	da_nop
10302	235	72	2026-01-08	da_nop
10303	235	73	2026-01-08	tre_han
10304	235	74	2026-01-08	da_nop
10305	235	75	2026-01-08	da_nop
10306	235	76	2026-01-08	da_nop
10307	235	77	2026-01-08	da_nop
10308	235	78	2026-01-08	da_nop
10309	235	79	2026-01-08	da_nop
10310	235	80	2026-01-08	da_nop
10311	235	81	2026-01-08	da_nop
10312	235	82	2026-01-08	tre_han
10313	235	83	2026-01-08	da_nop
10314	235	84	2026-01-08	da_nop
10315	235	85	2026-01-08	da_nop
10316	235	86	2026-01-08	da_nop
10317	235	87	2026-01-08	tre_han
10318	235	88	2026-01-08	da_nop
10319	235	89	2026-01-08	tre_han
10320	235	90	2026-01-08	da_nop
10321	235	91	2026-01-08	da_nop
10322	235	92	2026-01-08	da_nop
10323	235	93	2026-01-08	tre_han
10324	235	94	2026-01-08	da_nop
10325	235	95	2026-01-08	tre_han
10326	235	96	2026-01-08	da_nop
10327	235	97	2026-01-08	da_nop
10328	235	98	2026-01-08	da_nop
10329	235	99	2026-01-08	da_nop
10330	235	100	2026-01-08	da_nop
10331	235	101	2026-01-08	da_nop
10332	235	102	2026-01-08	tre_han
10333	235	103	2026-01-08	da_nop
10334	235	104	2026-01-08	da_nop
10335	235	105	2026-01-08	da_nop
10336	235	106	2026-01-08	tre_han
10337	235	107	2026-01-08	da_nop
10338	235	108	2026-01-08	tre_han
10339	235	109	2026-01-08	da_nop
10340	235	110	2026-01-08	da_nop
10341	236	67	2026-01-08	da_nop
10342	236	68	2026-01-08	da_nop
10343	236	69	2026-01-08	da_nop
10344	236	70	2026-01-08	da_nop
10345	236	71	2026-01-08	da_nop
10346	236	72	2026-01-08	da_nop
10347	236	73	2026-01-08	da_nop
10348	236	74	2026-01-08	da_nop
10349	236	75	2026-01-08	da_nop
10350	236	76	2026-01-08	tre_han
10351	236	77	2026-01-08	tre_han
10352	236	78	2026-01-08	da_nop
10353	236	79	2026-01-08	da_nop
10354	236	80	2026-01-08	tre_han
10355	236	81	2026-01-08	tre_han
10356	236	82	2026-01-08	da_nop
10357	236	83	2026-01-08	tre_han
10358	236	84	2026-01-08	da_nop
10359	236	85	2026-01-08	da_nop
10360	236	86	2026-01-08	da_nop
10361	236	87	2026-01-08	da_nop
10362	236	88	2026-01-08	tre_han
10363	236	89	2026-01-08	da_nop
10364	236	90	2026-01-08	da_nop
10365	236	91	2026-01-08	tre_han
10366	236	92	2026-01-08	da_nop
10367	236	93	2026-01-08	da_nop
10368	236	94	2026-01-08	da_nop
10369	236	95	2026-01-08	da_nop
10370	236	96	2026-01-08	da_nop
10371	236	97	2026-01-08	da_nop
10372	236	98	2026-01-08	da_nop
10373	236	99	2026-01-08	da_nop
10374	236	100	2026-01-08	da_nop
10375	236	101	2026-01-08	da_nop
10376	236	102	2026-01-08	da_nop
10377	236	103	2026-01-08	tre_han
10378	236	104	2026-01-08	tre_han
10379	236	105	2026-01-08	da_nop
10380	236	106	2026-01-08	da_nop
10381	236	107	2026-01-08	da_nop
10382	236	108	2026-01-08	da_nop
10383	236	109	2026-01-08	tre_han
10384	236	110	2026-01-08	da_nop
10385	237	67	2026-01-08	da_nop
10386	237	68	2026-01-08	tre_han
10387	237	69	2026-01-08	da_nop
10388	237	70	2026-01-08	tre_han
10389	237	71	2026-01-08	tre_han
10390	237	72	2026-01-08	da_nop
10391	237	73	2026-01-08	da_nop
10392	237	74	2026-01-08	da_nop
10393	237	75	2026-01-08	da_nop
10394	237	76	2026-01-08	da_nop
10395	237	77	2026-01-08	da_nop
10396	237	78	2026-01-08	da_nop
10397	237	79	2026-01-08	da_nop
10398	237	80	2026-01-08	da_nop
10399	237	81	2026-01-08	da_nop
10400	237	82	2026-01-08	da_nop
10401	237	83	2026-01-08	da_nop
10402	237	84	2026-01-08	da_nop
10403	237	85	2026-01-08	da_nop
10404	237	86	2026-01-08	da_nop
10405	237	87	2026-01-08	da_nop
10406	237	88	2026-01-08	da_nop
10407	237	89	2026-01-08	da_nop
10408	237	90	2026-01-08	da_nop
10409	237	91	2026-01-08	da_nop
10410	237	92	2026-01-08	tre_han
10411	237	93	2026-01-08	da_nop
10412	237	94	2026-01-08	da_nop
10413	237	95	2026-01-08	da_nop
10414	237	96	2026-01-08	da_nop
10415	237	97	2026-01-08	da_nop
10416	237	98	2026-01-08	tre_han
10417	237	99	2026-01-08	da_nop
10418	237	100	2026-01-08	da_nop
10419	237	101	2026-01-08	da_nop
10420	237	102	2026-01-08	da_nop
10421	237	103	2026-01-08	da_nop
10422	237	104	2026-01-08	da_nop
10423	237	105	2026-01-08	da_nop
10424	237	106	2026-01-08	tre_han
10425	237	107	2026-01-08	da_nop
10426	237	108	2026-01-08	da_nop
10427	237	109	2026-01-08	da_nop
10428	237	110	2026-01-08	da_nop
10429	238	67	2026-01-08	da_nop
10430	238	68	2026-01-08	da_nop
10431	238	69	2026-01-08	da_nop
10432	238	70	2026-01-08	da_nop
10433	238	71	2026-01-08	da_nop
10434	238	72	2026-01-08	da_nop
10435	238	73	2026-01-08	da_nop
10436	238	74	2026-01-08	da_nop
10437	238	75	2026-01-08	tre_han
10438	238	76	2026-01-08	da_nop
10439	238	77	2026-01-08	da_nop
10440	238	78	2026-01-08	da_nop
10441	238	79	2026-01-08	da_nop
10442	238	80	2026-01-08	da_nop
10443	238	81	2026-01-08	tre_han
10444	238	82	2026-01-08	tre_han
10445	238	83	2026-01-08	tre_han
10446	238	84	2026-01-08	tre_han
10447	238	85	2026-01-08	da_nop
10448	238	86	2026-01-08	da_nop
10449	238	87	2026-01-08	da_nop
10450	238	88	2026-01-08	da_nop
10451	238	89	2026-01-08	da_nop
10452	238	90	2026-01-08	da_nop
10453	238	91	2026-01-08	da_nop
10454	238	92	2026-01-08	da_nop
10455	238	93	2026-01-08	da_nop
10456	238	94	2026-01-08	da_nop
10457	238	95	2026-01-08	da_nop
10458	238	96	2026-01-08	da_nop
10459	238	97	2026-01-08	da_nop
10460	238	98	2026-01-08	da_nop
10461	238	99	2026-01-08	da_nop
10462	238	100	2026-01-08	da_nop
10463	238	101	2026-01-08	da_nop
10464	238	102	2026-01-08	da_nop
10465	238	103	2026-01-08	da_nop
10466	238	104	2026-01-08	tre_han
10467	238	105	2026-01-08	da_nop
10468	238	106	2026-01-08	da_nop
10469	238	107	2026-01-08	tre_han
10470	238	108	2026-01-08	da_nop
10471	238	109	2026-01-08	tre_han
10472	238	110	2026-01-08	tre_han
10473	239	67	2026-01-08	tre_han
10474	239	68	2026-01-08	tre_han
10475	239	69	2026-01-08	da_nop
10476	239	70	2026-01-08	da_nop
10477	239	71	2026-01-08	da_nop
10478	239	72	2026-01-08	da_nop
10479	239	73	2026-01-08	da_nop
10480	239	74	2026-01-08	da_nop
10481	239	75	2026-01-08	da_nop
10482	239	76	2026-01-08	da_nop
10483	239	77	2026-01-08	da_nop
10484	239	78	2026-01-08	tre_han
10485	239	79	2026-01-08	da_nop
10486	239	80	2026-01-08	da_nop
10487	239	81	2026-01-08	da_nop
10488	239	82	2026-01-08	da_nop
10489	239	83	2026-01-08	da_nop
10490	239	84	2026-01-08	da_nop
10491	239	85	2026-01-08	da_nop
10492	239	86	2026-01-08	da_nop
10493	239	87	2026-01-08	da_nop
10494	239	88	2026-01-08	tre_han
10495	239	89	2026-01-08	da_nop
10496	239	90	2026-01-08	da_nop
10497	239	91	2026-01-08	da_nop
10498	239	92	2026-01-08	da_nop
10499	239	93	2026-01-08	da_nop
10500	239	94	2026-01-08	da_nop
10501	239	95	2026-01-08	da_nop
10502	239	96	2026-01-08	tre_han
10503	239	97	2026-01-08	tre_han
10504	239	98	2026-01-08	da_nop
10505	239	99	2026-01-08	da_nop
10506	239	100	2026-01-08	da_nop
10507	239	101	2026-01-08	da_nop
10508	239	102	2026-01-08	da_nop
10509	239	103	2026-01-08	da_nop
10510	239	104	2026-01-08	da_nop
10511	239	105	2026-01-08	da_nop
10512	239	106	2026-01-08	da_nop
10513	239	107	2026-01-08	da_nop
10514	239	108	2026-01-08	da_nop
10515	239	109	2026-01-08	da_nop
10516	239	110	2026-01-08	da_nop
10517	240	67	2026-01-08	da_nop
10518	240	68	2026-01-08	tre_han
10519	240	69	2026-01-08	tre_han
10520	240	70	2026-01-08	da_nop
10521	240	71	2026-01-08	da_nop
10522	240	72	2026-01-08	tre_han
10523	240	73	2026-01-08	da_nop
10524	240	74	2026-01-08	da_nop
10525	240	75	2026-01-08	da_nop
10526	240	76	2026-01-08	da_nop
10527	240	77	2026-01-08	tre_han
10528	240	78	2026-01-08	da_nop
10529	240	79	2026-01-08	da_nop
10530	240	80	2026-01-08	da_nop
10531	240	81	2026-01-08	da_nop
10532	240	82	2026-01-08	da_nop
10533	240	83	2026-01-08	da_nop
10534	240	84	2026-01-08	da_nop
10535	240	85	2026-01-08	da_nop
10536	240	86	2026-01-08	da_nop
10537	240	87	2026-01-08	da_nop
10538	240	88	2026-01-08	da_nop
10539	240	89	2026-01-08	tre_han
10540	240	90	2026-01-08	da_nop
10541	240	91	2026-01-08	tre_han
10542	240	92	2026-01-08	tre_han
10543	240	93	2026-01-08	da_nop
10544	240	94	2026-01-08	da_nop
10545	240	95	2026-01-08	tre_han
10546	240	96	2026-01-08	da_nop
10547	240	97	2026-01-08	da_nop
10548	240	98	2026-01-08	da_nop
10549	240	99	2026-01-08	tre_han
10550	240	100	2026-01-08	da_nop
10551	240	101	2026-01-08	da_nop
10552	240	102	2026-01-08	da_nop
10553	240	103	2026-01-08	tre_han
10554	240	104	2026-01-08	da_nop
10555	240	105	2026-01-08	da_nop
10556	240	106	2026-01-08	da_nop
10557	240	107	2026-01-08	da_nop
10558	240	108	2026-01-08	tre_han
10559	240	109	2026-01-08	da_nop
10560	240	110	2026-01-08	da_nop
10561	241	67	2026-01-08	da_nop
10562	241	68	2026-01-08	da_nop
10563	241	69	2026-01-08	da_nop
10564	241	70	2026-01-08	da_nop
10565	241	71	2026-01-08	da_nop
10566	241	72	2026-01-08	tre_han
10567	241	73	2026-01-08	da_nop
10568	241	74	2026-01-08	da_nop
10569	241	75	2026-01-08	da_nop
10570	241	76	2026-01-08	tre_han
10571	241	77	2026-01-08	da_nop
10572	241	78	2026-01-08	tre_han
10573	241	79	2026-01-08	da_nop
10574	241	80	2026-01-08	tre_han
10575	241	81	2026-01-08	da_nop
10576	241	82	2026-01-08	da_nop
10577	241	83	2026-01-08	da_nop
10578	241	84	2026-01-08	da_nop
10579	241	85	2026-01-08	da_nop
10580	241	86	2026-01-08	da_nop
10581	241	87	2026-01-08	tre_han
10582	241	88	2026-01-08	da_nop
10583	241	89	2026-01-08	da_nop
10584	241	90	2026-01-08	tre_han
10585	241	91	2026-01-08	da_nop
10586	241	92	2026-01-08	da_nop
10587	241	93	2026-01-08	da_nop
10588	241	94	2026-01-08	da_nop
10589	241	95	2026-01-08	tre_han
10590	241	96	2026-01-08	da_nop
10591	241	97	2026-01-08	da_nop
10592	241	98	2026-01-08	da_nop
10593	241	99	2026-01-08	da_nop
10594	241	100	2026-01-08	da_nop
10595	241	101	2026-01-08	da_nop
10596	241	102	2026-01-08	da_nop
10597	241	103	2026-01-08	da_nop
10598	241	104	2026-01-08	da_nop
10599	241	105	2026-01-08	da_nop
10600	241	106	2026-01-08	da_nop
10601	241	107	2026-01-08	da_nop
10602	241	108	2026-01-08	da_nop
10603	241	109	2026-01-08	da_nop
10604	241	110	2026-01-08	da_nop
10605	242	67	2026-01-08	da_nop
10606	242	68	2026-01-08	da_nop
10607	242	69	2026-01-08	da_nop
10608	242	70	2026-01-08	da_nop
10609	242	71	2026-01-08	da_nop
10610	242	72	2026-01-08	da_nop
10611	242	73	2026-01-08	tre_han
10612	242	74	2026-01-08	tre_han
10613	242	75	2026-01-08	da_nop
10614	242	76	2026-01-08	da_nop
10615	242	77	2026-01-08	da_nop
10616	242	78	2026-01-08	da_nop
10617	242	79	2026-01-08	tre_han
10618	242	80	2026-01-08	da_nop
10619	242	81	2026-01-08	da_nop
10620	242	82	2026-01-08	da_nop
10621	242	83	2026-01-08	da_nop
10622	242	84	2026-01-08	da_nop
10623	242	85	2026-01-08	da_nop
10624	242	86	2026-01-08	tre_han
10625	242	87	2026-01-08	da_nop
10626	242	88	2026-01-08	tre_han
10627	242	89	2026-01-08	da_nop
10628	242	90	2026-01-08	da_nop
10629	242	91	2026-01-08	da_nop
10630	242	92	2026-01-08	tre_han
10631	242	93	2026-01-08	da_nop
10632	242	94	2026-01-08	da_nop
10633	242	95	2026-01-08	da_nop
10634	242	96	2026-01-08	da_nop
10635	242	97	2026-01-08	da_nop
10636	242	98	2026-01-08	tre_han
10637	242	99	2026-01-08	da_nop
10638	242	100	2026-01-08	da_nop
10639	242	101	2026-01-08	da_nop
10640	242	102	2026-01-08	da_nop
10641	242	103	2026-01-08	tre_han
10642	242	104	2026-01-08	tre_han
10643	242	105	2026-01-08	da_nop
10644	242	106	2026-01-08	da_nop
10645	242	107	2026-01-08	da_nop
10646	242	108	2026-01-08	tre_han
10647	242	109	2026-01-08	da_nop
10648	242	110	2026-01-08	da_nop
10649	243	67	2026-01-08	da_nop
10650	243	68	2026-01-08	da_nop
10651	243	69	2026-01-08	da_nop
10652	243	70	2026-01-08	da_nop
10653	243	71	2026-01-08	tre_han
10654	243	72	2026-01-08	da_nop
10655	243	73	2026-01-08	da_nop
10656	243	74	2026-01-08	da_nop
10657	243	75	2026-01-08	tre_han
10658	243	76	2026-01-08	da_nop
10659	243	77	2026-01-08	tre_han
10660	243	78	2026-01-08	da_nop
10661	243	79	2026-01-08	da_nop
10662	243	80	2026-01-08	tre_han
10663	243	81	2026-01-08	da_nop
10664	243	82	2026-01-08	da_nop
10665	243	83	2026-01-08	tre_han
10666	243	84	2026-01-08	da_nop
10667	243	85	2026-01-08	tre_han
10668	243	86	2026-01-08	da_nop
10669	243	87	2026-01-08	da_nop
10670	243	88	2026-01-08	tre_han
10671	243	89	2026-01-08	da_nop
10672	243	90	2026-01-08	tre_han
10673	243	91	2026-01-08	da_nop
10674	243	92	2026-01-08	da_nop
10675	243	93	2026-01-08	da_nop
10676	243	94	2026-01-08	da_nop
10677	243	95	2026-01-08	tre_han
10678	243	96	2026-01-08	tre_han
10679	243	97	2026-01-08	da_nop
10680	243	98	2026-01-08	da_nop
10681	243	99	2026-01-08	da_nop
10682	243	100	2026-01-08	da_nop
10683	243	101	2026-01-08	da_nop
10684	243	102	2026-01-08	da_nop
10685	243	103	2026-01-08	tre_han
10686	243	104	2026-01-08	da_nop
10687	243	105	2026-01-08	da_nop
10688	243	106	2026-01-08	da_nop
10689	243	107	2026-01-08	tre_han
10690	243	108	2026-01-08	tre_han
10691	243	109	2026-01-08	da_nop
10692	243	110	2026-01-08	da_nop
10693	244	67	2026-01-08	tre_han
10694	244	68	2026-01-08	da_nop
10695	244	69	2026-01-08	da_nop
10696	244	70	2026-01-08	da_nop
10697	244	71	2026-01-08	da_nop
10698	244	72	2026-01-08	da_nop
10699	244	73	2026-01-08	da_nop
10700	244	74	2026-01-08	da_nop
10701	244	75	2026-01-08	da_nop
10702	244	76	2026-01-08	tre_han
10703	244	77	2026-01-08	da_nop
10704	244	78	2026-01-08	da_nop
10705	244	79	2026-01-08	da_nop
10706	244	80	2026-01-08	da_nop
10707	244	81	2026-01-08	da_nop
10708	244	82	2026-01-08	da_nop
10709	244	83	2026-01-08	da_nop
10710	244	84	2026-01-08	da_nop
10711	244	85	2026-01-08	da_nop
10712	244	86	2026-01-08	tre_han
10713	244	87	2026-01-08	da_nop
10714	244	88	2026-01-08	da_nop
10715	244	89	2026-01-08	da_nop
10716	244	90	2026-01-08	tre_han
10717	244	91	2026-01-08	da_nop
10718	244	92	2026-01-08	tre_han
10719	244	93	2026-01-08	da_nop
10720	244	94	2026-01-08	da_nop
10721	244	95	2026-01-08	da_nop
10722	244	96	2026-01-08	da_nop
10723	244	97	2026-01-08	da_nop
10724	244	98	2026-01-08	tre_han
10725	244	99	2026-01-08	da_nop
10726	244	100	2026-01-08	da_nop
10727	244	101	2026-01-08	tre_han
10728	244	102	2026-01-08	da_nop
10729	244	103	2026-01-08	da_nop
10730	244	104	2026-01-08	da_nop
10731	244	105	2026-01-08	da_nop
10732	244	106	2026-01-08	tre_han
10733	244	107	2026-01-08	da_nop
10734	244	108	2026-01-08	da_nop
10735	244	109	2026-01-08	da_nop
10736	244	110	2026-01-08	tre_han
10737	245	67	2026-01-08	da_nop
10738	245	68	2026-01-08	da_nop
10739	245	69	2026-01-08	tre_han
10740	245	70	2026-01-08	da_nop
10741	245	71	2026-01-08	tre_han
10742	245	72	2026-01-08	da_nop
10743	245	73	2026-01-08	da_nop
10744	245	74	2026-01-08	da_nop
10745	245	75	2026-01-08	tre_han
10746	245	76	2026-01-08	da_nop
10747	245	77	2026-01-08	da_nop
10748	245	78	2026-01-08	da_nop
10749	245	79	2026-01-08	da_nop
10750	245	80	2026-01-08	da_nop
10751	245	81	2026-01-08	da_nop
10752	245	82	2026-01-08	da_nop
10753	245	83	2026-01-08	da_nop
10754	245	84	2026-01-08	tre_han
10755	245	85	2026-01-08	da_nop
10756	245	86	2026-01-08	da_nop
10757	245	87	2026-01-08	da_nop
10758	245	88	2026-01-08	da_nop
10759	245	89	2026-01-08	da_nop
10760	245	90	2026-01-08	da_nop
10761	245	91	2026-01-08	da_nop
10762	245	92	2026-01-08	da_nop
10763	245	93	2026-01-08	tre_han
10764	245	94	2026-01-08	da_nop
10765	245	95	2026-01-08	tre_han
10766	245	96	2026-01-08	da_nop
10767	245	97	2026-01-08	da_nop
10768	245	98	2026-01-08	tre_han
10769	245	99	2026-01-08	da_nop
10770	245	100	2026-01-08	da_nop
10771	245	101	2026-01-08	da_nop
10772	245	102	2026-01-08	da_nop
10773	245	103	2026-01-08	da_nop
10774	245	104	2026-01-08	da_nop
10775	245	105	2026-01-08	da_nop
10776	245	106	2026-01-08	tre_han
10777	245	107	2026-01-08	da_nop
10778	245	108	2026-01-08	da_nop
10779	245	109	2026-01-08	da_nop
10780	245	110	2026-01-08	da_nop
10781	246	67	2026-01-08	da_nop
10782	246	68	2026-01-08	da_nop
10783	246	69	2026-01-08	da_nop
10784	246	70	2026-01-08	da_nop
10785	246	71	2026-01-08	da_nop
10786	246	72	2026-01-08	da_nop
10787	246	73	2026-01-08	da_nop
10788	246	74	2026-01-08	da_nop
10789	246	75	2026-01-08	tre_han
10790	246	76	2026-01-08	da_nop
10791	246	77	2026-01-08	da_nop
10792	246	78	2026-01-08	da_nop
10793	246	79	2026-01-08	da_nop
10794	246	80	2026-01-08	tre_han
10795	246	81	2026-01-08	da_nop
10796	246	82	2026-01-08	tre_han
10797	246	83	2026-01-08	da_nop
10798	246	84	2026-01-08	da_nop
10799	246	85	2026-01-08	da_nop
10800	246	86	2026-01-08	da_nop
10801	246	87	2026-01-08	tre_han
10802	246	88	2026-01-08	da_nop
10803	246	89	2026-01-08	tre_han
10804	246	90	2026-01-08	da_nop
10805	246	91	2026-01-08	da_nop
10806	246	92	2026-01-08	da_nop
10807	246	93	2026-01-08	da_nop
10808	246	94	2026-01-08	da_nop
10809	246	95	2026-01-08	da_nop
10810	246	96	2026-01-08	da_nop
10811	246	97	2026-01-08	da_nop
10812	246	98	2026-01-08	da_nop
10813	246	99	2026-01-08	da_nop
10814	246	100	2026-01-08	tre_han
10815	246	101	2026-01-08	da_nop
10816	246	102	2026-01-08	da_nop
10817	246	103	2026-01-08	tre_han
10818	246	104	2026-01-08	da_nop
10819	246	105	2026-01-08	da_nop
10820	246	106	2026-01-08	da_nop
10821	246	107	2026-01-08	da_nop
10822	246	108	2026-01-08	da_nop
10823	246	109	2026-01-08	da_nop
10824	246	110	2026-01-08	tre_han
10825	247	67	2026-01-08	da_nop
10826	247	68	2026-01-08	da_nop
10827	247	69	2026-01-08	da_nop
10828	247	70	2026-01-08	da_nop
10829	247	71	2026-01-08	tre_han
10830	247	72	2026-01-08	da_nop
10831	247	73	2026-01-08	da_nop
10832	247	74	2026-01-08	da_nop
10833	247	75	2026-01-08	da_nop
10834	247	76	2026-01-08	tre_han
10835	247	77	2026-01-08	da_nop
10836	247	78	2026-01-08	tre_han
10837	247	79	2026-01-08	tre_han
10838	247	80	2026-01-08	da_nop
10839	247	81	2026-01-08	tre_han
10840	247	82	2026-01-08	da_nop
10841	247	83	2026-01-08	da_nop
10842	247	84	2026-01-08	tre_han
10843	247	85	2026-01-08	da_nop
10844	247	86	2026-01-08	da_nop
10845	247	87	2026-01-08	da_nop
10846	247	88	2026-01-08	da_nop
10847	247	89	2026-01-08	tre_han
10848	247	90	2026-01-08	da_nop
10849	247	91	2026-01-08	tre_han
10850	247	92	2026-01-08	tre_han
10851	247	93	2026-01-08	da_nop
10852	247	94	2026-01-08	da_nop
10853	247	95	2026-01-08	da_nop
10854	247	96	2026-01-08	da_nop
10855	247	97	2026-01-08	da_nop
10856	247	98	2026-01-08	da_nop
10857	247	99	2026-01-08	da_nop
10858	247	100	2026-01-08	da_nop
10859	247	101	2026-01-08	tre_han
10860	247	102	2026-01-08	da_nop
10861	247	103	2026-01-08	da_nop
10862	247	104	2026-01-08	da_nop
10863	247	105	2026-01-08	tre_han
10864	247	106	2026-01-08	da_nop
10865	247	107	2026-01-08	da_nop
10866	247	108	2026-01-08	da_nop
10867	247	109	2026-01-08	tre_han
10868	247	110	2026-01-08	da_nop
10869	248	67	2026-01-08	tre_han
10870	248	68	2026-01-08	da_nop
10871	248	69	2026-01-08	da_nop
10872	248	70	2026-01-08	da_nop
10873	248	71	2026-01-08	da_nop
10874	248	72	2026-01-08	da_nop
10875	248	73	2026-01-08	da_nop
10876	248	74	2026-01-08	da_nop
10877	248	75	2026-01-08	da_nop
10878	248	76	2026-01-08	tre_han
10879	248	77	2026-01-08	da_nop
10880	248	78	2026-01-08	da_nop
10881	248	79	2026-01-08	da_nop
10882	248	80	2026-01-08	tre_han
10883	248	81	2026-01-08	da_nop
10884	248	82	2026-01-08	da_nop
10885	248	83	2026-01-08	da_nop
10886	248	84	2026-01-08	da_nop
10887	248	85	2026-01-08	tre_han
10888	248	86	2026-01-08	da_nop
10889	248	87	2026-01-08	da_nop
10890	248	88	2026-01-08	da_nop
10891	248	89	2026-01-08	da_nop
10892	248	90	2026-01-08	da_nop
10893	248	91	2026-01-08	da_nop
10894	248	92	2026-01-08	tre_han
10895	248	93	2026-01-08	da_nop
10896	248	94	2026-01-08	da_nop
10897	248	95	2026-01-08	da_nop
10898	248	96	2026-01-08	da_nop
10899	248	97	2026-01-08	da_nop
10900	248	98	2026-01-08	da_nop
10901	248	99	2026-01-08	tre_han
10902	248	100	2026-01-08	da_nop
10903	248	101	2026-01-08	tre_han
10904	248	102	2026-01-08	da_nop
10905	248	103	2026-01-08	da_nop
10906	248	104	2026-01-08	da_nop
10907	248	105	2026-01-08	da_nop
10908	248	106	2026-01-08	da_nop
10909	248	107	2026-01-08	da_nop
10910	248	108	2026-01-08	da_nop
10911	248	109	2026-01-08	da_nop
10912	248	110	2026-01-08	da_nop
10913	249	67	2026-01-08	da_nop
10914	249	68	2026-01-08	da_nop
10915	249	69	2026-01-08	da_nop
10916	249	70	2026-01-08	da_nop
10917	249	71	2026-01-08	da_nop
10918	249	72	2026-01-08	da_nop
10919	249	73	2026-01-08	da_nop
10920	249	74	2026-01-08	da_nop
10921	249	75	2026-01-08	da_nop
10922	249	76	2026-01-08	tre_han
10923	249	77	2026-01-08	tre_han
10924	249	78	2026-01-08	da_nop
10925	249	79	2026-01-08	da_nop
10926	249	80	2026-01-08	da_nop
10927	249	81	2026-01-08	tre_han
10928	249	82	2026-01-08	tre_han
10929	249	83	2026-01-08	da_nop
10930	249	84	2026-01-08	da_nop
10931	249	85	2026-01-08	da_nop
10932	249	86	2026-01-08	da_nop
10933	249	87	2026-01-08	tre_han
10934	249	88	2026-01-08	da_nop
10935	249	89	2026-01-08	da_nop
10936	249	90	2026-01-08	da_nop
10937	249	91	2026-01-08	da_nop
10938	249	92	2026-01-08	tre_han
10939	249	93	2026-01-08	da_nop
10940	249	94	2026-01-08	tre_han
10941	249	95	2026-01-08	tre_han
10942	249	96	2026-01-08	tre_han
10943	249	97	2026-01-08	tre_han
10944	249	98	2026-01-08	da_nop
10945	249	99	2026-01-08	tre_han
10946	249	100	2026-01-08	da_nop
10947	249	101	2026-01-08	da_nop
10948	249	102	2026-01-08	da_nop
10949	249	103	2026-01-08	da_nop
10950	249	104	2026-01-08	da_nop
10951	249	105	2026-01-08	da_nop
10952	249	106	2026-01-08	tre_han
10953	249	107	2026-01-08	tre_han
10954	249	108	2026-01-08	da_nop
10955	249	109	2026-01-08	da_nop
10956	249	110	2026-01-08	da_nop
10957	250	67	2026-01-08	da_nop
10958	250	68	2026-01-08	tre_han
10959	250	69	2026-01-08	da_nop
10960	250	70	2026-01-08	tre_han
10961	250	71	2026-01-08	da_nop
10962	250	72	2026-01-08	da_nop
10963	250	73	2026-01-08	da_nop
10964	250	74	2026-01-08	da_nop
10965	250	75	2026-01-08	tre_han
10966	250	76	2026-01-08	da_nop
10967	250	77	2026-01-08	tre_han
10968	250	78	2026-01-08	da_nop
10969	250	79	2026-01-08	da_nop
10970	250	80	2026-01-08	da_nop
10971	250	81	2026-01-08	da_nop
10972	250	82	2026-01-08	da_nop
10973	250	83	2026-01-08	da_nop
10974	250	84	2026-01-08	da_nop
10975	250	85	2026-01-08	da_nop
10976	250	86	2026-01-08	da_nop
10977	250	87	2026-01-08	da_nop
10978	250	88	2026-01-08	da_nop
10979	250	89	2026-01-08	tre_han
10980	250	90	2026-01-08	da_nop
10981	250	91	2026-01-08	tre_han
10982	250	92	2026-01-08	da_nop
10983	250	93	2026-01-08	da_nop
10984	250	94	2026-01-08	da_nop
10985	250	95	2026-01-08	da_nop
10986	250	96	2026-01-08	da_nop
10987	250	97	2026-01-08	tre_han
10988	250	98	2026-01-08	da_nop
10989	250	99	2026-01-08	tre_han
10990	250	100	2026-01-08	da_nop
10991	250	101	2026-01-08	da_nop
10992	250	102	2026-01-08	da_nop
10993	250	103	2026-01-08	tre_han
10994	250	104	2026-01-08	da_nop
10995	250	105	2026-01-08	tre_han
10996	250	106	2026-01-08	da_nop
10997	250	107	2026-01-08	tre_han
10998	250	108	2026-01-08	da_nop
10999	250	109	2026-01-08	da_nop
11000	250	110	2026-01-08	tre_han
11001	251	67	2026-01-08	da_nop
11002	251	68	2026-01-08	tre_han
11003	251	69	2026-01-08	da_nop
11004	251	70	2026-01-08	da_nop
11005	251	71	2026-01-08	da_nop
11006	251	72	2026-01-08	da_nop
11007	251	73	2026-01-08	da_nop
11008	251	74	2026-01-08	da_nop
11009	251	75	2026-01-08	tre_han
11010	251	76	2026-01-08	tre_han
11011	251	77	2026-01-08	da_nop
11012	251	78	2026-01-08	da_nop
11013	251	79	2026-01-08	tre_han
11014	251	80	2026-01-08	tre_han
11015	251	81	2026-01-08	da_nop
11016	251	82	2026-01-08	da_nop
11017	251	83	2026-01-08	da_nop
11018	251	84	2026-01-08	da_nop
11019	251	85	2026-01-08	da_nop
11020	251	86	2026-01-08	tre_han
11021	251	87	2026-01-08	da_nop
11022	251	88	2026-01-08	da_nop
11023	251	89	2026-01-08	da_nop
11024	251	90	2026-01-08	da_nop
11025	251	91	2026-01-08	da_nop
11026	251	92	2026-01-08	da_nop
11027	251	93	2026-01-08	da_nop
11028	251	94	2026-01-08	da_nop
11029	251	95	2026-01-08	da_nop
11030	251	96	2026-01-08	da_nop
11031	251	97	2026-01-08	da_nop
11032	251	98	2026-01-08	tre_han
11033	251	99	2026-01-08	da_nop
11034	251	100	2026-01-08	tre_han
11035	251	101	2026-01-08	da_nop
11036	251	102	2026-01-08	da_nop
11037	251	103	2026-01-08	tre_han
11038	251	104	2026-01-08	da_nop
11039	251	105	2026-01-08	da_nop
11040	251	106	2026-01-08	da_nop
11041	251	107	2026-01-08	tre_han
11042	251	108	2026-01-08	da_nop
11043	251	109	2026-01-08	tre_han
11044	251	110	2026-01-08	tre_han
11045	252	67	2026-01-08	da_nop
11046	252	68	2026-01-08	tre_han
11047	252	69	2026-01-08	da_nop
11048	252	70	2026-01-08	da_nop
11049	252	71	2026-01-08	da_nop
11050	252	72	2026-01-08	tre_han
11051	252	73	2026-01-08	da_nop
11052	252	74	2026-01-08	da_nop
11053	252	75	2026-01-08	da_nop
11054	252	76	2026-01-08	da_nop
11055	252	77	2026-01-08	da_nop
11056	252	78	2026-01-08	da_nop
11057	252	79	2026-01-08	tre_han
11058	252	80	2026-01-08	tre_han
11059	252	81	2026-01-08	da_nop
11060	252	82	2026-01-08	da_nop
11061	252	83	2026-01-08	da_nop
11062	252	84	2026-01-08	da_nop
11063	252	85	2026-01-08	da_nop
11064	252	86	2026-01-08	da_nop
11065	252	87	2026-01-08	da_nop
11066	252	88	2026-01-08	da_nop
11067	252	89	2026-01-08	da_nop
11068	252	90	2026-01-08	da_nop
11069	252	91	2026-01-08	tre_han
11070	252	92	2026-01-08	da_nop
11071	252	93	2026-01-08	da_nop
11072	252	94	2026-01-08	da_nop
11073	252	95	2026-01-08	da_nop
11074	252	96	2026-01-08	da_nop
11075	252	97	2026-01-08	da_nop
11076	252	98	2026-01-08	da_nop
11077	252	99	2026-01-08	da_nop
11078	252	100	2026-01-08	da_nop
11079	252	101	2026-01-08	da_nop
11080	252	102	2026-01-08	tre_han
11081	252	103	2026-01-08	da_nop
11082	252	104	2026-01-08	da_nop
11083	252	105	2026-01-08	da_nop
11084	252	106	2026-01-08	tre_han
11085	252	107	2026-01-08	da_nop
11086	252	108	2026-01-08	da_nop
11087	252	109	2026-01-08	da_nop
11088	252	110	2026-01-08	tre_han
11089	253	67	2026-01-08	da_nop
11090	253	68	2026-01-08	da_nop
11091	253	69	2026-01-08	da_nop
11092	253	70	2026-01-08	da_nop
11093	253	71	2026-01-08	da_nop
11094	253	72	2026-01-08	da_nop
11095	253	73	2026-01-08	da_nop
11096	253	74	2026-01-08	tre_han
11097	253	75	2026-01-08	da_nop
11098	253	76	2026-01-08	tre_han
11099	253	77	2026-01-08	da_nop
11100	253	78	2026-01-08	da_nop
11101	253	79	2026-01-08	da_nop
11102	253	80	2026-01-08	tre_han
11103	253	81	2026-01-08	da_nop
11104	253	82	2026-01-08	da_nop
11105	253	83	2026-01-08	da_nop
11106	253	84	2026-01-08	da_nop
11107	253	85	2026-01-08	tre_han
11108	253	86	2026-01-08	da_nop
11109	253	87	2026-01-08	da_nop
11110	253	88	2026-01-08	da_nop
11111	253	89	2026-01-08	da_nop
11112	253	90	2026-01-08	da_nop
11113	253	91	2026-01-08	da_nop
11114	253	92	2026-01-08	da_nop
11115	253	93	2026-01-08	da_nop
11116	253	94	2026-01-08	da_nop
11117	253	95	2026-01-08	tre_han
11118	253	96	2026-01-08	da_nop
11119	253	97	2026-01-08	da_nop
11120	253	98	2026-01-08	da_nop
11121	253	99	2026-01-08	tre_han
11122	253	100	2026-01-08	da_nop
11123	253	101	2026-01-08	da_nop
11124	253	102	2026-01-08	da_nop
11125	253	103	2026-01-08	tre_han
11126	253	104	2026-01-08	da_nop
11127	253	105	2026-01-08	da_nop
11128	253	106	2026-01-08	da_nop
11129	253	107	2026-01-08	da_nop
11130	253	108	2026-01-08	da_nop
11131	253	109	2026-01-08	tre_han
11132	253	110	2026-01-08	da_nop
11133	254	67	2026-01-08	tre_han
11134	254	68	2026-01-08	da_nop
11135	254	69	2026-01-08	da_nop
11136	254	70	2026-01-08	da_nop
11137	254	71	2026-01-08	da_nop
11138	254	72	2026-01-08	da_nop
11139	254	73	2026-01-08	tre_han
11140	254	74	2026-01-08	da_nop
11141	254	75	2026-01-08	da_nop
11142	254	76	2026-01-08	da_nop
11143	254	77	2026-01-08	da_nop
11144	254	78	2026-01-08	tre_han
11145	254	79	2026-01-08	da_nop
11146	254	80	2026-01-08	da_nop
11147	254	81	2026-01-08	da_nop
11148	254	82	2026-01-08	da_nop
11149	254	83	2026-01-08	da_nop
11150	254	84	2026-01-08	da_nop
11151	254	85	2026-01-08	da_nop
11152	254	86	2026-01-08	da_nop
11153	254	87	2026-01-08	da_nop
11154	254	88	2026-01-08	da_nop
11155	254	89	2026-01-08	da_nop
11156	254	90	2026-01-08	da_nop
11157	254	91	2026-01-08	da_nop
11158	254	92	2026-01-08	da_nop
11159	254	93	2026-01-08	da_nop
11160	254	94	2026-01-08	tre_han
11161	254	95	2026-01-08	da_nop
11162	254	96	2026-01-08	da_nop
11163	254	97	2026-01-08	da_nop
11164	254	98	2026-01-08	da_nop
11165	254	99	2026-01-08	da_nop
11166	254	100	2026-01-08	da_nop
11167	254	101	2026-01-08	da_nop
11168	254	102	2026-01-08	da_nop
11169	254	103	2026-01-08	da_nop
11170	254	104	2026-01-08	da_nop
11171	254	105	2026-01-08	tre_han
11172	254	106	2026-01-08	tre_han
11173	254	107	2026-01-08	da_nop
11174	254	108	2026-01-08	tre_han
11175	254	109	2026-01-08	da_nop
11176	254	110	2026-01-08	da_nop
11177	255	67	2026-01-08	da_nop
11178	255	68	2026-01-08	da_nop
11179	255	69	2026-01-08	da_nop
11180	255	70	2026-01-08	da_nop
11181	255	71	2026-01-08	da_nop
11182	255	72	2026-01-08	da_nop
11183	255	73	2026-01-08	da_nop
11184	255	74	2026-01-08	da_nop
11185	255	75	2026-01-08	da_nop
11186	255	76	2026-01-08	da_nop
11187	255	77	2026-01-08	da_nop
11188	255	78	2026-01-08	da_nop
11189	255	79	2026-01-08	da_nop
11190	255	80	2026-01-08	tre_han
11191	255	81	2026-01-08	da_nop
11192	255	82	2026-01-08	da_nop
11193	255	83	2026-01-08	da_nop
11194	255	84	2026-01-08	tre_han
11195	255	85	2026-01-08	da_nop
11196	255	86	2026-01-08	da_nop
11197	255	87	2026-01-08	tre_han
11198	255	88	2026-01-08	tre_han
11199	255	89	2026-01-08	tre_han
11200	255	90	2026-01-08	da_nop
11201	255	91	2026-01-08	da_nop
11202	255	92	2026-01-08	da_nop
11203	255	93	2026-01-08	tre_han
11204	255	94	2026-01-08	tre_han
11205	255	95	2026-01-08	tre_han
11206	255	96	2026-01-08	da_nop
11207	255	97	2026-01-08	da_nop
11208	255	98	2026-01-08	da_nop
11209	255	99	2026-01-08	tre_han
11210	255	100	2026-01-08	da_nop
11211	255	101	2026-01-08	da_nop
11212	255	102	2026-01-08	tre_han
11213	255	103	2026-01-08	da_nop
11214	255	104	2026-01-08	da_nop
11215	255	105	2026-01-08	da_nop
11216	255	106	2026-01-08	tre_han
11217	255	107	2026-01-08	da_nop
11218	255	108	2026-01-08	da_nop
11219	255	109	2026-01-08	tre_han
11220	255	110	2026-01-08	tre_han
11221	256	67	2026-01-08	da_nop
11222	256	68	2026-01-08	da_nop
11223	256	69	2026-01-08	da_nop
11224	256	70	2026-01-08	tre_han
11225	256	71	2026-01-08	da_nop
11226	256	72	2026-01-08	da_nop
11227	256	73	2026-01-08	da_nop
11228	256	74	2026-01-08	da_nop
11229	256	75	2026-01-08	tre_han
11230	256	76	2026-01-08	tre_han
11231	256	77	2026-01-08	da_nop
11232	256	78	2026-01-08	da_nop
11233	256	79	2026-01-08	tre_han
11234	256	80	2026-01-08	da_nop
11235	256	81	2026-01-08	da_nop
11236	256	82	2026-01-08	da_nop
11237	256	83	2026-01-08	da_nop
11238	256	84	2026-01-08	da_nop
11239	256	85	2026-01-08	tre_han
11240	256	86	2026-01-08	da_nop
11241	256	87	2026-01-08	tre_han
11242	256	88	2026-01-08	da_nop
11243	256	89	2026-01-08	da_nop
11244	256	90	2026-01-08	tre_han
11245	256	91	2026-01-08	da_nop
11246	256	92	2026-01-08	da_nop
11247	256	93	2026-01-08	da_nop
11248	256	94	2026-01-08	da_nop
11249	256	95	2026-01-08	da_nop
11250	256	96	2026-01-08	tre_han
11251	256	97	2026-01-08	tre_han
11252	256	98	2026-01-08	da_nop
11253	256	99	2026-01-08	da_nop
11254	256	100	2026-01-08	da_nop
11255	256	101	2026-01-08	tre_han
11256	256	102	2026-01-08	da_nop
11257	256	103	2026-01-08	da_nop
11258	256	104	2026-01-08	da_nop
11259	256	105	2026-01-08	da_nop
11260	256	106	2026-01-08	da_nop
11261	256	107	2026-01-08	da_nop
11262	256	108	2026-01-08	tre_han
11263	256	109	2026-01-08	da_nop
11264	256	110	2026-01-08	da_nop
11265	257	67	2026-01-08	da_nop
11266	257	68	2026-01-08	da_nop
11267	257	69	2026-01-08	tre_han
11268	257	70	2026-01-08	da_nop
11269	257	71	2026-01-08	da_nop
11270	257	72	2026-01-08	da_nop
11271	257	73	2026-01-08	tre_han
11272	257	74	2026-01-08	da_nop
11273	257	75	2026-01-08	da_nop
11274	257	76	2026-01-08	da_nop
11275	257	77	2026-01-08	da_nop
11276	257	78	2026-01-08	da_nop
11277	257	79	2026-01-08	da_nop
11278	257	80	2026-01-08	da_nop
11279	257	81	2026-01-08	tre_han
11280	257	82	2026-01-08	da_nop
11281	257	83	2026-01-08	da_nop
11282	257	84	2026-01-08	da_nop
11283	257	85	2026-01-08	da_nop
11284	257	86	2026-01-08	da_nop
11285	257	87	2026-01-08	da_nop
11286	257	88	2026-01-08	da_nop
11287	257	89	2026-01-08	da_nop
11288	257	90	2026-01-08	tre_han
11289	257	91	2026-01-08	tre_han
11290	257	92	2026-01-08	da_nop
11291	257	93	2026-01-08	da_nop
11292	257	94	2026-01-08	da_nop
11293	257	95	2026-01-08	da_nop
11294	257	96	2026-01-08	tre_han
11295	257	97	2026-01-08	da_nop
11296	257	98	2026-01-08	da_nop
11297	257	99	2026-01-08	tre_han
11298	257	100	2026-01-08	da_nop
11299	257	101	2026-01-08	da_nop
11300	257	102	2026-01-08	da_nop
11301	257	103	2026-01-08	da_nop
11302	257	104	2026-01-08	da_nop
11303	257	105	2026-01-08	da_nop
11304	257	106	2026-01-08	da_nop
11305	257	107	2026-01-08	da_nop
11306	257	108	2026-01-08	tre_han
11307	257	109	2026-01-08	da_nop
11308	257	110	2026-01-08	tre_han
11309	258	67	2026-01-08	da_nop
11310	258	68	2026-01-08	da_nop
11311	258	69	2026-01-08	da_nop
11312	258	70	2026-01-08	da_nop
11313	258	71	2026-01-08	da_nop
11314	258	72	2026-01-08	da_nop
11315	258	73	2026-01-08	da_nop
11316	258	74	2026-01-08	da_nop
11317	258	75	2026-01-08	da_nop
11318	258	76	2026-01-08	da_nop
11319	258	77	2026-01-08	tre_han
11320	258	78	2026-01-08	da_nop
11321	258	79	2026-01-08	da_nop
11322	258	80	2026-01-08	da_nop
11323	258	81	2026-01-08	tre_han
11324	258	82	2026-01-08	da_nop
11325	258	83	2026-01-08	da_nop
11326	258	84	2026-01-08	tre_han
11327	258	85	2026-01-08	da_nop
11328	258	86	2026-01-08	da_nop
11329	258	87	2026-01-08	da_nop
11330	258	88	2026-01-08	da_nop
11331	258	89	2026-01-08	da_nop
11332	258	90	2026-01-08	tre_han
11333	258	91	2026-01-08	da_nop
11334	258	92	2026-01-08	da_nop
11335	258	93	2026-01-08	da_nop
11336	258	94	2026-01-08	da_nop
11337	258	95	2026-01-08	da_nop
11338	258	96	2026-01-08	da_nop
11339	258	97	2026-01-08	da_nop
11340	258	98	2026-01-08	da_nop
11341	258	99	2026-01-08	da_nop
11342	258	100	2026-01-08	tre_han
11343	258	101	2026-01-08	tre_han
11344	258	102	2026-01-08	tre_han
11345	258	103	2026-01-08	da_nop
11346	258	104	2026-01-08	da_nop
11347	258	105	2026-01-08	da_nop
11348	258	106	2026-01-08	da_nop
11349	258	107	2026-01-08	da_nop
11350	258	108	2026-01-08	da_nop
11351	258	109	2026-01-08	da_nop
11352	258	110	2026-01-08	da_nop
11353	259	67	2026-01-08	da_nop
11354	259	68	2026-01-08	da_nop
11355	259	69	2026-01-08	da_nop
11356	259	70	2026-01-08	da_nop
11357	259	71	2026-01-08	da_nop
11358	259	72	2026-01-08	da_nop
11359	259	73	2026-01-08	da_nop
11360	259	74	2026-01-08	tre_han
11361	259	75	2026-01-08	da_nop
11362	259	76	2026-01-08	da_nop
11363	259	77	2026-01-08	da_nop
11364	259	78	2026-01-08	da_nop
11365	259	79	2026-01-08	tre_han
11366	259	80	2026-01-08	da_nop
11367	259	81	2026-01-08	da_nop
11368	259	82	2026-01-08	da_nop
11369	259	83	2026-01-08	da_nop
11370	259	84	2026-01-08	da_nop
11371	259	85	2026-01-08	da_nop
11372	259	86	2026-01-08	tre_han
11373	259	87	2026-01-08	tre_han
11374	259	88	2026-01-08	da_nop
11375	259	89	2026-01-08	da_nop
11376	259	90	2026-01-08	da_nop
11377	259	91	2026-01-08	da_nop
11378	259	92	2026-01-08	da_nop
11379	259	93	2026-01-08	da_nop
11380	259	94	2026-01-08	da_nop
11381	259	95	2026-01-08	da_nop
11382	259	96	2026-01-08	da_nop
11383	259	97	2026-01-08	da_nop
11384	259	98	2026-01-08	da_nop
11385	259	99	2026-01-08	da_nop
11386	259	100	2026-01-08	da_nop
11387	259	101	2026-01-08	da_nop
11388	259	102	2026-01-08	da_nop
11389	259	103	2026-01-08	da_nop
11390	259	104	2026-01-08	da_nop
11391	259	105	2026-01-08	tre_han
11392	259	106	2026-01-08	da_nop
11393	259	107	2026-01-08	tre_han
11394	259	108	2026-01-08	da_nop
11395	259	109	2026-01-08	da_nop
11396	259	110	2026-01-08	da_nop
11397	260	67	2026-01-08	tre_han
11398	260	68	2026-01-08	tre_han
11399	260	69	2026-01-08	da_nop
11400	260	70	2026-01-08	da_nop
11401	260	71	2026-01-08	da_nop
11402	260	72	2026-01-08	da_nop
11403	260	73	2026-01-08	da_nop
11404	260	74	2026-01-08	da_nop
11405	260	75	2026-01-08	tre_han
11406	260	76	2026-01-08	da_nop
11407	260	77	2026-01-08	da_nop
11408	260	78	2026-01-08	da_nop
11409	260	79	2026-01-08	da_nop
11410	260	80	2026-01-08	da_nop
11411	260	81	2026-01-08	da_nop
11412	260	82	2026-01-08	tre_han
11413	260	83	2026-01-08	da_nop
11414	260	84	2026-01-08	da_nop
11415	260	85	2026-01-08	tre_han
11416	260	86	2026-01-08	da_nop
11417	260	87	2026-01-08	tre_han
11418	260	88	2026-01-08	da_nop
11419	260	89	2026-01-08	da_nop
11420	260	90	2026-01-08	tre_han
11421	260	91	2026-01-08	tre_han
11422	260	92	2026-01-08	da_nop
11423	260	93	2026-01-08	da_nop
11424	260	94	2026-01-08	da_nop
11425	260	95	2026-01-08	da_nop
11426	260	96	2026-01-08	da_nop
11427	260	97	2026-01-08	da_nop
11428	260	98	2026-01-08	da_nop
11429	260	99	2026-01-08	da_nop
11430	260	100	2026-01-08	da_nop
11431	260	101	2026-01-08	da_nop
11432	260	102	2026-01-08	tre_han
11433	260	103	2026-01-08	tre_han
11434	260	104	2026-01-08	da_nop
11435	260	105	2026-01-08	da_nop
11436	260	106	2026-01-08	da_nop
11437	260	107	2026-01-08	da_nop
11438	260	108	2026-01-08	da_nop
11439	260	109	2026-01-08	da_nop
11440	260	110	2026-01-08	da_nop
11441	261	67	2026-01-08	da_nop
11442	261	68	2026-01-08	da_nop
11443	261	69	2026-01-08	da_nop
11444	261	70	2026-01-08	tre_han
11445	261	71	2026-01-08	da_nop
11446	261	72	2026-01-08	da_nop
11447	261	73	2026-01-08	tre_han
11448	261	74	2026-01-08	da_nop
11449	261	75	2026-01-08	da_nop
11450	261	76	2026-01-08	da_nop
11451	261	77	2026-01-08	da_nop
11452	261	78	2026-01-08	tre_han
11453	261	79	2026-01-08	da_nop
11454	261	80	2026-01-08	tre_han
11455	261	81	2026-01-08	da_nop
11456	261	82	2026-01-08	da_nop
11457	261	83	2026-01-08	da_nop
11458	261	84	2026-01-08	da_nop
11459	261	85	2026-01-08	da_nop
11460	261	86	2026-01-08	da_nop
11461	261	87	2026-01-08	da_nop
11462	261	88	2026-01-08	da_nop
11463	261	89	2026-01-08	tre_han
11464	261	90	2026-01-08	da_nop
11465	261	91	2026-01-08	da_nop
11466	261	92	2026-01-08	da_nop
11467	261	93	2026-01-08	tre_han
11468	261	94	2026-01-08	tre_han
11469	261	95	2026-01-08	da_nop
11470	261	96	2026-01-08	da_nop
11471	261	97	2026-01-08	da_nop
11472	261	98	2026-01-08	da_nop
11473	261	99	2026-01-08	tre_han
11474	261	100	2026-01-08	da_nop
11475	261	101	2026-01-08	tre_han
11476	261	102	2026-01-08	da_nop
11477	261	103	2026-01-08	da_nop
11478	261	104	2026-01-08	tre_han
11479	261	105	2026-01-08	da_nop
11480	261	106	2026-01-08	tre_han
11481	261	107	2026-01-08	tre_han
11482	261	108	2026-01-08	da_nop
11483	261	109	2026-01-08	tre_han
11484	261	110	2026-01-08	da_nop
11485	262	67	2026-01-08	da_nop
11486	262	68	2026-01-08	da_nop
11487	262	69	2026-01-08	da_nop
11488	262	70	2026-01-08	da_nop
11489	262	71	2026-01-08	da_nop
11490	262	72	2026-01-08	tre_han
11491	262	73	2026-01-08	da_nop
11492	262	74	2026-01-08	tre_han
11493	262	75	2026-01-08	da_nop
11494	262	76	2026-01-08	tre_han
11495	262	77	2026-01-08	da_nop
11496	262	78	2026-01-08	da_nop
11497	262	79	2026-01-08	da_nop
11498	262	80	2026-01-08	da_nop
11499	262	81	2026-01-08	da_nop
11500	262	82	2026-01-08	da_nop
11501	262	83	2026-01-08	tre_han
11502	262	84	2026-01-08	da_nop
11503	262	85	2026-01-08	tre_han
11504	262	86	2026-01-08	tre_han
11505	262	87	2026-01-08	tre_han
11506	262	88	2026-01-08	da_nop
11507	262	89	2026-01-08	da_nop
11508	262	90	2026-01-08	da_nop
11509	262	91	2026-01-08	tre_han
11510	262	92	2026-01-08	da_nop
11511	262	93	2026-01-08	tre_han
11512	262	94	2026-01-08	tre_han
11513	262	95	2026-01-08	da_nop
11514	262	96	2026-01-08	tre_han
11515	262	97	2026-01-08	da_nop
11516	262	98	2026-01-08	da_nop
11517	262	99	2026-01-08	tre_han
11518	262	100	2026-01-08	tre_han
11519	262	101	2026-01-08	da_nop
11520	262	102	2026-01-08	da_nop
11521	262	103	2026-01-08	da_nop
11522	262	104	2026-01-08	da_nop
11523	262	105	2026-01-08	da_nop
11524	262	106	2026-01-08	da_nop
11525	262	107	2026-01-08	da_nop
11526	262	108	2026-01-08	da_nop
11527	262	109	2026-01-08	da_nop
11528	262	110	2026-01-08	da_nop
11529	263	67	2026-01-08	tre_han
11530	263	68	2026-01-08	da_nop
11531	263	69	2026-01-08	da_nop
11532	263	70	2026-01-08	tre_han
11533	263	71	2026-01-08	tre_han
11534	263	72	2026-01-08	da_nop
11535	263	73	2026-01-08	da_nop
11536	263	74	2026-01-08	da_nop
11537	263	75	2026-01-08	da_nop
11538	263	76	2026-01-08	tre_han
11539	263	77	2026-01-08	da_nop
11540	263	78	2026-01-08	da_nop
11541	263	79	2026-01-08	da_nop
11542	263	80	2026-01-08	da_nop
11543	263	81	2026-01-08	da_nop
11544	263	82	2026-01-08	da_nop
11545	263	83	2026-01-08	da_nop
11546	263	84	2026-01-08	tre_han
11547	263	85	2026-01-08	tre_han
11548	263	86	2026-01-08	da_nop
11549	263	87	2026-01-08	da_nop
11550	263	88	2026-01-08	da_nop
11551	263	89	2026-01-08	da_nop
11552	263	90	2026-01-08	da_nop
11553	263	91	2026-01-08	da_nop
11554	263	92	2026-01-08	tre_han
11555	263	93	2026-01-08	da_nop
11556	263	94	2026-01-08	tre_han
11557	263	95	2026-01-08	da_nop
11558	263	96	2026-01-08	da_nop
11559	263	97	2026-01-08	tre_han
11560	263	98	2026-01-08	da_nop
11561	263	99	2026-01-08	da_nop
11562	263	100	2026-01-08	da_nop
11563	263	101	2026-01-08	tre_han
11564	263	102	2026-01-08	tre_han
11565	263	103	2026-01-08	da_nop
11566	263	104	2026-01-08	da_nop
11567	263	105	2026-01-08	tre_han
11568	263	106	2026-01-08	da_nop
11569	263	107	2026-01-08	da_nop
11570	263	108	2026-01-08	da_nop
11571	263	109	2026-01-08	da_nop
11572	263	110	2026-01-08	da_nop
11573	264	67	2026-01-08	da_nop
11574	264	68	2026-01-08	tre_han
11575	264	69	2026-01-08	da_nop
11576	264	70	2026-01-08	da_nop
11577	264	71	2026-01-08	da_nop
11578	264	72	2026-01-08	da_nop
11579	264	73	2026-01-08	da_nop
11580	264	74	2026-01-08	da_nop
11581	264	75	2026-01-08	tre_han
11582	264	76	2026-01-08	da_nop
11583	264	77	2026-01-08	da_nop
11584	264	78	2026-01-08	da_nop
11585	264	79	2026-01-08	da_nop
11586	264	80	2026-01-08	da_nop
11587	264	81	2026-01-08	da_nop
11588	264	82	2026-01-08	da_nop
11589	264	83	2026-01-08	tre_han
11590	264	84	2026-01-08	tre_han
11591	264	85	2026-01-08	da_nop
11592	264	86	2026-01-08	da_nop
11593	264	87	2026-01-08	da_nop
11594	264	88	2026-01-08	tre_han
11595	264	89	2026-01-08	da_nop
11596	264	90	2026-01-08	da_nop
11597	264	91	2026-01-08	da_nop
11598	264	92	2026-01-08	da_nop
11599	264	93	2026-01-08	tre_han
11600	264	94	2026-01-08	da_nop
11601	264	95	2026-01-08	da_nop
11602	264	96	2026-01-08	da_nop
11603	264	97	2026-01-08	da_nop
11604	264	98	2026-01-08	da_nop
11605	264	99	2026-01-08	da_nop
11606	264	100	2026-01-08	tre_han
11607	264	101	2026-01-08	tre_han
11608	264	102	2026-01-08	da_nop
11609	264	103	2026-01-08	da_nop
11610	264	104	2026-01-08	da_nop
11611	264	105	2026-01-08	tre_han
11612	264	106	2026-01-08	tre_han
11613	264	107	2026-01-08	da_nop
11614	264	108	2026-01-08	tre_han
11615	264	109	2026-01-08	tre_han
11616	264	110	2026-01-08	da_nop
11617	265	67	2026-01-08	da_nop
11618	265	68	2026-01-08	da_nop
11619	265	69	2026-01-08	da_nop
11620	265	70	2026-01-08	da_nop
11621	265	71	2026-01-08	da_nop
11622	265	72	2026-01-08	da_nop
11623	265	73	2026-01-08	tre_han
11624	265	74	2026-01-08	da_nop
11625	265	75	2026-01-08	tre_han
11626	265	76	2026-01-08	da_nop
11627	265	77	2026-01-08	da_nop
11628	265	78	2026-01-08	da_nop
11629	265	79	2026-01-08	da_nop
11630	265	80	2026-01-08	da_nop
11631	265	81	2026-01-08	da_nop
11632	265	82	2026-01-08	da_nop
11633	265	83	2026-01-08	da_nop
11634	265	84	2026-01-08	da_nop
11635	265	85	2026-01-08	tre_han
11636	265	86	2026-01-08	da_nop
11637	265	87	2026-01-08	da_nop
11638	265	88	2026-01-08	tre_han
11639	265	89	2026-01-08	tre_han
11640	265	90	2026-01-08	tre_han
11641	265	91	2026-01-08	da_nop
11642	265	92	2026-01-08	tre_han
11643	265	93	2026-01-08	tre_han
11644	265	94	2026-01-08	da_nop
11645	265	95	2026-01-08	tre_han
11646	265	96	2026-01-08	tre_han
11647	265	97	2026-01-08	da_nop
11648	265	98	2026-01-08	tre_han
11649	265	99	2026-01-08	da_nop
11650	265	100	2026-01-08	da_nop
11651	265	101	2026-01-08	tre_han
11652	265	102	2026-01-08	da_nop
11653	265	103	2026-01-08	tre_han
11654	265	104	2026-01-08	da_nop
11655	265	105	2026-01-08	da_nop
11656	265	106	2026-01-08	da_nop
11657	265	107	2026-01-08	da_nop
11658	265	108	2026-01-08	da_nop
11659	265	109	2026-01-08	tre_han
11660	265	110	2026-01-08	da_nop
11661	266	67	2026-01-08	da_nop
11662	266	68	2026-01-08	da_nop
11663	266	69	2026-01-08	da_nop
11664	266	70	2026-01-08	da_nop
11665	266	71	2026-01-08	tre_han
11666	266	72	2026-01-08	tre_han
11667	266	73	2026-01-08	da_nop
11668	266	74	2026-01-08	da_nop
11669	266	75	2026-01-08	tre_han
11670	266	76	2026-01-08	da_nop
11671	266	77	2026-01-08	da_nop
11672	266	78	2026-01-08	da_nop
11673	266	79	2026-01-08	da_nop
11674	266	80	2026-01-08	da_nop
11675	266	81	2026-01-08	tre_han
11676	266	82	2026-01-08	da_nop
11677	266	83	2026-01-08	tre_han
11678	266	84	2026-01-08	tre_han
11679	266	85	2026-01-08	da_nop
11680	266	86	2026-01-08	da_nop
11681	266	87	2026-01-08	da_nop
11682	266	88	2026-01-08	tre_han
11683	266	89	2026-01-08	da_nop
11684	266	90	2026-01-08	da_nop
11685	266	91	2026-01-08	da_nop
11686	266	92	2026-01-08	da_nop
11687	266	93	2026-01-08	da_nop
11688	266	94	2026-01-08	da_nop
11689	266	95	2026-01-08	da_nop
11690	266	96	2026-01-08	da_nop
11691	266	97	2026-01-08	tre_han
11692	266	98	2026-01-08	da_nop
11693	266	99	2026-01-08	da_nop
11694	266	100	2026-01-08	tre_han
11695	266	101	2026-01-08	da_nop
11696	266	102	2026-01-08	da_nop
11697	266	103	2026-01-08	tre_han
11698	266	104	2026-01-08	da_nop
11699	266	105	2026-01-08	tre_han
11700	266	106	2026-01-08	tre_han
11701	266	107	2026-01-08	tre_han
11702	266	108	2026-01-08	da_nop
11703	266	109	2026-01-08	tre_han
11704	266	110	2026-01-08	tre_han
11705	267	67	2026-01-08	tre_han
11706	267	68	2026-01-08	tre_han
11707	267	69	2026-01-08	da_nop
11708	267	70	2026-01-08	da_nop
11709	267	71	2026-01-08	da_nop
11710	267	72	2026-01-08	da_nop
11711	267	73	2026-01-08	da_nop
11712	267	74	2026-01-08	tre_han
11713	267	75	2026-01-08	da_nop
11714	267	76	2026-01-08	da_nop
11715	267	77	2026-01-08	da_nop
11716	267	78	2026-01-08	tre_han
11717	267	79	2026-01-08	da_nop
11718	267	80	2026-01-08	da_nop
11719	267	81	2026-01-08	da_nop
11720	267	82	2026-01-08	da_nop
11721	267	83	2026-01-08	da_nop
11722	267	84	2026-01-08	tre_han
11723	267	85	2026-01-08	da_nop
11724	267	86	2026-01-08	tre_han
11725	267	87	2026-01-08	da_nop
11726	267	88	2026-01-08	da_nop
11727	267	89	2026-01-08	tre_han
11728	267	90	2026-01-08	da_nop
11729	267	91	2026-01-08	da_nop
11730	267	92	2026-01-08	da_nop
11731	267	93	2026-01-08	da_nop
11732	267	94	2026-01-08	da_nop
11733	267	95	2026-01-08	da_nop
11734	267	96	2026-01-08	da_nop
11735	267	97	2026-01-08	da_nop
11736	267	98	2026-01-08	da_nop
11737	267	99	2026-01-08	da_nop
11738	267	100	2026-01-08	tre_han
11739	267	101	2026-01-08	da_nop
11740	267	102	2026-01-08	da_nop
11741	267	103	2026-01-08	da_nop
11742	267	104	2026-01-08	da_nop
11743	267	105	2026-01-08	da_nop
11744	267	106	2026-01-08	tre_han
11745	267	107	2026-01-08	da_nop
11746	267	108	2026-01-08	da_nop
11747	267	109	2026-01-08	da_nop
11748	267	110	2026-01-08	tre_han
11749	268	67	2026-01-08	da_nop
11750	268	68	2026-01-08	da_nop
11751	268	69	2026-01-08	da_nop
11752	268	70	2026-01-08	da_nop
11753	268	71	2026-01-08	da_nop
11754	268	72	2026-01-08	da_nop
11755	268	73	2026-01-08	da_nop
11756	268	74	2026-01-08	da_nop
11757	268	75	2026-01-08	da_nop
11758	268	76	2026-01-08	da_nop
11759	268	77	2026-01-08	da_nop
11760	268	78	2026-01-08	da_nop
11761	268	79	2026-01-08	da_nop
11762	268	80	2026-01-08	tre_han
11763	268	81	2026-01-08	da_nop
11764	268	82	2026-01-08	da_nop
11765	268	83	2026-01-08	da_nop
11766	268	84	2026-01-08	tre_han
11767	268	85	2026-01-08	da_nop
11768	268	86	2026-01-08	tre_han
11769	268	87	2026-01-08	da_nop
11770	268	88	2026-01-08	tre_han
11771	268	89	2026-01-08	da_nop
11772	268	90	2026-01-08	da_nop
11773	268	91	2026-01-08	da_nop
11774	268	92	2026-01-08	da_nop
11775	268	93	2026-01-08	da_nop
11776	268	94	2026-01-08	da_nop
11777	268	95	2026-01-08	tre_han
11778	268	96	2026-01-08	da_nop
11779	268	97	2026-01-08	da_nop
11780	268	98	2026-01-08	da_nop
11781	268	99	2026-01-08	da_nop
11782	268	100	2026-01-08	da_nop
11783	268	101	2026-01-08	tre_han
11784	268	102	2026-01-08	da_nop
11785	268	103	2026-01-08	da_nop
11786	268	104	2026-01-08	da_nop
11787	268	105	2026-01-08	tre_han
11788	268	106	2026-01-08	da_nop
11789	268	107	2026-01-08	tre_han
11790	268	108	2026-01-08	da_nop
11791	268	109	2026-01-08	da_nop
11792	268	110	2026-01-08	da_nop
11793	269	67	2026-01-08	da_nop
11794	269	68	2026-01-08	da_nop
11795	269	69	2026-01-08	da_nop
11796	269	70	2026-01-08	tre_han
11797	269	71	2026-01-08	tre_han
11798	269	72	2026-01-08	da_nop
11799	269	73	2026-01-08	da_nop
11800	269	74	2026-01-08	tre_han
11801	269	75	2026-01-08	tre_han
11802	269	76	2026-01-08	da_nop
11803	269	77	2026-01-08	da_nop
11804	269	78	2026-01-08	da_nop
11805	269	79	2026-01-08	da_nop
11806	269	80	2026-01-08	tre_han
11807	269	81	2026-01-08	da_nop
11808	269	82	2026-01-08	tre_han
11809	269	83	2026-01-08	da_nop
11810	269	84	2026-01-08	tre_han
11811	269	85	2026-01-08	da_nop
11812	269	86	2026-01-08	da_nop
11813	269	87	2026-01-08	da_nop
11814	269	88	2026-01-08	tre_han
11815	269	89	2026-01-08	tre_han
11816	269	90	2026-01-08	da_nop
11817	269	91	2026-01-08	da_nop
11818	269	92	2026-01-08	da_nop
11819	269	93	2026-01-08	da_nop
11820	269	94	2026-01-08	da_nop
11821	269	95	2026-01-08	da_nop
11822	269	96	2026-01-08	tre_han
11823	269	97	2026-01-08	da_nop
11824	269	98	2026-01-08	da_nop
11825	269	99	2026-01-08	da_nop
11826	269	100	2026-01-08	da_nop
11827	269	101	2026-01-08	da_nop
11828	269	102	2026-01-08	da_nop
11829	269	103	2026-01-08	da_nop
11830	269	104	2026-01-08	da_nop
11831	269	105	2026-01-08	da_nop
11832	269	106	2026-01-08	da_nop
11833	269	107	2026-01-08	tre_han
11834	269	108	2026-01-08	da_nop
11835	269	109	2026-01-08	da_nop
11836	269	110	2026-01-08	da_nop
11837	270	67	2026-01-08	da_nop
11838	270	68	2026-01-08	da_nop
11839	270	69	2026-01-08	tre_han
11840	270	70	2026-01-08	tre_han
11841	270	71	2026-01-08	da_nop
11842	270	72	2026-01-08	da_nop
11843	270	73	2026-01-08	da_nop
11844	270	74	2026-01-08	da_nop
11845	270	75	2026-01-08	tre_han
11846	270	76	2026-01-08	da_nop
11847	270	77	2026-01-08	da_nop
11848	270	78	2026-01-08	da_nop
11849	270	79	2026-01-08	tre_han
11850	270	80	2026-01-08	da_nop
11851	270	81	2026-01-08	tre_han
11852	270	82	2026-01-08	da_nop
11853	270	83	2026-01-08	da_nop
11854	270	84	2026-01-08	tre_han
11855	270	85	2026-01-08	da_nop
11856	270	86	2026-01-08	da_nop
11857	270	87	2026-01-08	da_nop
11858	270	88	2026-01-08	da_nop
11859	270	89	2026-01-08	tre_han
11860	270	90	2026-01-08	tre_han
11861	270	91	2026-01-08	da_nop
11862	270	92	2026-01-08	da_nop
11863	270	93	2026-01-08	da_nop
11864	270	94	2026-01-08	da_nop
11865	270	95	2026-01-08	da_nop
11866	270	96	2026-01-08	da_nop
11867	270	97	2026-01-08	da_nop
11868	270	98	2026-01-08	da_nop
11869	270	99	2026-01-08	da_nop
11870	270	100	2026-01-08	da_nop
11871	270	101	2026-01-08	tre_han
11872	270	102	2026-01-08	da_nop
11873	270	103	2026-01-08	da_nop
11874	270	104	2026-01-08	da_nop
11875	270	105	2026-01-08	da_nop
11876	270	106	2026-01-08	da_nop
11877	270	107	2026-01-08	tre_han
11878	270	108	2026-01-08	da_nop
11879	270	109	2026-01-08	da_nop
11880	270	110	2026-01-08	da_nop
11881	271	67	2026-01-08	da_nop
11882	271	68	2026-01-08	da_nop
11883	271	69	2026-01-08	da_nop
11884	271	70	2026-01-08	da_nop
11885	271	71	2026-01-08	da_nop
11886	271	72	2026-01-08	da_nop
11887	271	73	2026-01-08	da_nop
11888	271	74	2026-01-08	da_nop
11889	271	75	2026-01-08	da_nop
11890	271	76	2026-01-08	da_nop
11891	271	77	2026-01-08	da_nop
11892	271	78	2026-01-08	da_nop
11893	271	79	2026-01-08	da_nop
11894	271	80	2026-01-08	da_nop
11895	271	81	2026-01-08	da_nop
11896	271	82	2026-01-08	da_nop
11897	271	83	2026-01-08	da_nop
11898	271	84	2026-01-08	tre_han
11899	271	85	2026-01-08	da_nop
11900	271	86	2026-01-08	da_nop
11901	271	87	2026-01-08	da_nop
11902	271	88	2026-01-08	da_nop
11903	271	89	2026-01-08	tre_han
11904	271	90	2026-01-08	da_nop
11905	271	91	2026-01-08	da_nop
11906	271	92	2026-01-08	da_nop
11907	271	93	2026-01-08	da_nop
11908	271	94	2026-01-08	da_nop
11909	271	95	2026-01-08	da_nop
11910	271	96	2026-01-08	da_nop
11911	271	97	2026-01-08	da_nop
11912	271	98	2026-01-08	da_nop
11913	271	99	2026-01-08	da_nop
11914	271	100	2026-01-08	da_nop
11915	271	101	2026-01-08	da_nop
11916	271	102	2026-01-08	da_nop
11917	271	103	2026-01-08	tre_han
11918	271	104	2026-01-08	da_nop
11919	271	105	2026-01-08	tre_han
11920	271	106	2026-01-08	da_nop
11921	271	107	2026-01-08	da_nop
11922	271	108	2026-01-08	da_nop
11923	271	109	2026-01-08	tre_han
11924	271	110	2026-01-08	da_nop
11925	272	67	2026-01-08	tre_han
11926	272	68	2026-01-08	tre_han
11927	272	69	2026-01-08	tre_han
11928	272	70	2026-01-08	da_nop
11929	272	71	2026-01-08	da_nop
11930	272	72	2026-01-08	da_nop
11931	272	73	2026-01-08	da_nop
11932	272	74	2026-01-08	da_nop
11933	272	75	2026-01-08	da_nop
11934	272	76	2026-01-08	da_nop
11935	272	77	2026-01-08	tre_han
11936	272	78	2026-01-08	da_nop
11937	272	79	2026-01-08	da_nop
11938	272	80	2026-01-08	da_nop
11939	272	81	2026-01-08	da_nop
11940	272	82	2026-01-08	da_nop
11941	272	83	2026-01-08	da_nop
11942	272	84	2026-01-08	da_nop
11943	272	85	2026-01-08	da_nop
11944	272	86	2026-01-08	da_nop
11945	272	87	2026-01-08	da_nop
11946	272	88	2026-01-08	da_nop
11947	272	89	2026-01-08	da_nop
11948	272	90	2026-01-08	tre_han
11949	272	91	2026-01-08	da_nop
11950	272	92	2026-01-08	da_nop
11951	272	93	2026-01-08	da_nop
11952	272	94	2026-01-08	da_nop
11953	272	95	2026-01-08	da_nop
11954	272	96	2026-01-08	da_nop
11955	272	97	2026-01-08	tre_han
11956	272	98	2026-01-08	da_nop
11957	272	99	2026-01-08	da_nop
11958	272	100	2026-01-08	da_nop
11959	272	101	2026-01-08	da_nop
11960	272	102	2026-01-08	da_nop
11961	272	103	2026-01-08	da_nop
11962	272	104	2026-01-08	tre_han
11963	272	105	2026-01-08	da_nop
11964	272	106	2026-01-08	da_nop
11965	272	107	2026-01-08	tre_han
11966	272	108	2026-01-08	da_nop
11967	272	109	2026-01-08	da_nop
11968	272	110	2026-01-08	da_nop
11969	273	67	2026-01-08	tre_han
11970	273	68	2026-01-08	da_nop
11971	273	69	2026-01-08	da_nop
11972	273	70	2026-01-08	da_nop
11973	273	71	2026-01-08	da_nop
11974	273	72	2026-01-08	da_nop
11975	273	73	2026-01-08	da_nop
11976	273	74	2026-01-08	da_nop
11977	273	75	2026-01-08	da_nop
11978	273	76	2026-01-08	da_nop
11979	273	77	2026-01-08	da_nop
11980	273	78	2026-01-08	da_nop
11981	273	79	2026-01-08	da_nop
11982	273	80	2026-01-08	da_nop
11983	273	81	2026-01-08	tre_han
11984	273	82	2026-01-08	tre_han
11985	273	83	2026-01-08	da_nop
11986	273	84	2026-01-08	da_nop
11987	273	85	2026-01-08	da_nop
11988	273	86	2026-01-08	da_nop
11989	273	87	2026-01-08	da_nop
11990	273	88	2026-01-08	da_nop
11991	273	89	2026-01-08	da_nop
11992	273	90	2026-01-08	da_nop
11993	273	91	2026-01-08	da_nop
11994	273	92	2026-01-08	da_nop
11995	273	93	2026-01-08	da_nop
11996	273	94	2026-01-08	tre_han
11997	273	95	2026-01-08	da_nop
11998	273	96	2026-01-08	da_nop
11999	273	97	2026-01-08	da_nop
12000	273	98	2026-01-08	tre_han
12001	273	99	2026-01-08	da_nop
12002	273	100	2026-01-08	da_nop
12003	273	101	2026-01-08	da_nop
12004	273	102	2026-01-08	da_nop
12005	273	103	2026-01-08	da_nop
12006	273	104	2026-01-08	da_nop
12007	273	105	2026-01-08	da_nop
12008	273	106	2026-01-08	da_nop
12009	273	107	2026-01-08	da_nop
12010	273	108	2026-01-08	tre_han
12011	273	109	2026-01-08	da_nop
12012	273	110	2026-01-08	da_nop
12013	274	67	2026-01-08	da_nop
12014	274	68	2026-01-08	da_nop
12015	274	69	2026-01-08	da_nop
12016	274	70	2026-01-08	da_nop
12017	274	71	2026-01-08	da_nop
12018	274	72	2026-01-08	da_nop
12019	274	73	2026-01-08	da_nop
12020	274	74	2026-01-08	da_nop
12021	274	75	2026-01-08	da_nop
12022	274	76	2026-01-08	da_nop
12023	274	77	2026-01-08	tre_han
12024	274	78	2026-01-08	da_nop
12025	274	79	2026-01-08	da_nop
12026	274	80	2026-01-08	tre_han
12027	274	81	2026-01-08	da_nop
12028	274	82	2026-01-08	da_nop
12029	274	83	2026-01-08	da_nop
12030	274	84	2026-01-08	da_nop
12031	274	85	2026-01-08	da_nop
12032	274	86	2026-01-08	da_nop
12033	274	87	2026-01-08	da_nop
12034	274	88	2026-01-08	da_nop
12035	274	89	2026-01-08	da_nop
12036	274	90	2026-01-08	da_nop
12037	274	91	2026-01-08	da_nop
12038	274	92	2026-01-08	da_nop
12039	274	93	2026-01-08	da_nop
12040	274	94	2026-01-08	da_nop
12041	274	95	2026-01-08	da_nop
12042	274	96	2026-01-08	da_nop
12043	274	97	2026-01-08	da_nop
12044	274	98	2026-01-08	da_nop
12045	274	99	2026-01-08	da_nop
12046	274	100	2026-01-08	da_nop
12047	274	101	2026-01-08	da_nop
12048	274	102	2026-01-08	da_nop
12049	274	103	2026-01-08	da_nop
12050	274	104	2026-01-08	da_nop
12051	274	105	2026-01-08	da_nop
12052	274	106	2026-01-08	da_nop
12053	274	107	2026-01-08	da_nop
12054	274	108	2026-01-08	da_nop
12055	274	109	2026-01-08	da_nop
12056	274	110	2026-01-08	da_nop
12057	275	67	2026-01-08	tre_han
12058	275	68	2026-01-08	da_nop
12059	275	69	2026-01-08	tre_han
12060	275	70	2026-01-08	da_nop
12061	275	71	2026-01-08	da_nop
12062	275	72	2026-01-08	da_nop
12063	275	73	2026-01-08	da_nop
12064	275	74	2026-01-08	da_nop
12065	275	75	2026-01-08	da_nop
12066	275	76	2026-01-08	da_nop
12067	275	77	2026-01-08	tre_han
12068	275	78	2026-01-08	da_nop
12069	275	79	2026-01-08	da_nop
12070	275	80	2026-01-08	tre_han
12071	275	81	2026-01-08	tre_han
12072	275	82	2026-01-08	tre_han
12073	275	83	2026-01-08	da_nop
12074	275	84	2026-01-08	da_nop
12075	275	85	2026-01-08	tre_han
12076	275	86	2026-01-08	da_nop
12077	275	87	2026-01-08	da_nop
12078	275	88	2026-01-08	da_nop
12079	275	89	2026-01-08	da_nop
12080	275	90	2026-01-08	da_nop
12081	275	91	2026-01-08	tre_han
12082	275	92	2026-01-08	da_nop
12083	275	93	2026-01-08	da_nop
12084	275	94	2026-01-08	da_nop
12085	275	95	2026-01-08	da_nop
12086	275	96	2026-01-08	da_nop
12087	275	97	2026-01-08	da_nop
12088	275	98	2026-01-08	da_nop
12089	275	99	2026-01-08	da_nop
12090	275	100	2026-01-08	da_nop
12091	275	101	2026-01-08	da_nop
12092	275	102	2026-01-08	da_nop
12093	275	103	2026-01-08	da_nop
12094	275	104	2026-01-08	da_nop
12095	275	105	2026-01-08	da_nop
12096	275	106	2026-01-08	da_nop
12097	275	107	2026-01-08	tre_han
12098	275	108	2026-01-08	da_nop
12099	275	109	2026-01-08	da_nop
12100	275	110	2026-01-08	da_nop
12101	276	67	2026-01-08	da_nop
12102	276	68	2026-01-08	da_nop
12103	276	69	2026-01-08	tre_han
12104	276	70	2026-01-08	da_nop
12105	276	71	2026-01-08	da_nop
12106	276	72	2026-01-08	da_nop
12107	276	73	2026-01-08	da_nop
12108	276	74	2026-01-08	da_nop
12109	276	75	2026-01-08	da_nop
12110	276	76	2026-01-08	da_nop
12111	276	77	2026-01-08	da_nop
12112	276	78	2026-01-08	tre_han
12113	276	79	2026-01-08	da_nop
12114	276	80	2026-01-08	tre_han
12115	276	81	2026-01-08	da_nop
12116	276	82	2026-01-08	tre_han
12117	276	83	2026-01-08	da_nop
12118	276	84	2026-01-08	tre_han
12119	276	85	2026-01-08	da_nop
12120	276	86	2026-01-08	da_nop
12121	276	87	2026-01-08	tre_han
12122	276	88	2026-01-08	da_nop
12123	276	89	2026-01-08	da_nop
12124	276	90	2026-01-08	da_nop
12125	276	91	2026-01-08	da_nop
12126	276	92	2026-01-08	tre_han
12127	276	93	2026-01-08	da_nop
12128	276	94	2026-01-08	da_nop
12129	276	95	2026-01-08	da_nop
12130	276	96	2026-01-08	da_nop
12131	276	97	2026-01-08	da_nop
12132	276	98	2026-01-08	da_nop
12133	276	99	2026-01-08	da_nop
12134	276	100	2026-01-08	da_nop
12135	276	101	2026-01-08	da_nop
12136	276	102	2026-01-08	da_nop
12137	276	103	2026-01-08	da_nop
12138	276	104	2026-01-08	tre_han
12139	276	105	2026-01-08	da_nop
12140	276	106	2026-01-08	tre_han
12141	276	107	2026-01-08	da_nop
12142	276	108	2026-01-08	da_nop
12143	276	109	2026-01-08	da_nop
12144	276	110	2026-01-08	da_nop
12145	277	67	2026-01-08	da_nop
12146	277	68	2026-01-08	da_nop
12147	277	69	2026-01-08	da_nop
12148	277	70	2026-01-08	da_nop
12149	277	71	2026-01-08	tre_han
12150	277	72	2026-01-08	da_nop
12151	277	73	2026-01-08	tre_han
12152	277	74	2026-01-08	da_nop
12153	277	75	2026-01-08	tre_han
12154	277	76	2026-01-08	da_nop
12155	277	77	2026-01-08	tre_han
12156	277	78	2026-01-08	da_nop
12157	277	79	2026-01-08	da_nop
12158	277	80	2026-01-08	da_nop
12159	277	81	2026-01-08	tre_han
12160	277	82	2026-01-08	da_nop
12161	277	83	2026-01-08	da_nop
12162	277	84	2026-01-08	da_nop
12163	277	85	2026-01-08	da_nop
12164	277	86	2026-01-08	da_nop
12165	277	87	2026-01-08	tre_han
12166	277	88	2026-01-08	tre_han
12167	277	89	2026-01-08	da_nop
12168	277	90	2026-01-08	tre_han
12169	277	91	2026-01-08	da_nop
12170	277	92	2026-01-08	tre_han
12171	277	93	2026-01-08	da_nop
12172	277	94	2026-01-08	tre_han
12173	277	95	2026-01-08	da_nop
12174	277	96	2026-01-08	da_nop
12175	277	97	2026-01-08	da_nop
12176	277	98	2026-01-08	da_nop
12177	277	99	2026-01-08	da_nop
12178	277	100	2026-01-08	da_nop
12179	277	101	2026-01-08	da_nop
12180	277	102	2026-01-08	da_nop
12181	277	103	2026-01-08	da_nop
12182	277	104	2026-01-08	da_nop
12183	277	105	2026-01-08	tre_han
12184	277	106	2026-01-08	da_nop
12185	277	107	2026-01-08	da_nop
12186	277	108	2026-01-08	da_nop
12187	277	109	2026-01-08	da_nop
12188	277	110	2026-01-08	da_nop
12189	278	67	2026-01-08	da_nop
12190	278	68	2026-01-08	da_nop
12191	278	69	2026-01-08	da_nop
12192	278	70	2026-01-08	da_nop
12193	278	71	2026-01-08	da_nop
12194	278	72	2026-01-08	tre_han
12195	278	73	2026-01-08	da_nop
12196	278	74	2026-01-08	tre_han
12197	278	75	2026-01-08	da_nop
12198	278	76	2026-01-08	da_nop
12199	278	77	2026-01-08	da_nop
12200	278	78	2026-01-08	da_nop
12201	278	79	2026-01-08	tre_han
12202	278	80	2026-01-08	da_nop
12203	278	81	2026-01-08	da_nop
12204	278	82	2026-01-08	da_nop
12205	278	83	2026-01-08	da_nop
12206	278	84	2026-01-08	da_nop
12207	278	85	2026-01-08	da_nop
12208	278	86	2026-01-08	da_nop
12209	278	87	2026-01-08	da_nop
12210	278	88	2026-01-08	da_nop
12211	278	89	2026-01-08	da_nop
12212	278	90	2026-01-08	da_nop
12213	278	91	2026-01-08	da_nop
12214	278	92	2026-01-08	da_nop
12215	278	93	2026-01-08	da_nop
12216	278	94	2026-01-08	da_nop
12217	278	95	2026-01-08	tre_han
12218	278	96	2026-01-08	tre_han
12219	278	97	2026-01-08	da_nop
12220	278	98	2026-01-08	da_nop
12221	278	99	2026-01-08	tre_han
12222	278	100	2026-01-08	tre_han
12223	278	101	2026-01-08	da_nop
12224	278	102	2026-01-08	da_nop
12225	278	103	2026-01-08	da_nop
12226	278	104	2026-01-08	da_nop
12227	278	105	2026-01-08	da_nop
12228	278	106	2026-01-08	da_nop
12229	278	107	2026-01-08	da_nop
12230	278	108	2026-01-08	da_nop
12231	278	109	2026-01-08	da_nop
12232	278	110	2026-01-08	tre_han
12233	279	67	2026-01-08	da_nop
12234	279	68	2026-01-08	da_nop
12235	279	69	2026-01-08	da_nop
12236	279	70	2026-01-08	tre_han
12237	279	71	2026-01-08	da_nop
12238	279	72	2026-01-08	da_nop
12239	279	73	2026-01-08	tre_han
12240	279	74	2026-01-08	tre_han
12241	279	75	2026-01-08	da_nop
12242	279	76	2026-01-08	da_nop
12243	279	77	2026-01-08	da_nop
12244	279	78	2026-01-08	da_nop
12245	279	79	2026-01-08	da_nop
12246	279	80	2026-01-08	tre_han
12247	279	81	2026-01-08	da_nop
12248	279	82	2026-01-08	da_nop
12249	279	83	2026-01-08	da_nop
12250	279	84	2026-01-08	tre_han
12251	279	85	2026-01-08	tre_han
12252	279	86	2026-01-08	da_nop
12253	279	87	2026-01-08	da_nop
12254	279	88	2026-01-08	da_nop
12255	279	89	2026-01-08	da_nop
12256	279	90	2026-01-08	da_nop
12257	279	91	2026-01-08	da_nop
12258	279	92	2026-01-08	da_nop
12259	279	93	2026-01-08	da_nop
12260	279	94	2026-01-08	da_nop
12261	279	95	2026-01-08	tre_han
12262	279	96	2026-01-08	da_nop
12263	279	97	2026-01-08	tre_han
12264	279	98	2026-01-08	da_nop
12265	279	99	2026-01-08	da_nop
12266	279	100	2026-01-08	da_nop
12267	279	101	2026-01-08	tre_han
12268	279	102	2026-01-08	da_nop
12269	279	103	2026-01-08	tre_han
12270	279	104	2026-01-08	da_nop
12271	279	105	2026-01-08	da_nop
12272	279	106	2026-01-08	da_nop
12273	279	107	2026-01-08	da_nop
12274	279	108	2026-01-08	da_nop
12275	279	109	2026-01-08	tre_han
12276	279	110	2026-01-08	da_nop
12277	280	67	2026-01-08	da_nop
12278	280	68	2026-01-08	da_nop
12279	280	69	2026-01-08	da_nop
12280	280	70	2026-01-08	da_nop
12281	280	71	2026-01-08	da_nop
12282	280	72	2026-01-08	tre_han
12283	280	73	2026-01-08	da_nop
12284	280	74	2026-01-08	da_nop
12285	280	75	2026-01-08	da_nop
12286	280	76	2026-01-08	da_nop
12287	280	77	2026-01-08	da_nop
12288	280	78	2026-01-08	da_nop
12289	280	79	2026-01-08	da_nop
12290	280	80	2026-01-08	tre_han
12291	280	81	2026-01-08	da_nop
12292	280	82	2026-01-08	da_nop
12293	280	83	2026-01-08	tre_han
12294	280	84	2026-01-08	da_nop
12295	280	85	2026-01-08	da_nop
12296	280	86	2026-01-08	da_nop
12297	280	87	2026-01-08	da_nop
12298	280	88	2026-01-08	da_nop
12299	280	89	2026-01-08	da_nop
12300	280	90	2026-01-08	da_nop
12301	280	91	2026-01-08	da_nop
12302	280	92	2026-01-08	tre_han
12303	280	93	2026-01-08	da_nop
12304	280	94	2026-01-08	da_nop
12305	280	95	2026-01-08	da_nop
12306	280	96	2026-01-08	da_nop
12307	280	97	2026-01-08	da_nop
12308	280	98	2026-01-08	da_nop
12309	280	99	2026-01-08	da_nop
12310	280	100	2026-01-08	da_nop
12311	280	101	2026-01-08	da_nop
12312	280	102	2026-01-08	da_nop
12313	280	103	2026-01-08	da_nop
12314	280	104	2026-01-08	da_nop
12315	280	105	2026-01-08	da_nop
12316	280	106	2026-01-08	da_nop
12317	280	107	2026-01-08	da_nop
12318	280	108	2026-01-08	tre_han
12319	280	109	2026-01-08	da_nop
12320	280	110	2026-01-08	da_nop
12321	281	67	2026-01-08	da_nop
12322	281	68	2026-01-08	da_nop
12323	281	69	2026-01-08	da_nop
12324	281	70	2026-01-08	da_nop
12325	281	71	2026-01-08	da_nop
12326	281	72	2026-01-08	da_nop
12327	281	73	2026-01-08	da_nop
12328	281	74	2026-01-08	tre_han
12329	281	75	2026-01-08	tre_han
12330	281	76	2026-01-08	da_nop
12331	281	77	2026-01-08	da_nop
12332	281	78	2026-01-08	da_nop
12333	281	79	2026-01-08	da_nop
12334	281	80	2026-01-08	tre_han
12335	281	81	2026-01-08	da_nop
12336	281	82	2026-01-08	da_nop
12337	281	83	2026-01-08	da_nop
12338	281	84	2026-01-08	da_nop
12339	281	85	2026-01-08	da_nop
12340	281	86	2026-01-08	da_nop
12341	281	87	2026-01-08	tre_han
12342	281	88	2026-01-08	da_nop
12343	281	89	2026-01-08	tre_han
12344	281	90	2026-01-08	da_nop
12345	281	91	2026-01-08	tre_han
12346	281	92	2026-01-08	da_nop
12347	281	93	2026-01-08	tre_han
12348	281	94	2026-01-08	da_nop
12349	281	95	2026-01-08	da_nop
12350	281	96	2026-01-08	tre_han
12351	281	97	2026-01-08	da_nop
12352	281	98	2026-01-08	da_nop
12353	281	99	2026-01-08	da_nop
12354	281	100	2026-01-08	tre_han
12355	281	101	2026-01-08	da_nop
12356	281	102	2026-01-08	da_nop
12357	281	103	2026-01-08	da_nop
12358	281	104	2026-01-08	da_nop
12359	281	105	2026-01-08	da_nop
12360	281	106	2026-01-08	da_nop
12361	281	107	2026-01-08	da_nop
12362	281	108	2026-01-08	da_nop
12363	281	109	2026-01-08	da_nop
12364	281	110	2026-01-08	tre_han
12365	282	67	2026-01-08	da_nop
12366	282	68	2026-01-08	da_nop
12367	282	69	2026-01-08	da_nop
12368	282	70	2026-01-08	da_nop
12369	282	71	2026-01-08	da_nop
12370	282	72	2026-01-08	da_nop
12371	282	73	2026-01-08	da_nop
12372	282	74	2026-01-08	da_nop
12373	282	75	2026-01-08	da_nop
12374	282	76	2026-01-08	da_nop
12375	282	77	2026-01-08	da_nop
12376	282	78	2026-01-08	da_nop
12377	282	79	2026-01-08	tre_han
12378	282	80	2026-01-08	da_nop
12379	282	81	2026-01-08	da_nop
12380	282	82	2026-01-08	da_nop
12381	282	83	2026-01-08	da_nop
12382	282	84	2026-01-08	da_nop
12383	282	85	2026-01-08	da_nop
12384	282	86	2026-01-08	da_nop
12385	282	87	2026-01-08	tre_han
12386	282	88	2026-01-08	da_nop
12387	282	89	2026-01-08	da_nop
12388	282	90	2026-01-08	da_nop
12389	282	91	2026-01-08	da_nop
12390	282	92	2026-01-08	da_nop
12391	282	93	2026-01-08	tre_han
12392	282	94	2026-01-08	da_nop
12393	282	95	2026-01-08	tre_han
12394	282	96	2026-01-08	da_nop
12395	282	97	2026-01-08	da_nop
12396	282	98	2026-01-08	da_nop
12397	282	99	2026-01-08	da_nop
12398	282	100	2026-01-08	tre_han
12399	282	101	2026-01-08	da_nop
12400	282	102	2026-01-08	da_nop
12401	282	103	2026-01-08	tre_han
12402	282	104	2026-01-08	da_nop
12403	282	105	2026-01-08	da_nop
12404	282	106	2026-01-08	tre_han
12405	282	107	2026-01-08	da_nop
12406	282	108	2026-01-08	da_nop
12407	282	109	2026-01-08	da_nop
12408	282	110	2026-01-08	da_nop
12409	283	67	2026-01-08	da_nop
12410	283	68	2026-01-08	da_nop
12411	283	69	2026-01-08	da_nop
12412	283	70	2026-01-08	da_nop
12413	283	71	2026-01-08	da_nop
12414	283	72	2026-01-08	da_nop
12415	283	73	2026-01-08	da_nop
12416	283	74	2026-01-08	tre_han
12417	283	75	2026-01-08	da_nop
12418	283	76	2026-01-08	tre_han
12419	283	77	2026-01-08	da_nop
12420	283	78	2026-01-08	da_nop
12421	283	79	2026-01-08	da_nop
12422	283	80	2026-01-08	da_nop
12423	283	81	2026-01-08	da_nop
12424	283	82	2026-01-08	tre_han
12425	283	83	2026-01-08	tre_han
12426	283	84	2026-01-08	da_nop
12427	283	85	2026-01-08	da_nop
12428	283	86	2026-01-08	da_nop
12429	283	87	2026-01-08	tre_han
12430	283	88	2026-01-08	da_nop
12431	283	89	2026-01-08	da_nop
12432	283	90	2026-01-08	da_nop
12433	283	91	2026-01-08	da_nop
12434	283	92	2026-01-08	tre_han
12435	283	93	2026-01-08	da_nop
12436	283	94	2026-01-08	da_nop
12437	283	95	2026-01-08	da_nop
12438	283	96	2026-01-08	tre_han
12439	283	97	2026-01-08	da_nop
12440	283	98	2026-01-08	da_nop
12441	283	99	2026-01-08	da_nop
12442	283	100	2026-01-08	tre_han
12443	283	101	2026-01-08	tre_han
12444	283	102	2026-01-08	tre_han
12445	283	103	2026-01-08	da_nop
12446	283	104	2026-01-08	tre_han
12447	283	105	2026-01-08	da_nop
12448	283	106	2026-01-08	tre_han
12449	283	107	2026-01-08	da_nop
12450	283	108	2026-01-08	da_nop
12451	283	109	2026-01-08	da_nop
12452	283	110	2026-01-08	da_nop
12453	284	67	2026-01-08	da_nop
12454	284	68	2026-01-08	da_nop
12455	284	69	2026-01-08	da_nop
12456	284	70	2026-01-08	da_nop
12457	284	71	2026-01-08	da_nop
12458	284	72	2026-01-08	tre_han
12459	284	73	2026-01-08	tre_han
12460	284	74	2026-01-08	da_nop
12461	284	75	2026-01-08	da_nop
12462	284	76	2026-01-08	tre_han
12463	284	77	2026-01-08	da_nop
12464	284	78	2026-01-08	da_nop
12465	284	79	2026-01-08	da_nop
12466	284	80	2026-01-08	da_nop
12467	284	81	2026-01-08	da_nop
12468	284	82	2026-01-08	da_nop
12469	284	83	2026-01-08	da_nop
12470	284	84	2026-01-08	tre_han
12471	284	85	2026-01-08	da_nop
12472	284	86	2026-01-08	tre_han
12473	284	87	2026-01-08	da_nop
12474	284	88	2026-01-08	da_nop
12475	284	89	2026-01-08	da_nop
12476	284	90	2026-01-08	tre_han
12477	284	91	2026-01-08	da_nop
12478	284	92	2026-01-08	da_nop
12479	284	93	2026-01-08	da_nop
12480	284	94	2026-01-08	da_nop
12481	284	95	2026-01-08	da_nop
12482	284	96	2026-01-08	tre_han
12483	284	97	2026-01-08	tre_han
12484	284	98	2026-01-08	da_nop
12485	284	99	2026-01-08	tre_han
12486	284	100	2026-01-08	da_nop
12487	284	101	2026-01-08	da_nop
12488	284	102	2026-01-08	da_nop
12489	284	103	2026-01-08	da_nop
12490	284	104	2026-01-08	tre_han
12491	284	105	2026-01-08	da_nop
12492	284	106	2026-01-08	da_nop
12493	284	107	2026-01-08	da_nop
12494	284	108	2026-01-08	tre_han
12495	284	109	2026-01-08	da_nop
12496	284	110	2026-01-08	da_nop
12497	285	67	2026-01-08	da_nop
12498	285	68	2026-01-08	da_nop
12499	285	69	2026-01-08	da_nop
12500	285	70	2026-01-08	da_nop
12501	285	71	2026-01-08	da_nop
12502	285	72	2026-01-08	da_nop
12503	285	73	2026-01-08	da_nop
12504	285	74	2026-01-08	da_nop
12505	285	75	2026-01-08	tre_han
12506	285	76	2026-01-08	da_nop
12507	285	77	2026-01-08	da_nop
12508	285	78	2026-01-08	da_nop
12509	285	79	2026-01-08	tre_han
12510	285	80	2026-01-08	tre_han
12511	285	81	2026-01-08	tre_han
12512	285	82	2026-01-08	tre_han
12513	285	83	2026-01-08	da_nop
12514	285	84	2026-01-08	tre_han
12515	285	85	2026-01-08	tre_han
12516	285	86	2026-01-08	da_nop
12517	285	87	2026-01-08	da_nop
12518	285	88	2026-01-08	tre_han
12519	285	89	2026-01-08	da_nop
12520	285	90	2026-01-08	da_nop
12521	285	91	2026-01-08	da_nop
12522	285	92	2026-01-08	da_nop
12523	285	93	2026-01-08	da_nop
12524	285	94	2026-01-08	tre_han
12525	285	95	2026-01-08	tre_han
12526	285	96	2026-01-08	da_nop
12527	285	97	2026-01-08	da_nop
12528	285	98	2026-01-08	da_nop
12529	285	99	2026-01-08	da_nop
12530	285	100	2026-01-08	da_nop
12531	285	101	2026-01-08	da_nop
12532	285	102	2026-01-08	da_nop
12533	285	103	2026-01-08	da_nop
12534	285	104	2026-01-08	da_nop
12535	285	105	2026-01-08	da_nop
12536	285	106	2026-01-08	tre_han
12537	285	107	2026-01-08	da_nop
12538	285	108	2026-01-08	tre_han
12539	285	109	2026-01-08	da_nop
12540	285	110	2026-01-08	tre_han
12541	286	67	2026-01-08	tre_han
12542	286	68	2026-01-08	da_nop
12543	286	69	2026-01-08	da_nop
12544	286	70	2026-01-08	tre_han
12545	286	71	2026-01-08	da_nop
12546	286	72	2026-01-08	da_nop
12547	286	73	2026-01-08	da_nop
12548	286	74	2026-01-08	tre_han
12549	286	75	2026-01-08	da_nop
12550	286	76	2026-01-08	da_nop
12551	286	77	2026-01-08	da_nop
12552	286	78	2026-01-08	da_nop
12553	286	79	2026-01-08	da_nop
12554	286	80	2026-01-08	tre_han
12555	286	81	2026-01-08	tre_han
12556	286	82	2026-01-08	tre_han
12557	286	83	2026-01-08	da_nop
12558	286	84	2026-01-08	tre_han
12559	286	85	2026-01-08	da_nop
12560	286	86	2026-01-08	tre_han
12561	286	87	2026-01-08	da_nop
12562	286	88	2026-01-08	da_nop
12563	286	89	2026-01-08	tre_han
12564	286	90	2026-01-08	tre_han
12565	286	91	2026-01-08	da_nop
12566	286	92	2026-01-08	da_nop
12567	286	93	2026-01-08	da_nop
12568	286	94	2026-01-08	da_nop
12569	286	95	2026-01-08	da_nop
12570	286	96	2026-01-08	da_nop
12571	286	97	2026-01-08	da_nop
12572	286	98	2026-01-08	da_nop
12573	286	99	2026-01-08	da_nop
12574	286	100	2026-01-08	da_nop
12575	286	101	2026-01-08	da_nop
12576	286	102	2026-01-08	da_nop
12577	286	103	2026-01-08	da_nop
12578	286	104	2026-01-08	tre_han
12579	286	105	2026-01-08	da_nop
12580	286	106	2026-01-08	tre_han
12581	286	107	2026-01-08	da_nop
12582	286	108	2026-01-08	da_nop
12583	286	109	2026-01-08	tre_han
12584	286	110	2026-01-08	da_nop
12585	287	67	2026-01-08	da_nop
12586	287	68	2026-01-08	tre_han
12587	287	69	2026-01-08	da_nop
12588	287	70	2026-01-08	tre_han
12589	287	71	2026-01-08	da_nop
12590	287	72	2026-01-08	da_nop
12591	287	73	2026-01-08	da_nop
12592	287	74	2026-01-08	da_nop
12593	287	75	2026-01-08	da_nop
12594	287	76	2026-01-08	da_nop
12595	287	77	2026-01-08	tre_han
12596	287	78	2026-01-08	da_nop
12597	287	79	2026-01-08	da_nop
12598	287	80	2026-01-08	da_nop
12599	287	81	2026-01-08	da_nop
12600	287	82	2026-01-08	da_nop
12601	287	83	2026-01-08	tre_han
12602	287	84	2026-01-08	tre_han
12603	287	85	2026-01-08	da_nop
12604	287	86	2026-01-08	tre_han
12605	287	87	2026-01-08	tre_han
12606	287	88	2026-01-08	da_nop
12607	287	89	2026-01-08	da_nop
12608	287	90	2026-01-08	da_nop
12609	287	91	2026-01-08	tre_han
12610	287	92	2026-01-08	da_nop
12611	287	93	2026-01-08	da_nop
12612	287	94	2026-01-08	da_nop
12613	287	95	2026-01-08	da_nop
12614	287	96	2026-01-08	da_nop
12615	287	97	2026-01-08	da_nop
12616	287	98	2026-01-08	da_nop
12617	287	99	2026-01-08	da_nop
12618	287	100	2026-01-08	da_nop
12619	287	101	2026-01-08	da_nop
12620	287	102	2026-01-08	da_nop
12621	287	103	2026-01-08	da_nop
12622	287	104	2026-01-08	da_nop
12623	287	105	2026-01-08	tre_han
12624	287	106	2026-01-08	da_nop
12625	287	107	2026-01-08	da_nop
12626	287	108	2026-01-08	da_nop
12627	287	109	2026-01-08	da_nop
12628	287	110	2026-01-08	da_nop
12629	288	67	2026-01-08	da_nop
12630	288	68	2026-01-08	da_nop
12631	288	69	2026-01-08	da_nop
12632	288	70	2026-01-08	tre_han
12633	288	71	2026-01-08	da_nop
12634	288	72	2026-01-08	da_nop
12635	288	73	2026-01-08	da_nop
12636	288	74	2026-01-08	tre_han
12637	288	75	2026-01-08	tre_han
12638	288	76	2026-01-08	da_nop
12639	288	77	2026-01-08	da_nop
12640	288	78	2026-01-08	da_nop
12641	288	79	2026-01-08	tre_han
12642	288	80	2026-01-08	da_nop
12643	288	81	2026-01-08	da_nop
12644	288	82	2026-01-08	tre_han
12645	288	83	2026-01-08	da_nop
12646	288	84	2026-01-08	da_nop
12647	288	85	2026-01-08	da_nop
12648	288	86	2026-01-08	da_nop
12649	288	87	2026-01-08	da_nop
12650	288	88	2026-01-08	da_nop
12651	288	89	2026-01-08	da_nop
12652	288	90	2026-01-08	da_nop
12653	288	91	2026-01-08	da_nop
12654	288	92	2026-01-08	da_nop
12655	288	93	2026-01-08	tre_han
12656	288	94	2026-01-08	da_nop
12657	288	95	2026-01-08	tre_han
12658	288	96	2026-01-08	da_nop
12659	288	97	2026-01-08	da_nop
12660	288	98	2026-01-08	da_nop
12661	288	99	2026-01-08	da_nop
12662	288	100	2026-01-08	tre_han
12663	288	101	2026-01-08	da_nop
12664	288	102	2026-01-08	da_nop
12665	288	103	2026-01-08	da_nop
12666	288	104	2026-01-08	da_nop
12667	288	105	2026-01-08	da_nop
12668	288	106	2026-01-08	da_nop
12669	288	107	2026-01-08	da_nop
12670	288	108	2026-01-08	da_nop
12671	288	109	2026-01-08	tre_han
12672	288	110	2026-01-08	da_nop
12673	289	67	2026-01-08	da_nop
12674	289	68	2026-01-08	da_nop
12675	289	69	2026-01-08	da_nop
12676	289	70	2026-01-08	da_nop
12677	289	71	2026-01-08	da_nop
12678	289	72	2026-01-08	da_nop
12679	289	73	2026-01-08	da_nop
12680	289	74	2026-01-08	tre_han
12681	289	75	2026-01-08	da_nop
12682	289	76	2026-01-08	da_nop
12683	289	77	2026-01-08	tre_han
12684	289	78	2026-01-08	tre_han
12685	289	79	2026-01-08	da_nop
12686	289	80	2026-01-08	da_nop
12687	289	81	2026-01-08	da_nop
12688	289	82	2026-01-08	da_nop
12689	289	83	2026-01-08	da_nop
12690	289	84	2026-01-08	da_nop
12691	289	85	2026-01-08	da_nop
12692	289	86	2026-01-08	tre_han
12693	289	87	2026-01-08	da_nop
12694	289	88	2026-01-08	da_nop
12695	289	89	2026-01-08	da_nop
12696	289	90	2026-01-08	da_nop
12697	289	91	2026-01-08	da_nop
12698	289	92	2026-01-08	da_nop
12699	289	93	2026-01-08	tre_han
12700	289	94	2026-01-08	da_nop
12701	289	95	2026-01-08	da_nop
12702	289	96	2026-01-08	da_nop
12703	289	97	2026-01-08	da_nop
12704	289	98	2026-01-08	da_nop
12705	289	99	2026-01-08	da_nop
12706	289	100	2026-01-08	da_nop
12707	289	101	2026-01-08	da_nop
12708	289	102	2026-01-08	da_nop
12709	289	103	2026-01-08	da_nop
12710	289	104	2026-01-08	da_nop
12711	289	105	2026-01-08	da_nop
12712	289	106	2026-01-08	da_nop
12713	289	107	2026-01-08	da_nop
12714	289	108	2026-01-08	tre_han
12715	289	109	2026-01-08	da_nop
12716	289	110	2026-01-08	da_nop
12717	290	67	2026-01-08	da_nop
12718	290	68	2026-01-08	tre_han
12719	290	69	2026-01-08	da_nop
12720	290	70	2026-01-08	da_nop
12721	290	71	2026-01-08	da_nop
12722	290	72	2026-01-08	tre_han
12723	290	73	2026-01-08	da_nop
12724	290	74	2026-01-08	da_nop
12725	290	75	2026-01-08	da_nop
12726	290	76	2026-01-08	da_nop
12727	290	77	2026-01-08	tre_han
12728	290	78	2026-01-08	da_nop
12729	290	79	2026-01-08	tre_han
12730	290	80	2026-01-08	da_nop
12731	290	81	2026-01-08	da_nop
12732	290	82	2026-01-08	da_nop
12733	290	83	2026-01-08	da_nop
12734	290	84	2026-01-08	da_nop
12735	290	85	2026-01-08	da_nop
12736	290	86	2026-01-08	tre_han
12737	290	87	2026-01-08	da_nop
12738	290	88	2026-01-08	tre_han
12739	290	89	2026-01-08	da_nop
12740	290	90	2026-01-08	da_nop
12741	290	91	2026-01-08	da_nop
12742	290	92	2026-01-08	tre_han
12743	290	93	2026-01-08	da_nop
12744	290	94	2026-01-08	da_nop
12745	290	95	2026-01-08	da_nop
12746	290	96	2026-01-08	tre_han
12747	290	97	2026-01-08	da_nop
12748	290	98	2026-01-08	tre_han
12749	290	99	2026-01-08	da_nop
12750	290	100	2026-01-08	tre_han
12751	290	101	2026-01-08	da_nop
12752	290	102	2026-01-08	da_nop
12753	290	103	2026-01-08	da_nop
12754	290	104	2026-01-08	tre_han
12755	290	105	2026-01-08	da_nop
12756	290	106	2026-01-08	da_nop
12757	290	107	2026-01-08	tre_han
12758	290	108	2026-01-08	da_nop
12759	290	109	2026-01-08	da_nop
12760	290	110	2026-01-08	da_nop
12761	291	67	2026-01-08	da_nop
12762	291	68	2026-01-08	da_nop
12763	291	69	2026-01-08	da_nop
12764	291	70	2026-01-08	da_nop
12765	291	71	2026-01-08	da_nop
12766	291	72	2026-01-08	da_nop
12767	291	73	2026-01-08	da_nop
12768	291	74	2026-01-08	da_nop
12769	291	75	2026-01-08	da_nop
12770	291	76	2026-01-08	da_nop
12771	291	77	2026-01-08	da_nop
12772	291	78	2026-01-08	da_nop
12773	291	79	2026-01-08	da_nop
12774	291	80	2026-01-08	da_nop
12775	291	81	2026-01-08	tre_han
12776	291	82	2026-01-08	da_nop
12777	291	83	2026-01-08	da_nop
12778	291	84	2026-01-08	tre_han
12779	291	85	2026-01-08	da_nop
12780	291	86	2026-01-08	da_nop
12781	291	87	2026-01-08	da_nop
12782	291	88	2026-01-08	da_nop
12783	291	89	2026-01-08	da_nop
12784	291	90	2026-01-08	da_nop
12785	291	91	2026-01-08	da_nop
12786	291	92	2026-01-08	da_nop
12787	291	93	2026-01-08	da_nop
12788	291	94	2026-01-08	da_nop
12789	291	95	2026-01-08	da_nop
12790	291	96	2026-01-08	da_nop
12791	291	97	2026-01-08	da_nop
12792	291	98	2026-01-08	da_nop
12793	291	99	2026-01-08	da_nop
12794	291	100	2026-01-08	tre_han
12795	291	101	2026-01-08	da_nop
12796	291	102	2026-01-08	da_nop
12797	291	103	2026-01-08	tre_han
12798	291	104	2026-01-08	tre_han
12799	291	105	2026-01-08	da_nop
12800	291	106	2026-01-08	da_nop
12801	291	107	2026-01-08	da_nop
12802	291	108	2026-01-08	da_nop
12803	291	109	2026-01-08	da_nop
12804	291	110	2026-01-08	tre_han
12805	292	67	2026-01-08	da_nop
12806	292	68	2026-01-08	da_nop
12807	292	69	2026-01-08	da_nop
12808	292	70	2026-01-08	da_nop
12809	292	71	2026-01-08	da_nop
12810	292	72	2026-01-08	da_nop
12811	292	73	2026-01-08	da_nop
12812	292	74	2026-01-08	da_nop
12813	292	75	2026-01-08	da_nop
12814	292	76	2026-01-08	da_nop
12815	292	77	2026-01-08	da_nop
12816	292	78	2026-01-08	da_nop
12817	292	79	2026-01-08	da_nop
12818	292	80	2026-01-08	da_nop
12819	292	81	2026-01-08	tre_han
12820	292	82	2026-01-08	tre_han
12821	292	83	2026-01-08	da_nop
12822	292	84	2026-01-08	da_nop
12823	292	85	2026-01-08	tre_han
12824	292	86	2026-01-08	da_nop
12825	292	87	2026-01-08	da_nop
12826	292	88	2026-01-08	da_nop
12827	292	89	2026-01-08	da_nop
12828	292	90	2026-01-08	da_nop
12829	292	91	2026-01-08	da_nop
12830	292	92	2026-01-08	da_nop
12831	292	93	2026-01-08	tre_han
12832	292	94	2026-01-08	da_nop
12833	292	95	2026-01-08	da_nop
12834	292	96	2026-01-08	da_nop
12835	292	97	2026-01-08	da_nop
12836	292	98	2026-01-08	da_nop
12837	292	99	2026-01-08	da_nop
12838	292	100	2026-01-08	da_nop
12839	292	101	2026-01-08	da_nop
12840	292	102	2026-01-08	da_nop
12841	292	103	2026-01-08	da_nop
12842	292	104	2026-01-08	da_nop
12843	292	105	2026-01-08	da_nop
12844	292	106	2026-01-08	da_nop
12845	292	107	2026-01-08	da_nop
12846	292	108	2026-01-08	da_nop
12847	292	109	2026-01-08	da_nop
12848	292	110	2026-01-08	da_nop
12849	293	67	2026-01-08	da_nop
12850	293	68	2026-01-08	da_nop
12851	293	69	2026-01-08	da_nop
12852	293	70	2026-01-08	da_nop
12853	293	71	2026-01-08	da_nop
12854	293	72	2026-01-08	tre_han
12855	293	73	2026-01-08	da_nop
12856	293	74	2026-01-08	da_nop
12857	293	75	2026-01-08	tre_han
12858	293	76	2026-01-08	tre_han
12859	293	77	2026-01-08	da_nop
12860	293	78	2026-01-08	da_nop
12861	293	79	2026-01-08	da_nop
12862	293	80	2026-01-08	tre_han
12863	293	81	2026-01-08	tre_han
12864	293	82	2026-01-08	da_nop
12865	293	83	2026-01-08	da_nop
12866	293	84	2026-01-08	da_nop
12867	293	85	2026-01-08	tre_han
12868	293	86	2026-01-08	da_nop
12869	293	87	2026-01-08	da_nop
12870	293	88	2026-01-08	tre_han
12871	293	89	2026-01-08	da_nop
12872	293	90	2026-01-08	da_nop
12873	293	91	2026-01-08	da_nop
12874	293	92	2026-01-08	tre_han
12875	293	93	2026-01-08	tre_han
12876	293	94	2026-01-08	da_nop
12877	293	95	2026-01-08	da_nop
12878	293	96	2026-01-08	da_nop
12879	293	97	2026-01-08	tre_han
12880	293	98	2026-01-08	da_nop
12881	293	99	2026-01-08	tre_han
12882	293	100	2026-01-08	da_nop
12883	293	101	2026-01-08	da_nop
12884	293	102	2026-01-08	da_nop
12885	293	103	2026-01-08	tre_han
12886	293	104	2026-01-08	tre_han
12887	293	105	2026-01-08	da_nop
12888	293	106	2026-01-08	da_nop
12889	293	107	2026-01-08	da_nop
12890	293	108	2026-01-08	da_nop
12891	293	109	2026-01-08	da_nop
12892	293	110	2026-01-08	da_nop
12893	294	67	2026-01-08	da_nop
12894	294	68	2026-01-08	da_nop
12895	294	69	2026-01-08	da_nop
12896	294	70	2026-01-08	da_nop
12897	294	71	2026-01-08	da_nop
12898	294	72	2026-01-08	da_nop
12899	294	73	2026-01-08	da_nop
12900	294	74	2026-01-08	da_nop
12901	294	75	2026-01-08	tre_han
12902	294	76	2026-01-08	da_nop
12903	294	77	2026-01-08	da_nop
12904	294	78	2026-01-08	da_nop
12905	294	79	2026-01-08	da_nop
12906	294	80	2026-01-08	da_nop
12907	294	81	2026-01-08	tre_han
12908	294	82	2026-01-08	da_nop
12909	294	83	2026-01-08	da_nop
12910	294	84	2026-01-08	da_nop
12911	294	85	2026-01-08	tre_han
12912	294	86	2026-01-08	da_nop
12913	294	87	2026-01-08	da_nop
12914	294	88	2026-01-08	da_nop
12915	294	89	2026-01-08	da_nop
12916	294	90	2026-01-08	da_nop
12917	294	91	2026-01-08	da_nop
12918	294	92	2026-01-08	da_nop
12919	294	93	2026-01-08	tre_han
12920	294	94	2026-01-08	da_nop
12921	294	95	2026-01-08	tre_han
12922	294	96	2026-01-08	da_nop
12923	294	97	2026-01-08	da_nop
12924	294	98	2026-01-08	da_nop
12925	294	99	2026-01-08	da_nop
12926	294	100	2026-01-08	da_nop
12927	294	101	2026-01-08	da_nop
12928	294	102	2026-01-08	tre_han
12929	294	103	2026-01-08	da_nop
12930	294	104	2026-01-08	da_nop
12931	294	105	2026-01-08	da_nop
12932	294	106	2026-01-08	da_nop
12933	294	107	2026-01-08	da_nop
12934	294	108	2026-01-08	da_nop
12935	294	109	2026-01-08	tre_han
12936	294	110	2026-01-08	da_nop
12937	295	67	2026-01-08	da_nop
12938	295	68	2026-01-08	tre_han
12939	295	69	2026-01-08	da_nop
12940	295	70	2026-01-08	tre_han
12941	295	71	2026-01-08	tre_han
12942	295	72	2026-01-08	tre_han
12943	295	73	2026-01-08	da_nop
12944	295	74	2026-01-08	da_nop
12945	295	75	2026-01-08	da_nop
12946	295	76	2026-01-08	da_nop
12947	295	77	2026-01-08	da_nop
12948	295	78	2026-01-08	da_nop
12949	295	79	2026-01-08	tre_han
12950	295	80	2026-01-08	da_nop
12951	295	81	2026-01-08	da_nop
12952	295	82	2026-01-08	da_nop
12953	295	83	2026-01-08	da_nop
12954	295	84	2026-01-08	da_nop
12955	295	85	2026-01-08	tre_han
12956	295	86	2026-01-08	da_nop
12957	295	87	2026-01-08	da_nop
12958	295	88	2026-01-08	da_nop
12959	295	89	2026-01-08	da_nop
12960	295	90	2026-01-08	da_nop
12961	295	91	2026-01-08	tre_han
12962	295	92	2026-01-08	da_nop
12963	295	93	2026-01-08	da_nop
12964	295	94	2026-01-08	da_nop
12965	295	95	2026-01-08	tre_han
12966	295	96	2026-01-08	da_nop
12967	295	97	2026-01-08	da_nop
12968	295	98	2026-01-08	da_nop
12969	295	99	2026-01-08	da_nop
12970	295	100	2026-01-08	da_nop
12971	295	101	2026-01-08	da_nop
12972	295	102	2026-01-08	tre_han
12973	295	103	2026-01-08	da_nop
12974	295	104	2026-01-08	da_nop
12975	295	105	2026-01-08	da_nop
12976	295	106	2026-01-08	tre_han
12977	295	107	2026-01-08	da_nop
12978	295	108	2026-01-08	da_nop
12979	295	109	2026-01-08	tre_han
12980	295	110	2026-01-08	da_nop
12981	296	67	2026-01-08	da_nop
12982	296	68	2026-01-08	tre_han
12983	296	69	2026-01-08	da_nop
12984	296	70	2026-01-08	da_nop
12985	296	71	2026-01-08	da_nop
12986	296	72	2026-01-08	da_nop
12987	296	73	2026-01-08	tre_han
12988	296	74	2026-01-08	tre_han
12989	296	75	2026-01-08	da_nop
12990	296	76	2026-01-08	da_nop
12991	296	77	2026-01-08	da_nop
12992	296	78	2026-01-08	tre_han
12993	296	79	2026-01-08	da_nop
12994	296	80	2026-01-08	da_nop
12995	296	81	2026-01-08	da_nop
12996	296	82	2026-01-08	da_nop
12997	296	83	2026-01-08	da_nop
12998	296	84	2026-01-08	da_nop
12999	296	85	2026-01-08	da_nop
13000	296	86	2026-01-08	da_nop
13001	296	87	2026-01-08	da_nop
13002	296	88	2026-01-08	da_nop
13003	296	89	2026-01-08	tre_han
13004	296	90	2026-01-08	da_nop
13005	296	91	2026-01-08	da_nop
13006	296	92	2026-01-08	da_nop
13007	296	93	2026-01-08	da_nop
13008	296	94	2026-01-08	da_nop
13009	296	95	2026-01-08	da_nop
13010	296	96	2026-01-08	da_nop
13011	296	97	2026-01-08	da_nop
13012	296	98	2026-01-08	da_nop
13013	296	99	2026-01-08	da_nop
13014	296	100	2026-01-08	da_nop
13015	296	101	2026-01-08	tre_han
13016	296	102	2026-01-08	tre_han
13017	296	103	2026-01-08	da_nop
13018	296	104	2026-01-08	da_nop
13019	296	105	2026-01-08	tre_han
13020	296	106	2026-01-08	da_nop
13021	296	107	2026-01-08	da_nop
13022	296	108	2026-01-08	da_nop
13023	296	109	2026-01-08	da_nop
13024	296	110	2026-01-08	da_nop
13025	297	67	2026-01-08	da_nop
13026	297	68	2026-01-08	tre_han
13027	297	69	2026-01-08	da_nop
13028	297	70	2026-01-08	da_nop
13029	297	71	2026-01-08	tre_han
13030	297	72	2026-01-08	da_nop
13031	297	73	2026-01-08	da_nop
13032	297	74	2026-01-08	da_nop
13033	297	75	2026-01-08	da_nop
13034	297	76	2026-01-08	tre_han
13035	297	77	2026-01-08	da_nop
13036	297	78	2026-01-08	da_nop
13037	297	79	2026-01-08	tre_han
13038	297	80	2026-01-08	tre_han
13039	297	81	2026-01-08	tre_han
13040	297	82	2026-01-08	da_nop
13041	297	83	2026-01-08	da_nop
13042	297	84	2026-01-08	da_nop
13043	297	85	2026-01-08	da_nop
13044	297	86	2026-01-08	da_nop
13045	297	87	2026-01-08	da_nop
13046	297	88	2026-01-08	da_nop
13047	297	89	2026-01-08	da_nop
13048	297	90	2026-01-08	da_nop
13049	297	91	2026-01-08	da_nop
13050	297	92	2026-01-08	da_nop
13051	297	93	2026-01-08	tre_han
13052	297	94	2026-01-08	da_nop
13053	297	95	2026-01-08	tre_han
13054	297	96	2026-01-08	da_nop
13055	297	97	2026-01-08	da_nop
13056	297	98	2026-01-08	da_nop
13057	297	99	2026-01-08	da_nop
13058	297	100	2026-01-08	tre_han
13059	297	101	2026-01-08	da_nop
13060	297	102	2026-01-08	da_nop
13061	297	103	2026-01-08	tre_han
13062	297	104	2026-01-08	da_nop
13063	297	105	2026-01-08	da_nop
13064	297	106	2026-01-08	da_nop
13065	297	107	2026-01-08	da_nop
13066	297	108	2026-01-08	da_nop
13067	297	109	2026-01-08	da_nop
13068	297	110	2026-01-08	da_nop
13069	298	67	2026-01-08	da_nop
13070	298	68	2026-01-08	da_nop
13071	298	69	2026-01-08	da_nop
13072	298	70	2026-01-08	tre_han
13073	298	71	2026-01-08	da_nop
13074	298	72	2026-01-08	da_nop
13075	298	73	2026-01-08	da_nop
13076	298	74	2026-01-08	tre_han
13077	298	75	2026-01-08	da_nop
13078	298	76	2026-01-08	da_nop
13079	298	77	2026-01-08	da_nop
13080	298	78	2026-01-08	tre_han
13081	298	79	2026-01-08	da_nop
13082	298	80	2026-01-08	da_nop
13083	298	81	2026-01-08	da_nop
13084	298	82	2026-01-08	da_nop
13085	298	83	2026-01-08	da_nop
13086	298	84	2026-01-08	tre_han
13087	298	85	2026-01-08	da_nop
13088	298	86	2026-01-08	tre_han
13089	298	87	2026-01-08	da_nop
13090	298	88	2026-01-08	da_nop
13091	298	89	2026-01-08	da_nop
13092	298	90	2026-01-08	da_nop
13093	298	91	2026-01-08	tre_han
13094	298	92	2026-01-08	da_nop
13095	298	93	2026-01-08	da_nop
13096	298	94	2026-01-08	da_nop
13097	298	95	2026-01-08	da_nop
13098	298	96	2026-01-08	da_nop
13099	298	97	2026-01-08	da_nop
13100	298	98	2026-01-08	da_nop
13101	298	99	2026-01-08	tre_han
13102	298	100	2026-01-08	da_nop
13103	298	101	2026-01-08	da_nop
13104	298	102	2026-01-08	da_nop
13105	298	103	2026-01-08	da_nop
13106	298	104	2026-01-08	da_nop
13107	298	105	2026-01-08	da_nop
13108	298	106	2026-01-08	da_nop
13109	298	107	2026-01-08	da_nop
13110	298	108	2026-01-08	tre_han
13111	298	109	2026-01-08	da_nop
13112	298	110	2026-01-08	da_nop
13113	299	67	2026-01-08	da_nop
13114	299	68	2026-01-08	da_nop
13115	299	69	2026-01-08	da_nop
13116	299	70	2026-01-08	da_nop
13117	299	71	2026-01-08	tre_han
13118	299	72	2026-01-08	da_nop
13119	299	73	2026-01-08	da_nop
13120	299	74	2026-01-08	da_nop
13121	299	75	2026-01-08	da_nop
13122	299	76	2026-01-08	tre_han
13123	299	77	2026-01-08	da_nop
13124	299	78	2026-01-08	da_nop
13125	299	79	2026-01-08	da_nop
13126	299	80	2026-01-08	da_nop
13127	299	81	2026-01-08	da_nop
13128	299	82	2026-01-08	da_nop
13129	299	83	2026-01-08	da_nop
13130	299	84	2026-01-08	da_nop
13131	299	85	2026-01-08	da_nop
13132	299	86	2026-01-08	da_nop
13133	299	87	2026-01-08	da_nop
13134	299	88	2026-01-08	da_nop
13135	299	89	2026-01-08	da_nop
13136	299	90	2026-01-08	tre_han
13137	299	91	2026-01-08	da_nop
13138	299	92	2026-01-08	da_nop
13139	299	93	2026-01-08	da_nop
13140	299	94	2026-01-08	da_nop
13141	299	95	2026-01-08	da_nop
13142	299	96	2026-01-08	da_nop
13143	299	97	2026-01-08	tre_han
13144	299	98	2026-01-08	da_nop
13145	299	99	2026-01-08	tre_han
13146	299	100	2026-01-08	da_nop
13147	299	101	2026-01-08	da_nop
13148	299	102	2026-01-08	da_nop
13149	299	103	2026-01-08	da_nop
13150	299	104	2026-01-08	da_nop
13151	299	105	2026-01-08	da_nop
13152	299	106	2026-01-08	da_nop
13153	299	107	2026-01-08	da_nop
13154	299	108	2026-01-08	da_nop
13155	299	109	2026-01-08	da_nop
13156	299	110	2026-01-08	tre_han
13157	300	67	2026-01-08	tre_han
13158	300	68	2026-01-08	tre_han
13159	300	69	2026-01-08	da_nop
13160	300	70	2026-01-08	da_nop
13161	300	71	2026-01-08	da_nop
13162	300	72	2026-01-08	tre_han
13163	300	73	2026-01-08	da_nop
13164	300	74	2026-01-08	tre_han
13165	300	75	2026-01-08	da_nop
13166	300	76	2026-01-08	tre_han
13167	300	77	2026-01-08	da_nop
13168	300	78	2026-01-08	da_nop
13169	300	79	2026-01-08	da_nop
13170	300	80	2026-01-08	tre_han
13171	300	81	2026-01-08	da_nop
13172	300	82	2026-01-08	da_nop
13173	300	83	2026-01-08	da_nop
13174	300	84	2026-01-08	da_nop
13175	300	85	2026-01-08	da_nop
13176	300	86	2026-01-08	da_nop
13177	300	87	2026-01-08	da_nop
13178	300	88	2026-01-08	da_nop
13179	300	89	2026-01-08	tre_han
13180	300	90	2026-01-08	tre_han
13181	300	91	2026-01-08	da_nop
13182	300	92	2026-01-08	tre_han
13183	300	93	2026-01-08	da_nop
13184	300	94	2026-01-08	da_nop
13185	300	95	2026-01-08	tre_han
13186	300	96	2026-01-08	da_nop
13187	300	97	2026-01-08	da_nop
13188	300	98	2026-01-08	da_nop
13189	300	99	2026-01-08	da_nop
13190	300	100	2026-01-08	da_nop
13191	300	101	2026-01-08	da_nop
13192	300	102	2026-01-08	tre_han
13193	300	103	2026-01-08	da_nop
13194	300	104	2026-01-08	da_nop
13195	300	105	2026-01-08	da_nop
13196	300	106	2026-01-08	da_nop
13197	300	107	2026-01-08	da_nop
13198	300	108	2026-01-08	da_nop
13199	300	109	2026-01-08	da_nop
13200	300	110	2026-01-08	da_nop
13201	301	67	2026-01-08	da_nop
13202	301	68	2026-01-08	da_nop
13203	301	69	2026-01-08	da_nop
13204	301	70	2026-01-08	da_nop
13205	301	71	2026-01-08	da_nop
13206	301	72	2026-01-08	da_nop
13207	301	73	2026-01-08	da_nop
13208	301	74	2026-01-08	tre_han
13209	301	75	2026-01-08	da_nop
13210	301	76	2026-01-08	da_nop
13211	301	77	2026-01-08	da_nop
13212	301	78	2026-01-08	da_nop
13213	301	79	2026-01-08	da_nop
13214	301	80	2026-01-08	da_nop
13215	301	81	2026-01-08	da_nop
13216	301	82	2026-01-08	da_nop
13217	301	83	2026-01-08	da_nop
13218	301	84	2026-01-08	da_nop
13219	301	85	2026-01-08	da_nop
13220	301	86	2026-01-08	da_nop
13221	301	87	2026-01-08	da_nop
13222	301	88	2026-01-08	da_nop
13223	301	89	2026-01-08	da_nop
13224	301	90	2026-01-08	da_nop
13225	301	91	2026-01-08	da_nop
13226	301	92	2026-01-08	da_nop
13227	301	93	2026-01-08	tre_han
13228	301	94	2026-01-08	tre_han
13229	301	95	2026-01-08	da_nop
13230	301	96	2026-01-08	da_nop
13231	301	97	2026-01-08	da_nop
13232	301	98	2026-01-08	da_nop
13233	301	99	2026-01-08	da_nop
13234	301	100	2026-01-08	da_nop
13235	301	101	2026-01-08	da_nop
13236	301	102	2026-01-08	da_nop
13237	301	103	2026-01-08	da_nop
13238	301	104	2026-01-08	da_nop
13239	301	105	2026-01-08	da_nop
13240	301	106	2026-01-08	tre_han
13241	301	107	2026-01-08	da_nop
13242	301	108	2026-01-08	da_nop
13243	301	109	2026-01-08	da_nop
13244	301	110	2026-01-08	da_nop
13245	302	67	2026-01-08	da_nop
13246	302	68	2026-01-08	da_nop
13247	302	69	2026-01-08	da_nop
13248	302	70	2026-01-08	da_nop
13249	302	71	2026-01-08	da_nop
13250	302	72	2026-01-08	da_nop
13251	302	73	2026-01-08	da_nop
13252	302	74	2026-01-08	da_nop
13253	302	75	2026-01-08	da_nop
13254	302	76	2026-01-08	tre_han
13255	302	77	2026-01-08	da_nop
13256	302	78	2026-01-08	da_nop
13257	302	79	2026-01-08	da_nop
13258	302	80	2026-01-08	da_nop
13259	302	81	2026-01-08	tre_han
13260	302	82	2026-01-08	da_nop
13261	302	83	2026-01-08	da_nop
13262	302	84	2026-01-08	da_nop
13263	302	85	2026-01-08	da_nop
13264	302	86	2026-01-08	da_nop
13265	302	87	2026-01-08	da_nop
13266	302	88	2026-01-08	da_nop
13267	302	89	2026-01-08	tre_han
13268	302	90	2026-01-08	da_nop
13269	302	91	2026-01-08	da_nop
13270	302	92	2026-01-08	da_nop
13271	302	93	2026-01-08	da_nop
13272	302	94	2026-01-08	da_nop
13273	302	95	2026-01-08	da_nop
13274	302	96	2026-01-08	da_nop
13275	302	97	2026-01-08	da_nop
13276	302	98	2026-01-08	da_nop
13277	302	99	2026-01-08	da_nop
13278	302	100	2026-01-08	da_nop
13279	302	101	2026-01-08	da_nop
13280	302	102	2026-01-08	tre_han
13281	302	103	2026-01-08	da_nop
13282	302	104	2026-01-08	da_nop
13283	302	105	2026-01-08	da_nop
13284	302	106	2026-01-08	da_nop
13285	302	107	2026-01-08	da_nop
13286	302	108	2026-01-08	da_nop
13287	302	109	2026-01-08	da_nop
13288	302	110	2026-01-08	da_nop
13289	303	67	2026-01-08	da_nop
13290	303	68	2026-01-08	da_nop
13291	303	69	2026-01-08	da_nop
13292	303	70	2026-01-08	da_nop
13293	303	71	2026-01-08	da_nop
13294	303	72	2026-01-08	da_nop
13295	303	73	2026-01-08	tre_han
13296	303	74	2026-01-08	da_nop
13297	303	75	2026-01-08	da_nop
13298	303	76	2026-01-08	da_nop
13299	303	77	2026-01-08	da_nop
13300	303	78	2026-01-08	da_nop
13301	303	79	2026-01-08	da_nop
13302	303	80	2026-01-08	tre_han
13303	303	81	2026-01-08	tre_han
13304	303	82	2026-01-08	da_nop
13305	303	83	2026-01-08	da_nop
13306	303	84	2026-01-08	da_nop
13307	303	85	2026-01-08	tre_han
13308	303	86	2026-01-08	da_nop
13309	303	87	2026-01-08	da_nop
13310	303	88	2026-01-08	da_nop
13311	303	89	2026-01-08	tre_han
13312	303	90	2026-01-08	tre_han
13313	303	91	2026-01-08	da_nop
13314	303	92	2026-01-08	tre_han
13315	303	93	2026-01-08	tre_han
13316	303	94	2026-01-08	da_nop
13317	303	95	2026-01-08	da_nop
13318	303	96	2026-01-08	da_nop
13319	303	97	2026-01-08	tre_han
13320	303	98	2026-01-08	tre_han
13321	303	99	2026-01-08	da_nop
13322	303	100	2026-01-08	da_nop
13323	303	101	2026-01-08	da_nop
13324	303	102	2026-01-08	da_nop
13325	303	103	2026-01-08	da_nop
13326	303	104	2026-01-08	da_nop
13327	303	105	2026-01-08	da_nop
13328	303	106	2026-01-08	da_nop
13329	303	107	2026-01-08	da_nop
13330	303	108	2026-01-08	da_nop
13331	303	109	2026-01-08	da_nop
13332	303	110	2026-01-08	tre_han
13333	304	67	2026-01-08	da_nop
13334	304	68	2026-01-08	da_nop
13335	304	69	2026-01-08	da_nop
13336	304	70	2026-01-08	da_nop
13337	304	71	2026-01-08	da_nop
13338	304	72	2026-01-08	da_nop
13339	304	73	2026-01-08	da_nop
13340	304	74	2026-01-08	da_nop
13341	304	75	2026-01-08	da_nop
13342	304	76	2026-01-08	da_nop
13343	304	77	2026-01-08	da_nop
13344	304	78	2026-01-08	da_nop
13345	304	79	2026-01-08	da_nop
13346	304	80	2026-01-08	da_nop
13347	304	81	2026-01-08	da_nop
13348	304	82	2026-01-08	tre_han
13349	304	83	2026-01-08	da_nop
13350	304	84	2026-01-08	da_nop
13351	304	85	2026-01-08	da_nop
13352	304	86	2026-01-08	da_nop
13353	304	87	2026-01-08	da_nop
13354	304	88	2026-01-08	da_nop
13355	304	89	2026-01-08	da_nop
13356	304	90	2026-01-08	tre_han
13357	304	91	2026-01-08	tre_han
13358	304	92	2026-01-08	tre_han
13359	304	93	2026-01-08	tre_han
13360	304	94	2026-01-08	da_nop
13361	304	95	2026-01-08	da_nop
13362	304	96	2026-01-08	da_nop
13363	304	97	2026-01-08	tre_han
13364	304	98	2026-01-08	tre_han
13365	304	99	2026-01-08	da_nop
13366	304	100	2026-01-08	da_nop
13367	304	101	2026-01-08	da_nop
13368	304	102	2026-01-08	tre_han
13369	304	103	2026-01-08	da_nop
13370	304	104	2026-01-08	da_nop
13371	304	105	2026-01-08	da_nop
13372	304	106	2026-01-08	tre_han
13373	304	107	2026-01-08	da_nop
13374	304	108	2026-01-08	da_nop
13375	304	109	2026-01-08	da_nop
13376	304	110	2026-01-08	da_nop
13377	305	67	2026-01-08	da_nop
13378	305	68	2026-01-08	da_nop
13379	305	69	2026-01-08	da_nop
13380	305	70	2026-01-08	da_nop
13381	305	71	2026-01-08	tre_han
13382	305	72	2026-01-08	da_nop
13383	305	73	2026-01-08	da_nop
13384	305	74	2026-01-08	da_nop
13385	305	75	2026-01-08	da_nop
13386	305	76	2026-01-08	tre_han
13387	305	77	2026-01-08	da_nop
13388	305	78	2026-01-08	da_nop
13389	305	79	2026-01-08	da_nop
13390	305	80	2026-01-08	da_nop
13391	305	81	2026-01-08	da_nop
13392	305	82	2026-01-08	da_nop
13393	305	83	2026-01-08	da_nop
13394	305	84	2026-01-08	da_nop
13395	305	85	2026-01-08	da_nop
13396	305	86	2026-01-08	da_nop
13397	305	87	2026-01-08	da_nop
13398	305	88	2026-01-08	da_nop
13399	305	89	2026-01-08	da_nop
13400	305	90	2026-01-08	da_nop
13401	305	91	2026-01-08	da_nop
13402	305	92	2026-01-08	da_nop
13403	305	93	2026-01-08	da_nop
13404	305	94	2026-01-08	da_nop
13405	305	95	2026-01-08	da_nop
13406	305	96	2026-01-08	da_nop
13407	305	97	2026-01-08	da_nop
13408	305	98	2026-01-08	da_nop
13409	305	99	2026-01-08	da_nop
13410	305	100	2026-01-08	da_nop
13411	305	101	2026-01-08	da_nop
13412	305	102	2026-01-08	da_nop
13413	305	103	2026-01-08	da_nop
13414	305	104	2026-01-08	tre_han
13415	305	105	2026-01-08	da_nop
13416	305	106	2026-01-08	da_nop
13417	305	107	2026-01-08	da_nop
13418	305	108	2026-01-08	da_nop
13419	305	109	2026-01-08	da_nop
13420	305	110	2026-01-08	da_nop
13421	306	67	2026-01-08	da_nop
13422	306	68	2026-01-08	tre_han
13423	306	69	2026-01-08	tre_han
13424	306	70	2026-01-08	da_nop
13425	306	71	2026-01-08	da_nop
13426	306	72	2026-01-08	da_nop
13427	306	73	2026-01-08	da_nop
13428	306	74	2026-01-08	tre_han
13429	306	75	2026-01-08	da_nop
13430	306	76	2026-01-08	da_nop
13431	306	77	2026-01-08	da_nop
13432	306	78	2026-01-08	da_nop
13433	306	79	2026-01-08	da_nop
13434	306	80	2026-01-08	da_nop
13435	306	81	2026-01-08	tre_han
13436	306	82	2026-01-08	tre_han
13437	306	83	2026-01-08	da_nop
13438	306	84	2026-01-08	da_nop
13439	306	85	2026-01-08	da_nop
13440	306	86	2026-01-08	da_nop
13441	306	87	2026-01-08	da_nop
13442	306	88	2026-01-08	tre_han
13443	306	89	2026-01-08	da_nop
13444	306	90	2026-01-08	da_nop
13445	306	91	2026-01-08	da_nop
13446	306	92	2026-01-08	da_nop
13447	306	93	2026-01-08	da_nop
13448	306	94	2026-01-08	da_nop
13449	306	95	2026-01-08	da_nop
13450	306	96	2026-01-08	da_nop
13451	306	97	2026-01-08	da_nop
13452	306	98	2026-01-08	da_nop
13453	306	99	2026-01-08	da_nop
13454	306	100	2026-01-08	da_nop
13455	306	101	2026-01-08	da_nop
13456	306	102	2026-01-08	tre_han
13457	306	103	2026-01-08	da_nop
13458	306	104	2026-01-08	da_nop
13459	306	105	2026-01-08	da_nop
13460	306	106	2026-01-08	tre_han
13461	306	107	2026-01-08	da_nop
13462	306	108	2026-01-08	da_nop
13463	306	109	2026-01-08	da_nop
13464	306	110	2026-01-08	tre_han
13465	307	67	2026-01-08	da_nop
13466	307	68	2026-01-08	da_nop
13467	307	69	2026-01-08	da_nop
13468	307	70	2026-01-08	da_nop
13469	307	71	2026-01-08	da_nop
13470	307	72	2026-01-08	tre_han
13471	307	73	2026-01-08	da_nop
13472	307	74	2026-01-08	tre_han
13473	307	75	2026-01-08	da_nop
13474	307	76	2026-01-08	da_nop
13475	307	77	2026-01-08	da_nop
13476	307	78	2026-01-08	tre_han
13477	307	79	2026-01-08	tre_han
13478	307	80	2026-01-08	da_nop
13479	307	81	2026-01-08	da_nop
13480	307	82	2026-01-08	da_nop
13481	307	83	2026-01-08	da_nop
13482	307	84	2026-01-08	da_nop
13483	307	85	2026-01-08	da_nop
13484	307	86	2026-01-08	da_nop
13485	307	87	2026-01-08	tre_han
13486	307	88	2026-01-08	da_nop
13487	307	89	2026-01-08	tre_han
13488	307	90	2026-01-08	da_nop
13489	307	91	2026-01-08	da_nop
13490	307	92	2026-01-08	tre_han
13491	307	93	2026-01-08	tre_han
13492	307	94	2026-01-08	da_nop
13493	307	95	2026-01-08	tre_han
13494	307	96	2026-01-08	da_nop
13495	307	97	2026-01-08	tre_han
13496	307	98	2026-01-08	da_nop
13497	307	99	2026-01-08	da_nop
13498	307	100	2026-01-08	da_nop
13499	307	101	2026-01-08	tre_han
13500	307	102	2026-01-08	da_nop
13501	307	103	2026-01-08	da_nop
13502	307	104	2026-01-08	da_nop
13503	307	105	2026-01-08	tre_han
13504	307	106	2026-01-08	da_nop
13505	307	107	2026-01-08	da_nop
13506	307	108	2026-01-08	da_nop
13507	307	109	2026-01-08	tre_han
13508	307	110	2026-01-08	tre_han
13509	308	67	2026-01-08	da_nop
13510	308	68	2026-01-08	da_nop
13511	308	69	2026-01-08	da_nop
13512	308	70	2026-01-08	da_nop
13513	308	71	2026-01-08	da_nop
13514	308	72	2026-01-08	da_nop
13515	308	73	2026-01-08	tre_han
13516	308	74	2026-01-08	da_nop
13517	308	75	2026-01-08	da_nop
13518	308	76	2026-01-08	da_nop
13519	308	77	2026-01-08	tre_han
13520	308	78	2026-01-08	da_nop
13521	308	79	2026-01-08	da_nop
13522	308	80	2026-01-08	da_nop
13523	308	81	2026-01-08	tre_han
13524	308	82	2026-01-08	da_nop
13525	308	83	2026-01-08	da_nop
13526	308	84	2026-01-08	da_nop
13527	308	85	2026-01-08	da_nop
13528	308	86	2026-01-08	tre_han
13529	308	87	2026-01-08	da_nop
13530	308	88	2026-01-08	da_nop
13531	308	89	2026-01-08	da_nop
13532	308	90	2026-01-08	da_nop
13533	308	91	2026-01-08	da_nop
13534	308	92	2026-01-08	da_nop
13535	308	93	2026-01-08	da_nop
13536	308	94	2026-01-08	tre_han
13537	308	95	2026-01-08	da_nop
13538	308	96	2026-01-08	tre_han
13539	308	97	2026-01-08	da_nop
13540	308	98	2026-01-08	da_nop
13541	308	99	2026-01-08	tre_han
13542	308	100	2026-01-08	da_nop
13543	308	101	2026-01-08	tre_han
13544	308	102	2026-01-08	da_nop
13545	308	103	2026-01-08	da_nop
13546	308	104	2026-01-08	da_nop
13547	308	105	2026-01-08	da_nop
13548	308	106	2026-01-08	da_nop
13549	308	107	2026-01-08	da_nop
13550	308	108	2026-01-08	da_nop
13551	308	109	2026-01-08	da_nop
13552	308	110	2026-01-08	da_nop
13553	309	67	2026-01-08	da_nop
13554	309	68	2026-01-08	da_nop
13555	309	69	2026-01-08	da_nop
13556	309	70	2026-01-08	da_nop
13557	309	71	2026-01-08	da_nop
13558	309	72	2026-01-08	da_nop
13559	309	73	2026-01-08	da_nop
13560	309	74	2026-01-08	da_nop
13561	309	75	2026-01-08	tre_han
13562	309	76	2026-01-08	da_nop
13563	309	77	2026-01-08	da_nop
13564	309	78	2026-01-08	tre_han
13565	309	79	2026-01-08	da_nop
13566	309	80	2026-01-08	da_nop
13567	309	81	2026-01-08	da_nop
13568	309	82	2026-01-08	tre_han
13569	309	83	2026-01-08	da_nop
13570	309	84	2026-01-08	da_nop
13571	309	85	2026-01-08	da_nop
13572	309	86	2026-01-08	tre_han
13573	309	87	2026-01-08	da_nop
13574	309	88	2026-01-08	da_nop
13575	309	89	2026-01-08	da_nop
13576	309	90	2026-01-08	da_nop
13577	309	91	2026-01-08	tre_han
13578	309	92	2026-01-08	da_nop
13579	309	93	2026-01-08	da_nop
13580	309	94	2026-01-08	da_nop
13581	309	95	2026-01-08	da_nop
13582	309	96	2026-01-08	da_nop
13583	309	97	2026-01-08	da_nop
13584	309	98	2026-01-08	da_nop
13585	309	99	2026-01-08	da_nop
13586	309	100	2026-01-08	da_nop
13587	309	101	2026-01-08	da_nop
13588	309	102	2026-01-08	da_nop
13589	309	103	2026-01-08	da_nop
13590	309	104	2026-01-08	da_nop
13591	309	105	2026-01-08	da_nop
13592	309	106	2026-01-08	da_nop
13593	309	107	2026-01-08	da_nop
13594	309	108	2026-01-08	da_nop
13595	309	109	2026-01-08	tre_han
13596	309	110	2026-01-08	tre_han
13597	310	67	2026-01-08	tre_han
13598	310	68	2026-01-08	da_nop
13599	310	69	2026-01-08	da_nop
13600	310	70	2026-01-08	tre_han
13601	310	71	2026-01-08	da_nop
13602	310	72	2026-01-08	da_nop
13603	310	73	2026-01-08	da_nop
13604	310	74	2026-01-08	da_nop
13605	310	75	2026-01-08	tre_han
13606	310	76	2026-01-08	da_nop
13607	310	77	2026-01-08	da_nop
13608	310	78	2026-01-08	da_nop
13609	310	79	2026-01-08	tre_han
13610	310	80	2026-01-08	da_nop
13611	310	81	2026-01-08	tre_han
13612	310	82	2026-01-08	da_nop
13613	310	83	2026-01-08	tre_han
13614	310	84	2026-01-08	da_nop
13615	310	85	2026-01-08	tre_han
13616	310	86	2026-01-08	tre_han
13617	310	87	2026-01-08	tre_han
13618	310	88	2026-01-08	da_nop
13619	310	89	2026-01-08	da_nop
13620	310	90	2026-01-08	da_nop
13621	310	91	2026-01-08	da_nop
13622	310	92	2026-01-08	da_nop
13623	310	93	2026-01-08	da_nop
13624	310	94	2026-01-08	da_nop
13625	310	95	2026-01-08	da_nop
13626	310	96	2026-01-08	da_nop
13627	310	97	2026-01-08	da_nop
13628	310	98	2026-01-08	da_nop
13629	310	99	2026-01-08	da_nop
13630	310	100	2026-01-08	tre_han
13631	310	101	2026-01-08	da_nop
13632	310	102	2026-01-08	da_nop
13633	310	103	2026-01-08	da_nop
13634	310	104	2026-01-08	da_nop
13635	310	105	2026-01-08	da_nop
13636	310	106	2026-01-08	da_nop
13637	310	107	2026-01-08	da_nop
13638	310	108	2026-01-08	da_nop
13639	310	109	2026-01-08	da_nop
13640	310	110	2026-01-08	da_nop
13641	311	67	2026-01-08	da_nop
13642	311	68	2026-01-08	da_nop
13643	311	69	2026-01-08	da_nop
13644	311	70	2026-01-08	da_nop
13645	311	71	2026-01-08	da_nop
13646	311	72	2026-01-08	da_nop
13647	311	73	2026-01-08	da_nop
13648	311	74	2026-01-08	da_nop
13649	311	75	2026-01-08	da_nop
13650	311	76	2026-01-08	da_nop
13651	311	77	2026-01-08	da_nop
13652	311	78	2026-01-08	da_nop
13653	311	79	2026-01-08	da_nop
13654	311	80	2026-01-08	da_nop
13655	311	81	2026-01-08	da_nop
13656	311	82	2026-01-08	da_nop
13657	311	83	2026-01-08	da_nop
13658	311	84	2026-01-08	da_nop
13659	311	85	2026-01-08	da_nop
13660	311	86	2026-01-08	da_nop
13661	311	87	2026-01-08	da_nop
13662	311	88	2026-01-08	da_nop
13663	311	89	2026-01-08	tre_han
13664	311	90	2026-01-08	da_nop
13665	311	91	2026-01-08	da_nop
13666	311	92	2026-01-08	da_nop
13667	311	93	2026-01-08	da_nop
13668	311	94	2026-01-08	da_nop
13669	311	95	2026-01-08	da_nop
13670	311	96	2026-01-08	da_nop
13671	311	97	2026-01-08	da_nop
13672	311	98	2026-01-08	da_nop
13673	311	99	2026-01-08	da_nop
13674	311	100	2026-01-08	tre_han
13675	311	101	2026-01-08	tre_han
13676	311	102	2026-01-08	tre_han
13677	311	103	2026-01-08	da_nop
13678	311	104	2026-01-08	da_nop
13679	311	105	2026-01-08	da_nop
13680	311	106	2026-01-08	da_nop
13681	311	107	2026-01-08	da_nop
13682	311	108	2026-01-08	da_nop
13683	311	109	2026-01-08	da_nop
13684	311	110	2026-01-08	da_nop
13685	312	67	2026-01-08	da_nop
13686	312	68	2026-01-08	tre_han
13687	312	69	2026-01-08	da_nop
13688	312	70	2026-01-08	da_nop
13689	312	71	2026-01-08	da_nop
13690	312	72	2026-01-08	da_nop
13691	312	73	2026-01-08	da_nop
13692	312	74	2026-01-08	da_nop
13693	312	75	2026-01-08	da_nop
13694	312	76	2026-01-08	tre_han
13695	312	77	2026-01-08	da_nop
13696	312	78	2026-01-08	da_nop
13697	312	79	2026-01-08	da_nop
13698	312	80	2026-01-08	da_nop
13699	312	81	2026-01-08	da_nop
13700	312	82	2026-01-08	tre_han
13701	312	83	2026-01-08	da_nop
13702	312	84	2026-01-08	da_nop
13703	312	85	2026-01-08	da_nop
13704	312	86	2026-01-08	da_nop
13705	312	87	2026-01-08	da_nop
13706	312	88	2026-01-08	da_nop
13707	312	89	2026-01-08	da_nop
13708	312	90	2026-01-08	da_nop
13709	312	91	2026-01-08	da_nop
13710	312	92	2026-01-08	da_nop
13711	312	93	2026-01-08	tre_han
13712	312	94	2026-01-08	da_nop
13713	312	95	2026-01-08	da_nop
13714	312	96	2026-01-08	da_nop
13715	312	97	2026-01-08	da_nop
13716	312	98	2026-01-08	da_nop
13717	312	99	2026-01-08	tre_han
13718	312	100	2026-01-08	da_nop
13719	312	101	2026-01-08	da_nop
13720	312	102	2026-01-08	tre_han
13721	312	103	2026-01-08	da_nop
13722	312	104	2026-01-08	da_nop
13723	312	105	2026-01-08	da_nop
13724	312	106	2026-01-08	tre_han
13725	312	107	2026-01-08	da_nop
13726	312	108	2026-01-08	da_nop
13727	312	109	2026-01-08	da_nop
13728	312	110	2026-01-08	da_nop
13729	313	67	2026-01-08	da_nop
13730	313	68	2026-01-08	da_nop
13731	313	69	2026-01-08	da_nop
13732	313	70	2026-01-08	da_nop
13733	313	71	2026-01-08	da_nop
13734	313	72	2026-01-08	da_nop
13735	313	73	2026-01-08	tre_han
13736	313	74	2026-01-08	da_nop
13737	313	75	2026-01-08	da_nop
13738	313	76	2026-01-08	da_nop
13739	313	77	2026-01-08	da_nop
13740	313	78	2026-01-08	tre_han
13741	313	79	2026-01-08	da_nop
13742	313	80	2026-01-08	da_nop
13743	313	81	2026-01-08	da_nop
13744	313	82	2026-01-08	tre_han
13745	313	83	2026-01-08	da_nop
13746	313	84	2026-01-08	da_nop
13747	313	85	2026-01-08	da_nop
13748	313	86	2026-01-08	tre_han
13749	313	87	2026-01-08	da_nop
13750	313	88	2026-01-08	da_nop
13751	313	89	2026-01-08	tre_han
13752	313	90	2026-01-08	da_nop
13753	313	91	2026-01-08	da_nop
13754	313	92	2026-01-08	tre_han
13755	313	93	2026-01-08	da_nop
13756	313	94	2026-01-08	da_nop
13757	313	95	2026-01-08	da_nop
13758	313	96	2026-01-08	da_nop
13759	313	97	2026-01-08	tre_han
13760	313	98	2026-01-08	da_nop
13761	313	99	2026-01-08	da_nop
13762	313	100	2026-01-08	da_nop
13763	313	101	2026-01-08	da_nop
13764	313	102	2026-01-08	tre_han
13765	313	103	2026-01-08	da_nop
13766	313	104	2026-01-08	da_nop
13767	313	105	2026-01-08	tre_han
13768	313	106	2026-01-08	da_nop
13769	313	107	2026-01-08	tre_han
13770	313	108	2026-01-08	tre_han
13771	313	109	2026-01-08	da_nop
13772	313	110	2026-01-08	da_nop
13773	314	67	2026-01-08	da_nop
13774	314	68	2026-01-08	da_nop
13775	314	69	2026-01-08	tre_han
13776	314	70	2026-01-08	da_nop
13777	314	71	2026-01-08	tre_han
13778	314	72	2026-01-08	da_nop
13779	314	73	2026-01-08	da_nop
13780	314	74	2026-01-08	da_nop
13781	314	75	2026-01-08	da_nop
13782	314	76	2026-01-08	da_nop
13783	314	77	2026-01-08	tre_han
13784	314	78	2026-01-08	da_nop
13785	314	79	2026-01-08	da_nop
13786	314	80	2026-01-08	tre_han
13787	314	81	2026-01-08	da_nop
13788	314	82	2026-01-08	da_nop
13789	314	83	2026-01-08	da_nop
13790	314	84	2026-01-08	da_nop
13791	314	85	2026-01-08	tre_han
13792	314	86	2026-01-08	tre_han
13793	314	87	2026-01-08	da_nop
13794	314	88	2026-01-08	da_nop
13795	314	89	2026-01-08	da_nop
13796	314	90	2026-01-08	da_nop
13797	314	91	2026-01-08	da_nop
13798	314	92	2026-01-08	da_nop
13799	314	93	2026-01-08	tre_han
13800	314	94	2026-01-08	da_nop
13801	314	95	2026-01-08	da_nop
13802	314	96	2026-01-08	da_nop
13803	314	97	2026-01-08	da_nop
13804	314	98	2026-01-08	da_nop
13805	314	99	2026-01-08	da_nop
13806	314	100	2026-01-08	da_nop
13807	314	101	2026-01-08	da_nop
13808	314	102	2026-01-08	da_nop
13809	314	103	2026-01-08	da_nop
13810	314	104	2026-01-08	da_nop
13811	314	105	2026-01-08	tre_han
13812	314	106	2026-01-08	da_nop
13813	314	107	2026-01-08	da_nop
13814	314	108	2026-01-08	da_nop
13815	314	109	2026-01-08	da_nop
13816	314	110	2026-01-08	tre_han
13817	315	67	2026-01-08	tre_han
13818	315	68	2026-01-08	da_nop
13819	315	69	2026-01-08	da_nop
13820	315	70	2026-01-08	da_nop
13821	315	71	2026-01-08	da_nop
13822	315	72	2026-01-08	tre_han
13823	315	73	2026-01-08	da_nop
13824	315	74	2026-01-08	tre_han
13825	315	75	2026-01-08	da_nop
13826	315	76	2026-01-08	da_nop
13827	315	77	2026-01-08	da_nop
13828	315	78	2026-01-08	da_nop
13829	315	79	2026-01-08	da_nop
13830	315	80	2026-01-08	da_nop
13831	315	81	2026-01-08	da_nop
13832	315	82	2026-01-08	da_nop
13833	315	83	2026-01-08	da_nop
13834	315	84	2026-01-08	da_nop
13835	315	85	2026-01-08	da_nop
13836	315	86	2026-01-08	da_nop
13837	315	87	2026-01-08	da_nop
13838	315	88	2026-01-08	da_nop
13839	315	89	2026-01-08	da_nop
13840	315	90	2026-01-08	da_nop
13841	315	91	2026-01-08	da_nop
13842	315	92	2026-01-08	da_nop
13843	315	93	2026-01-08	da_nop
13844	315	94	2026-01-08	da_nop
13845	315	95	2026-01-08	da_nop
13846	315	96	2026-01-08	da_nop
13847	315	97	2026-01-08	da_nop
13848	315	98	2026-01-08	da_nop
13849	315	99	2026-01-08	da_nop
13850	315	100	2026-01-08	da_nop
13851	315	101	2026-01-08	da_nop
13852	315	102	2026-01-08	tre_han
13853	315	103	2026-01-08	da_nop
13854	315	104	2026-01-08	tre_han
13855	315	105	2026-01-08	da_nop
13856	315	106	2026-01-08	da_nop
13857	315	107	2026-01-08	da_nop
13858	315	108	2026-01-08	tre_han
13859	315	109	2026-01-08	da_nop
13860	315	110	2026-01-08	tre_han
13861	316	67	2026-01-08	tre_han
13862	316	68	2026-01-08	da_nop
13863	316	69	2026-01-08	tre_han
13864	316	70	2026-01-08	da_nop
13865	316	71	2026-01-08	da_nop
13866	316	72	2026-01-08	da_nop
13867	316	73	2026-01-08	da_nop
13868	316	74	2026-01-08	tre_han
13869	316	75	2026-01-08	tre_han
13870	316	76	2026-01-08	da_nop
13871	316	77	2026-01-08	da_nop
13872	316	78	2026-01-08	da_nop
13873	316	79	2026-01-08	da_nop
13874	316	80	2026-01-08	tre_han
13875	316	81	2026-01-08	da_nop
13876	316	82	2026-01-08	da_nop
13877	316	83	2026-01-08	da_nop
13878	316	84	2026-01-08	da_nop
13879	316	85	2026-01-08	da_nop
13880	316	86	2026-01-08	tre_han
13881	316	87	2026-01-08	da_nop
13882	316	88	2026-01-08	da_nop
13883	316	89	2026-01-08	da_nop
13884	316	90	2026-01-08	tre_han
13885	316	91	2026-01-08	tre_han
13886	316	92	2026-01-08	da_nop
13887	316	93	2026-01-08	da_nop
13888	316	94	2026-01-08	da_nop
13889	316	95	2026-01-08	tre_han
13890	316	96	2026-01-08	da_nop
13891	316	97	2026-01-08	da_nop
13892	316	98	2026-01-08	da_nop
13893	316	99	2026-01-08	da_nop
13894	316	100	2026-01-08	tre_han
13895	316	101	2026-01-08	da_nop
13896	316	102	2026-01-08	tre_han
13897	316	103	2026-01-08	da_nop
13898	316	104	2026-01-08	da_nop
13899	316	105	2026-01-08	da_nop
13900	316	106	2026-01-08	tre_han
13901	316	107	2026-01-08	da_nop
13902	316	108	2026-01-08	da_nop
13903	316	109	2026-01-08	da_nop
13904	316	110	2026-01-08	da_nop
13905	317	67	2026-01-08	da_nop
13906	317	68	2026-01-08	da_nop
13907	317	69	2026-01-08	da_nop
13908	317	70	2026-01-08	da_nop
13909	317	71	2026-01-08	da_nop
13910	317	72	2026-01-08	da_nop
13911	317	73	2026-01-08	da_nop
13912	317	74	2026-01-08	da_nop
13913	317	75	2026-01-08	da_nop
13914	317	76	2026-01-08	da_nop
13915	317	77	2026-01-08	da_nop
13916	317	78	2026-01-08	da_nop
13917	317	79	2026-01-08	da_nop
13918	317	80	2026-01-08	da_nop
13919	317	81	2026-01-08	da_nop
13920	317	82	2026-01-08	da_nop
13921	317	83	2026-01-08	tre_han
13922	317	84	2026-01-08	da_nop
13923	317	85	2026-01-08	da_nop
13924	317	86	2026-01-08	da_nop
13925	317	87	2026-01-08	da_nop
13926	317	88	2026-01-08	da_nop
13927	317	89	2026-01-08	da_nop
13928	317	90	2026-01-08	da_nop
13929	317	91	2026-01-08	da_nop
13930	317	92	2026-01-08	da_nop
13931	317	93	2026-01-08	da_nop
13932	317	94	2026-01-08	tre_han
13933	317	95	2026-01-08	tre_han
13934	317	96	2026-01-08	da_nop
13935	317	97	2026-01-08	da_nop
13936	317	98	2026-01-08	da_nop
13937	317	99	2026-01-08	tre_han
13938	317	100	2026-01-08	da_nop
13939	317	101	2026-01-08	tre_han
13940	317	102	2026-01-08	da_nop
13941	317	103	2026-01-08	da_nop
13942	317	104	2026-01-08	da_nop
13943	317	105	2026-01-08	da_nop
13944	317	106	2026-01-08	da_nop
13945	317	107	2026-01-08	tre_han
13946	317	108	2026-01-08	da_nop
13947	317	109	2026-01-08	tre_han
13948	317	110	2026-01-08	da_nop
13949	318	67	2026-01-08	da_nop
13950	318	68	2026-01-08	tre_han
13951	318	69	2026-01-08	da_nop
13952	318	70	2026-01-08	da_nop
13953	318	71	2026-01-08	tre_han
13954	318	72	2026-01-08	tre_han
13955	318	73	2026-01-08	da_nop
13956	318	74	2026-01-08	tre_han
13957	318	75	2026-01-08	da_nop
13958	318	76	2026-01-08	da_nop
13959	318	77	2026-01-08	tre_han
13960	318	78	2026-01-08	da_nop
13961	318	79	2026-01-08	da_nop
13962	318	80	2026-01-08	da_nop
13963	318	81	2026-01-08	da_nop
13964	318	82	2026-01-08	da_nop
13965	318	83	2026-01-08	da_nop
13966	318	84	2026-01-08	da_nop
13967	318	85	2026-01-08	tre_han
13968	318	86	2026-01-08	da_nop
13969	318	87	2026-01-08	tre_han
13970	318	88	2026-01-08	da_nop
13971	318	89	2026-01-08	da_nop
13972	318	90	2026-01-08	da_nop
13973	318	91	2026-01-08	tre_han
13974	318	92	2026-01-08	da_nop
13975	318	93	2026-01-08	da_nop
13976	318	94	2026-01-08	da_nop
13977	318	95	2026-01-08	da_nop
13978	318	96	2026-01-08	da_nop
13979	318	97	2026-01-08	da_nop
13980	318	98	2026-01-08	da_nop
13981	318	99	2026-01-08	da_nop
13982	318	100	2026-01-08	tre_han
13983	318	101	2026-01-08	da_nop
13984	318	102	2026-01-08	da_nop
13985	318	103	2026-01-08	da_nop
13986	318	104	2026-01-08	tre_han
13987	318	105	2026-01-08	da_nop
13988	318	106	2026-01-08	da_nop
13989	318	107	2026-01-08	tre_han
13990	318	108	2026-01-08	da_nop
13991	318	109	2026-01-08	da_nop
13992	318	110	2026-01-08	tre_han
13993	319	67	2026-01-08	da_nop
13994	319	68	2026-01-08	da_nop
13995	319	69	2026-01-08	da_nop
13996	319	70	2026-01-08	da_nop
13997	319	71	2026-01-08	da_nop
13998	319	72	2026-01-08	da_nop
13999	319	73	2026-01-08	da_nop
14000	319	74	2026-01-08	da_nop
14001	319	75	2026-01-08	da_nop
14002	319	76	2026-01-08	tre_han
14003	319	77	2026-01-08	tre_han
14004	319	78	2026-01-08	tre_han
14005	319	79	2026-01-08	da_nop
14006	319	80	2026-01-08	da_nop
14007	319	81	2026-01-08	da_nop
14008	319	82	2026-01-08	tre_han
14009	319	83	2026-01-08	da_nop
14010	319	84	2026-01-08	da_nop
14011	319	85	2026-01-08	tre_han
14012	319	86	2026-01-08	tre_han
14013	319	87	2026-01-08	da_nop
14014	319	88	2026-01-08	da_nop
14015	319	89	2026-01-08	da_nop
14016	319	90	2026-01-08	tre_han
14017	319	91	2026-01-08	da_nop
14018	319	92	2026-01-08	da_nop
14019	319	93	2026-01-08	tre_han
14020	319	94	2026-01-08	da_nop
14021	319	95	2026-01-08	tre_han
14022	319	96	2026-01-08	tre_han
14023	319	97	2026-01-08	da_nop
14024	319	98	2026-01-08	tre_han
14025	319	99	2026-01-08	tre_han
14026	319	100	2026-01-08	da_nop
14027	319	101	2026-01-08	da_nop
14028	319	102	2026-01-08	tre_han
14029	319	103	2026-01-08	da_nop
14030	319	104	2026-01-08	da_nop
14031	319	105	2026-01-08	da_nop
14032	319	106	2026-01-08	tre_han
14033	319	107	2026-01-08	tre_han
14034	319	108	2026-01-08	da_nop
14035	319	109	2026-01-08	da_nop
14036	319	110	2026-01-08	da_nop
14037	320	67	2026-01-08	da_nop
14038	320	68	2026-01-08	tre_han
14039	320	69	2026-01-08	tre_han
14040	320	70	2026-01-08	tre_han
14041	320	71	2026-01-08	tre_han
14042	320	72	2026-01-08	tre_han
14043	320	73	2026-01-08	da_nop
14044	320	74	2026-01-08	da_nop
14045	320	75	2026-01-08	da_nop
14046	320	76	2026-01-08	da_nop
14047	320	77	2026-01-08	da_nop
14048	320	78	2026-01-08	da_nop
14049	320	79	2026-01-08	da_nop
14050	320	80	2026-01-08	da_nop
14051	320	81	2026-01-08	da_nop
14052	320	82	2026-01-08	da_nop
14053	320	83	2026-01-08	da_nop
14054	320	84	2026-01-08	tre_han
14055	320	85	2026-01-08	da_nop
14056	320	86	2026-01-08	tre_han
14057	320	87	2026-01-08	da_nop
14058	320	88	2026-01-08	da_nop
14059	320	89	2026-01-08	da_nop
14060	320	90	2026-01-08	da_nop
14061	320	91	2026-01-08	da_nop
14062	320	92	2026-01-08	da_nop
14063	320	93	2026-01-08	da_nop
14064	320	94	2026-01-08	da_nop
14065	320	95	2026-01-08	da_nop
14066	320	96	2026-01-08	da_nop
14067	320	97	2026-01-08	da_nop
14068	320	98	2026-01-08	da_nop
14069	320	99	2026-01-08	da_nop
14070	320	100	2026-01-08	da_nop
14071	320	101	2026-01-08	da_nop
14072	320	102	2026-01-08	da_nop
14073	320	103	2026-01-08	da_nop
14074	320	104	2026-01-08	tre_han
14075	320	105	2026-01-08	da_nop
14076	320	106	2026-01-08	da_nop
14077	320	107	2026-01-08	da_nop
14078	320	108	2026-01-08	tre_han
14079	320	109	2026-01-08	da_nop
14080	320	110	2026-01-08	tre_han
14081	321	67	2026-01-08	da_nop
14082	321	68	2026-01-08	da_nop
14083	321	69	2026-01-08	tre_han
14084	321	70	2026-01-08	da_nop
14085	321	71	2026-01-08	tre_han
14086	321	72	2026-01-08	da_nop
14087	321	73	2026-01-08	tre_han
14088	321	74	2026-01-08	da_nop
14089	321	75	2026-01-08	tre_han
14090	321	76	2026-01-08	da_nop
14091	321	77	2026-01-08	da_nop
14092	321	78	2026-01-08	da_nop
14093	321	79	2026-01-08	da_nop
14094	321	80	2026-01-08	tre_han
14095	321	81	2026-01-08	da_nop
14096	321	82	2026-01-08	da_nop
14097	321	83	2026-01-08	da_nop
14098	321	84	2026-01-08	da_nop
14099	321	85	2026-01-08	da_nop
14100	321	86	2026-01-08	tre_han
14101	321	87	2026-01-08	da_nop
14102	321	88	2026-01-08	da_nop
14103	321	89	2026-01-08	da_nop
14104	321	90	2026-01-08	tre_han
14105	321	91	2026-01-08	tre_han
14106	321	92	2026-01-08	da_nop
14107	321	93	2026-01-08	da_nop
14108	321	94	2026-01-08	da_nop
14109	321	95	2026-01-08	tre_han
14110	321	96	2026-01-08	da_nop
14111	321	97	2026-01-08	da_nop
14112	321	98	2026-01-08	da_nop
14113	321	99	2026-01-08	tre_han
14114	321	100	2026-01-08	tre_han
14115	321	101	2026-01-08	tre_han
14116	321	102	2026-01-08	tre_han
14117	321	103	2026-01-08	tre_han
14118	321	104	2026-01-08	da_nop
14119	321	105	2026-01-08	da_nop
14120	321	106	2026-01-08	da_nop
14121	321	107	2026-01-08	da_nop
14122	321	108	2026-01-08	da_nop
14123	321	109	2026-01-08	tre_han
14124	321	110	2026-01-08	tre_han
14125	322	67	2026-01-08	da_nop
14126	322	68	2026-01-08	da_nop
14127	322	69	2026-01-08	da_nop
14128	322	70	2026-01-08	da_nop
14129	322	71	2026-01-08	tre_han
14130	322	72	2026-01-08	da_nop
14131	322	73	2026-01-08	da_nop
14132	322	74	2026-01-08	da_nop
14133	322	75	2026-01-08	da_nop
14134	322	76	2026-01-08	da_nop
14135	322	77	2026-01-08	da_nop
14136	322	78	2026-01-08	da_nop
14137	322	79	2026-01-08	da_nop
14138	322	80	2026-01-08	da_nop
14139	322	81	2026-01-08	tre_han
14140	322	82	2026-01-08	da_nop
14141	322	83	2026-01-08	tre_han
14142	322	84	2026-01-08	tre_han
14143	322	85	2026-01-08	da_nop
14144	322	86	2026-01-08	da_nop
14145	322	87	2026-01-08	da_nop
14146	322	88	2026-01-08	da_nop
14147	322	89	2026-01-08	da_nop
14148	322	90	2026-01-08	da_nop
14149	322	91	2026-01-08	da_nop
14150	322	92	2026-01-08	da_nop
14151	322	93	2026-01-08	da_nop
14152	322	94	2026-01-08	da_nop
14153	322	95	2026-01-08	da_nop
14154	322	96	2026-01-08	da_nop
14155	322	97	2026-01-08	da_nop
14156	322	98	2026-01-08	tre_han
14157	322	99	2026-01-08	da_nop
14158	322	100	2026-01-08	da_nop
14159	322	101	2026-01-08	da_nop
14160	322	102	2026-01-08	da_nop
14161	322	103	2026-01-08	da_nop
14162	322	104	2026-01-08	da_nop
14163	322	105	2026-01-08	da_nop
14164	322	106	2026-01-08	da_nop
14165	322	107	2026-01-08	da_nop
14166	322	108	2026-01-08	tre_han
14167	322	109	2026-01-08	da_nop
14168	322	110	2026-01-08	tre_han
14169	323	67	2026-01-08	da_nop
14170	323	68	2026-01-08	tre_han
14171	323	69	2026-01-08	tre_han
14172	323	70	2026-01-08	tre_han
14173	323	71	2026-01-08	da_nop
14174	323	72	2026-01-08	da_nop
14175	323	73	2026-01-08	da_nop
14176	323	74	2026-01-08	tre_han
14177	323	75	2026-01-08	da_nop
14178	323	76	2026-01-08	da_nop
14179	323	77	2026-01-08	da_nop
14180	323	78	2026-01-08	da_nop
14181	323	79	2026-01-08	da_nop
14182	323	80	2026-01-08	da_nop
14183	323	81	2026-01-08	tre_han
14184	323	82	2026-01-08	da_nop
14185	323	83	2026-01-08	da_nop
14186	323	84	2026-01-08	tre_han
14187	323	85	2026-01-08	tre_han
14188	323	86	2026-01-08	da_nop
14189	323	87	2026-01-08	da_nop
14190	323	88	2026-01-08	da_nop
14191	323	89	2026-01-08	da_nop
14192	323	90	2026-01-08	da_nop
14193	323	91	2026-01-08	da_nop
14194	323	92	2026-01-08	da_nop
14195	323	93	2026-01-08	da_nop
14196	323	94	2026-01-08	da_nop
14197	323	95	2026-01-08	da_nop
14198	323	96	2026-01-08	da_nop
14199	323	97	2026-01-08	tre_han
14200	323	98	2026-01-08	da_nop
14201	323	99	2026-01-08	da_nop
14202	323	100	2026-01-08	da_nop
14203	323	101	2026-01-08	da_nop
14204	323	102	2026-01-08	da_nop
14205	323	103	2026-01-08	da_nop
14206	323	104	2026-01-08	tre_han
14207	323	105	2026-01-08	tre_han
14208	323	106	2026-01-08	da_nop
14209	323	107	2026-01-08	da_nop
14210	323	108	2026-01-08	da_nop
14211	323	109	2026-01-08	da_nop
14212	323	110	2026-01-08	da_nop
14213	324	67	2026-01-08	da_nop
14214	324	68	2026-01-08	da_nop
14215	324	69	2026-01-08	tre_han
14216	324	70	2026-01-08	da_nop
14217	324	71	2026-01-08	da_nop
14218	324	72	2026-01-08	da_nop
14219	324	73	2026-01-08	da_nop
14220	324	74	2026-01-08	da_nop
14221	324	75	2026-01-08	da_nop
14222	324	76	2026-01-08	tre_han
14223	324	77	2026-01-08	da_nop
14224	324	78	2026-01-08	da_nop
14225	324	79	2026-01-08	da_nop
14226	324	80	2026-01-08	da_nop
14227	324	81	2026-01-08	da_nop
14228	324	82	2026-01-08	da_nop
14229	324	83	2026-01-08	da_nop
14230	324	84	2026-01-08	tre_han
14231	324	85	2026-01-08	da_nop
14232	324	86	2026-01-08	da_nop
14233	324	87	2026-01-08	da_nop
14234	324	88	2026-01-08	da_nop
14235	324	89	2026-01-08	da_nop
14236	324	90	2026-01-08	tre_han
14237	324	91	2026-01-08	da_nop
14238	324	92	2026-01-08	tre_han
14239	324	93	2026-01-08	da_nop
14240	324	94	2026-01-08	da_nop
14241	324	95	2026-01-08	tre_han
14242	324	96	2026-01-08	da_nop
14243	324	97	2026-01-08	da_nop
14244	324	98	2026-01-08	da_nop
14245	324	99	2026-01-08	tre_han
14246	324	100	2026-01-08	da_nop
14247	324	101	2026-01-08	da_nop
14248	324	102	2026-01-08	da_nop
14249	324	103	2026-01-08	da_nop
14250	324	104	2026-01-08	da_nop
14251	324	105	2026-01-08	da_nop
14252	324	106	2026-01-08	da_nop
14253	324	107	2026-01-08	da_nop
14254	324	108	2026-01-08	da_nop
14255	324	109	2026-01-08	da_nop
14256	324	110	2026-01-08	da_nop
14257	325	67	2026-01-08	da_nop
14258	325	68	2026-01-08	tre_han
14259	325	69	2026-01-08	da_nop
14260	325	70	2026-01-08	da_nop
14261	325	71	2026-01-08	tre_han
14262	325	72	2026-01-08	da_nop
14263	325	73	2026-01-08	tre_han
14264	325	74	2026-01-08	da_nop
14265	325	75	2026-01-08	da_nop
14266	325	76	2026-01-08	da_nop
14267	325	77	2026-01-08	da_nop
14268	325	78	2026-01-08	da_nop
14269	325	79	2026-01-08	tre_han
14270	325	80	2026-01-08	da_nop
14271	325	81	2026-01-08	da_nop
14272	325	82	2026-01-08	tre_han
14273	325	83	2026-01-08	da_nop
14274	325	84	2026-01-08	da_nop
14275	325	85	2026-01-08	tre_han
14276	325	86	2026-01-08	da_nop
14277	325	87	2026-01-08	da_nop
14278	325	88	2026-01-08	da_nop
14279	325	89	2026-01-08	da_nop
14280	325	90	2026-01-08	da_nop
14281	325	91	2026-01-08	tre_han
14282	325	92	2026-01-08	da_nop
14283	325	93	2026-01-08	da_nop
14284	325	94	2026-01-08	da_nop
14285	325	95	2026-01-08	da_nop
14286	325	96	2026-01-08	da_nop
14287	325	97	2026-01-08	da_nop
14288	325	98	2026-01-08	da_nop
14289	325	99	2026-01-08	da_nop
14290	325	100	2026-01-08	da_nop
14291	325	101	2026-01-08	da_nop
14292	325	102	2026-01-08	da_nop
14293	325	103	2026-01-08	da_nop
14294	325	104	2026-01-08	tre_han
14295	325	105	2026-01-08	da_nop
14296	325	106	2026-01-08	tre_han
14297	325	107	2026-01-08	da_nop
14298	325	108	2026-01-08	da_nop
14299	325	109	2026-01-08	da_nop
14300	325	110	2026-01-08	tre_han
14301	326	67	2026-01-08	da_nop
14302	326	68	2026-01-08	da_nop
14303	326	69	2026-01-08	da_nop
14304	326	70	2026-01-08	da_nop
14305	326	71	2026-01-08	da_nop
14306	326	72	2026-01-08	da_nop
14307	326	73	2026-01-08	da_nop
14308	326	74	2026-01-08	da_nop
14309	326	75	2026-01-08	da_nop
14310	326	76	2026-01-08	da_nop
14311	326	77	2026-01-08	da_nop
14312	326	78	2026-01-08	da_nop
14313	326	79	2026-01-08	da_nop
14314	326	80	2026-01-08	da_nop
14315	326	81	2026-01-08	da_nop
14316	326	82	2026-01-08	da_nop
14317	326	83	2026-01-08	da_nop
14318	326	84	2026-01-08	da_nop
14319	326	85	2026-01-08	da_nop
14320	326	86	2026-01-08	da_nop
14321	326	87	2026-01-08	da_nop
14322	326	88	2026-01-08	da_nop
14323	326	89	2026-01-08	da_nop
14324	326	90	2026-01-08	da_nop
14325	326	91	2026-01-08	da_nop
14326	326	92	2026-01-08	da_nop
14327	326	93	2026-01-08	da_nop
14328	326	94	2026-01-08	da_nop
14329	326	95	2026-01-08	tre_han
14330	326	96	2026-01-08	tre_han
14331	326	97	2026-01-08	da_nop
14332	326	98	2026-01-08	da_nop
14333	326	99	2026-01-08	tre_han
14334	326	100	2026-01-08	da_nop
14335	326	101	2026-01-08	da_nop
14336	326	102	2026-01-08	da_nop
14337	326	103	2026-01-08	da_nop
14338	326	104	2026-01-08	da_nop
14339	326	105	2026-01-08	da_nop
14340	326	106	2026-01-08	da_nop
14341	326	107	2026-01-08	tre_han
14342	326	108	2026-01-08	tre_han
14343	326	109	2026-01-08	tre_han
14344	326	110	2026-01-08	da_nop
14345	327	67	2026-01-08	tre_han
14346	327	68	2026-01-08	da_nop
14347	327	69	2026-01-08	da_nop
14348	327	70	2026-01-08	da_nop
14349	327	71	2026-01-08	da_nop
14350	327	72	2026-01-08	tre_han
14351	327	73	2026-01-08	da_nop
14352	327	74	2026-01-08	da_nop
14353	327	75	2026-01-08	da_nop
14354	327	76	2026-01-08	da_nop
14355	327	77	2026-01-08	da_nop
14356	327	78	2026-01-08	da_nop
14357	327	79	2026-01-08	da_nop
14358	327	80	2026-01-08	da_nop
14359	327	81	2026-01-08	da_nop
14360	327	82	2026-01-08	da_nop
14361	327	83	2026-01-08	tre_han
14362	327	84	2026-01-08	da_nop
14363	327	85	2026-01-08	da_nop
14364	327	86	2026-01-08	tre_han
14365	327	87	2026-01-08	da_nop
14366	327	88	2026-01-08	da_nop
14367	327	89	2026-01-08	da_nop
14368	327	90	2026-01-08	da_nop
14369	327	91	2026-01-08	da_nop
14370	327	92	2026-01-08	da_nop
14371	327	93	2026-01-08	da_nop
14372	327	94	2026-01-08	da_nop
14373	327	95	2026-01-08	da_nop
14374	327	96	2026-01-08	tre_han
14375	327	97	2026-01-08	tre_han
14376	327	98	2026-01-08	da_nop
14377	327	99	2026-01-08	tre_han
14378	327	100	2026-01-08	da_nop
14379	327	101	2026-01-08	da_nop
14380	327	102	2026-01-08	da_nop
14381	327	103	2026-01-08	da_nop
14382	327	104	2026-01-08	tre_han
14383	327	105	2026-01-08	da_nop
14384	327	106	2026-01-08	da_nop
14385	327	107	2026-01-08	da_nop
14386	327	108	2026-01-08	tre_han
14387	327	109	2026-01-08	da_nop
14388	327	110	2026-01-08	tre_han
14389	328	67	2026-01-08	tre_han
14390	328	68	2026-01-08	da_nop
14391	328	69	2026-01-08	da_nop
14392	328	70	2026-01-08	da_nop
14393	328	71	2026-01-08	da_nop
14394	328	72	2026-01-08	da_nop
14395	328	73	2026-01-08	tre_han
14396	328	74	2026-01-08	da_nop
14397	328	75	2026-01-08	da_nop
14398	328	76	2026-01-08	da_nop
14399	328	77	2026-01-08	tre_han
14400	328	78	2026-01-08	da_nop
14401	328	79	2026-01-08	da_nop
14402	328	80	2026-01-08	da_nop
14403	328	81	2026-01-08	da_nop
14404	328	82	2026-01-08	da_nop
14405	328	83	2026-01-08	da_nop
14406	328	84	2026-01-08	da_nop
14407	328	85	2026-01-08	da_nop
14408	328	86	2026-01-08	da_nop
14409	328	87	2026-01-08	da_nop
14410	328	88	2026-01-08	da_nop
14411	328	89	2026-01-08	da_nop
14412	328	90	2026-01-08	da_nop
14413	328	91	2026-01-08	da_nop
14414	328	92	2026-01-08	tre_han
14415	328	93	2026-01-08	tre_han
14416	328	94	2026-01-08	da_nop
14417	328	95	2026-01-08	da_nop
14418	328	96	2026-01-08	da_nop
14419	328	97	2026-01-08	da_nop
14420	328	98	2026-01-08	da_nop
14421	328	99	2026-01-08	da_nop
14422	328	100	2026-01-08	da_nop
14423	328	101	2026-01-08	da_nop
14424	328	102	2026-01-08	da_nop
14425	328	103	2026-01-08	da_nop
14426	328	104	2026-01-08	da_nop
14427	328	105	2026-01-08	da_nop
14428	328	106	2026-01-08	da_nop
14429	328	107	2026-01-08	da_nop
14430	328	108	2026-01-08	da_nop
14431	328	109	2026-01-08	da_nop
14432	328	110	2026-01-08	da_nop
14433	329	67	2026-01-08	tre_han
14434	329	68	2026-01-08	tre_han
14435	329	69	2026-01-08	da_nop
14436	329	70	2026-01-08	da_nop
14437	329	71	2026-01-08	da_nop
14438	329	72	2026-01-08	da_nop
14439	329	73	2026-01-08	da_nop
14440	329	74	2026-01-08	da_nop
14441	329	75	2026-01-08	tre_han
14442	329	76	2026-01-08	da_nop
14443	329	77	2026-01-08	da_nop
14444	329	78	2026-01-08	da_nop
14445	329	79	2026-01-08	da_nop
14446	329	80	2026-01-08	da_nop
14447	329	81	2026-01-08	da_nop
14448	329	82	2026-01-08	da_nop
14449	329	83	2026-01-08	da_nop
14450	329	84	2026-01-08	da_nop
14451	329	85	2026-01-08	da_nop
14452	329	86	2026-01-08	da_nop
14453	329	87	2026-01-08	tre_han
14454	329	88	2026-01-08	da_nop
14455	329	89	2026-01-08	da_nop
14456	329	90	2026-01-08	da_nop
14457	329	91	2026-01-08	tre_han
14458	329	92	2026-01-08	da_nop
14459	329	93	2026-01-08	da_nop
14460	329	94	2026-01-08	da_nop
14461	329	95	2026-01-08	tre_han
14462	329	96	2026-01-08	da_nop
14463	329	97	2026-01-08	tre_han
14464	329	98	2026-01-08	da_nop
14465	329	99	2026-01-08	da_nop
14466	329	100	2026-01-08	tre_han
14467	329	101	2026-01-08	tre_han
14468	329	102	2026-01-08	da_nop
14469	329	103	2026-01-08	da_nop
14470	329	104	2026-01-08	da_nop
14471	329	105	2026-01-08	da_nop
14472	329	106	2026-01-08	tre_han
14473	329	107	2026-01-08	da_nop
14474	329	108	2026-01-08	da_nop
14475	329	109	2026-01-08	da_nop
14476	329	110	2026-01-08	tre_han
14477	330	67	2026-01-08	da_nop
14478	330	68	2026-01-08	da_nop
14479	330	69	2026-01-08	da_nop
14480	330	70	2026-01-08	da_nop
14481	330	71	2026-01-08	tre_han
14482	330	72	2026-01-08	da_nop
14483	330	73	2026-01-08	da_nop
14484	330	74	2026-01-08	da_nop
14485	330	75	2026-01-08	tre_han
14486	330	76	2026-01-08	da_nop
14487	330	77	2026-01-08	da_nop
14488	330	78	2026-01-08	da_nop
14489	330	79	2026-01-08	da_nop
14490	330	80	2026-01-08	da_nop
14491	330	81	2026-01-08	da_nop
14492	330	82	2026-01-08	da_nop
14493	330	83	2026-01-08	da_nop
14494	330	84	2026-01-08	da_nop
14495	330	85	2026-01-08	da_nop
14496	330	86	2026-01-08	da_nop
14497	330	87	2026-01-08	tre_han
14498	330	88	2026-01-08	da_nop
14499	330	89	2026-01-08	da_nop
14500	330	90	2026-01-08	tre_han
14501	330	91	2026-01-08	da_nop
14502	330	92	2026-01-08	da_nop
14503	330	93	2026-01-08	tre_han
14504	330	94	2026-01-08	da_nop
14505	330	95	2026-01-08	da_nop
14506	330	96	2026-01-08	da_nop
14507	330	97	2026-01-08	da_nop
14508	330	98	2026-01-08	da_nop
14509	330	99	2026-01-08	da_nop
14510	330	100	2026-01-08	tre_han
14511	330	101	2026-01-08	da_nop
14512	330	102	2026-01-08	da_nop
14513	330	103	2026-01-08	da_nop
14514	330	104	2026-01-08	da_nop
14515	330	105	2026-01-08	tre_han
14516	330	106	2026-01-08	da_nop
14517	330	107	2026-01-08	da_nop
14518	330	108	2026-01-08	tre_han
14519	330	109	2026-01-08	da_nop
14520	330	110	2026-01-08	tre_han
14521	331	67	2026-01-08	da_nop
14522	331	68	2026-01-08	da_nop
14523	331	69	2026-01-08	da_nop
14524	331	70	2026-01-08	da_nop
14525	331	71	2026-01-08	da_nop
14526	331	72	2026-01-08	tre_han
14527	331	73	2026-01-08	da_nop
14528	331	74	2026-01-08	da_nop
14529	331	75	2026-01-08	tre_han
14530	331	76	2026-01-08	da_nop
14531	331	77	2026-01-08	tre_han
14532	331	78	2026-01-08	da_nop
14533	331	79	2026-01-08	da_nop
14534	331	80	2026-01-08	da_nop
14535	331	81	2026-01-08	da_nop
14536	331	82	2026-01-08	tre_han
14537	331	83	2026-01-08	da_nop
14538	331	84	2026-01-08	da_nop
14539	331	85	2026-01-08	da_nop
14540	331	86	2026-01-08	tre_han
14541	331	87	2026-01-08	tre_han
14542	331	88	2026-01-08	da_nop
14543	331	89	2026-01-08	tre_han
14544	331	90	2026-01-08	da_nop
14545	331	91	2026-01-08	da_nop
14546	331	92	2026-01-08	da_nop
14547	331	93	2026-01-08	da_nop
14548	331	94	2026-01-08	da_nop
14549	331	95	2026-01-08	da_nop
14550	331	96	2026-01-08	tre_han
14551	331	97	2026-01-08	da_nop
14552	331	98	2026-01-08	da_nop
14553	331	99	2026-01-08	da_nop
14554	331	100	2026-01-08	tre_han
14555	331	101	2026-01-08	tre_han
14556	331	102	2026-01-08	da_nop
14557	331	103	2026-01-08	da_nop
14558	331	104	2026-01-08	da_nop
14559	331	105	2026-01-08	da_nop
14560	331	106	2026-01-08	da_nop
14561	331	107	2026-01-08	tre_han
14562	331	108	2026-01-08	tre_han
14563	331	109	2026-01-08	da_nop
14564	331	110	2026-01-08	tre_han
14565	332	67	2026-01-08	tre_han
14566	332	68	2026-01-08	da_nop
14567	332	69	2026-01-08	da_nop
14568	332	70	2026-01-08	da_nop
14569	332	71	2026-01-08	tre_han
14570	332	72	2026-01-08	da_nop
14571	332	73	2026-01-08	tre_han
14572	332	74	2026-01-08	da_nop
14573	332	75	2026-01-08	tre_han
14574	332	76	2026-01-08	da_nop
14575	332	77	2026-01-08	da_nop
14576	332	78	2026-01-08	tre_han
14577	332	79	2026-01-08	da_nop
14578	332	80	2026-01-08	tre_han
14579	332	81	2026-01-08	tre_han
14580	332	82	2026-01-08	da_nop
14581	332	83	2026-01-08	da_nop
14582	332	84	2026-01-08	da_nop
14583	332	85	2026-01-08	da_nop
14584	332	86	2026-01-08	da_nop
14585	332	87	2026-01-08	da_nop
14586	332	88	2026-01-08	da_nop
14587	332	89	2026-01-08	da_nop
14588	332	90	2026-01-08	da_nop
14589	332	91	2026-01-08	da_nop
14590	332	92	2026-01-08	da_nop
14591	332	93	2026-01-08	da_nop
14592	332	94	2026-01-08	da_nop
14593	332	95	2026-01-08	da_nop
14594	332	96	2026-01-08	da_nop
14595	332	97	2026-01-08	da_nop
14596	332	98	2026-01-08	da_nop
14597	332	99	2026-01-08	da_nop
14598	332	100	2026-01-08	da_nop
14599	332	101	2026-01-08	da_nop
14600	332	102	2026-01-08	da_nop
14601	332	103	2026-01-08	da_nop
14602	332	104	2026-01-08	da_nop
14603	332	105	2026-01-08	da_nop
14604	332	106	2026-01-08	da_nop
14605	332	107	2026-01-08	da_nop
14606	332	108	2026-01-08	da_nop
14607	332	109	2026-01-08	da_nop
14608	332	110	2026-01-08	da_nop
14609	333	67	2026-01-08	tre_han
14610	333	68	2026-01-08	da_nop
14611	333	69	2026-01-08	tre_han
14612	333	70	2026-01-08	da_nop
14613	333	71	2026-01-08	tre_han
14614	333	72	2026-01-08	da_nop
14615	333	73	2026-01-08	da_nop
14616	333	74	2026-01-08	da_nop
14617	333	75	2026-01-08	da_nop
14618	333	76	2026-01-08	da_nop
14619	333	77	2026-01-08	da_nop
14620	333	78	2026-01-08	da_nop
14621	333	79	2026-01-08	da_nop
14622	333	80	2026-01-08	da_nop
14623	333	81	2026-01-08	da_nop
14624	333	82	2026-01-08	da_nop
14625	333	83	2026-01-08	da_nop
14626	333	84	2026-01-08	da_nop
14627	333	85	2026-01-08	da_nop
14628	333	86	2026-01-08	da_nop
14629	333	87	2026-01-08	da_nop
14630	333	88	2026-01-08	tre_han
14631	333	89	2026-01-08	tre_han
14632	333	90	2026-01-08	tre_han
14633	333	91	2026-01-08	da_nop
14634	333	92	2026-01-08	da_nop
14635	333	93	2026-01-08	tre_han
14636	333	94	2026-01-08	da_nop
14637	333	95	2026-01-08	da_nop
14638	333	96	2026-01-08	da_nop
14639	333	97	2026-01-08	tre_han
14640	333	98	2026-01-08	da_nop
14641	333	99	2026-01-08	da_nop
14642	333	100	2026-01-08	da_nop
14643	333	101	2026-01-08	da_nop
14644	333	102	2026-01-08	da_nop
14645	333	103	2026-01-08	da_nop
14646	333	104	2026-01-08	da_nop
14647	333	105	2026-01-08	tre_han
14648	333	106	2026-01-08	da_nop
14649	333	107	2026-01-08	da_nop
14650	333	108	2026-01-08	da_nop
14651	333	109	2026-01-08	da_nop
14652	333	110	2026-01-08	da_nop
14653	334	67	2026-01-08	da_nop
14654	334	68	2026-01-08	da_nop
14655	334	69	2026-01-08	da_nop
14656	334	70	2026-01-08	da_nop
14657	334	71	2026-01-08	da_nop
14658	334	72	2026-01-08	da_nop
14659	334	73	2026-01-08	da_nop
14660	334	74	2026-01-08	tre_han
14661	334	75	2026-01-08	tre_han
14662	334	76	2026-01-08	tre_han
14663	334	77	2026-01-08	da_nop
14664	334	78	2026-01-08	tre_han
14665	334	79	2026-01-08	da_nop
14666	334	80	2026-01-08	da_nop
14667	334	81	2026-01-08	tre_han
14668	334	82	2026-01-08	da_nop
14669	334	83	2026-01-08	da_nop
14670	334	84	2026-01-08	da_nop
14671	334	85	2026-01-08	tre_han
14672	334	86	2026-01-08	da_nop
14673	334	87	2026-01-08	da_nop
14674	334	88	2026-01-08	da_nop
14675	334	89	2026-01-08	da_nop
14676	334	90	2026-01-08	da_nop
14677	334	91	2026-01-08	da_nop
14678	334	92	2026-01-08	da_nop
14679	334	93	2026-01-08	da_nop
14680	334	94	2026-01-08	da_nop
14681	334	95	2026-01-08	da_nop
14682	334	96	2026-01-08	da_nop
14683	334	97	2026-01-08	da_nop
14684	334	98	2026-01-08	da_nop
14685	334	99	2026-01-08	da_nop
14686	334	100	2026-01-08	tre_han
14687	334	101	2026-01-08	da_nop
14688	334	102	2026-01-08	tre_han
14689	334	103	2026-01-08	tre_han
14690	334	104	2026-01-08	tre_han
14691	334	105	2026-01-08	da_nop
14692	334	106	2026-01-08	da_nop
14693	334	107	2026-01-08	da_nop
14694	334	108	2026-01-08	da_nop
14695	334	109	2026-01-08	da_nop
14696	334	110	2026-01-08	da_nop
14697	335	67	2026-01-08	da_nop
14698	335	68	2026-01-08	da_nop
14699	335	69	2026-01-08	da_nop
14700	335	70	2026-01-08	tre_han
14701	335	71	2026-01-08	da_nop
14702	335	72	2026-01-08	da_nop
14703	335	73	2026-01-08	da_nop
14704	335	74	2026-01-08	da_nop
14705	335	75	2026-01-08	tre_han
14706	335	76	2026-01-08	tre_han
14707	335	77	2026-01-08	da_nop
14708	335	78	2026-01-08	da_nop
14709	335	79	2026-01-08	tre_han
14710	335	80	2026-01-08	tre_han
14711	335	81	2026-01-08	da_nop
14712	335	82	2026-01-08	tre_han
14713	335	83	2026-01-08	da_nop
14714	335	84	2026-01-08	da_nop
14715	335	85	2026-01-08	da_nop
14716	335	86	2026-01-08	da_nop
14717	335	87	2026-01-08	da_nop
14718	335	88	2026-01-08	da_nop
14719	335	89	2026-01-08	tre_han
14720	335	90	2026-01-08	da_nop
14721	335	91	2026-01-08	da_nop
14722	335	92	2026-01-08	da_nop
14723	335	93	2026-01-08	da_nop
14724	335	94	2026-01-08	da_nop
14725	335	95	2026-01-08	da_nop
14726	335	96	2026-01-08	tre_han
14727	335	97	2026-01-08	da_nop
14728	335	98	2026-01-08	da_nop
14729	335	99	2026-01-08	da_nop
14730	335	100	2026-01-08	tre_han
14731	335	101	2026-01-08	da_nop
14732	335	102	2026-01-08	da_nop
14733	335	103	2026-01-08	da_nop
14734	335	104	2026-01-08	da_nop
14735	335	105	2026-01-08	da_nop
14736	335	106	2026-01-08	da_nop
14737	335	107	2026-01-08	da_nop
14738	335	108	2026-01-08	da_nop
14739	335	109	2026-01-08	da_nop
14740	335	110	2026-01-08	da_nop
14741	336	67	2026-01-08	tre_han
14742	336	68	2026-01-08	da_nop
14743	336	69	2026-01-08	tre_han
14744	336	70	2026-01-08	da_nop
14745	336	71	2026-01-08	da_nop
14746	336	72	2026-01-08	da_nop
14747	336	73	2026-01-08	da_nop
14748	336	74	2026-01-08	tre_han
14749	336	75	2026-01-08	da_nop
14750	336	76	2026-01-08	da_nop
14751	336	77	2026-01-08	da_nop
14752	336	78	2026-01-08	da_nop
14753	336	79	2026-01-08	tre_han
14754	336	80	2026-01-08	da_nop
14755	336	81	2026-01-08	da_nop
14756	336	82	2026-01-08	da_nop
14757	336	83	2026-01-08	da_nop
14758	336	84	2026-01-08	da_nop
14759	336	85	2026-01-08	da_nop
14760	336	86	2026-01-08	da_nop
14761	336	87	2026-01-08	da_nop
14762	336	88	2026-01-08	da_nop
14763	336	89	2026-01-08	da_nop
14764	336	90	2026-01-08	da_nop
14765	336	91	2026-01-08	da_nop
14766	336	92	2026-01-08	da_nop
14767	336	93	2026-01-08	da_nop
14768	336	94	2026-01-08	da_nop
14769	336	95	2026-01-08	da_nop
14770	336	96	2026-01-08	da_nop
14771	336	97	2026-01-08	da_nop
14772	336	98	2026-01-08	tre_han
14773	336	99	2026-01-08	da_nop
14774	336	100	2026-01-08	da_nop
14775	336	101	2026-01-08	da_nop
14776	336	102	2026-01-08	da_nop
14777	336	103	2026-01-08	da_nop
14778	336	104	2026-01-08	da_nop
14779	336	105	2026-01-08	da_nop
14780	336	106	2026-01-08	da_nop
14781	336	107	2026-01-08	da_nop
14782	336	108	2026-01-08	da_nop
14783	336	109	2026-01-08	da_nop
14784	336	110	2026-01-08	tre_han
14785	337	67	2026-01-08	tre_han
14786	337	68	2026-01-08	tre_han
14787	337	69	2026-01-08	tre_han
14788	337	70	2026-01-08	da_nop
14789	337	71	2026-01-08	da_nop
14790	337	72	2026-01-08	tre_han
14791	337	73	2026-01-08	da_nop
14792	337	74	2026-01-08	da_nop
14793	337	75	2026-01-08	da_nop
14794	337	76	2026-01-08	da_nop
14795	337	77	2026-01-08	da_nop
14796	337	78	2026-01-08	da_nop
14797	337	79	2026-01-08	da_nop
14798	337	80	2026-01-08	da_nop
14799	337	81	2026-01-08	da_nop
14800	337	82	2026-01-08	tre_han
14801	337	83	2026-01-08	tre_han
14802	337	84	2026-01-08	da_nop
14803	337	85	2026-01-08	da_nop
14804	337	86	2026-01-08	tre_han
14805	337	87	2026-01-08	da_nop
14806	337	88	2026-01-08	da_nop
14807	337	89	2026-01-08	da_nop
14808	337	90	2026-01-08	da_nop
14809	337	91	2026-01-08	da_nop
14810	337	92	2026-01-08	da_nop
14811	337	93	2026-01-08	da_nop
14812	337	94	2026-01-08	da_nop
14813	337	95	2026-01-08	da_nop
14814	337	96	2026-01-08	da_nop
14815	337	97	2026-01-08	da_nop
14816	337	98	2026-01-08	tre_han
14817	337	99	2026-01-08	da_nop
14818	337	100	2026-01-08	da_nop
14819	337	101	2026-01-08	da_nop
14820	337	102	2026-01-08	tre_han
14821	337	103	2026-01-08	da_nop
14822	337	104	2026-01-08	da_nop
14823	337	105	2026-01-08	da_nop
14824	337	106	2026-01-08	da_nop
14825	337	107	2026-01-08	da_nop
14826	337	108	2026-01-08	da_nop
14827	337	109	2026-01-08	da_nop
14828	337	110	2026-01-08	da_nop
14829	338	67	2026-01-08	da_nop
14830	338	68	2026-01-08	tre_han
14831	338	69	2026-01-08	da_nop
14832	338	70	2026-01-08	tre_han
14833	338	71	2026-01-08	da_nop
14834	338	72	2026-01-08	da_nop
14835	338	73	2026-01-08	da_nop
14836	338	74	2026-01-08	tre_han
14837	338	75	2026-01-08	tre_han
14838	338	76	2026-01-08	da_nop
14839	338	77	2026-01-08	tre_han
14840	338	78	2026-01-08	da_nop
14841	338	79	2026-01-08	da_nop
14842	338	80	2026-01-08	tre_han
14843	338	81	2026-01-08	da_nop
14844	338	82	2026-01-08	da_nop
14845	338	83	2026-01-08	da_nop
14846	338	84	2026-01-08	da_nop
14847	338	85	2026-01-08	da_nop
14848	338	86	2026-01-08	tre_han
14849	338	87	2026-01-08	da_nop
14850	338	88	2026-01-08	da_nop
14851	338	89	2026-01-08	da_nop
14852	338	90	2026-01-08	da_nop
14853	338	91	2026-01-08	da_nop
14854	338	92	2026-01-08	da_nop
14855	338	93	2026-01-08	da_nop
14856	338	94	2026-01-08	da_nop
14857	338	95	2026-01-08	tre_han
14858	338	96	2026-01-08	da_nop
14859	338	97	2026-01-08	da_nop
14860	338	98	2026-01-08	da_nop
14861	338	99	2026-01-08	da_nop
14862	338	100	2026-01-08	da_nop
14863	338	101	2026-01-08	da_nop
14864	338	102	2026-01-08	da_nop
14865	338	103	2026-01-08	da_nop
14866	338	104	2026-01-08	da_nop
14867	338	105	2026-01-08	da_nop
14868	338	106	2026-01-08	da_nop
14869	338	107	2026-01-08	da_nop
14870	338	108	2026-01-08	da_nop
14871	338	109	2026-01-08	da_nop
14872	338	110	2026-01-08	da_nop
14873	339	67	2026-01-08	da_nop
14874	339	68	2026-01-08	da_nop
14875	339	69	2026-01-08	da_nop
14876	339	70	2026-01-08	da_nop
14877	339	71	2026-01-08	da_nop
14878	339	72	2026-01-08	da_nop
14879	339	73	2026-01-08	da_nop
14880	339	74	2026-01-08	da_nop
14881	339	75	2026-01-08	tre_han
14882	339	76	2026-01-08	da_nop
14883	339	77	2026-01-08	tre_han
14884	339	78	2026-01-08	tre_han
14885	339	79	2026-01-08	da_nop
14886	339	80	2026-01-08	da_nop
14887	339	81	2026-01-08	da_nop
14888	339	82	2026-01-08	da_nop
14889	339	83	2026-01-08	da_nop
14890	339	84	2026-01-08	da_nop
14891	339	85	2026-01-08	da_nop
14892	339	86	2026-01-08	tre_han
14893	339	87	2026-01-08	da_nop
14894	339	88	2026-01-08	da_nop
14895	339	89	2026-01-08	da_nop
14896	339	90	2026-01-08	da_nop
14897	339	91	2026-01-08	da_nop
14898	339	92	2026-01-08	da_nop
14899	339	93	2026-01-08	tre_han
14900	339	94	2026-01-08	da_nop
14901	339	95	2026-01-08	da_nop
14902	339	96	2026-01-08	da_nop
14903	339	97	2026-01-08	da_nop
14904	339	98	2026-01-08	da_nop
14905	339	99	2026-01-08	da_nop
14906	339	100	2026-01-08	tre_han
14907	339	101	2026-01-08	tre_han
14908	339	102	2026-01-08	da_nop
14909	339	103	2026-01-08	da_nop
14910	339	104	2026-01-08	da_nop
14911	339	105	2026-01-08	da_nop
14912	339	106	2026-01-08	tre_han
14913	339	107	2026-01-08	da_nop
14914	339	108	2026-01-08	da_nop
14915	339	109	2026-01-08	da_nop
14916	339	110	2026-01-08	da_nop
14917	340	67	2026-01-08	da_nop
14918	340	68	2026-01-08	da_nop
14919	340	69	2026-01-08	tre_han
14920	340	70	2026-01-08	da_nop
14921	340	71	2026-01-08	da_nop
14922	340	72	2026-01-08	da_nop
14923	340	73	2026-01-08	da_nop
14924	340	74	2026-01-08	da_nop
14925	340	75	2026-01-08	da_nop
14926	340	76	2026-01-08	da_nop
14927	340	77	2026-01-08	tre_han
14928	340	78	2026-01-08	da_nop
14929	340	79	2026-01-08	da_nop
14930	340	80	2026-01-08	da_nop
14931	340	81	2026-01-08	da_nop
14932	340	82	2026-01-08	da_nop
14933	340	83	2026-01-08	da_nop
14934	340	84	2026-01-08	tre_han
14935	340	85	2026-01-08	tre_han
14936	340	86	2026-01-08	da_nop
14937	340	87	2026-01-08	da_nop
14938	340	88	2026-01-08	da_nop
14939	340	89	2026-01-08	da_nop
14940	340	90	2026-01-08	da_nop
14941	340	91	2026-01-08	tre_han
14942	340	92	2026-01-08	da_nop
14943	340	93	2026-01-08	da_nop
14944	340	94	2026-01-08	tre_han
14945	340	95	2026-01-08	da_nop
14946	340	96	2026-01-08	da_nop
14947	340	97	2026-01-08	tre_han
14948	340	98	2026-01-08	da_nop
14949	340	99	2026-01-08	da_nop
14950	340	100	2026-01-08	da_nop
14951	340	101	2026-01-08	da_nop
14952	340	102	2026-01-08	da_nop
14953	340	103	2026-01-08	da_nop
14954	340	104	2026-01-08	da_nop
14955	340	105	2026-01-08	da_nop
14956	340	106	2026-01-08	da_nop
14957	340	107	2026-01-08	da_nop
14958	340	108	2026-01-08	da_nop
14959	340	109	2026-01-08	tre_han
14960	340	110	2026-01-08	da_nop
14961	341	67	2026-01-08	tre_han
14962	341	68	2026-01-08	da_nop
14963	341	69	2026-01-08	da_nop
14964	341	70	2026-01-08	tre_han
14965	341	71	2026-01-08	da_nop
14966	341	72	2026-01-08	da_nop
14967	341	73	2026-01-08	tre_han
14968	341	74	2026-01-08	tre_han
14969	341	75	2026-01-08	da_nop
14970	341	76	2026-01-08	da_nop
14971	341	77	2026-01-08	da_nop
14972	341	78	2026-01-08	da_nop
14973	341	79	2026-01-08	da_nop
14974	341	80	2026-01-08	da_nop
14975	341	81	2026-01-08	tre_han
14976	341	82	2026-01-08	da_nop
14977	341	83	2026-01-08	da_nop
14978	341	84	2026-01-08	tre_han
14979	341	85	2026-01-08	tre_han
14980	341	86	2026-01-08	da_nop
14981	341	87	2026-01-08	da_nop
14982	341	88	2026-01-08	da_nop
14983	341	89	2026-01-08	da_nop
14984	341	90	2026-01-08	tre_han
14985	341	91	2026-01-08	da_nop
14986	341	92	2026-01-08	da_nop
14987	341	93	2026-01-08	da_nop
14988	341	94	2026-01-08	da_nop
14989	341	95	2026-01-08	da_nop
14990	341	96	2026-01-08	da_nop
14991	341	97	2026-01-08	da_nop
14992	341	98	2026-01-08	da_nop
14993	341	99	2026-01-08	tre_han
14994	341	100	2026-01-08	da_nop
14995	341	101	2026-01-08	da_nop
14996	341	102	2026-01-08	da_nop
14997	341	103	2026-01-08	da_nop
14998	341	104	2026-01-08	da_nop
14999	341	105	2026-01-08	da_nop
15000	341	106	2026-01-08	tre_han
15001	341	107	2026-01-08	da_nop
15002	341	108	2026-01-08	tre_han
15003	341	109	2026-01-08	da_nop
15004	341	110	2026-01-08	da_nop
15005	342	67	2026-01-08	da_nop
15006	342	68	2026-01-08	da_nop
15007	342	69	2026-01-08	da_nop
15008	342	70	2026-01-08	da_nop
15009	342	71	2026-01-08	da_nop
15010	342	72	2026-01-08	da_nop
15011	342	73	2026-01-08	da_nop
15012	342	74	2026-01-08	tre_han
15013	342	75	2026-01-08	da_nop
15014	342	76	2026-01-08	da_nop
15015	342	77	2026-01-08	da_nop
15016	342	78	2026-01-08	da_nop
15017	342	79	2026-01-08	da_nop
15018	342	80	2026-01-08	da_nop
15019	342	81	2026-01-08	da_nop
15020	342	82	2026-01-08	da_nop
15021	342	83	2026-01-08	da_nop
15022	342	84	2026-01-08	da_nop
15023	342	85	2026-01-08	da_nop
15024	342	86	2026-01-08	da_nop
15025	342	87	2026-01-08	da_nop
15026	342	88	2026-01-08	da_nop
15027	342	89	2026-01-08	da_nop
15028	342	90	2026-01-08	tre_han
15029	342	91	2026-01-08	tre_han
15030	342	92	2026-01-08	da_nop
15031	342	93	2026-01-08	da_nop
15032	342	94	2026-01-08	da_nop
15033	342	95	2026-01-08	da_nop
15034	342	96	2026-01-08	tre_han
15035	342	97	2026-01-08	da_nop
15036	342	98	2026-01-08	da_nop
15037	342	99	2026-01-08	tre_han
15038	342	100	2026-01-08	da_nop
15039	342	101	2026-01-08	da_nop
15040	342	102	2026-01-08	tre_han
15041	342	103	2026-01-08	tre_han
15042	342	104	2026-01-08	da_nop
15043	342	105	2026-01-08	da_nop
15044	342	106	2026-01-08	da_nop
15045	342	107	2026-01-08	da_nop
15046	342	108	2026-01-08	tre_han
15047	342	109	2026-01-08	da_nop
15048	342	110	2026-01-08	da_nop
15049	343	67	2026-01-08	da_nop
15050	343	68	2026-01-08	da_nop
15051	343	69	2026-01-08	da_nop
15052	343	70	2026-01-08	tre_han
15053	343	71	2026-01-08	da_nop
15054	343	72	2026-01-08	da_nop
15055	343	73	2026-01-08	da_nop
15056	343	74	2026-01-08	da_nop
15057	343	75	2026-01-08	da_nop
15058	343	76	2026-01-08	da_nop
15059	343	77	2026-01-08	da_nop
15060	343	78	2026-01-08	da_nop
15061	343	79	2026-01-08	tre_han
15062	343	80	2026-01-08	da_nop
15063	343	81	2026-01-08	da_nop
15064	343	82	2026-01-08	da_nop
15065	343	83	2026-01-08	da_nop
15066	343	84	2026-01-08	da_nop
15067	343	85	2026-01-08	da_nop
15068	343	86	2026-01-08	tre_han
15069	343	87	2026-01-08	da_nop
15070	343	88	2026-01-08	da_nop
15071	343	89	2026-01-08	da_nop
15072	343	90	2026-01-08	tre_han
15073	343	91	2026-01-08	da_nop
15074	343	92	2026-01-08	da_nop
15075	343	93	2026-01-08	da_nop
15076	343	94	2026-01-08	da_nop
15077	343	95	2026-01-08	da_nop
15078	343	96	2026-01-08	da_nop
15079	343	97	2026-01-08	tre_han
15080	343	98	2026-01-08	tre_han
15081	343	99	2026-01-08	da_nop
15082	343	100	2026-01-08	da_nop
15083	343	101	2026-01-08	tre_han
15084	343	102	2026-01-08	da_nop
15085	343	103	2026-01-08	tre_han
15086	343	104	2026-01-08	da_nop
15087	343	105	2026-01-08	da_nop
15088	343	106	2026-01-08	da_nop
15089	343	107	2026-01-08	da_nop
15090	343	108	2026-01-08	da_nop
15091	343	109	2026-01-08	tre_han
15092	343	110	2026-01-08	da_nop
15093	344	67	2026-01-08	da_nop
15094	344	68	2026-01-08	tre_han
15095	344	69	2026-01-08	da_nop
15096	344	70	2026-01-08	da_nop
15097	344	71	2026-01-08	da_nop
15098	344	72	2026-01-08	da_nop
15099	344	73	2026-01-08	da_nop
15100	344	74	2026-01-08	da_nop
15101	344	75	2026-01-08	da_nop
15102	344	76	2026-01-08	da_nop
15103	344	77	2026-01-08	tre_han
15104	344	78	2026-01-08	da_nop
15105	344	79	2026-01-08	tre_han
15106	344	80	2026-01-08	da_nop
15107	344	81	2026-01-08	tre_han
15108	344	82	2026-01-08	tre_han
15109	344	83	2026-01-08	tre_han
15110	344	84	2026-01-08	da_nop
15111	344	85	2026-01-08	da_nop
15112	344	86	2026-01-08	da_nop
15113	344	87	2026-01-08	da_nop
15114	344	88	2026-01-08	da_nop
15115	344	89	2026-01-08	da_nop
15116	344	90	2026-01-08	da_nop
15117	344	91	2026-01-08	da_nop
15118	344	92	2026-01-08	da_nop
15119	344	93	2026-01-08	da_nop
15120	344	94	2026-01-08	da_nop
15121	344	95	2026-01-08	da_nop
15122	344	96	2026-01-08	da_nop
15123	344	97	2026-01-08	da_nop
15124	344	98	2026-01-08	tre_han
15125	344	99	2026-01-08	da_nop
15126	344	100	2026-01-08	da_nop
15127	344	101	2026-01-08	da_nop
15128	344	102	2026-01-08	da_nop
15129	344	103	2026-01-08	da_nop
15130	344	104	2026-01-08	da_nop
15131	344	105	2026-01-08	da_nop
15132	344	106	2026-01-08	tre_han
15133	344	107	2026-01-08	da_nop
15134	344	108	2026-01-08	da_nop
15135	344	109	2026-01-08	da_nop
15136	344	110	2026-01-08	da_nop
15137	345	67	2026-01-08	tre_han
15138	345	68	2026-01-08	tre_han
15139	345	69	2026-01-08	da_nop
15140	345	70	2026-01-08	da_nop
15141	345	71	2026-01-08	da_nop
15142	345	72	2026-01-08	da_nop
15143	345	73	2026-01-08	da_nop
15144	345	74	2026-01-08	da_nop
15145	345	75	2026-01-08	da_nop
15146	345	76	2026-01-08	da_nop
15147	345	77	2026-01-08	da_nop
15148	345	78	2026-01-08	tre_han
15149	345	79	2026-01-08	da_nop
15150	345	80	2026-01-08	da_nop
15151	345	81	2026-01-08	da_nop
15152	345	82	2026-01-08	da_nop
15153	345	83	2026-01-08	tre_han
15154	345	84	2026-01-08	da_nop
15155	345	85	2026-01-08	tre_han
15156	345	86	2026-01-08	da_nop
15157	345	87	2026-01-08	da_nop
15158	345	88	2026-01-08	da_nop
15159	345	89	2026-01-08	tre_han
15160	345	90	2026-01-08	da_nop
15161	345	91	2026-01-08	tre_han
15162	345	92	2026-01-08	tre_han
15163	345	93	2026-01-08	da_nop
15164	345	94	2026-01-08	tre_han
15165	345	95	2026-01-08	tre_han
15166	345	96	2026-01-08	da_nop
15167	345	97	2026-01-08	da_nop
15168	345	98	2026-01-08	da_nop
15169	345	99	2026-01-08	da_nop
15170	345	100	2026-01-08	da_nop
15171	345	101	2026-01-08	da_nop
15172	345	102	2026-01-08	da_nop
15173	345	103	2026-01-08	da_nop
15174	345	104	2026-01-08	da_nop
15175	345	105	2026-01-08	da_nop
15176	345	106	2026-01-08	da_nop
15177	345	107	2026-01-08	da_nop
15178	345	108	2026-01-08	da_nop
15179	345	109	2026-01-08	da_nop
15180	345	110	2026-01-08	da_nop
15181	346	67	2026-01-08	da_nop
15182	346	68	2026-01-08	da_nop
15183	346	69	2026-01-08	da_nop
15184	346	70	2026-01-08	da_nop
15185	346	71	2026-01-08	tre_han
15186	346	72	2026-01-08	da_nop
15187	346	73	2026-01-08	da_nop
15188	346	74	2026-01-08	da_nop
15189	346	75	2026-01-08	tre_han
15190	346	76	2026-01-08	da_nop
15191	346	77	2026-01-08	da_nop
15192	346	78	2026-01-08	tre_han
15193	346	79	2026-01-08	tre_han
15194	346	80	2026-01-08	tre_han
15195	346	81	2026-01-08	da_nop
15196	346	82	2026-01-08	da_nop
15197	346	83	2026-01-08	tre_han
15198	346	84	2026-01-08	da_nop
15199	346	85	2026-01-08	tre_han
15200	346	86	2026-01-08	da_nop
15201	346	87	2026-01-08	da_nop
15202	346	88	2026-01-08	da_nop
15203	346	89	2026-01-08	da_nop
15204	346	90	2026-01-08	da_nop
15205	346	91	2026-01-08	da_nop
15206	346	92	2026-01-08	da_nop
15207	346	93	2026-01-08	da_nop
15208	346	94	2026-01-08	da_nop
15209	346	95	2026-01-08	da_nop
15210	346	96	2026-01-08	da_nop
15211	346	97	2026-01-08	da_nop
15212	346	98	2026-01-08	da_nop
15213	346	99	2026-01-08	da_nop
15214	346	100	2026-01-08	tre_han
15215	346	101	2026-01-08	tre_han
15216	346	102	2026-01-08	da_nop
15217	346	103	2026-01-08	da_nop
15218	346	104	2026-01-08	da_nop
15219	346	105	2026-01-08	da_nop
15220	346	106	2026-01-08	da_nop
15221	346	107	2026-01-08	da_nop
15222	346	108	2026-01-08	da_nop
15223	346	109	2026-01-08	da_nop
15224	346	110	2026-01-08	da_nop
15225	347	67	2026-01-08	da_nop
15226	347	68	2026-01-08	tre_han
15227	347	69	2026-01-08	da_nop
15228	347	70	2026-01-08	da_nop
15229	347	71	2026-01-08	tre_han
15230	347	72	2026-01-08	da_nop
15231	347	73	2026-01-08	da_nop
15232	347	74	2026-01-08	da_nop
15233	347	75	2026-01-08	da_nop
15234	347	76	2026-01-08	da_nop
15235	347	77	2026-01-08	da_nop
15236	347	78	2026-01-08	da_nop
15237	347	79	2026-01-08	tre_han
15238	347	80	2026-01-08	da_nop
15239	347	81	2026-01-08	tre_han
15240	347	82	2026-01-08	da_nop
15241	347	83	2026-01-08	da_nop
15242	347	84	2026-01-08	da_nop
15243	347	85	2026-01-08	da_nop
15244	347	86	2026-01-08	da_nop
15245	347	87	2026-01-08	da_nop
15246	347	88	2026-01-08	da_nop
15247	347	89	2026-01-08	da_nop
15248	347	90	2026-01-08	da_nop
15249	347	91	2026-01-08	tre_han
15250	347	92	2026-01-08	da_nop
15251	347	93	2026-01-08	da_nop
15252	347	94	2026-01-08	da_nop
15253	347	95	2026-01-08	da_nop
15254	347	96	2026-01-08	tre_han
15255	347	97	2026-01-08	da_nop
15256	347	98	2026-01-08	da_nop
15257	347	99	2026-01-08	tre_han
15258	347	100	2026-01-08	da_nop
15259	347	101	2026-01-08	da_nop
15260	347	102	2026-01-08	tre_han
15261	347	103	2026-01-08	da_nop
15262	347	104	2026-01-08	tre_han
15263	347	105	2026-01-08	tre_han
15264	347	106	2026-01-08	tre_han
15265	347	107	2026-01-08	tre_han
15266	347	108	2026-01-08	da_nop
15267	347	109	2026-01-08	da_nop
15268	347	110	2026-01-08	da_nop
15269	348	67	2026-01-08	da_nop
15270	348	68	2026-01-08	da_nop
15271	348	69	2026-01-08	da_nop
15272	348	70	2026-01-08	da_nop
15273	348	71	2026-01-08	da_nop
15274	348	72	2026-01-08	da_nop
15275	348	73	2026-01-08	da_nop
15276	348	74	2026-01-08	da_nop
15277	348	75	2026-01-08	da_nop
15278	348	76	2026-01-08	da_nop
15279	348	77	2026-01-08	da_nop
15280	348	78	2026-01-08	tre_han
15281	348	79	2026-01-08	da_nop
15282	348	80	2026-01-08	da_nop
15283	348	81	2026-01-08	da_nop
15284	348	82	2026-01-08	da_nop
15285	348	83	2026-01-08	da_nop
15286	348	84	2026-01-08	da_nop
15287	348	85	2026-01-08	da_nop
15288	348	86	2026-01-08	da_nop
15289	348	87	2026-01-08	da_nop
15290	348	88	2026-01-08	da_nop
15291	348	89	2026-01-08	da_nop
15292	348	90	2026-01-08	da_nop
15293	348	91	2026-01-08	da_nop
15294	348	92	2026-01-08	da_nop
15295	348	93	2026-01-08	da_nop
15296	348	94	2026-01-08	da_nop
15297	348	95	2026-01-08	da_nop
15298	348	96	2026-01-08	da_nop
15299	348	97	2026-01-08	da_nop
15300	348	98	2026-01-08	da_nop
15301	348	99	2026-01-08	tre_han
15302	348	100	2026-01-08	da_nop
15303	348	101	2026-01-08	tre_han
15304	348	102	2026-01-08	tre_han
15305	348	103	2026-01-08	da_nop
15306	348	104	2026-01-08	tre_han
15307	348	105	2026-01-08	tre_han
15308	348	106	2026-01-08	tre_han
15309	348	107	2026-01-08	da_nop
15310	348	108	2026-01-08	da_nop
15311	348	109	2026-01-08	da_nop
15312	348	110	2026-01-08	da_nop
15313	349	67	2026-01-08	da_nop
15314	349	68	2026-01-08	da_nop
15315	349	69	2026-01-08	da_nop
15316	349	70	2026-01-08	tre_han
15317	349	71	2026-01-08	tre_han
15318	349	72	2026-01-08	tre_han
15319	349	73	2026-01-08	da_nop
15320	349	74	2026-01-08	da_nop
15321	349	75	2026-01-08	da_nop
15322	349	76	2026-01-08	tre_han
15323	349	77	2026-01-08	da_nop
15324	349	78	2026-01-08	tre_han
15325	349	79	2026-01-08	da_nop
15326	349	80	2026-01-08	da_nop
15327	349	81	2026-01-08	da_nop
15328	349	82	2026-01-08	da_nop
15329	349	83	2026-01-08	da_nop
15330	349	84	2026-01-08	da_nop
15331	349	85	2026-01-08	da_nop
15332	349	86	2026-01-08	tre_han
15333	349	87	2026-01-08	da_nop
15334	349	88	2026-01-08	da_nop
15335	349	89	2026-01-08	da_nop
15336	349	90	2026-01-08	tre_han
15337	349	91	2026-01-08	da_nop
15338	349	92	2026-01-08	da_nop
15339	349	93	2026-01-08	da_nop
15340	349	94	2026-01-08	da_nop
15341	349	95	2026-01-08	da_nop
15342	349	96	2026-01-08	da_nop
15343	349	97	2026-01-08	da_nop
15344	349	98	2026-01-08	da_nop
15345	349	99	2026-01-08	da_nop
15346	349	100	2026-01-08	da_nop
15347	349	101	2026-01-08	da_nop
15348	349	102	2026-01-08	da_nop
15349	349	103	2026-01-08	tre_han
15350	349	104	2026-01-08	da_nop
15351	349	105	2026-01-08	da_nop
15352	349	106	2026-01-08	da_nop
15353	349	107	2026-01-08	da_nop
15354	349	108	2026-01-08	da_nop
15355	349	109	2026-01-08	da_nop
15356	349	110	2026-01-08	da_nop
15357	350	67	2026-01-08	da_nop
15358	350	68	2026-01-08	da_nop
15359	350	69	2026-01-08	da_nop
15360	350	70	2026-01-08	da_nop
15361	350	71	2026-01-08	da_nop
15362	350	72	2026-01-08	da_nop
15363	350	73	2026-01-08	da_nop
15364	350	74	2026-01-08	da_nop
15365	350	75	2026-01-08	da_nop
15366	350	76	2026-01-08	da_nop
15367	350	77	2026-01-08	da_nop
15368	350	78	2026-01-08	da_nop
15369	350	79	2026-01-08	da_nop
15370	350	80	2026-01-08	da_nop
15371	350	81	2026-01-08	da_nop
15372	350	82	2026-01-08	da_nop
15373	350	83	2026-01-08	tre_han
15374	350	84	2026-01-08	da_nop
15375	350	85	2026-01-08	da_nop
15376	350	86	2026-01-08	tre_han
15377	350	87	2026-01-08	da_nop
15378	350	88	2026-01-08	da_nop
15379	350	89	2026-01-08	da_nop
15380	350	90	2026-01-08	da_nop
15381	350	91	2026-01-08	da_nop
15382	350	92	2026-01-08	tre_han
15383	350	93	2026-01-08	da_nop
15384	350	94	2026-01-08	da_nop
15385	350	95	2026-01-08	da_nop
15386	350	96	2026-01-08	da_nop
15387	350	97	2026-01-08	da_nop
15388	350	98	2026-01-08	da_nop
15389	350	99	2026-01-08	da_nop
15390	350	100	2026-01-08	da_nop
15391	350	101	2026-01-08	tre_han
15392	350	102	2026-01-08	da_nop
15393	350	103	2026-01-08	da_nop
15394	350	104	2026-01-08	da_nop
15395	350	105	2026-01-08	da_nop
15396	350	106	2026-01-08	tre_han
15397	350	107	2026-01-08	da_nop
15398	350	108	2026-01-08	da_nop
15399	350	109	2026-01-08	da_nop
15400	350	110	2026-01-08	da_nop
15401	351	67	2026-01-08	da_nop
15402	351	68	2026-01-08	da_nop
15403	351	69	2026-01-08	da_nop
15404	351	70	2026-01-08	da_nop
15405	351	71	2026-01-08	da_nop
15406	351	72	2026-01-08	da_nop
15407	351	73	2026-01-08	tre_han
15408	351	74	2026-01-08	da_nop
15409	351	75	2026-01-08	da_nop
15410	351	76	2026-01-08	da_nop
15411	351	77	2026-01-08	da_nop
15412	351	78	2026-01-08	da_nop
15413	351	79	2026-01-08	tre_han
15414	351	80	2026-01-08	da_nop
15415	351	81	2026-01-08	da_nop
15416	351	82	2026-01-08	da_nop
15417	351	83	2026-01-08	da_nop
15418	351	84	2026-01-08	tre_han
15419	351	85	2026-01-08	da_nop
15420	351	86	2026-01-08	da_nop
15421	351	87	2026-01-08	da_nop
15422	351	88	2026-01-08	da_nop
15423	351	89	2026-01-08	tre_han
15424	351	90	2026-01-08	tre_han
15425	351	91	2026-01-08	tre_han
15426	351	92	2026-01-08	tre_han
15427	351	93	2026-01-08	da_nop
15428	351	94	2026-01-08	da_nop
15429	351	95	2026-01-08	da_nop
15430	351	96	2026-01-08	da_nop
15431	351	97	2026-01-08	da_nop
15432	351	98	2026-01-08	da_nop
15433	351	99	2026-01-08	da_nop
15434	351	100	2026-01-08	da_nop
15435	351	101	2026-01-08	tre_han
15436	351	102	2026-01-08	da_nop
15437	351	103	2026-01-08	da_nop
15438	351	104	2026-01-08	tre_han
15439	351	105	2026-01-08	da_nop
15440	351	106	2026-01-08	da_nop
15441	351	107	2026-01-08	da_nop
15442	351	108	2026-01-08	da_nop
15443	351	109	2026-01-08	da_nop
15444	351	110	2026-01-08	da_nop
15445	352	67	2026-01-08	da_nop
15446	352	68	2026-01-08	da_nop
15447	352	69	2026-01-08	da_nop
15448	352	70	2026-01-08	tre_han
15449	352	71	2026-01-08	tre_han
15450	352	72	2026-01-08	tre_han
15451	352	73	2026-01-08	da_nop
15452	352	74	2026-01-08	da_nop
15453	352	75	2026-01-08	da_nop
15454	352	76	2026-01-08	da_nop
15455	352	77	2026-01-08	da_nop
15456	352	78	2026-01-08	da_nop
15457	352	79	2026-01-08	da_nop
15458	352	80	2026-01-08	da_nop
15459	352	81	2026-01-08	da_nop
15460	352	82	2026-01-08	tre_han
15461	352	83	2026-01-08	da_nop
15462	352	84	2026-01-08	da_nop
15463	352	85	2026-01-08	da_nop
15464	352	86	2026-01-08	tre_han
15465	352	87	2026-01-08	da_nop
15466	352	88	2026-01-08	da_nop
15467	352	89	2026-01-08	da_nop
15468	352	90	2026-01-08	da_nop
15469	352	91	2026-01-08	da_nop
15470	352	92	2026-01-08	da_nop
15471	352	93	2026-01-08	da_nop
15472	352	94	2026-01-08	da_nop
15473	352	95	2026-01-08	da_nop
15474	352	96	2026-01-08	tre_han
15475	352	97	2026-01-08	da_nop
15476	352	98	2026-01-08	da_nop
15477	352	99	2026-01-08	da_nop
15478	352	100	2026-01-08	da_nop
15479	352	101	2026-01-08	da_nop
15480	352	102	2026-01-08	tre_han
15481	352	103	2026-01-08	tre_han
15482	352	104	2026-01-08	da_nop
15483	352	105	2026-01-08	da_nop
15484	352	106	2026-01-08	tre_han
15485	352	107	2026-01-08	da_nop
15486	352	108	2026-01-08	da_nop
15487	352	109	2026-01-08	da_nop
15488	352	110	2026-01-08	da_nop
15489	353	67	2026-01-08	tre_han
15490	353	68	2026-01-08	da_nop
15491	353	69	2026-01-08	da_nop
15492	353	70	2026-01-08	da_nop
15493	353	71	2026-01-08	da_nop
15494	353	72	2026-01-08	da_nop
15495	353	73	2026-01-08	da_nop
15496	353	74	2026-01-08	da_nop
15497	353	75	2026-01-08	da_nop
15498	353	76	2026-01-08	da_nop
15499	353	77	2026-01-08	tre_han
15500	353	78	2026-01-08	da_nop
15501	353	79	2026-01-08	tre_han
15502	353	80	2026-01-08	da_nop
15503	353	81	2026-01-08	da_nop
15504	353	82	2026-01-08	da_nop
15505	353	83	2026-01-08	da_nop
15506	353	84	2026-01-08	da_nop
15507	353	85	2026-01-08	da_nop
15508	353	86	2026-01-08	da_nop
15509	353	87	2026-01-08	tre_han
15510	353	88	2026-01-08	tre_han
15511	353	89	2026-01-08	da_nop
15512	353	90	2026-01-08	da_nop
15513	353	91	2026-01-08	tre_han
15514	353	92	2026-01-08	da_nop
15515	353	93	2026-01-08	da_nop
15516	353	94	2026-01-08	da_nop
15517	353	95	2026-01-08	da_nop
15518	353	96	2026-01-08	da_nop
15519	353	97	2026-01-08	tre_han
15520	353	98	2026-01-08	da_nop
15521	353	99	2026-01-08	da_nop
15522	353	100	2026-01-08	da_nop
15523	353	101	2026-01-08	da_nop
15524	353	102	2026-01-08	da_nop
15525	353	103	2026-01-08	da_nop
15526	353	104	2026-01-08	da_nop
15527	353	105	2026-01-08	da_nop
15528	353	106	2026-01-08	da_nop
15529	353	107	2026-01-08	da_nop
15530	353	108	2026-01-08	da_nop
15531	353	109	2026-01-08	da_nop
15532	353	110	2026-01-08	tre_han
15533	354	67	2026-01-08	da_nop
15534	354	68	2026-01-08	da_nop
15535	354	69	2026-01-08	da_nop
15536	354	70	2026-01-08	da_nop
15537	354	71	2026-01-08	da_nop
15538	354	72	2026-01-08	da_nop
15539	354	73	2026-01-08	da_nop
15540	354	74	2026-01-08	da_nop
15541	354	75	2026-01-08	da_nop
15542	354	76	2026-01-08	da_nop
15543	354	77	2026-01-08	tre_han
15544	354	78	2026-01-08	da_nop
15545	354	79	2026-01-08	da_nop
15546	354	80	2026-01-08	da_nop
15547	354	81	2026-01-08	da_nop
15548	354	82	2026-01-08	tre_han
15549	354	83	2026-01-08	da_nop
15550	354	84	2026-01-08	da_nop
15551	354	85	2026-01-08	da_nop
15552	354	86	2026-01-08	da_nop
15553	354	87	2026-01-08	da_nop
15554	354	88	2026-01-08	da_nop
15555	354	89	2026-01-08	da_nop
15556	354	90	2026-01-08	da_nop
15557	354	91	2026-01-08	da_nop
15558	354	92	2026-01-08	tre_han
15559	354	93	2026-01-08	tre_han
15560	354	94	2026-01-08	da_nop
15561	354	95	2026-01-08	tre_han
15562	354	96	2026-01-08	da_nop
15563	354	97	2026-01-08	da_nop
15564	354	98	2026-01-08	da_nop
15565	354	99	2026-01-08	da_nop
15566	354	100	2026-01-08	da_nop
15567	354	101	2026-01-08	da_nop
15568	354	102	2026-01-08	da_nop
15569	354	103	2026-01-08	tre_han
15570	354	104	2026-01-08	da_nop
15571	354	105	2026-01-08	da_nop
15572	354	106	2026-01-08	da_nop
15573	354	107	2026-01-08	da_nop
15574	354	108	2026-01-08	da_nop
15575	354	109	2026-01-08	da_nop
15576	354	110	2026-01-08	da_nop
15577	355	67	2026-01-08	da_nop
15578	355	68	2026-01-08	da_nop
15579	355	69	2026-01-08	da_nop
15580	355	70	2026-01-08	da_nop
15581	355	71	2026-01-08	da_nop
15582	355	72	2026-01-08	da_nop
15583	355	73	2026-01-08	tre_han
15584	355	74	2026-01-08	da_nop
15585	355	75	2026-01-08	da_nop
15586	355	76	2026-01-08	tre_han
15587	355	77	2026-01-08	da_nop
15588	355	78	2026-01-08	da_nop
15589	355	79	2026-01-08	da_nop
15590	355	80	2026-01-08	tre_han
15591	355	81	2026-01-08	da_nop
15592	355	82	2026-01-08	tre_han
15593	355	83	2026-01-08	da_nop
15594	355	84	2026-01-08	da_nop
15595	355	85	2026-01-08	da_nop
15596	355	86	2026-01-08	tre_han
15597	355	87	2026-01-08	da_nop
15598	355	88	2026-01-08	da_nop
15599	355	89	2026-01-08	da_nop
15600	355	90	2026-01-08	da_nop
15601	355	91	2026-01-08	da_nop
15602	355	92	2026-01-08	da_nop
15603	355	93	2026-01-08	da_nop
15604	355	94	2026-01-08	da_nop
15605	355	95	2026-01-08	da_nop
15606	355	96	2026-01-08	da_nop
15607	355	97	2026-01-08	tre_han
15608	355	98	2026-01-08	da_nop
15609	355	99	2026-01-08	da_nop
15610	355	100	2026-01-08	tre_han
15611	355	101	2026-01-08	da_nop
15612	355	102	2026-01-08	da_nop
15613	355	103	2026-01-08	da_nop
15614	355	104	2026-01-08	da_nop
15615	355	105	2026-01-08	tre_han
15616	355	106	2026-01-08	da_nop
15617	355	107	2026-01-08	da_nop
15618	355	108	2026-01-08	da_nop
15619	355	109	2026-01-08	tre_han
15620	355	110	2026-01-08	tre_han
15621	356	67	2026-01-08	da_nop
15622	356	68	2026-01-08	da_nop
15623	356	69	2026-01-08	da_nop
15624	356	70	2026-01-08	da_nop
15625	356	71	2026-01-08	tre_han
15626	356	72	2026-01-08	da_nop
15627	356	73	2026-01-08	da_nop
15628	356	74	2026-01-08	da_nop
15629	356	75	2026-01-08	da_nop
15630	356	76	2026-01-08	da_nop
15631	356	77	2026-01-08	da_nop
15632	356	78	2026-01-08	da_nop
15633	356	79	2026-01-08	da_nop
15634	356	80	2026-01-08	tre_han
15635	356	81	2026-01-08	da_nop
15636	356	82	2026-01-08	da_nop
15637	356	83	2026-01-08	da_nop
15638	356	84	2026-01-08	da_nop
15639	356	85	2026-01-08	da_nop
15640	356	86	2026-01-08	da_nop
15641	356	87	2026-01-08	da_nop
15642	356	88	2026-01-08	da_nop
15643	356	89	2026-01-08	da_nop
15644	356	90	2026-01-08	tre_han
15645	356	91	2026-01-08	da_nop
15646	356	92	2026-01-08	tre_han
15647	356	93	2026-01-08	da_nop
15648	356	94	2026-01-08	da_nop
15649	356	95	2026-01-08	da_nop
15650	356	96	2026-01-08	da_nop
15651	356	97	2026-01-08	da_nop
15652	356	98	2026-01-08	da_nop
15653	356	99	2026-01-08	da_nop
15654	356	100	2026-01-08	da_nop
15655	356	101	2026-01-08	da_nop
15656	356	102	2026-01-08	da_nop
15657	356	103	2026-01-08	da_nop
15658	356	104	2026-01-08	da_nop
15659	356	105	2026-01-08	da_nop
15660	356	106	2026-01-08	da_nop
15661	356	107	2026-01-08	da_nop
15662	356	108	2026-01-08	da_nop
15663	356	109	2026-01-08	da_nop
15664	356	110	2026-01-08	da_nop
15665	357	67	2026-01-08	da_nop
15666	357	68	2026-01-08	da_nop
15667	357	69	2026-01-08	tre_han
15668	357	70	2026-01-08	da_nop
15669	357	71	2026-01-08	da_nop
15670	357	72	2026-01-08	da_nop
15671	357	73	2026-01-08	da_nop
15672	357	74	2026-01-08	tre_han
15673	357	75	2026-01-08	da_nop
15674	357	76	2026-01-08	da_nop
15675	357	77	2026-01-08	da_nop
15676	357	78	2026-01-08	da_nop
15677	357	79	2026-01-08	tre_han
15678	357	80	2026-01-08	da_nop
15679	357	81	2026-01-08	tre_han
15680	357	82	2026-01-08	da_nop
15681	357	83	2026-01-08	tre_han
15682	357	84	2026-01-08	da_nop
15683	357	85	2026-01-08	da_nop
15684	357	86	2026-01-08	da_nop
15685	357	87	2026-01-08	tre_han
15686	357	88	2026-01-08	tre_han
15687	357	89	2026-01-08	da_nop
15688	357	90	2026-01-08	da_nop
15689	357	91	2026-01-08	da_nop
15690	357	92	2026-01-08	da_nop
15691	357	93	2026-01-08	tre_han
15692	357	94	2026-01-08	tre_han
15693	357	95	2026-01-08	da_nop
15694	357	96	2026-01-08	da_nop
15695	357	97	2026-01-08	tre_han
15696	357	98	2026-01-08	da_nop
15697	357	99	2026-01-08	da_nop
15698	357	100	2026-01-08	da_nop
15699	357	101	2026-01-08	tre_han
15700	357	102	2026-01-08	da_nop
15701	357	103	2026-01-08	da_nop
15702	357	104	2026-01-08	tre_han
15703	357	105	2026-01-08	da_nop
15704	357	106	2026-01-08	da_nop
15705	357	107	2026-01-08	da_nop
15706	357	108	2026-01-08	tre_han
15707	357	109	2026-01-08	tre_han
15708	357	110	2026-01-08	da_nop
15709	358	67	2026-01-08	da_nop
15710	358	68	2026-01-08	da_nop
15711	358	69	2026-01-08	tre_han
15712	358	70	2026-01-08	tre_han
15713	358	71	2026-01-08	tre_han
15714	358	72	2026-01-08	da_nop
15715	358	73	2026-01-08	da_nop
15716	358	74	2026-01-08	da_nop
15717	358	75	2026-01-08	da_nop
15718	358	76	2026-01-08	da_nop
15719	358	77	2026-01-08	tre_han
15720	358	78	2026-01-08	tre_han
15721	358	79	2026-01-08	da_nop
15722	358	80	2026-01-08	da_nop
15723	358	81	2026-01-08	tre_han
15724	358	82	2026-01-08	da_nop
15725	358	83	2026-01-08	da_nop
15726	358	84	2026-01-08	da_nop
15727	358	85	2026-01-08	da_nop
15728	358	86	2026-01-08	da_nop
15729	358	87	2026-01-08	da_nop
15730	358	88	2026-01-08	da_nop
15731	358	89	2026-01-08	tre_han
15732	358	90	2026-01-08	tre_han
15733	358	91	2026-01-08	da_nop
15734	358	92	2026-01-08	da_nop
15735	358	93	2026-01-08	tre_han
15736	358	94	2026-01-08	tre_han
15737	358	95	2026-01-08	da_nop
15738	358	96	2026-01-08	da_nop
15739	358	97	2026-01-08	da_nop
15740	358	98	2026-01-08	da_nop
15741	358	99	2026-01-08	da_nop
15742	358	100	2026-01-08	da_nop
15743	358	101	2026-01-08	da_nop
15744	358	102	2026-01-08	da_nop
15745	358	103	2026-01-08	da_nop
15746	358	104	2026-01-08	da_nop
15747	358	105	2026-01-08	da_nop
15748	358	106	2026-01-08	da_nop
15749	358	107	2026-01-08	da_nop
15750	358	108	2026-01-08	da_nop
15751	358	109	2026-01-08	da_nop
15752	358	110	2026-01-08	da_nop
15753	359	67	2026-01-08	da_nop
15754	359	68	2026-01-08	da_nop
15755	359	69	2026-01-08	da_nop
15756	359	70	2026-01-08	tre_han
15757	359	71	2026-01-08	da_nop
15758	359	72	2026-01-08	da_nop
15759	359	73	2026-01-08	da_nop
15760	359	74	2026-01-08	da_nop
15761	359	75	2026-01-08	da_nop
15762	359	76	2026-01-08	da_nop
15763	359	77	2026-01-08	da_nop
15764	359	78	2026-01-08	da_nop
15765	359	79	2026-01-08	da_nop
15766	359	80	2026-01-08	da_nop
15767	359	81	2026-01-08	tre_han
15768	359	82	2026-01-08	da_nop
15769	359	83	2026-01-08	da_nop
15770	359	84	2026-01-08	da_nop
15771	359	85	2026-01-08	da_nop
15772	359	86	2026-01-08	da_nop
15773	359	87	2026-01-08	da_nop
15774	359	88	2026-01-08	da_nop
15775	359	89	2026-01-08	da_nop
15776	359	90	2026-01-08	da_nop
15777	359	91	2026-01-08	tre_han
15778	359	92	2026-01-08	da_nop
15779	359	93	2026-01-08	tre_han
15780	359	94	2026-01-08	da_nop
15781	359	95	2026-01-08	da_nop
15782	359	96	2026-01-08	da_nop
15783	359	97	2026-01-08	da_nop
15784	359	98	2026-01-08	da_nop
15785	359	99	2026-01-08	tre_han
15786	359	100	2026-01-08	tre_han
15787	359	101	2026-01-08	da_nop
15788	359	102	2026-01-08	da_nop
15789	359	103	2026-01-08	da_nop
15790	359	104	2026-01-08	da_nop
15791	359	105	2026-01-08	da_nop
15792	359	106	2026-01-08	da_nop
15793	359	107	2026-01-08	da_nop
15794	359	108	2026-01-08	da_nop
15795	359	109	2026-01-08	da_nop
15796	359	110	2026-01-08	da_nop
15797	360	67	2026-01-08	da_nop
15798	360	68	2026-01-08	da_nop
15799	360	69	2026-01-08	da_nop
15800	360	70	2026-01-08	da_nop
15801	360	71	2026-01-08	tre_han
15802	360	72	2026-01-08	tre_han
15803	360	73	2026-01-08	da_nop
15804	360	74	2026-01-08	da_nop
15805	360	75	2026-01-08	da_nop
15806	360	76	2026-01-08	da_nop
15807	360	77	2026-01-08	da_nop
15808	360	78	2026-01-08	tre_han
15809	360	79	2026-01-08	da_nop
15810	360	80	2026-01-08	tre_han
15811	360	81	2026-01-08	da_nop
15812	360	82	2026-01-08	da_nop
15813	360	83	2026-01-08	tre_han
15814	360	84	2026-01-08	da_nop
15815	360	85	2026-01-08	da_nop
15816	360	86	2026-01-08	da_nop
15817	360	87	2026-01-08	tre_han
15818	360	88	2026-01-08	da_nop
15819	360	89	2026-01-08	da_nop
15820	360	90	2026-01-08	da_nop
15821	360	91	2026-01-08	da_nop
15822	360	92	2026-01-08	da_nop
15823	360	93	2026-01-08	da_nop
15824	360	94	2026-01-08	da_nop
15825	360	95	2026-01-08	da_nop
15826	360	96	2026-01-08	da_nop
15827	360	97	2026-01-08	da_nop
15828	360	98	2026-01-08	da_nop
15829	360	99	2026-01-08	da_nop
15830	360	100	2026-01-08	tre_han
15831	360	101	2026-01-08	da_nop
15832	360	102	2026-01-08	da_nop
15833	360	103	2026-01-08	da_nop
15834	360	104	2026-01-08	da_nop
15835	360	105	2026-01-08	da_nop
15836	360	106	2026-01-08	da_nop
15837	360	107	2026-01-08	da_nop
15838	360	108	2026-01-08	tre_han
15839	360	109	2026-01-08	tre_han
15840	360	110	2026-01-08	da_nop
\.


--
-- TOC entry 5225 (class 0 OID 16934)
-- Dependencies: 246
-- Data for Name: phan_cong_giang_day; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phan_cong_giang_day (id, giang_vien_id, lop_hoc_phan_id) FROM stdin;
1	11	13
2	11	14
3	11	15
4	11	16
5	11	17
6	11	18
7	11	19
8	11	20
9	11	21
10	11	22
11	11	23
12	11	24
13	11	25
14	11	26
15	11	27
16	11	28
17	11	29
18	11	30
19	11	31
20	11	32
21	11	33
22	11	34
23	11	35
24	11	36
25	11	37
26	11	38
27	11	39
28	11	40
29	11	41
30	11	42
31	11	43
32	11	44
33	11	45
34	11	46
35	11	47
36	11	48
37	12	13
38	12	14
39	12	15
40	12	16
41	12	17
42	12	18
43	12	19
44	12	20
45	12	21
46	12	22
47	12	23
48	12	24
49	12	25
50	12	26
51	12	27
52	12	28
53	12	29
54	12	30
55	12	31
56	12	32
57	12	33
58	12	34
59	12	35
60	12	36
61	12	37
62	12	38
63	12	39
64	12	40
65	12	41
66	12	42
67	12	43
68	12	44
69	12	45
70	12	46
71	12	47
72	12	48
73	13	13
74	13	14
75	13	15
76	13	16
77	13	17
78	13	18
79	13	19
80	13	20
81	13	21
82	13	22
83	13	23
84	13	24
85	13	25
86	13	26
87	13	27
88	13	28
89	13	29
90	13	30
91	13	31
92	13	32
93	13	33
94	13	34
95	13	35
96	13	36
97	13	37
98	13	38
99	13	39
100	13	40
101	13	41
102	13	42
103	13	43
104	13	44
105	13	45
106	13	46
107	13	47
108	13	48
109	14	13
110	14	14
111	14	15
112	14	16
113	14	17
114	14	18
115	14	19
116	14	20
117	14	21
118	14	22
119	14	23
120	14	24
121	14	25
122	14	26
123	14	27
124	14	28
125	14	29
126	14	30
127	14	31
128	14	32
129	14	33
130	14	34
131	14	35
132	14	36
133	14	37
134	14	38
135	14	39
136	14	40
137	14	41
138	14	42
139	14	43
140	14	44
141	14	45
142	14	46
143	14	47
144	14	48
145	15	13
146	15	14
147	15	15
148	15	16
149	15	17
150	15	18
151	15	19
152	15	20
153	15	21
154	15	22
155	15	23
156	15	24
157	15	25
158	15	26
159	15	27
160	15	28
161	15	29
162	15	30
163	15	31
164	15	32
165	15	33
166	15	34
167	15	35
168	15	36
169	15	37
170	15	38
171	15	39
172	15	40
173	15	41
174	15	42
175	15	43
176	15	44
177	15	45
178	15	46
179	15	47
180	15	48
181	16	13
182	16	14
183	16	15
184	16	16
185	16	17
186	16	18
187	16	19
188	16	20
189	16	21
190	16	22
191	16	23
192	16	24
193	16	25
194	16	26
195	16	27
196	16	28
197	16	29
198	16	30
199	16	31
200	16	32
201	16	33
202	16	34
203	16	35
204	16	36
205	16	37
206	16	38
207	16	39
208	16	40
209	16	41
210	16	42
211	16	43
212	16	44
213	16	45
214	16	46
215	16	47
216	16	48
217	17	13
218	17	14
219	17	15
220	17	16
221	17	17
222	17	18
223	17	19
224	17	20
225	17	21
226	17	22
227	17	23
228	17	24
229	17	25
230	17	26
231	17	27
232	17	28
233	17	29
234	17	30
235	17	31
236	17	32
237	17	33
238	17	34
239	17	35
240	17	36
241	17	37
242	17	38
243	17	39
244	17	40
245	17	41
246	17	42
247	17	43
248	17	44
249	17	45
250	17	46
251	17	47
252	17	48
253	18	13
254	18	14
255	18	15
256	18	16
257	18	17
258	18	18
259	18	19
260	18	20
261	18	21
262	18	22
263	18	23
264	18	24
265	18	25
266	18	26
267	18	27
268	18	28
269	18	29
270	18	30
271	18	31
272	18	32
273	18	33
274	18	34
275	18	35
276	18	36
277	18	37
278	18	38
279	18	39
280	18	40
281	18	41
282	18	42
283	18	43
284	18	44
285	18	45
286	18	46
287	18	47
288	18	48
289	19	13
290	19	14
291	19	15
292	19	16
293	19	17
294	19	18
295	19	19
296	19	20
297	19	21
298	19	22
299	19	23
300	19	24
301	19	25
302	19	26
303	19	27
304	19	28
305	19	29
306	19	30
307	19	31
308	19	32
309	19	33
310	19	34
311	19	35
312	19	36
313	19	37
314	19	38
315	19	39
316	19	40
317	19	41
318	19	42
319	19	43
320	19	44
321	19	45
322	19	46
323	19	47
324	19	48
325	20	13
326	20	14
327	20	15
328	20	16
329	20	17
330	20	18
331	20	19
332	20	20
333	20	21
334	20	22
335	20	23
336	20	24
337	20	25
338	20	26
339	20	27
340	20	28
341	20	29
342	20	30
343	20	31
344	20	32
345	20	33
346	20	34
347	20	35
348	20	36
349	20	37
350	20	38
351	20	39
352	20	40
353	20	41
354	20	42
355	20	43
356	20	44
357	20	45
358	20	46
359	20	47
360	20	48
\.


--
-- TOC entry 5215 (class 0 OID 16857)
-- Dependencies: 236
-- Data for Name: phien_diem_danh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phien_diem_danh (id, buoi_hoc_id, ma_qr_phien, bat_dau, ket_thuc) FROM stdin;
2	2	QR-2-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
3	3	QR-3-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
4	4	QR-4-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
5	5	QR-5-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
6	6	QR-6-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
7	7	QR-7-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
8	8	QR-8-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
9	9	QR-9-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
10	10	QR-10-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
11	11	QR-11-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
12	12	QR-12-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
13	13	QR-13-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
14	14	QR-14-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
15	15	QR-15-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
16	16	QR-16-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
17	17	QR-17-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
18	18	QR-18-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
19	19	QR-19-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
20	20	QR-20-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
21	21	QR-21-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
22	22	QR-22-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
23	23	QR-23-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
24	24	QR-24-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
25	25	QR-25-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
26	26	QR-26-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
27	27	QR-27-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
28	28	QR-28-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
29	29	QR-29-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
30	30	QR-30-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
31	31	QR-31-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
32	32	QR-32-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
33	33	QR-33-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
34	34	QR-34-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
35	35	QR-35-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
36	36	QR-36-1767873561	2026-01-08 18:59:21.245064	2026-01-08 19:14:21.245064
37	1	PHIEN_1768627313768	2026-01-17 05:21:53.768	\N
1	1	QR-1-1767873561	2026-01-08 18:59:21.245064	2026-01-17 05:24:13.135
38	1	PHIEN_1768628691787	2026-01-17 05:44:51.787	\N
39	1	PHIEN_1768628692807	2026-01-17 05:44:52.808	\N
40	1	PHIEN_1768628693258	2026-01-17 05:44:53.258	\N
41	1	PHIEN_1768628693782	2026-01-17 05:44:53.782	\N
42	1	PHIEN_1768628694330	2026-01-17 05:44:54.33	\N
43	1	PHIEN_1768628694801	2026-01-17 05:44:54.801	\N
44	1	PHIEN_1768628695318	2026-01-17 05:44:55.318	\N
45	1	PHIEN_1768628695725	2026-01-17 05:44:55.725	\N
\.


--
-- TOC entry 5203 (class 0 OID 16769)
-- Dependencies: 224
-- Data for Name: sinh_vien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sinh_vien (id, nguoi_dung_id, mssv, ho_ten, lop, ma_qr) FROM stdin;
74	19	VAA240008	Trần Quốc Bảo	24ĐHTT02	QR-VAA-19
75	20	VAA240009	Lý Minh Châu	24ĐHTT03	QR-VAA-20
76	21	VAA240010	Phan Anh Tuấn	24ĐHTT04	QR-VAA-21
77	22	VAA240011	Nguyễn Thị Mai	24ĐHTT05	QR-VAA-22
78	23	VAA240012	Trịnh Hoàng Nam	24ĐHTT06	QR-VAA-23
79	24	VAA240013	Đỗ Minh Quân	24ĐHTT01	QR-VAA-24
80	25	VAA240014	Bùi Thị Ngọc	24ĐHTT02	QR-VAA-25
81	26	VAA240015	Huỳnh Tấn Phát	24ĐHTT03	QR-VAA-26
82	27	VAA240016	Ngô Thanh Tùng	24ĐHTT04	QR-VAA-27
83	28	VAA240017	Phạm Quốc Khánh	24ĐHTT05	QR-VAA-28
84	29	VAA240018	Nguyễn Hải Yến	24ĐHTT06	QR-VAA-29
85	30	VAA240019	Lê Thanh Bình	24ĐHTT01	QR-VAA-30
86	31	VAA240020	Trần Thị Ánh	24ĐHTT02	QR-VAA-31
87	32	VAA240021	Đinh Văn Đức	24ĐHTT03	QR-VAA-32
67	12	VAA240001	Nguyễn Văn An	24ĐHTT01	QR-VAA-12
68	13	VAA240002	Trần Thị Bích	24ĐHTT02	QR-VAA-13
69	14	VAA240003	Lê Hoàng Minh	24ĐHTT03	QR-VAA-14
70	15	VAA240004	Phạm Thu Trang	24ĐHTT04	QR-VAA-15
71	16	VAA240005	Võ Quốc Huy	24ĐHTT05	QR-VAA-16
72	17	VAA240006	Đặng Thị Hồng	24ĐHTT06	QR-VAA-17
73	18	VAA240007	Nguyễn Thành Long	24ĐHTT01	QR-VAA-18
88	33	VAA240022	Nguyễn Phương Thảo	24ĐHTT04	QR-VAA-33
89	34	VAA240023	Hoàng Minh Khoa	24ĐHTT05	QR-VAA-34
90	35	VAA240024	Phạm Ngọc Linh	24ĐHTT06	QR-VAA-35
91	36	VAA240025	Lương Quốc Toàn	24ĐHTT01	QR-VAA-36
92	37	VAA240026	Vũ Thị Lan	24ĐHTT02	QR-VAA-37
93	38	VAA240027	Nguyễn Tuấn Kiệt	24ĐHTT03	QR-VAA-38
94	39	VAA240028	Trần Minh Tâm	24ĐHTT04	QR-VAA-39
95	40	VAA240029	Phạm Văn Phúc	24ĐHTT05	QR-VAA-40
96	41	VAA240030	Nguyễn Kim Oanh	24ĐHTT06	QR-VAA-41
97	42	VAA240031	Lê Quốc Việt	24ĐHTT01	QR-VAA-42
98	43	VAA240032	Đỗ Thị Thúy	24ĐHTT02	QR-VAA-43
99	44	VAA240033	Nguyễn Anh Dũng	24ĐHTT03	QR-VAA-44
100	45	VAA240034	Trần Gia Huy	24ĐHTT04	QR-VAA-45
101	46	VAA240035	Phan Thị Như Ý	24ĐHTT05	QR-VAA-46
102	47	VAA240036	Hoàng Văn Sơn	24ĐHTT06	QR-VAA-47
103	48	VAA240037	Nguyễn Thị Hạnh	24ĐHTT01	QR-VAA-48
104	49	VAA240038	Lê Minh Nhật	24ĐHTT02	QR-VAA-49
105	50	VAA240039	Trần Quốc Thái	24ĐHTT03	QR-VAA-50
106	51	VAA240040	Phạm Thanh Tùng	24ĐHTT04	QR-VAA-51
107	52	VAA240041	Nguyễn Văn Phong	24ĐHTT05	QR-VAA-52
108	53	VAA240042	Bùi Thị Kim	24ĐHTT06	QR-VAA-53
109	54	VAA240043	Võ Minh Trí	24ĐHTT01	QR-VAA-54
110	55	VAA240044	Lê Quốc Đạt	24ĐHTT02	QR-VAA-55
111	56	VAA240045	Trần Ngọc Bảo	24ĐHTT03	QR-VAA-56
112	57	VAA240046	Nguyễn Thị Diễm	24ĐHTT04	QR-VAA-57
113	58	VAA240047	Phạm Hữu Nghĩa	24ĐHTT05	QR-VAA-58
114	59	VAA240048	Huỳnh Quốc Cường	24ĐHTT06	QR-VAA-59
115	60	VAA240049	Lý Thị Tuyết	24ĐHTT01	QR-VAA-60
116	61	VAA240050	Nguyễn Minh Hoàng	24ĐHTT02	QR-VAA-61
117	62	VAA240051	Trần Văn Khôi	24ĐHTT03	QR-VAA-62
118	63	VAA240052	Phạm Mỹ Linh	24ĐHTT04	QR-VAA-63
119	64	VAA240053	Đỗ Quốc Hưng	24ĐHTT05	QR-VAA-64
120	65	VAA240054	Nguyễn Thị Thanh	24ĐHTT06	QR-VAA-65
121	66	VAA240055	Lê Văn Trung	24ĐHTT01	QR-VAA-66
122	67	VAA240056	Trần Minh Đức	24ĐHTT02	QR-VAA-67
123	68	VAA240057	Phạm Quốc Vinh	24ĐHTT03	QR-VAA-68
124	69	VAA240058	Nguyễn Phúc An	24ĐHTT04	QR-VAA-69
125	70	VAA240059	Hoàng Gia Bảo	24ĐHTT05	QR-VAA-70
126	71	VAA240060	Vũ Thị Thanh Tâm	24ĐHTT06	QR-VAA-71
\.


--
-- TOC entry 5227 (class 0 OID 16952)
-- Dependencies: 248
-- Data for Name: su_kien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.su_kien (id, ten_su_kien, mo_ta, ngay_to_chuc, dia_diem, diem_cong, admin_id) FROM stdin;
6	Sự kiện sinh viên	Hoạt động toàn trường	2026-01-07	Hội trường A	10	1
7	Tuần sinh hoạt công dân	Sinh hoạt đầu khóa	2024-09-10	Hội trường B	25	1
8	Ngày hội việc làm	Doanh nghiệp tuyển dụng	2024-10-15	Hội trường A	25	1
9	Hiến máu nhân đạo	Hoạt động tình nguyện	2024-11-20	Hội trường B	40	1
\.


--
-- TOC entry 5235 (class 0 OID 17156)
-- Dependencies: 256
-- Data for Name: thanh_toan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thanh_toan (id, sinh_vien_id, lop_hoc_phan_id, so_tien, trang_thai, phuong_thuc, thoi_gian_thanh_toan) FROM stdin;
\.


--
-- TOC entry 5199 (class 0 OID 16741)
-- Dependencies: 220
-- Data for Name: vai_tro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vai_tro (id, ten_vai_tro) FROM stdin;
1	ADMIN
2	GIANG_VIEN
3	SINH_VIEN
\.


--
-- TOC entry 5260 (class 0 OID 0)
-- Dependencies: 239
-- Name: bai_tap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bai_tap_id_seq', 360, true);


--
-- TOC entry 5261 (class 0 OID 0)
-- Dependencies: 233
-- Name: buoi_hoc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buoi_hoc_id_seq', 36, true);


--
-- TOC entry 5262 (class 0 OID 0)
-- Dependencies: 231
-- Name: dang_ky_hoc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dang_ky_hoc_id_seq', 1584, true);


--
-- TOC entry 5263 (class 0 OID 0)
-- Dependencies: 249
-- Name: dang_ky_su_kien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dang_ky_su_kien_id_seq', 40, true);


--
-- TOC entry 5264 (class 0 OID 0)
-- Dependencies: 237
-- Name: diem_danh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diem_danh_id_seq', 1584, true);


--
-- TOC entry 5265 (class 0 OID 0)
-- Dependencies: 243
-- Name: diem_ren_luyen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diem_ren_luyen_id_seq', 125, true);


--
-- TOC entry 5266 (class 0 OID 0)
-- Dependencies: 225
-- Name: giang_vien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.giang_vien_id_seq', 20, true);


--
-- TOC entry 5267 (class 0 OID 0)
-- Dependencies: 227
-- Name: hoc_phan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hoc_phan_id_seq', 14, true);


--
-- TOC entry 5268 (class 0 OID 0)
-- Dependencies: 253
-- Name: lich_hoc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lich_hoc_id_seq', 42, true);


--
-- TOC entry 5269 (class 0 OID 0)
-- Dependencies: 251
-- Name: lich_su_diem_ren_luyen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lich_su_diem_ren_luyen_id_seq', 44, true);


--
-- TOC entry 5270 (class 0 OID 0)
-- Dependencies: 229
-- Name: lop_hoc_phan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lop_hoc_phan_id_seq', 48, true);


--
-- TOC entry 5271 (class 0 OID 0)
-- Dependencies: 221
-- Name: nguoi_dung_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nguoi_dung_id_seq', 72, true);


--
-- TOC entry 5272 (class 0 OID 0)
-- Dependencies: 241
-- Name: nop_bai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nop_bai_id_seq', 15840, true);


--
-- TOC entry 5273 (class 0 OID 0)
-- Dependencies: 245
-- Name: phan_cong_giang_day_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phan_cong_giang_day_id_seq', 360, true);


--
-- TOC entry 5274 (class 0 OID 0)
-- Dependencies: 235
-- Name: phien_diem_danh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phien_diem_danh_id_seq', 45, true);


--
-- TOC entry 5275 (class 0 OID 0)
-- Dependencies: 223
-- Name: sinh_vien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sinh_vien_id_seq', 146, true);


--
-- TOC entry 5276 (class 0 OID 0)
-- Dependencies: 247
-- Name: su_kien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.su_kien_id_seq', 9, true);


--
-- TOC entry 5277 (class 0 OID 0)
-- Dependencies: 255
-- Name: thanh_toan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thanh_toan_id_seq', 1, false);


--
-- TOC entry 5278 (class 0 OID 0)
-- Dependencies: 219
-- Name: vai_tro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vai_tro_id_seq', 3, true);


--
-- TOC entry 5008 (class 2606 OID 16895)
-- Name: bai_tap bai_tap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bai_tap
    ADD CONSTRAINT bai_tap_pkey PRIMARY KEY (id);


--
-- TOC entry 5002 (class 2606 OID 16850)
-- Name: buoi_hoc buoi_hoc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buoi_hoc
    ADD CONSTRAINT buoi_hoc_pkey PRIMARY KEY (id);


--
-- TOC entry 4998 (class 2606 OID 16832)
-- Name: dang_ky_hoc dang_ky_hoc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dang_ky_hoc
    ADD CONSTRAINT dang_ky_hoc_pkey PRIMARY KEY (id);


--
-- TOC entry 5018 (class 2606 OID 16974)
-- Name: dang_ky_su_kien dang_ky_su_kien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dang_ky_su_kien
    ADD CONSTRAINT dang_ky_su_kien_pkey PRIMARY KEY (id);


--
-- TOC entry 5006 (class 2606 OID 16877)
-- Name: diem_danh diem_danh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diem_danh
    ADD CONSTRAINT diem_danh_pkey PRIMARY KEY (id);


--
-- TOC entry 5012 (class 2606 OID 16927)
-- Name: diem_ren_luyen diem_ren_luyen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diem_ren_luyen
    ADD CONSTRAINT diem_ren_luyen_pkey PRIMARY KEY (id);


--
-- TOC entry 4992 (class 2606 OID 16792)
-- Name: giang_vien giang_vien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giang_vien
    ADD CONSTRAINT giang_vien_pkey PRIMARY KEY (id);


--
-- TOC entry 4994 (class 2606 OID 16805)
-- Name: hoc_phan hoc_phan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoc_phan
    ADD CONSTRAINT hoc_phan_pkey PRIMARY KEY (id);


--
-- TOC entry 5022 (class 2606 OID 17145)
-- Name: lich_hoc lich_hoc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lich_hoc
    ADD CONSTRAINT lich_hoc_pkey PRIMARY KEY (id);


--
-- TOC entry 5020 (class 2606 OID 16995)
-- Name: lich_su_diem_ren_luyen lich_su_diem_ren_luyen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lich_su_diem_ren_luyen
    ADD CONSTRAINT lich_su_diem_ren_luyen_pkey PRIMARY KEY (id);


--
-- TOC entry 4996 (class 2606 OID 16813)
-- Name: lop_hoc_phan lop_hoc_phan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lop_hoc_phan
    ADD CONSTRAINT lop_hoc_phan_pkey PRIMARY KEY (id);


--
-- TOC entry 4982 (class 2606 OID 16762)
-- Name: nguoi_dung nguoi_dung_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nguoi_dung
    ADD CONSTRAINT nguoi_dung_email_key UNIQUE (email);


--
-- TOC entry 4984 (class 2606 OID 16760)
-- Name: nguoi_dung nguoi_dung_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nguoi_dung
    ADD CONSTRAINT nguoi_dung_pkey PRIMARY KEY (id);


--
-- TOC entry 5010 (class 2606 OID 16908)
-- Name: nop_bai nop_bai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nop_bai
    ADD CONSTRAINT nop_bai_pkey PRIMARY KEY (id);


--
-- TOC entry 5014 (class 2606 OID 16940)
-- Name: phan_cong_giang_day phan_cong_giang_day_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phan_cong_giang_day
    ADD CONSTRAINT phan_cong_giang_day_pkey PRIMARY KEY (id);


--
-- TOC entry 5004 (class 2606 OID 16863)
-- Name: phien_diem_danh phien_diem_danh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phien_diem_danh
    ADD CONSTRAINT phien_diem_danh_pkey PRIMARY KEY (id);


--
-- TOC entry 4986 (class 2606 OID 16779)
-- Name: sinh_vien sinh_vien_ma_qr_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinh_vien
    ADD CONSTRAINT sinh_vien_ma_qr_key UNIQUE (ma_qr);


--
-- TOC entry 4988 (class 2606 OID 16777)
-- Name: sinh_vien sinh_vien_mssv_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinh_vien
    ADD CONSTRAINT sinh_vien_mssv_key UNIQUE (mssv);


--
-- TOC entry 4990 (class 2606 OID 16775)
-- Name: sinh_vien sinh_vien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinh_vien
    ADD CONSTRAINT sinh_vien_pkey PRIMARY KEY (id);


--
-- TOC entry 5016 (class 2606 OID 16960)
-- Name: su_kien su_kien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.su_kien
    ADD CONSTRAINT su_kien_pkey PRIMARY KEY (id);


--
-- TOC entry 5024 (class 2606 OID 17168)
-- Name: thanh_toan thanh_toan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thanh_toan
    ADD CONSTRAINT thanh_toan_pkey PRIMARY KEY (id);


--
-- TOC entry 5000 (class 2606 OID 17154)
-- Name: dang_ky_hoc unique_dang_ky; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dang_ky_hoc
    ADD CONSTRAINT unique_dang_ky UNIQUE (sinh_vien_id, lop_hoc_phan_id);


--
-- TOC entry 4978 (class 2606 OID 16748)
-- Name: vai_tro vai_tro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vai_tro
    ADD CONSTRAINT vai_tro_pkey PRIMARY KEY (id);


--
-- TOC entry 4980 (class 2606 OID 16750)
-- Name: vai_tro vai_tro_ten_vai_tro_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vai_tro
    ADD CONSTRAINT vai_tro_ten_vai_tro_key UNIQUE (ten_vai_tro);


--
-- TOC entry 5036 (class 2606 OID 17008)
-- Name: bai_tap bai_tap_giang_vien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bai_tap
    ADD CONSTRAINT bai_tap_giang_vien_id_fkey FOREIGN KEY (giang_vien_id) REFERENCES public.giang_vien(id);


--
-- TOC entry 5037 (class 2606 OID 16896)
-- Name: bai_tap bai_tap_lop_hoc_phan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bai_tap
    ADD CONSTRAINT bai_tap_lop_hoc_phan_id_fkey FOREIGN KEY (lop_hoc_phan_id) REFERENCES public.lop_hoc_phan(id);


--
-- TOC entry 5032 (class 2606 OID 16851)
-- Name: buoi_hoc buoi_hoc_lop_hoc_phan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buoi_hoc
    ADD CONSTRAINT buoi_hoc_lop_hoc_phan_id_fkey FOREIGN KEY (lop_hoc_phan_id) REFERENCES public.lop_hoc_phan(id);


--
-- TOC entry 5030 (class 2606 OID 16838)
-- Name: dang_ky_hoc dang_ky_hoc_lop_hoc_phan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dang_ky_hoc
    ADD CONSTRAINT dang_ky_hoc_lop_hoc_phan_id_fkey FOREIGN KEY (lop_hoc_phan_id) REFERENCES public.lop_hoc_phan(id);


--
-- TOC entry 5031 (class 2606 OID 16833)
-- Name: dang_ky_hoc dang_ky_hoc_sinh_vien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dang_ky_hoc
    ADD CONSTRAINT dang_ky_hoc_sinh_vien_id_fkey FOREIGN KEY (sinh_vien_id) REFERENCES public.sinh_vien(id);


--
-- TOC entry 5044 (class 2606 OID 16980)
-- Name: dang_ky_su_kien dang_ky_su_kien_sinh_vien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dang_ky_su_kien
    ADD CONSTRAINT dang_ky_su_kien_sinh_vien_id_fkey FOREIGN KEY (sinh_vien_id) REFERENCES public.sinh_vien(id);


--
-- TOC entry 5045 (class 2606 OID 16975)
-- Name: dang_ky_su_kien dang_ky_su_kien_su_kien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dang_ky_su_kien
    ADD CONSTRAINT dang_ky_su_kien_su_kien_id_fkey FOREIGN KEY (su_kien_id) REFERENCES public.su_kien(id);


--
-- TOC entry 5034 (class 2606 OID 16878)
-- Name: diem_danh diem_danh_buoi_hoc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diem_danh
    ADD CONSTRAINT diem_danh_buoi_hoc_id_fkey FOREIGN KEY (buoi_hoc_id) REFERENCES public.buoi_hoc(id);


--
-- TOC entry 5035 (class 2606 OID 16883)
-- Name: diem_danh diem_danh_sinh_vien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diem_danh
    ADD CONSTRAINT diem_danh_sinh_vien_id_fkey FOREIGN KEY (sinh_vien_id) REFERENCES public.sinh_vien(id);


--
-- TOC entry 5040 (class 2606 OID 16928)
-- Name: diem_ren_luyen diem_ren_luyen_sinh_vien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diem_ren_luyen
    ADD CONSTRAINT diem_ren_luyen_sinh_vien_id_fkey FOREIGN KEY (sinh_vien_id) REFERENCES public.sinh_vien(id);


--
-- TOC entry 5049 (class 2606 OID 17174)
-- Name: thanh_toan fk_tt_lhp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thanh_toan
    ADD CONSTRAINT fk_tt_lhp FOREIGN KEY (lop_hoc_phan_id) REFERENCES public.lop_hoc_phan(id);


--
-- TOC entry 5050 (class 2606 OID 17169)
-- Name: thanh_toan fk_tt_sv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thanh_toan
    ADD CONSTRAINT fk_tt_sv FOREIGN KEY (sinh_vien_id) REFERENCES public.sinh_vien(id);


--
-- TOC entry 5027 (class 2606 OID 16793)
-- Name: giang_vien giang_vien_nguoi_dung_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giang_vien
    ADD CONSTRAINT giang_vien_nguoi_dung_id_fkey FOREIGN KEY (nguoi_dung_id) REFERENCES public.nguoi_dung(id);


--
-- TOC entry 5048 (class 2606 OID 17146)
-- Name: lich_hoc lich_hoc_lop_hoc_phan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lich_hoc
    ADD CONSTRAINT lich_hoc_lop_hoc_phan_id_fkey FOREIGN KEY (lop_hoc_phan_id) REFERENCES public.lop_hoc_phan(id);


--
-- TOC entry 5046 (class 2606 OID 17001)
-- Name: lich_su_diem_ren_luyen lich_su_diem_ren_luyen_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lich_su_diem_ren_luyen
    ADD CONSTRAINT lich_su_diem_ren_luyen_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.nguoi_dung(id);


--
-- TOC entry 5047 (class 2606 OID 16996)
-- Name: lich_su_diem_ren_luyen lich_su_diem_ren_luyen_sinh_vien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lich_su_diem_ren_luyen
    ADD CONSTRAINT lich_su_diem_ren_luyen_sinh_vien_id_fkey FOREIGN KEY (sinh_vien_id) REFERENCES public.sinh_vien(id);


--
-- TOC entry 5028 (class 2606 OID 16819)
-- Name: lop_hoc_phan lop_hoc_phan_giang_vien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lop_hoc_phan
    ADD CONSTRAINT lop_hoc_phan_giang_vien_id_fkey FOREIGN KEY (giang_vien_id) REFERENCES public.giang_vien(id);


--
-- TOC entry 5029 (class 2606 OID 16814)
-- Name: lop_hoc_phan lop_hoc_phan_hoc_phan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lop_hoc_phan
    ADD CONSTRAINT lop_hoc_phan_hoc_phan_id_fkey FOREIGN KEY (hoc_phan_id) REFERENCES public.hoc_phan(id);


--
-- TOC entry 5025 (class 2606 OID 16763)
-- Name: nguoi_dung nguoi_dung_vai_tro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nguoi_dung
    ADD CONSTRAINT nguoi_dung_vai_tro_id_fkey FOREIGN KEY (vai_tro_id) REFERENCES public.vai_tro(id);


--
-- TOC entry 5038 (class 2606 OID 16909)
-- Name: nop_bai nop_bai_bai_tap_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nop_bai
    ADD CONSTRAINT nop_bai_bai_tap_id_fkey FOREIGN KEY (bai_tap_id) REFERENCES public.bai_tap(id);


--
-- TOC entry 5039 (class 2606 OID 16914)
-- Name: nop_bai nop_bai_sinh_vien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nop_bai
    ADD CONSTRAINT nop_bai_sinh_vien_id_fkey FOREIGN KEY (sinh_vien_id) REFERENCES public.sinh_vien(id);


--
-- TOC entry 5041 (class 2606 OID 16941)
-- Name: phan_cong_giang_day phan_cong_giang_day_giang_vien_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phan_cong_giang_day
    ADD CONSTRAINT phan_cong_giang_day_giang_vien_id_fkey FOREIGN KEY (giang_vien_id) REFERENCES public.giang_vien(id);


--
-- TOC entry 5042 (class 2606 OID 16946)
-- Name: phan_cong_giang_day phan_cong_giang_day_lop_hoc_phan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phan_cong_giang_day
    ADD CONSTRAINT phan_cong_giang_day_lop_hoc_phan_id_fkey FOREIGN KEY (lop_hoc_phan_id) REFERENCES public.lop_hoc_phan(id);


--
-- TOC entry 5033 (class 2606 OID 16864)
-- Name: phien_diem_danh phien_diem_danh_buoi_hoc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phien_diem_danh
    ADD CONSTRAINT phien_diem_danh_buoi_hoc_id_fkey FOREIGN KEY (buoi_hoc_id) REFERENCES public.buoi_hoc(id);


--
-- TOC entry 5026 (class 2606 OID 16780)
-- Name: sinh_vien sinh_vien_nguoi_dung_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinh_vien
    ADD CONSTRAINT sinh_vien_nguoi_dung_id_fkey FOREIGN KEY (nguoi_dung_id) REFERENCES public.nguoi_dung(id);


--
-- TOC entry 5043 (class 2606 OID 16961)
-- Name: su_kien su_kien_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.su_kien
    ADD CONSTRAINT su_kien_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.nguoi_dung(id);


-- Completed on 2026-03-24 12:44:59

--
-- PostgreSQL database dump complete
--

\unrestrict gPdmvOnvaRhJEwNvN1SQLix8PdrsTx9j9lxAHupheneDef8WqjZE3S6MAj2awj7

