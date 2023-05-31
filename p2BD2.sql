create database dbPegawaii
use dbPegawaii


create table tbDivisi (kd_divisi varchar(5) primary key, nama_divisi varchar(20), lokasi varchar(20)) 

create table tbKaryawan (nip varchar(5) primary key, nama varchar(20), tgl_lahir date, kd_jenis char(1),
 kd_divisi varchar(5) references tbDivisi(kd_divisi), kd_status varchar(5))

 alter table tbKaryawan add gaji varchar(10)

 select * from tbDivisi
 select * from tbKaryawan

 insert into tbDivisi values('M0001', 'Gudang', 'Gedung A'),('M0024', 'Marketing', 'Gedung B'),('M0012', 'Humas', 'Gedung B'),('M0013', 'Accounting', 'Gedung A')

 insert into tbKaryawan values('P0011', 'Johan', '03/15/2001','L', 'M0001', 'B', 3500000),('P0009', 'Nicholas', '05/05/2003','L', 'M0001', 'B', 5200000),('P0008', 'Yenni', '11/02/1990','L', 'M0001', 'K', 5900000)


 select nip, nama, gaji, kd_jenis, year(getdate())- year(tgl_lahir) as umur from tbKaryawan where year(getdate())- year(tgl_lahir) < 25


 # download dulu dbmahasiswa p4, resto.re data.base

use dbmahasiswa

select * from tbmhs
Select * from tbmk
select * from tbtrans

insert into tbmhs values('2125240392','Panji','09/02/1999','L'), 
('2024241192','Lusia','02/11/2000','P'), ('2125250111','Reni','04/11/2001','P')

insert into tbmhs values('2024241192','Lusia','02/11/2000','P')

delete tbmhs where npm = '2125250111'

insert into tbmk values('if002', 'Basis Data II', 4), 
('if011', 'Kalkulus II', 2), ('if010', 'Algoritma', 2), ('if008', 'Matematika Diskrit', 4)

insert into tbtrans values('A0125', '2024241192', 'if008','B'),('A0126','2126250022','if010','A'),('A0127','2226250392','if011','B'),('A0128', '2126250022', 'if010', 'A') 
 


 select npm,nama,tgl_lahir, case when kd_jenis='P' 
 then 'Perempuan' else 'Laki-laki' end as jenis from tbmhs where  nama like '%o'


 select npm, nama, tgl_lahir, year(getdate())- year(tgl_lahir) as umur, case when kd_jenis='P' 
 then 'Perempuan' else 'Laki-laki' end as jenis  from tbmhs where year(getdate())- year(tgl_lahir) > 20 and kd_jenis ='L'


  update tbmhs set nama = 'Lusiana' where nama = 'Lusia'

 alter table tbmhs add jenis varchar(20)
  alter table tbmhs add jurusan varchar(20)

   update tbmhs set jenis = 'Laki-laki' where kd_jenis = 'L'
   update tbmhs set jenis = 'perempuan' where kd_jenis = 'P'

 alter table tbmhs add  umur int

 update tbmhs set umur = year(getdate())- year(tgl_lahir)

 alter table tbtrans add indeks int
 update tbtrans set indeks = 4 where nilai='A'
 update tbtrans set indeks = iif(nilai='B',3,iif(nilai='C',3,iif (nilai ='D',2,1)))


  # download dulu finansial p5, resto.re data.base

 use finansial
 select * from pelanggan

#1

alter table pelanggan add persenbunga float, angsuran float, tgl_tempo date

 #2
update pelanggan set persenbunga = iif(hutang >= 14000000,hutang*7/100,hutang*5/100)

#3
update pelanggan set angsuran = ((hutang + persenbunga)/24)

#4

update pelanggan set tgl_tempo = iif(hutang >= 14000000, '10/15/2019', '10/05/2019')


#finansial1 udah done semua untuk db finansial

