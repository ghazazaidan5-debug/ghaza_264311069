-- ============================================================
-- A. ALASAN BISNIS
-- ============================================================
--
-- Sistem reservasi ruang kampus digunakan untuk mengelola
-- pengajuan penggunaan ruang oleh mahasiswa.
-- Sistem perlu menyimpan data mahasiswa, ruang, lokasi kampus,
-- admin lokasi, pengajuan ruang, dan keputusan pengajuan.
--
-- Data lokasi kampus dikelola secara terpusat agar setiap ruang
-- dan admin terhubung dengan lokasi yang sesuai.
-- Data pengajuan menyimpan tanggal penggunaan, jam mulai,
-- jam selesai, tujuan penggunaan, status pengajuan, dan alasan.
--
-- Entitas Keputusan_Pengajuan digunakan untuk mencatat hasil
-- keputusan admin terhadap pengajuan ruang. Jika sistem perlu
-- menyimpan riwayat keputusan, satu pengajuan dapat memiliki
-- lebih dari satu catatan keputusan.

-- tabel keputusan_pengajuan
CREATE TABLE keputusan_pengajuan (
    id_keputusan INT AUTO_INCREMENT PRIMARY KEY,
    nomor_pengajuan VARCHAR(20) NOT NULL,
    id_admin VARCHAR(10) NOT NULL,
    keputusan VARCHAR(12) NOT NULL,
    waktu_keputusan DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    catatan VARCHAR(150) NULL,

    CONSTRAINT fk_keputusan_pengajuan
        FOREIGN KEY (nomor_pengajuan)
        REFERENCES pengajuan_ruang(nomor_pengajuan)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_keputusan_admin
        FOREIGN KEY (id_admin)
        REFERENCES admin_lokasi(id_admin)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_keputusan
        CHECK (keputusan IN ('Disetujui', 'Ditolak'))
);
