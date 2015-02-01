ACOPT	=

ABOJS	= \
	data1.o \
	data2.o \
	mathlib.o \
	parent.o

ALIS	= \
	data1.ali \
	data2.ali \
	mathlib.ali \
	parent.ali

ALIB	= liba.a

COBJS	= \
	main.o

PROGRAM	= main

#
# 以下はコンパイルの対象ではない。
# mathlib.ads
# parent-child.adb

all:	$(PROGRAM)

.SUFFIXES: 	.ada .spc .bdy
.SUFFIXES: 	.adb .ads
# この順にすると、.oをつくるときに、.adbが優先される。

#####
#####
CHOPCMD	= gnatchop -w $<
.spc.ads:
	$(CHOPCMD)
.ada.ads:
	$(CHOPCMD)
.ada.adb:
	$(CHOPCMD)
.bdy.adb:
	$(CHOPCMD)
# 名前が変わるもの、副単位の子のファイルを記載する。
parent-child.adb:     child.ada
	$(CHOPCMD)

#####
#####
COMPCMD = gcc $(ACOPT) -c $<
# .SUFFIXESの順番により、.adb.oのほうが優先される。気休めだが。
# (ここに書いた順番ではない)
.ads.o:
	$(COMPCMD)
.adb.o:
	$(COMPCMD)
#
# 個別ルールの書式：
# ターゲット	生成元(最初の依存) \
		その他の依存
#data1.o:	data1.ads
#	$(COMPCMD)
#data2.o:	data2.ads
#	$(COMPCMD)
parent.o:	parent.adb \
		data1.ads data2.ads mathlib.ads parent-child.adb
	$(COMPCMD)
mathlib.o:	mathlib.adb \
		mathlib.ads
	$(COMPCMD)

#####
#####
#
#Adaのメイン副文を直接実行するプログラムを作る場合
#parent:	$(ABOJS)
#	gnatbind parent
#	gnatlink parent

$(ALIB):	$(ABOJS)
	gnatbind -n $(ALIS) -C -o ada-control.c
	gcc -c ada-control.c
	ar cr liba.a ada-control.o $(ABOJS)

$(PROGRAM):	$(ALIB) $(COBJS)
	gcc -o $(PROGRAM) $(COBJS) ada-control.o $(ALIB) \
	-L/usr/lib/gcc/i686-linux-gnu/4.6/adalib \
	-lgnat

clean:;
	rm -f $(ALIB) $(ABOJS) $(COBJS) $(ALIS) ada-control.* \
	*.ads *.adb

# END