select nama, 2000+left(npm,2) as kode_angkatan from tbmhs
select nama, 2000+left(npm,2) as kode_angkatan, 2000+left(npm,2) + 5 as thunlulus from tbmhs
select nama,right(npm,4) as No_urut from tbmhs

select * from tbmhs


update tbmhs set nama = upper(nama)

update tbmhs set nama = upper(left(nama,1)) + lower(substring(nama,2,Len(nama)))

select replicate('A', 5) as A, REPLICATE('B', 17) as B

select reverse('ramandamd') as backward

alter table tbmhs add tahun_lulus varchar(20), prodi varchar(20)



update tbmhs set prodi = iif(substring(npm,5,2)='24','sistem informasi',iif(substring(npm,5,2)='25','informatika',iif(substring(npm,5,2)='21',
'manajemen','bukan orang mdp'))),  tahun_lulus = 2000+substring(npm,3,2)


use kursus

select * from ajar

update ajar set angkatan = left(kode,3)

update ajar set angkatan = substring(kode,1,3)
update ajar set paket =iif(substring(kode,5,1)='A','Ms.Word', iif(substring (kode,5,1)='B', 'Ms.excel','Ms.powerpoint'))

update ajar set lama =iif(substring(kode,5,1)='A' or substring(kode,5,1)='B',2,1)


alter table ajar add tglMulai date, hariBljr varchar(20), jamBelajar varchar(20), tglSelesai date, total int

update ajar set ruang=iif(substring(kode,7,1)='A', '1',iif(substring(kode,7,1) = 'B', '2', '3'))

update ajar set tglMulai=iif(paket='Ms.Word','03/20/2023',iif(paket='Ms.excel','03/21/2023','03/27/2023'))


update ajar set hariBljr=iif(substring(kode,9,1)='A', 'Senin - Kamis',iif(substring(kode,9,1) = 'B', 'Selasa - Jumat', 'Rabu - Sabtu'))

update ajar set jamBelajar= iif(substring(kode,10,1)='1', '08.00 - 10.00',iif(substring(kode,10,1) = '2', '10.00 - 12.00', '13.00 - 15.00'))

update ajar set tglSelesai = dateadd(month, lama, tglMulai)

alter table ajar add biaya int

update ajar set biaya = iif(paket='Ms.Word'or paket='Ms.excel', 350000,300000)

update ajar set total = lama*biaya


CREATE database pegawaiSwasta

use  pegawaiSwasta

select * from pegawaiSwasta
create table karyawans (id int primary key, nama varchar(30),tgLahir date, salary int, department varchar(5),gender varchar(1), tmpLahir varchar(20))


insert into karyawans values('1','Ahmad Sofyan','01/01/1990',2250000,'IT','l','Bandung'),('2','Ismail Soleh','12/12/1986',5000000,'ACC','l','Pandeglang'),
('3','Ferry Subekti','06/06/1987',4500000,'HRD','p', 'Purwakarta'),('4','Iskiyati','07/07/1988',7500000,'FIN','p', 'Brebes'),
('5','Nurul Hikmah','08/08/1989',3750000,'FIN','p', 'Purwokerto'),('6','Riyanto','02/02/1983',4500000,'IT','l', 'Subang'),
('7','Azka Nurul','03/03/1984',5000000,'HRD','p', 'Bandung'),('8','Venny Maya','04/04/1989',7000000,'IT','p', 'Jakarta'),
('9','Anna Fauziyah','05/05/1989',3700000,'ACC','p', 'Bekasi'),('10','Arya Ardhi','09/09/1980',8000000,'FIN','l', 'Magelang')


truncate table karyawans            # Menghapus seluruh isi data tabel

#1
select sum(salary) as totalSalary from karyawans where department = 'IT' 

#2
select nama,department, case when gender = 'l' then 'lelaki' else 'perempuan' end as JenisKelamin from karyawans

#3
select count(nama) as banyak from karyawans where tmpLahir = 'Bandung' and department = 'IT'  


#4
select nama, salary, case when salary > 5000000 then (salary*0.1) else (salary*0.05) end as PPH from karyawans

