import {argv} from 'process';
import {readFileSync} from 'fs';
import {Env} from './temper.out/ebb/js/interp.js';

const env = new Env();

env.source(String(readFileSync("ebb.ebb")));
env.call("main-low", [String(readFileSync(argv[2]))]);
