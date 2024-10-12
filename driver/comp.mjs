import {argv} from 'process';
import {readFile} from 'fs/promises';
import {Env} from '../temper.out/js/eb/interp.js';
import {runTodo, string, unstring} from '../temper.out/js/eb/value.js';
import {URL} from 'url';

const main = async () => {
    const env = new Env();

    const ebFile = readFile(new URL('../eb/eb.eb', import.meta.url));
    const srcFile = argv[3] == null ? ebFile : readFile(argv[3]);

    env.add('read-file', async ([filename], k) => {
        await readFile(unstring(filename))
            .then(content => {
                k(string(String(content)));
                runTodo();
            });
    });

    env.source(String(await ebFile));

    env.call("main-lang", [string(argv[2] ?? "c"), string(String(await srcFile))]);
};

main().catch(e => console.error(e));