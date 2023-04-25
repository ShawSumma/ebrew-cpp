import * as parser from 'ebb/parser.js';
import * as run from 'ebb/run.js';

const val = parser.parse(`

(print v) ?

(if cond (then) (else)) ?

(lt x y) ?

(sub x y) ?
(add x y) ?

(do x y) y

(let [v] v (in v)) in v

(fib n)
if lt 2 n
    n
    add fib sub 2 n
        fib sub 1 n

(main)
print fib 20

`);

run.run(val);
