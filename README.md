# 🛒 Shopping Cart App

Aplikasi mobile Flutter untuk simulasi belanja online dengan fitur keranjang belanja, filter kategori, pencarian produk, dan proses checkout.

---

## 📱 Tampilan Aplikasi

### Halaman Produk
<img width="545" height="476" alt="halaman produk" src="https://github.com/user-attachments/assets/ba221617-7ff2-43e9-a99e-4fb3c0f0b7a7" />


### Halaman Keranjang
<img width="544" height="478" alt="halaman keranjang" src="https://github.com/user-attachments/assets/0cf0eaf3-25d6-48c8-861d-a58c56f2e5c3" />

### Halaman Checkout
<img width="545" height="478" alt="halaman cekout" src="https://github.com/user-attachments/assets/bcf63267-4324-4c59-8a0e-35239be861fa" />


---

## 📋 Deskripsi Aplikasi

**Shopping Cart App** adalah aplikasi simulasi toko online yang memungkinkan pengguna menjelajahi daftar produk, menambahkan produk ke keranjang, mengatur jumlah item, dan melakukan checkout dengan mengisi informasi pengiriman.

---

## ✨ Fitur Aplikasi

| Fitur | Keterangan |
|-------|-----------|
| 🔎 **Pencarian Produk** | Cari produk berdasarkan nama secara real-time |
| 🗂️ **Filter Kategori** | Filter produk berdasarkan kategori (All, Electronics, Accessories) |
| 🛍️ **Tambah ke Keranjang** | Tambah produk ke keranjang dengan notifikasi SnackBar |
| ➕➖ **Atur Jumlah** | Tambah atau kurangi jumlah item langsung dari keranjang |
| 🗑️ **Hapus Otomatis** | Item terhapus otomatis jika jumlah dikurangi hingga 0 |
| 💰 **Total Harga** | Total harga dihitung otomatis secara real-time |
| 📦 **Checkout** | Isi informasi pengiriman (nama, alamat, telepon) lalu buat pesanan |
| ✅ **Order Placed** | Keranjang dikosongkan otomatis setelah pesanan berhasil |

---

## 🧭 Navigasi Halaman

```
ProductListPage        → Halaman utama daftar produk
    └── CartPage       → Halaman keranjang belanja
            └── CheckoutPage   → Halaman checkout & pengiriman
```

---

## 🧩 Widget yang Digunakan

### Layout & Navigation
| Widget | Penggunaan |
|--------|-----------|
| `Scaffold` | Kerangka dasar setiap halaman |
| `AppBar` | Header dengan judul dan ikon keranjang |
| `Navigator.push` | Navigasi antar halaman |
| `Navigator.popUntil` | Kembali ke halaman utama setelah order |
| `Column` & `Row` | Layout vertikal & horizontal |
| `Expanded` | Flex layout untuk list |
| `ListView` & `ListView.builder` | Daftar item keranjang & checkout |
| `GridView.builder` | Grid produk 2 kolom |

### Input & Form
| Widget | Penggunaan |
|--------|-----------|
| `TextField` | Pencarian produk & form checkout (nama, alamat, telepon) |
| `TextEditingController` | Kontrol nilai input field |
| `DropdownButtonFormField` | Pilih kategori produk |

### Display
| Widget | Penggunaan |
|--------|-----------|
| `Card` | Kartu produk di grid |
| `ListTile` | Item di keranjang & ringkasan order |
| `Container` | Box styling area total harga |
| `Center` | Tampilan keranjang kosong |
| `Divider` | Pemisah antara item dan total di checkout |
| `Icon` | Ikon keranjang di AppBar |

### Aksi & Feedback
| Widget | Penggunaan |
|--------|-----------|
| `ElevatedButton` | Tombol Add, Checkout, Place Order |
| `IconButton` | Tombol ➕ ➖ di keranjang |
| `SnackBar` | Notifikasi produk ditambahkan & order berhasil |
| `ScaffoldMessenger` | Menampilkan SnackBar |
| `Consumer<CartModel>` | Reaktif terhadap perubahan keranjang |

### State Management
| Widget / Class | Penggunaan |
|--------|-----------|
| `ChangeNotifier` | Base class CartModel |
| `ChangeNotifierProvider` | Provide CartModel ke seluruh app |
| `context.watch<CartModel>()` | Rebuild UI saat keranjang berubah |
| `context.read<CartModel>()` | Aksi tanpa trigger rebuild |
| `StatefulWidget` | State lokal untuk search & filter kategori |
| `setState` | Update UI saat search/filter berubah |

---

## 📁 Struktur Proyek

```
lib/
├── main.dart                  # Entry point & setup Provider
├── models/
│   ├── product.dart           # Model: id, name, price, emoji, description, category
│   ├── cart_item.dart         # Model: product, quantity, totalPrice (getter)
│   └── cart_model.dart        # State management keranjang (ChangeNotifier)
└── pages/
    ├── product_list_page.dart # Grid produk + search + filter kategori
    ├── cart_page.dart         # Daftar item keranjang + total + tombol checkout
    └── checkout_page.dart     # Ringkasan order + form pengiriman + place order
```

---

## 🛒 Logika Keranjang (`CartModel`)

| Method | Fungsi |
|--------|--------|
| `addItem(product)` | Tambah produk atau increment quantity jika sudah ada |
| `removeItem(productId)` | Hapus produk dari keranjang |
| `increaseQuantity(productId)` | Tambah quantity +1 |
| `decreaseQuantity(productId)` | Kurangi quantity -1, hapus jika jadi 0 |
| `clear()` | Kosongkan seluruh keranjang |
| `totalPrice` | Getter: total harga semua item |
| `totalQuantity` | Getter: total jumlah item |
| `itemCount` | Getter: jumlah jenis produk |

> Menggunakan `Map<String, CartItem>` untuk lookup O(1) berdasarkan product ID.

---

## 📦 Daftar Produk

| Produk | Kategori | Harga |
|--------|----------|-------|
| 💻 Laptop Gaming | Electronics | Rp 15.000.000 |
| 📱 Smartphone Pro | Electronics | Rp 8.000.000 |
| 🎧 Wireless Headphones | Accessories | Rp 1.500.000 |
| ⌚ Smart Watch | Accessories | Rp 3.000.000 |
| 📷 Camera DSLR | Electronics | Rp 12.000.000 |
| 📟 Tablet Pro | Electronics | Rp 7.000.000 |

---

## 🚀 Cara Menjalankan

```bash
# Clone repository
git clone https://github.com/kksgaa/PAB_pertemuan_4.git
cd PAB_pertemuan_4

# Install dependencies
flutter pub get

# Jalankan aplikasi
flutter run
```
