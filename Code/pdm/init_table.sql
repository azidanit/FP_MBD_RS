/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     20/05/2020 21:32:49                          */
/*==============================================================*/


alter table BARANG_TITIPAN
   drop constraint FK_BARANG_T_DIANTAR_PENGANTA;

alter table DOKTER
   drop constraint FK_DOKTER_DINAUNGI_KLINIK;

alter table KAMAR
   drop constraint FK_KAMAR_MENGURUS_ROBOT;

alter table KAMAR
   drop constraint FK_KAMAR_MERAWAT_PERAWAT;

alter table MEMBERI
   drop constraint FK_MEMBERI_MEMBERI_PERAWATA;

alter table MEMBERI
   drop constraint FK_MEMBERI_MEMBERI2_OBAT;

alter table OBAT
   drop constraint FK_OBAT_BERJENIS_JENIS_OB;

alter table OBAT_DIANTAR
   drop constraint FK_OBAT_DIA_OBAT_DIAN_OBAT;

alter table OBAT_DIANTAR
   drop constraint FK_OBAT_DIA_OBAT_DIAN_PENGANTA;

alter table PENGANTARAN
   drop constraint FK_PENGANTA_DIANTAR_O_ROBOT;

alter table PENGANTARAN
   drop constraint FK_PENGANTA_MENGANTAR_PASIEN;

alter table PERAWATAN
   drop constraint FK_PERAWATA_DIKAMAR_KAMAR;

alter table PERAWATAN
   drop constraint FK_PERAWATA_DIRAWAT_PASIEN;

alter table PERAWATAN
   drop constraint FK_PERAWATA_MENANGANI_DOKTER;

alter table REKAM_MEDIS
   drop constraint FK_REKAM_ME_DITANGANI_DOKTER;

alter table REKAM_MEDIS
   drop constraint FK_REKAM_ME_MEMPUNYAI_PASIEN;

alter table RESEP_OBAT
   drop constraint FK_RESEP_OB_RESEP_OBA_REKAM_ME;

alter table RESEP_OBAT
   drop constraint FK_RESEP_OB_RESEP_OBA_OBAT;

drop index DIANTAR_FK;

drop table BARANG_TITIPAN cascade constraints;

drop index DINAUNGI_FK;

drop table DOKTER cascade constraints;

drop table JENIS_OBAT cascade constraints;

drop index MENGURUS_FK;

drop index MERAWAT_FK;

drop table KAMAR cascade constraints;

drop table KLINIK cascade constraints;

drop index MEMBERI2_FK;

drop index MEMBERI_FK;

drop table MEMBERI cascade constraints;

drop index BERJENIS_FK;

drop table OBAT cascade constraints;

drop index OBAT_DIANTAR2_FK;

drop index OBAT_DIANTAR_FK;

drop table OBAT_DIANTAR cascade constraints;

drop table PASIEN cascade constraints;

drop index DIANTAR_OLEH__FK;

drop index MENGANTAR_BARANG_FK;

drop table PENGANTARAN cascade constraints;

drop table PERAWAT cascade constraints;

drop index MENANGANI_FK;

drop index DIKAMAR_FK;

drop index DIRAWAT_FK;

drop table PERAWATAN cascade constraints;

drop index DITANGANI_FK;

drop index MEMPUNYAI_FK;

drop table REKAM_MEDIS cascade constraints;

drop index RESEP_OBAT2_FK;

drop index RESEP_OBAT_FK;

drop table RESEP_OBAT cascade constraints;

drop table ROBOT cascade constraints;

/*==============================================================*/
/* Table: BARANG_TITIPAN                                        */
/*==============================================================*/
create table BARANG_TITIPAN 
(
   ID_BARANG            VARCHAR2(5)          not null,
   ID_PENGANTARAN       VARCHAR2(5)          not null,
   NAMA_PENGIRIM        VARCHAR2(50),
   DESKRIPSI_BARANG     VARCHAR2(250),
   TGL_PENITIPAN        DATE,
   constraint PK_BARANG_TITIPAN primary key (ID_BARANG)
);

/*==============================================================*/
/* Index: DIANTAR_FK                                            */
/*==============================================================*/
create index DIANTAR_FK on BARANG_TITIPAN (
   ID_PENGANTARAN ASC
);