#5
select nama, department, 
iif(department ='IT','Information Technology',iif(department = 'ACC','Accounting',iif(department='HRD','Human Resource','Finance'))) 
as Departemen from karyawans

#6
select count(gender) as Lelaki from karyawans where gender='l'
select count(gender) as Perempuan from karyawans where gender='p'


#7
select sum(salary) as totalSalary from karyawans where gender = 'p'

#8
select nama, tmpLahir, year(getdate())- year(tgLahir) as umur,
iif(department ='IT','Information Technology',iif(department = 'ACC','Accounting',iif(department='HRD','Human Resource','Finance'))) 
as department from karyawans

#9
select sum(salary) as totalSalary from karyawans where department='HRD'
select avg(salary) as totalSalary from karyawans where department='FIN'


#10
alter table karyawans add pph int

#11
update karyawans set pph = iif(salary >5000000,salary*0.1, salary*0.05)



use dbmahasiswa

select  tgl_lahir,datepart(week,tgl_lahir), datepart(weekday, tgl_lahir) from tbmhs

select datename(dw,'08/08/2004') as hariLahir

select datediff(year,'2023-05-07','2027-07-09')


select convert(datetime,'2026-10-04')


alter table tbmhs  add hari_lahir varchar(10), umur int , th_kuliah int , lama_kuliah int  

update  tbmhs set hari_lahir = datename(dw,tgl_lahir)

update tbmhs set umur =  year(getdate())- year(tgl_lahir)

update tbmhs set th_kuliah = 2000 + substring(npm,1,2)

update tbmhs set lama_kuliah = (2000 + substring(npm,3,2)) - th_kuliah

select * from tbmhs


create database kursus

use kursus


create table peserta ( nomor int  IDENTITY(1,1) PRIMARY KEY ,nama varchar(30), kodePaket varchar(15), tglDaftar date, tglMasuk date)


insert into peserta values('Yuliani', '243/A/B/A2', '09/12/2022', '10/15/2022')
insert into peserta values('Mathilda', '245/B/A/B1', '09/14/2022', '10/18/2022')
insert into peserta values('Johan', '244/C/B/C2', '09/14/2022', '10/17/2022')
insert into peserta values('Ramses', '245/B/A/B1', '09/16/2022', '10/18/2022')
insert into peserta values('Brontolaras', '243/A/B/A2', '09/18/2022', '10/15/2022')

select * from peserta

alter table peserta add angkatan varchar(10), paket varchar(27),biaya int, tgl_akhir date

update peserta set angkatan = substring(kodePaket, 1, 3)
update peserta set paket = iif(substring(kodePaket,5,1)='A', 'Microsoft Word',iif(substring(kodePaket,5,1)='B','Microsoft Excel','Microsoft Powerpoint'))

update peserta set biaya = iif(substring(kodePaket,5,1)='A', 250000,iif(substring(kodePaket,5,1)='B',300000,250000))

update peserta set lama_kursus = iif(substring(kodePaket,5,1)='A', 2,iif(substring(kodePaket,5,1)='B',2,1))
update peserta set total = biaya*lama_kursus

update peserta set tgl_akhir = dateadd(month, lama_kursus, tglMasuk)

use dbmahasiswa
select * from tbmhs

create view vmhs as select npm, nama, umur from tbmhs

select * from vnilai

create view vinformatika as select npm, nama, umur, tgl_lahir from tbmhs where substring(npm,5,2)='25'

create view vnilai as select tbmhs.npm, tbmhs.nama, tbmk.nama_mk, tbtrans.nilai from tbtrans, tbmhs, tbmk
where tbtrans.npm=tbmhs.npm and tbtrans.kode_mk=tbmk.kode_mk

create database dbjual
use dbjual
create table penjual(idPenjual varchar(30) primary key, nama_penjual varchar(30),tgl_jual date, nilai_jual int)

create table barang(id_barang varchar(30) primary key, nama_brg varchar(25), harga int, jumlah int, idPenjual varchar(30) foreign key references penjual(idPenjual))

