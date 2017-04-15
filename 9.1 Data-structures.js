var m5 = new WeakMap();

var x = {
        id: 1
    },
    y = {
        id: 2
    },
    z = {
        id: 3
    },
    w = {
        id: 4
    };

m5.set(x, y);

x = null; // { id: 1 } is GC-eligible
y = null; // { id: 2 } is GC-eligible
// only because { id: 1 } is

m5.set(z, w);

w = null; // { id: 4 } is not GC-eligible






var m5 = new WeakMap();

var x = {
        id: 1
    },
    y = {
        id: 2
    },
    z = {
        id: 3
    },
    w = {
        id: 4
    };

m5.set(x, y);

x = null; // { id: 1 } is GC-eligible
y = null; // { id: 2 } is GC-eligible
// only because { id: 1 } is

m5.set(z, w);

w = null; // { id: 4 } is not GC-eligible




var s3 = new WeakSet();

var x = {
        id: 1
    },
    y = {
        id: 2
    };

s3.add(x);
s3.add(y);

x = null; // `x` is GC-eligible
y = null; // `y` is GC-eligible

/*
WeakMaps are maps where the key (object) is weakly held, so that GC is free to collect the entry if it's the last reference to an object.
WeakSets are sets where the value is weakly held, again so that GC can remove the entry if it's the last reference to that object.
*/