/*==============================================================*/
/* Table: DOKTER                                                */
/*==============================================================*/
create table DOKTER 
(
   ID_DOKTER            VARCHAR2(5)          not null,
   ID_KLINIK            VARCHAR2(5),
   NAMA_DOKTER          VARCHAR2(100),
   TGL_LAHIR_DOKTER     DATE,
   GENDER_DOKTER        CHAR(1),
   constraint PK_DOKTER primary key (ID_DOKTER)
);

/*==============================================================*/
/* Index: DINAUNGI_FK                                           */
/*==============================================================*/
create index DINAUNGI_FK on DOKTER (
   ID_KLINIK ASC
);

/*==============================================================*/
/* Table: JENIS_OBAT                                            */
/*==============================================================*/
create table JENIS_OBAT 
(
   ID_JENIS_OBAT        VARCHAR2(5)          not null,
   JENIS_OBAT           VARCHAR2(50),
   constraint PK_JENIS_OBAT primary key (ID_JENIS_OBAT)
);

/*==============================================================*/
/* Table: KAMAR                                                 */
/*==============================================================*/
create table KAMAR 
(
   ID_KAMAR             VARCHAR2(5)          not null,
   ID_PERAWAT           VARCHAR2(5),
   ID_ROBOT             VARCHAR2(5),
   STATUS_KAMAR         VARCHAR2(40),
   JUMLAH_PENGHUNI_KAMAR SMALLINT,
   constraint PK_KAMAR primary key (ID_KAMAR)
);

/*==============================================================*/
/* Index: MERAWAT_FK                                            */
/*==============================================================*/
create index MERAWAT_FK on KAMAR (
   ID_PERAWAT ASC
);

/*==============================================================*/
/* Index: MENGURUS_FK                                           */
/*==============================================================*/
create index MENGURUS_FK on KAMAR (
   ID_ROBOT ASC
);

/*==============================================================*/
/* Table: KLINIK                                                */
/*==============================================================*/
create table KLINIK 
(
   ID_KLINIK            VARCHAR2(5)          not null,
   NAMA_KLINK           VARCHAR2(50),
   constraint PK_KLINIK primary key (ID_KLINIK)
);

/*==============================================================*/
/* Table: MEMBERI                                               */
/*==============================================================*/
create table MEMBERI 
(
   ID_PERAWATAN         VARCHAR2(5)          not null,
   ID_OBAT              VARCHAR2(5)          not null,
   constraint PK_MEMBERI primary key (ID_PERAWATAN, ID_OBAT)
);

/*==============================================================*/
/* Index: MEMBERI_FK                                            */
/*==============================================================*/
create index MEMBERI_FK on MEMBERI (
   ID_PERAWATAN ASC
);

/*==============================================================*/
/* Index: MEMBERI2_FK                                           */
/*==============================================================*/
create index MEMBERI2_FK on MEMBERI (
   ID_OBAT ASC
);

/*==============================================================*/
/* Table: OBAT                                                  */
/*==============================================================*/
create table OBAT 
(
   ID_OBAT              VARCHAR2(5)          not null,
   ID_JENIS_OBAT        VARCHAR2(5)          not null,
   DESKRIPSI_OBAT       VARCHAR2(250),
   STOK_OBAT            INTEGER,
   NAMA_OBAT            VARCHAR2(100),
   constraint PK_OBAT primary key (ID_OBAT)
);

/*==============================================================*/
/* Index: BERJENIS_FK                                           */
/*==============================================================*/
create index BERJENIS_FK on OBAT (
   ID_JENIS_OBAT ASC
);

/*==============================================================*/
/* Table: OBAT_DIANTAR                                          */
/*==============================================================*/
create table OBAT_DIANTAR 
(
   ID_OBAT              VARCHAR2(5)          not null,
   ID_PENGANTARAN       VARCHAR2(5)          not null,
   constraint PK_OBAT_DIANTAR primary key (ID_OBAT, ID_PENGANTARAN)
);

/*==============================================================*/
/* Index: OBAT_DIANTAR_FK                                       */
/*==============================================================*/
create index OBAT_DIANTAR_FK on OBAT_DIANTAR (
   ID_OBAT ASC
);

/*==============================================================*/
/* Index: OBAT_DIANTAR2_FK                                      */
/*==============================================================*/
create index OBAT_DIANTAR2_FK on OBAT_DIANTAR (
   ID_PENGANTARAN ASC
);

