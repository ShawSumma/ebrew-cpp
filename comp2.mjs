import {argv} from 'process';
import {readFileSync} from 'fs';
import {Env} from './temper.out/ebb/js/comp.js';

const env = new Env();

env.source(String(readFileSync("ebb.ebb")));
env.call("main-lang", [argv[2], String(readFileSync(argv[3]))]);
