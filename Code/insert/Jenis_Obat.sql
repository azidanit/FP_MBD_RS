create table JENIS_OBAT 
(
   ID_JENIS_OBAT        VARCHAR2(5)          not null,
   JENIS_OBAT           VARCHAR2(50),
   constraint PK_JENIS_OBAT primary key (ID_JENIS_OBAT)
);

INSERT INTO JENIS_OBAT (ID_JENIS_OBAT,JENIS_OBAT) Values ('JO001','Injeksi(Suntik)');
INSERT INTO JENIS_OBAT (ID_JENIS_OBAT,JENIS_OBAT) Values ('JO002','Tablet');
INSERT INTO JENIS_OBAT (ID_JENIS_OBAT,JENIS_OBAT) Values ('JO003','Cair');
INSERT INTO JENIS_OBAT (ID_JENIS_OBAT,JENIS_OBAT) Values ('JO004','Pil');
INSERT INTO JENIS_OBAT (ID_JENIS_OBAT,JENIS_OBAT) Values ('JO005','Serbuk');