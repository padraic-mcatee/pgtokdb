
assert:{$[x;::;'`$y];}

test01:{[x] ([] j:til x)}

test02:{[x]
	([]
		b:x#01b;
		h:"h"$til x;
		i:"i"$til x;
		j:til x;
		e:3.1e*til x;
		f:4.1f*til x;
		p:.z.p+1000000000*til x;
		c:x#"abc";
		cc:"string",/:string til x
		)
	}

test03:{[x] ([]h:1#x)}

test04:{[b;h;i;j;e;f;p;cc] ([] res:1#-1 -5 -6 -7 -8 -9 -12 10h~type each (b;h;i;j;e;f;p;cc))}

test05:{[x] ([] c:1#x)}

test06:{[x1;x2] ([] p1:1#x1; p2:1#x2)}

test07:{ ([] d:1#.z.d)}

test08:{[x] ([] g:1#x)}

test09:{[x] ([] tt:1#enlist x)}

test10:{[x] ([] xx:1#enlist x)}

test11:{[h] ([] i:1#h; j:1#h; e:1#h; f:1#h)}

test12:{[i] ([] j:1#i; e:1#i; f:1#i)}

test13:{[j] ([] e:1#j; f:1#j)}

test14:{[e] ([] f:1#e) }

test15:{1!([] j1:1 2 3; j2:1 2 3)}

test16:{([m] j:1#1)}

test17:{([] m:1#1)}

test18:{([] j:1#1)}

test19:{([] c:1#23:50)}

test20:{([] c:1#23:50)}

test21:{([] c:1#23:50)}

test22:{([] c:1#23:50)}

test23:{([] c:1#23:50)}

test24:{([] c:1#23:50)}

test25:{([] c:1#23:50)}

test26:{([] c:1#23:50)}

test27:{([] c:1#23:50)}

test28:{([] c:1#23:50)}

test29:{([] c:1#23:50)}

test30:{assert[0;"An exception (assertion) in the kdb+ code"]}

test31:{([] j:1#1)}

test32:{([] j:1#1)}

test33:{([] j:1#1)}

test34:{[n] ([] cc:n#enlist 1000#"x" ; xx:n#enlist "x"$til 256 ; g:n?0Ng)}

test35:{[n] ([] i:"i"$til n)}

show "Ready to run tests."

// Handy utility to renumber tests in the .SQL and .Q files. It used after additional
// tests are added (starting at the next available test number) throughout the
// code in the scripts. The output files are renamed so that they can be compared
// with diff, etc.

getfile:{[n] -1_raze "\000",/:read0 n}
setfile:{[n;d] n 0: "\000" vs d}
sufind:{[d] ss[d;"[tT]est",raze 2#enlist "[0123456789]"]+\:4 5}
allsuf:{[n] -2#'"0",/:string 1+til n}

renumber:{
	f:getfile `:pgtokdb_test.sql;
	i:sufind[f];
	d:distinct s:f[i];
	a:allsuf count d;
	f[i]:a[d?s];
	setfile[`:pgtokdb_test1.sql;f];

	f:getfile `:pgtokdb_test.q;
	i:sufind f;
	f[i]:a[d?f[i]];
	setfile[`:pgtokdb_test1.q;f];
	}




