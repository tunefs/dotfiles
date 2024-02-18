#!/usr/bin/env node

const main = async () => {
  for await (const line of process.stdin) {
    const rot13 = line.toString().replace(/[a-zA-Z]/g, c =>
      'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm'.charAt(
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.indexOf(c))
    );
    process.stdout.write(rot13);
  }
};

main();

// vi:et:sw=2:
