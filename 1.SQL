--- Soal no 1 ---
--Tabel induk yang saya pilih adalah tabel mahasiswa, dan tabel ruang
--Tabel transaksi/anak yang saya pilih adalah tabel pengajuan_ruang

--Tabel mahasiswa(induk)
CREATE TABLE mahasiswa (
  nim             VARCHAR(15)  NOT NULL,
  nama_mahasiswa  VARCHAR(100) NOT NULL,
  kelas           VARCHAR(10)  NULL,
  CONSTRAINT pk_mahasiswa PRIMARY KEY (nim)
) ENGINE=InnoDB;

--Tabel ruang(induk)
CREATE TABLE ruang (
  no_ruang     VARCHAR(10) NOT NULL,
  id_lokasi    VARCHAR(10) NOT NULL,
  CONSTRAINT pk_ruang PRIMARY KEY (no_ruang)
) ENGINE=InnoDB;

--Tabel pengajuan_ruang(anak/transaksi)
CREATE TABLE pengajuan_ruang (
  nomor_pengajuan     VARCHAR(20)  NOT NULL,
  nim                 VARCHAR(15)  NOT NULL,
  no_ruang            VARCHAR(10)  NOT NULL,
  id_admin            VARCHAR(10)  NULL,
  tanggal_penggunaan  DATE         NOT NULL,
  jam_mulai           TIME         NOT NULL,
  jam_selesai         TIME         NOT NULL,
  tujuan_penggunaan   VARCHAR(150) NOT NULL,
  status_pengajuan    VARCHAR(12)  NOT NULL DEFAULT 'Menunggu',
  alasan              VARCHAR(150) NULL,
  CONSTRAINT pk_pengajuan_ruang PRIMARY KEY (nomor_pengajuan),
  CONSTRAINT ck_pengajuan_waktu  CHECK (jam_selesai > jam_mulai),
  CONSTRAINT ck_pengajuan_status CHECK (status_pengajuan IN
    ('Menunggu', 'Disetujui', 'Ditolak', 'Dibatalkan')),
  CONSTRAINT fk_pengajuan_mahasiswa FOREIGN KEY (nim)
    REFERENCES mahasiswa (nim)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_pengajuan_ruang FOREIGN KEY (no_ruang)
    REFERENCES ruang (no_ruang)
    ON UPDATE CASCADE ON DELETE RESTRICT,
) ENGINE=InnoDB;