select * from barang
select * from vtransaksi


insert into penjual values('P0001','Rohadi', '09/12/2022', 45000000)
insert into penjual values('P0002','Nurman', '02/15/2022', 55000000)
insert into penjual values('P0003','Johan', '02/1/2022', 42000000)
insert into penjual values('P0004','januari', '05/19/2022', 17000000)
insert into penjual values('P0005','Budiman', '06/18/2022', 67000000)

insert into barang values('BA211','Komputer', 7500000,2, 'P0001')
insert into barang values('BA201','Mouse', 75000,10, 'P0003')
insert into barang values('BA202','Keyboard', 100000,15, 'P0005')
insert into barang values('BA204','SSD', 300000,7, 'P0001')

create view vtransaksi as select penjual.nama_penjual, penjual.nilai_jual, barang.nama_brg, barang.jumlah from  penjual, barang
where penjual.idPenjual = barang.idPenjual

use finansial

select * from pelanggan
create table bayar (kd_bayar char(5) primary key, tgl_bayar date, nomor varchar(6), j_angsuran int, bunga int)


ALTER TABLE PELANGGAN alter column nokontrak varchar(6) not null 

ALTER TABLE PELANGGAN add primary key (nokontrak) 

alter table bayar  add  foreign key (nomor)  references pelanggan(nokontrak)

insert into bayar values('B0001', '09/13/2022', '0003', 250000, 15000)
insert into bayar values('B0002', '04/14/2022', '0002', 210000, 12000)
insert into bayar values('B0003', '08/16/2022', '0001', 215000, 10000)
insert into bayar values('B0004', '07/10/2022', '0004', 125000, 13500)


select * from bayar


create view daftar as select bayar.kd_bayar, pelanggan.nama, bayar.tgl_bayar, bayar.j_angsuran from pelanggan, bayar
where bayar.nomor = pelanggan.nokontrak  


select * from daftar

create view view2 as select nama, hutang, 
				case jkelamin
				when 'L' then 'Laki-laki'
				when 'P' then 'Perempuan'

			end as jenis
			from pelanggan

select * from hutang


create view hutang as select pelanggan.nama, bayar.j_angsuran, pelanggan.hutang,pelanggan.hutang-bayar.j_angsuran as sisa_hutang from pelanggan, bayar
where bayar.nomor = pelanggan.nokontrak 



--bit.ly/if2e

use db_penjualan


select * from barang

--inner join

select t.kd_transaksi, c.nama , c.kelurahan, t.jumlah_barang from transaksi as t inner join customer as c on t.id_customer = c.id_customer

-- inner join 3 tabel
select t.kd_transaksi as kode, c.nama as customer ,b.nama as barang, t.jumlah_barang , c.kelurahan as pengantaran from transaksi as t inner join customer as c on t.id_customer = c.id_customer inner join barang as b on t.id_barang = b.id_barang



--left join

select t.kd_transaksi, c.nama , c.kelurahan, t.jumlah_barang from transaksi as t left join customer as c on t.id_customer = c.id_customer


--right join

select t.kd_transaksi, c.nama , c.kelurahan, t.jumlah_barang from transaksi as t right join customer as c on t.id_customer = c.id_customer

--outer join
select t.kd_transaksi, c.nama , c.kelurahan, t.jumlah_barang from transaksi as t full outer join customer as c on t.id_customer = c.id_customer


--latihan

create database db_lagu
 use db_lagu
create table tb_lagu(kd_lagu char(5) primary key, judul_lagu varchar(25), penyanyi varchar(15), tahun_lagu varchar(10))
create table tb_album(kd_album char(5) primary key, nama_album varchar(25), tahun_rilis varchar(4))
create table tb_penjualan(id_penjualan int identity(1,1) primary key, kd_lagu char(5) references tb_lagu(kd_lagu), kd_album char(5) references tb_album(kd_album),
record_terjual int, streaming int)

select * from tb_penjualan