/*==============================================================*/
/* Table: PASIEN                                                */
/*==============================================================*/
create table PASIEN 
(
   ID_PASIEN            VARCHAR2(5)          not null,
   NAMA_PASIEN          VARCHAR2(60),
   STATUS               VARCHAR2(20),
   TGL_LAHIR_PASIEN     DATE,
   GENDER_PASIEN        CHAR(1),
   constraint PK_PASIEN primary key (ID_PASIEN)
);

/*==============================================================*/
/* Table: PENGANTARAN                                           */
/*==============================================================*/
create table PENGANTARAN 
(
   ID_PENGANTARAN       VARCHAR2(5)          not null,
   ID_PASIEN            VARCHAR2(5)          not null,
   ID_ROBOT             VARCHAR2(5)          not null,
   constraint PK_PENGANTARAN primary key (ID_PENGANTARAN)
);

/*==============================================================*/
/* Index: MENGANTAR_BARANG_FK                                   */
/*==============================================================*/
create index MENGANTAR_BARANG_FK on PENGANTARAN (
   ID_PASIEN ASC
);

/*==============================================================*/
/* Index: DIANTAR_OLEH__FK                                      */
/*==============================================================*/
create index DIANTAR_OLEH__FK on PENGANTARAN (
   ID_ROBOT ASC
);

/*==============================================================*/
/* Table: PERAWAT                                               */
/*==============================================================*/
create table PERAWAT 
(
   ID_PERAWAT           VARCHAR2(5)          not null,
   GENDER_PERAWAT       CHAR(1),
   TGL_LAHIR_PERAWAT    DATE,
   NAMA_PERAWAT         VARCHAR2(100),
   constraint PK_PERAWAT primary key (ID_PERAWAT)
);

/*==============================================================*/
/* Table: PERAWATAN                                             */
/*==============================================================*/
create table PERAWATAN 
(
   ID_PERAWATAN         VARCHAR2(5)          not null,
   ID_DOKTER            VARCHAR2(5),
   ID_PASIEN            VARCHAR2(5)          not null,
   ID_KAMAR             VARCHAR2(5),
   PENYAKIT             VARCHAR2(1024),
   CHECK_IN             DATE,
   CHECK_OUT            DATE,
   constraint PK_PERAWATAN primary key (ID_PERAWATAN)
);

/*==============================================================*/
/* Index: DIRAWAT_FK                                            */
/*==============================================================*/
create index DIRAWAT_FK on PERAWATAN (
   ID_PASIEN ASC
);

/*==============================================================*/
/* Index: DIKAMAR_FK                                            */
/*==============================================================*/
create index DIKAMAR_FK on PERAWATAN (
   ID_KAMAR ASC
);

/*==============================================================*/
/* Index: MENANGANI_FK                                          */
/*==============================================================*/
create index MENANGANI_FK on PERAWATAN (
   ID_DOKTER ASC
);

/*==============================================================*/
/* Table: REKAM_MEDIS                                           */
/*==============================================================*/
create table REKAM_MEDIS 
(
   ID_REKAM_MEDIS       VARCHAR2(5)          not null,
   ID_DOKTER            VARCHAR2(5)          not null,
   ID_PASIEN            VARCHAR2(5)          not null,
   TGL_REKAM_MEDIS      DATE,
   KET_REKAM_MEDIS      CLOB,
   TINDAKAN_REKAM_MEDIS CLOB,
   PENYAKIT_REKAM_MEDIS CLOB,
   constraint PK_REKAM_MEDIS primary key (ID_REKAM_MEDIS)
);

/*==============================================================*/
/* Index: MEMPUNYAI_FK                                          */
/*==============================================================*/
create index MEMPUNYAI_FK on REKAM_MEDIS (
   ID_PASIEN ASC
);

/*==============================================================*/
/* Index: DITANGANI_FK                                          */
/*==============================================================*/
create index DITANGANI_FK on REKAM_MEDIS (
   ID_DOKTER ASC
);

/*==============================================================*/
/* Table: RESEP_OBAT                                            */
/*==============================================================*/
create table RESEP_OBAT 
(
   ID_REKAM_MEDIS       VARCHAR2(5)          not null,
   ID_OBAT              VARCHAR2(5)          not null,
   constraint PK_RESEP_OBAT primary key (ID_REKAM_MEDIS, ID_OBAT)
);

