import {argv} from 'process';
import {readFile} from 'fs/promises';
import {Env} from '../temper.out/ebb/js/src/comp.js';
import {URL} from 'url';

const main = async () => {
    const env = new Env();

    const ebbFile = readFile(new URL('../ebb/ebb.ebb', import.meta.url));
    const srcFile = argv[3] == null ? ebbFile : readFile(argv[3]);

    env.source(String(await ebbFile));

    env.call("main-lang", [argv[2] ?? "c", String(await srcFile)]);
};

main().catch(e => console.error(e));