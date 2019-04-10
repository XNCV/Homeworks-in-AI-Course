import math
import random

def khoitaoquanthe(sizequanthe):
	quanthe = []
	for i in range(sizequanthe):
		quanthe.append(float(random.randrange(0, 500, 1))/100)
	return quanthe


def chonloc(quanthe, n, sizequanthe):
	quanthechonloc = []
	parent = []
	for num in quanthe:
		parent.append((num, giatriham(num)))
	parent.sort(key=custom_sort, reverse = True)
	# chon "n" phan tu lon nhat
	chosen_parent = []
	for i in range(n):
		chosen_parent.append((parent[i][0], int(parent[i][1])))
	danhsachluachon = [thanhphan for thanhphan, weight in chosen_parent for i in range(weight)]
	for i in range(sizequanthe):
		quanthechonloc.append(random.choice(danhsachluachon))
	return quanthechonloc

def laighep(quanthe):
	quanthemoi = []
	quanthe2 = mahoa(quanthe)
	for i in range(int(len(quanthe2)/2)):
		x = random.choice(quanthe2)
		quanthe2.remove(x)
		y = random.choice(quanthe2)
		quanthe2.remove(y)
		tra_ve = lai2phantu(x, y, split = 2)
		quanthemoi.append(tra_ve[0])
		quanthemoi.append(tra_ve[1])
	return quanthemoi

def dotbien(quanthe, soluong, vitribit = 2):
	for i in range(soluong):
		x = random.choice(quanthe)
		x1 = list(x)
		quanthe.remove(x)
		if(x1[vitribit+2]=='1'):
			x1[vitribit+2] = '0'
		else:
			x1[vitribit+2] = '1'
		x2 = "".join(x1)
		quanthe.append(x2)
	return quanthe

def danhgia(quanthe):
	quanthegiatri = []
	for num in quanthe:
		quanthegiatri.append(giatriham(num))
	quanthegiatri.sort(reverse = True)
	return quanthegiatri[0]

def timketqua(quanthe):
	parent = []
	for num in quanthe:
		parent.append((num, giatriham(num)))
	parent.sort(key=custom_sort, reverse = True)
	return(parent[0])


#CAC HAM CON
def custom_sort(elem):
    return elem[1]

def giatriham(giatri):
	return(4*giatri**4 - 5*giatri**3 + math.exp(-2*giatri) - 7*math.sin(giatri) - 3*math.cos(giatri))

def mahoa(quanthe):
	quanthe2 = []
	for num in quanthe:
		quanthe2.append(bin(int(num*100)))
	return(quanthe2)

def lai2phantu(x, y, split = 2):
    tra_ve = []
    x1 = x[0:len(x)-split] + y[len(y)-split:len(y)]
    x2 = y[0:len(y)-split] + x[len(x)-split:len(x)]
    tra_ve.append(x1)
    tra_ve.append(x2)
    return tra_ve

def giaima(quanthe):
    quanthe2 = []
    for num in quanthe:
        num_int = 0
        for i in range(len(num)-2):
            num_int = num_int + int(num[len(num)-1-i])*2**i
        quanthe2.append(float(num_int)/100)
    return quanthe2

#do lon cua qua the
kichthuocquanthe = 40
#so luong phan tu dot bien trong moi lan lap
soluongdotbien = 1
#so lan de xac dinh do hoi tu
solan = 20
#sai so gia tri lon nhat cua quan the sau va truoc
saiso = 0.05
J = 0
quanthe = khoitaoquanthe(kichthuocquanthe)
n = 0
while(True):
	n = n + 1
	print('GA lan', n)
	danhgia1 = danhgia(quanthe)
	quanthechonloc = chonloc(quanthe, 20, kichthuocquanthe)
	quanthelaighep = laighep(quanthechonloc)
	quanthedotbien = dotbien(quanthelaighep, soluongdotbien, 2)
	quanthe = giaima(quanthedotbien)
	danhgia2 = danhgia(quanthe)
	#chuong trinh se dung khi so lan thoa man saiso > solan
	if(abs(danhgia2 - danhgia1) < saiso):
		J = J + 1
	else:
		J = 0
	if(J == solan):
		break
print(timketqua(quanthe)[0])

