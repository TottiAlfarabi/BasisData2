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


 select nip, nama,gaji, kd_jenis, year(getdate())- year(tgl_lahir) as umur from tbKaryawan where year(getdate())- year(tgl_lahir) < 25
 