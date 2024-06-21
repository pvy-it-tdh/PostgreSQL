CREATE TABLE Nhanvien(
	maNV varchar(25)not null primary key,
	tennv varchar(250) not null,
	luong int not null,
	maql varchar(25),
	maBophan varchar(25) not null,
	FOREIGN KEY(maBophan) REFERENCES Bophan(maBophan)
	
	
);
CREATE TABLE Bophan(
	maBophan varchar(25) not null primary key,
	tenBoPhan varchar(100) not null
);

CREATE TABLE mathang(
	masmh varchar(25) not null primary key,
	tenmh varchar(100) not null,
	maBophan varchar(25) not null,
	FOREIGN KEY(maBophan) REFERENCES Bophan(maBophan)
);
CREATE TABLE nguoicungcap(
	msNCC varchar(25) not null primary key,
	tenNCC varchar(100) not null,
	Diachi varchar(200) not null
);
CREATE TABLE cungcap(
	macc varchar(25) not null primary key,
	masmh varchar(25) not null,
	msNCC varchar(25) not null,
	giacc int not null,
	FOREIGN KEY(masmh) REFERENCES mathang(masmh),
	FOREIGN KEY(msNCC) REFERENCES nguoicungcap(msNCC)
);
CREATE TABLE khachhang(
	makh varchar(25) not null primary key,
	tenkh varchar(250) not null,
	diachikh varchar(250) not null
);
CREATE TABLE donhang(
	sohieuddh varchar(25) not null primary key,
	ngaydh date not null,
	makh varchar(25) not null,
	FOREIGN KEY(makh) REFERENCES khachhang(makh)
);
CREATE TABLE chitietdonhang (
    id SERIAL NOT NULL PRIMARY KEY,
    soluong INT NOT NULL, 
    dongia INT NOT NULL,
    sohieuddh VARCHAR(25) NOT NULL,
    masmh VARCHAR(25) NOT NULL,
    FOREIGN KEY (sohieuddh) REFERENCES donhang(sohieuddh),
    FOREIGN KEY (masmh) REFERENCES mathang(masmh)
);

