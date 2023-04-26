import {Env, isBad} from './temper.out/ebb/js/run.js';
import * as process from 'process';
import {readFileSync} from 'fs';

const env = new Env();

const tostr = (s) => {
    let r = 0;
    for (var i = s.length-1; i >= 0; i--) {
        r = [s.charCodeAt(i), r];
    }
    return r;
};

const fromstr = (s) => {
    let r = '';
    while (Array.isArray(s)) {
        r += String.fromCharCode(s[0]);
        s = s[1];
    }
    return r;
};

env.define("if", ([c, t, f]) => {
    if (c !== 0) {
        return t.invoke([]);
    } else {
        return f.invoke([]);
    }
});

env.define("putchar", ([c]) => {
    process.stdout.write(String.fromCharCode(c));
    return 0;
});

env.define("equal", ([a, b]) => (b === a)|0);
env.define("above", ([a, b]) => (b < a) ? 1 : 0);
env.define("add", ([a, b]) => b + a|0)
env.define("sub", ([a, b]) => b - a|0)
env.define("mul", ([a, b]) => b * a|0)
env.define("div", ([a, b]) => b / a|0)
env.define("mod", ([a, b]) => b % a|0)
env.define("read-file", ([name]) => {
    return tostr(String(readFileSync(fromstr(name))));
});
env.define("pair", ([a, b]) => [a, b]);
env.define("first", ([p]) => p[0]);
env.define("second", ([p]) => p[1]);

env.source(String(readFileSync("ebb.ebb")));
let a = [tostr(process.argv[2]), 0];
const res = env.call("main", [a]);
if (isBad(res)) {
    console.log(res.msg);
}