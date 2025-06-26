 1. Di RStudio (menggunakan R)
- Cara Kerja Singkat Script-nya
a.  Muat data dari file CSV.
b. Hapus kolom yang bocorleakage (leak_col_good dan leak_col_subtle).
c. Bangun model regresi logistik untuk memprediksi default.
d. Tes performa model dengan Hosmer-Lemeshow test.
e. Prediksi probabilitas dan buat calibration plot untuk melihat ketepatan prediksi.
f. Tentukan cutoff agar proporsi default di bawah 5%.

- Cara Menjalankan di RStudio
Buka RStudio.

Buat folder credit_score_project.

Taruh file credit_scoring.csv ke dalam subfolder data.

Buat file skrip baru modeling_credit.R, lalu copy-paste kode R yang sudah dijelaskan.

Klik tombol Source (di kanan atas script) atau tekan Ctrl + Shift + Enter.

Hasil grafik akan disimpan sebagai calibration_curve.png, dan cut-off score ditampilkan di konsol.

2.  Di Google Colab (menggunakan Python)
 Cara Kerja Singkat Script-nya
Impor data menggunakan pandas.

Hapus kolom yang bocor dari dataset.

Bangun model logistik dengan sklearn atau statsmodels.

Hitung probabilitas prediksi.

Plot calibration curve menggunakan matplotlib atau seaborn.

Hitung cutoff score supaya default tidak lebih dari 5%.

- Cara Menjalankan di Google Colab
Buka httpscolab.research.google.com.

Klik New Notebook.

Upload file credit_scoring.csv ke Colab lewat sidebar.

Masukkan kode Python ke dalam cell (atau buka file .ipynb Anda).

Tekan Shift + Enter untuk menjalankan per cell.

Grafik akan langsung muncul, dan cut-off score ditampilkan di output.