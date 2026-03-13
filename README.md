# Tutorial 5 - Game Development
### Nayla Farah Nida [2306213426]

Control:
- Right Arrow: Player berjalan ke kanan.
- Left Arrow: Player berjalan ke kiri.
- Space Bar: Player melakukan 'attack'.

Object baru dengan animasi spritesheet:
- ```Player.tscn```: Saya menggunakan spritesheet pixel untuk Player yang berbeda dari tutorial sebelumnya.
- ```BookProjectile.tscn```: Objek buku sebagai proyektil ketika Player melakukan 'attack'.
- ```Shinobi.tscn```: Karakter idle menggunakan animasi spritesheet yang ditambahkan hanya sebagai objek untuk di hit :)

Penambahan Audio Efek Suara (SFX):
- ```Footstep```: Diputar ketika pemain berjalan. Suara dipicu pada frame tertentu dari animasi walk sehingga langkah kaki terdengar lebih natural.
- ```Throw```: Diputar ketika pemain melakukan serangan dan melempar buku.
- ```HitSound```: Diputar ketika BookProjectile mengenai objek Shinobi.

Penambahan Background Music:

Background music berasal dari objek ```Radio```. Radio menggunakan node AudioStreamPlayer2D untuk memutar musik. Musik tidak langsung menyala sejak awal permainan, tetapi baru akan diputar ketika radio terkena BookProjectile yang dilempar oleh pemain.

Implementasi Interaksi Objek dengan Pemain:

Player melempar BookProjectile ketika pemain menekan tombol serangan (spasi). BookProjectile dapat berinteraksi dengan objek lain, seperti:
- Radio: ketika terkena projectile, radio akan menyalakan musik.
- hinobi: ketika terkena projectile, objek akan bereaksi terhadap serangan tersebut.

Implementasi Audio Feedback dari Interaksi:
- Ketika pemain melempar buku, Throw SFX diputar.
- Ketika BookProjectile mengenai Shinobi, HitSound diputar.
- Ketika radio terkena projectile dan musik menyala, pemain mendapatkan feedback audio berupa background music yang mulai diputar.

Implementasi Audio yang Relatif terhadap Posisi Objek:

Sistem audio yang digunakan bersifat spatial (posisional) dengan menggunakan node AudioStreamPlayer2D pada musik yang diputar oleh objek Radio. Dengan sistem ini, volume suara akan bergantung pada jarak antara pemain dan sumber suara.

Referensi:
- [Godot 4 Animated Sprite Tutorial | 2D & 3D](https://youtu.be/tfdXgiMwUBw?si=kEczKK-YwCqzqjHd)
- [Kenney Assets](https://kenney.nl/assets)
- [Epidemic Sound](https://www.epidemicsound.com/sound-effects/)
- [Craftpix](https://craftpix.net/download/56976/)