insert into tb_lagu values ('L0001', 'Ternyata Cinta', 'Padi', '1999')
insert into tb_lagu values ('L0002', 'Masih Tetap Tersenyum', 'Padi', '2000')
insert into tb_lagu values ('L0003', 'Siapa Gerangan Dirinya', 'Padi', '2005')

insert into tb_lagu values ('L0004', 'Atas Nama Cinta', 'Dewa 19', '2000')
insert into tb_lagu values ('L0005', 'Cinta Gila', 'Dewa 19', '2002')
insert into tb_lagu values ('L0006', 'Pangeran Cinta', 'Dewa 19', '2003')

insert into tb_lagu values ('L0007', 'Jadikan aku pacarmu', 'Sheila on 7', '2003')
insert into tb_lagu values ('L0008', 'Dan', 'Sheila on 7', '2004')
insert into tb_lagu values ('L0009', 'Tertatih', 'Sheila on 7', '2005')

insert into tb_album values ('A0001', 'Indra Keenam', '2019')
insert into tb_album values ('A0002', 'Laskar Cinta', '1999')
insert into tb_album values ('A0003', 'Sheila on 7', '1999')

insert into tb_penjualan values ('L0001', 'A0001', 50000, 300000)
insert into tb_penjualan values ('L0002', 'A0001', 53000, 326700)
insert into tb_penjualan values ('L0003', 'A0001', 65000, 333900)
insert into tb_penjualan values ('L0004', 'A0002', 76000, 435600)
insert into tb_penjualan values ('L0005', 'A0002', 100000, 1300000)
insert into tb_penjualan values ('L0006', 'A0002', 150000, 967000)
insert into tb_penjualan values ('L0007', 'A0003', 51000, 535000)
insert into tb_penjualan values ('L0008', 'A0003', 31000, 615000)
insert into tb_penjualan values ('L0009', 'A0003', 29000, 423000)


select l.judul_lagu, l.penyanyi, l.tahun_lagu, a.nama_album, a.tahun_rilis, p.record_terjual, p.streaming  
from  tb_penjualan as p  inner join  tb_lagu as l on p.kd_lagu = l.kd_lagu inner join tb_album as a on p.kd_album =  a.kd_album 
order by streaming desc




use dbpegawai

select * from tbkaryawan

alter table tbkaryawan add tgl_lahir date
insert into tbkaryawan values('4455343', 'gita risky', 'jl. parameswara', '12/12/2022', 3000000, 'L', '02/02/1978')
create proc coba1 
as 
begin
if(exists(select * from tbkaryawan))
begin
select nip,nama,
iif(kd_jenis='L','Laki-laki','Perempuan') as jenis_kelamin, year(getdate())-year(tgl_lahir) as umur
from tbkaryawan
end
else
begin
print 'file tidak ada!'
end
end
go
 
exec coba1


create proc isian @np varchar (5),@nm varchar(20), @almt varchar(25), @tgl date, @gj int, @kdj char(1), @tgl_lahir date
as
begin
if(exists(select * from tbkaryawan where nip=@np))
begin
print 'Data Sudah ada!'
end 
else
begin
insert into tbkaryawan values(@np, @nm,@almt, @tgl, @gj, @kdj, @tgl_lahir)
print 'Data berhasil masuk!' 
end
end
go
 
exec isian '20192','Yuhana','jl. gerok','12/09/1990',5000000,'p', '12/04/1966'



create database dbmhs
 
 
 
use dbmhs
 
create table mahasiswa(npm varchar(10) primary key, nama varchar(25), angkatan char(4), IPK real)
 
create table nilai(nourut int, npm varchar(10) foreign key references mahasiswa(npm), total_sks int, total_nilai real)
 
