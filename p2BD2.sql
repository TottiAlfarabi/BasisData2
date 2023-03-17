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


CREATE database KARYAWAN

use  KARYAWAN

select * from karyawans
create table karyawans (id char(1), nama varchar(30),tgLahir date, salary int, department varchar(5),gender varchar(1))
alter table karyawans alter column id int

insert into karyawans values('1','Ahmad Sofyan','01/01/1990',2250000,'IT','l','Bandung'),
insert into karyawans values('2','Ismail Soleh','12/12/1986',5000000,'ACC','l','Pandeglang'),
insert into karyawans values('3','Ferry Subekti','06/06/1987',4500000,'HRD','p', 'Purwakarta')
,('4','Iskiyati','07/07/1988',7500000,'FIN','p', 'Brebes'),('5','Nurul Hikmah','08/08/1989',3750000,'FIN','p', 'Purwokerto')
,('6','Riyanto','02/02/1983',4500000,'IT','l', 'Subang'),('7','Azka Nurul','03/03/1984',5000000,'HRD','p', 'Bandung')
,('8','Venny Maya','04/04/1989',7000000,'IT','p', 'Jakarta'),('9','Anna Fauziyah','05/05/1989',3700000,'ACC','p', 'Bekasi')
insert into karyawans values('10','Arya Ardhi','09/09/1980',8000000,'FIN','l', 'Magelang')


#1
select sum(salary) as totalSalary from karyawans where department = 'IT' 

#2
select gender, case when gender = 'l' then 'lelaki' else 'perempuan' end as JenisKelamin from karyawans

#3
select count(nama) as banyak from karyawans where tmpLahir = 'Bandung' and department = 'IT'  


#4
select salary, case when salary > 5000000 then (salary*0.1) else (salary*0.05) end as PPH from karyawans

#5
select nama, department, iif(department ='IT','Information Technology',iif(department = 'ACC','Accounting',iif(department='HRD','Human Resource','Finance'))) as Departemen from karyawans







 