/*==============================================================*/
/* Index: RESEP_OBAT_FK                                         */
/*==============================================================*/
create index RESEP_OBAT_FK on RESEP_OBAT (
   ID_REKAM_MEDIS ASC
);

/*==============================================================*/
/* Index: RESEP_OBAT2_FK                                        */
/*==============================================================*/
create index RESEP_OBAT2_FK on RESEP_OBAT (
   ID_OBAT ASC
);

/*==============================================================*/
/* Table: ROBOT                                                 */
/*==============================================================*/
create table ROBOT 
(
   ID_ROBOT             VARCHAR2(5)          not null,
   SN_ROBOT             CHAR(20),
   status_robot         VARCHAR2(25),
   constraint PK_ROBOT primary key (ID_ROBOT)
);

alter table BARANG_TITIPAN
   add constraint FK_BARANG_T_DIANTAR_PENGANTA foreign key (ID_PENGANTARAN)
      references PENGANTARAN (ID_PENGANTARAN);

alter table DOKTER
   add constraint FK_DOKTER_DINAUNGI_KLINIK foreign key (ID_KLINIK)
      references KLINIK (ID_KLINIK);

alter table KAMAR
   add constraint FK_KAMAR_MENGURUS_ROBOT foreign key (ID_ROBOT)
      references ROBOT (ID_ROBOT);

alter table KAMAR
   add constraint FK_KAMAR_MERAWAT_PERAWAT foreign key (ID_PERAWAT)
      references PERAWAT (ID_PERAWAT);

alter table MEMBERI
   add constraint FK_MEMBERI_MEMBERI_PERAWATA foreign key (ID_PERAWATAN)
      references PERAWATAN (ID_PERAWATAN);

alter table MEMBERI
   add constraint FK_MEMBERI_MEMBERI2_OBAT foreign key (ID_OBAT)
      references OBAT (ID_OBAT);

alter table OBAT
   add constraint FK_OBAT_BERJENIS_JENIS_OB foreign key (ID_JENIS_OBAT)
      references JENIS_OBAT (ID_JENIS_OBAT);

alter table OBAT_DIANTAR
   add constraint FK_OBAT_DIA_OBAT_DIAN_OBAT foreign key (ID_OBAT)
      references OBAT (ID_OBAT);

alter table OBAT_DIANTAR
   add constraint FK_OBAT_DIA_OBAT_DIAN_PENGANTA foreign key (ID_PENGANTARAN)
      references PENGANTARAN (ID_PENGANTARAN);

alter table PENGANTARAN
   add constraint FK_PENGANTA_DIANTAR_O_ROBOT foreign key (ID_ROBOT)
      references ROBOT (ID_ROBOT);

alter table PENGANTARAN
   add constraint FK_PENGANTA_MENGANTAR_PASIEN foreign key (ID_PASIEN)
      references PASIEN (ID_PASIEN);

alter table PERAWATAN
   add constraint FK_PERAWATA_DIKAMAR_KAMAR foreign key (ID_KAMAR)
      references KAMAR (ID_KAMAR);

alter table PERAWATAN
   add constraint FK_PERAWATA_DIRAWAT_PASIEN foreign key (ID_PASIEN)
      references PASIEN (ID_PASIEN);

alter table PERAWATAN
   add constraint FK_PERAWATA_MENANGANI_DOKTER foreign key (ID_DOKTER)
      references DOKTER (ID_DOKTER);

alter table REKAM_MEDIS
   add constraint FK_REKAM_ME_DITANGANI_DOKTER foreign key (ID_DOKTER)
      references DOKTER (ID_DOKTER);

alter table REKAM_MEDIS
   add constraint FK_REKAM_ME_MEMPUNYAI_PASIEN foreign key (ID_PASIEN)
      references PASIEN (ID_PASIEN);

alter table RESEP_OBAT
   add constraint FK_RESEP_OB_RESEP_OBA_REKAM_ME foreign key (ID_REKAM_MEDIS)
      references REKAM_MEDIS (ID_REKAM_MEDIS);

alter table RESEP_OBAT
   add constraint FK_RESEP_OB_RESEP_OBA_OBAT foreign key (ID_OBAT)
      references OBAT (ID_OBAT);

