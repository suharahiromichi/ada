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

#
# このような、推論規則は書けない。
# 
#.SUFFIXES:	.ads .adb
#.ads.o:
#	gcc -c $*.ads
#.adb.o:
#	gcc -c $*.adb
#

CHOPCMD	= gnatchop -w $<
# $< は、最初の依存を示す。
data1.ads:	data1.spc
	$(CHOPCMD)
data2.ads:	data2.spc
	$(CHOPCMD)
mathlib.ads:	mathlib.ada
	$(CHOPCMD)
mathlib.adb:	mathlib.ada
	$(CHOPCMD)
parent-child.adb:	child.ada
	$(CHOPCMD)
parent.adb:	parent.ada
	$(CHOPCMD)

COMPCMD = gcc $(ACOPT) -c $<
# ターゲット	生成元(最初の依存)	その他の依存
data1.o:	data1.ads
	$(COMPCMD)
data2.o:	data2.ads
	$(COMPCMD)
parent.o:	parent.adb \
		data1.ads data2.ads mathlib.ads parent-child.adb
	$(COMPCMD)
mathlib.o:	mathlib.adb \
		mathlib.ads
	$(COMPCMD)
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