insert into mahasiswa values('1924259012','Yunita','',0)
insert into mahasiswa values('2025241013','Andi Baso','',0)
insert into mahasiswa values('1823254016','Murdiono','',0)
insert into mahasiswa values('1722242003','Bambang','',0)
insert into mahasiswa values('1722250010','Melita','',0)
insert into mahasiswa values('1823248017','Rahma','',0)
insert into mahasiswa values('2025241015','Lucky','',0)
insert into mahasiswa values('1924252011','Arquella','',0)
insert into mahasiswa values('1823244010','Alvaro','',0)
insert into mahasiswa values('1924255072','Rendra','',0)
 
select * from mahasiswa
 
create proc isi1
as
begin
if(exists(select npm from mahasiswa))
begin
update mahasiswa set angkatan='20'+left(npm,2)
end
else
begin
print 'File tidak ada'
end
end
go
 
exec isi1
 
create proc isi2 @npm varchar(10),@ttlsk int, @ttlnilai real
as
begin
declare @nourut int, @IPKS float
if(exists(select npm from mahasiswa where npm=@npm))
begin
set @nourut=(select count(*)+1 as id from mahasiswa where npm=@npm)
set @npm=(select npm from mahasiswa where npm=@npm)
set @IPKS=@ttlnilai/@ttlsk
insert into nilai values(@nourut,@npm,@ttlsk,@ttlnilai)
update mahasiswa set IPK=@IPKS where npm=@npm
end
end
go
 
exec isi2 '1722242003',144,324
exec isi2 '1722250010',98,236
select * from nilai



alter table mahasiswa add jurusan varchar(25)

use elektro

select * from tblbarang


alter table  tbljualan add foreign key (kdbrg) references tblbarang(kdbrg)
alter table  tbljualan add foreign key (kdkasir) references tblkasir(kdkasir)

insert into tbljualan values('V0192', '12/05/2023','M1200', '001',5)
insert into tbljualan values('V0193', '10/05/2023','M1201', '002',2)

select * from tbljualan

create proc masukjualan @nofak varchar(6), @tgl date, @kdb varchar(5), @kdk char(3), @jmlh int
as
begin
	declare @st int 
	declare @sisa int
	if(exists(select * from tbljualan))
	begin
		
		set @st=(select stok from tblbarang where kdbrg=@kdb)
		if(@jmlh>@st)
		begin
			print'Stok Tidak Cukup'
		end
		else
		begin
			set @sisa = @st-@jmlh
			insert into tbljualan values(@nofak, @tgl, @kdb, @kdk, @jmlh)
			print 'Data masuk'
			update tblbarang set stok = @sisa where kdbrg=@kdb
		end
	end
end
go
drop procedure masukjualan
exec  masukjualan 'V0195','12/06/2023','M1200', '002', 1



create view vjualan as select j.nofaktur, b.nmbrg, b.hrgjual, j.jumlah, nilaibarang = j.jumlah*b.hrgjual  from tbljualan as j, tblbarang as b
where j.kdbrg = b.kdbrg

select * from vjualan





 create database dbnilai
 
use dbnilai
 
create table daftarsiswa (npm varchar(10) primary key, nama varchar(20), keterangan varchar(25))
 
create table daftarnilai (kdmtk char(5) primary key, npm varchar(10) foreign key references daftarsiswa(npm), nilai int)
 
insert into daftarsiswa values('2125250001','Yance','')
 
insert into daftarsiswa values('2125250002','Budiana','')
 
insert into daftarsiswa values('2125250003','Rendi','')
 
insert into daftarsiswa values('2125250004','Lusiana','')
 
insert into daftarsiswa values('2125250005','Tuti','')
 
create trigger tr_status on daftarnilai
for insert, update
as
begin
declare @mtk char(5)
declare @npm varchar(10)
declare @nilai int
select @nilai = nilai
from daftarnilai
if @nilai >= 60
update daftarsiswa set keterangan = 'lulus'
where npm = @npm
else 
update daftarsiswa set keterangan = 'tidak lulus'
where npm = @npm
end
end
go

insert into daftarnilai values('A0287', '2125250001', 50)
insert into daftarnilai values('A0287', '2125250001', 50)
select * from daftarsiswa

select * from daftarnilai
