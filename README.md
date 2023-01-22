# NPM Package Starter

```
NNNNNNNN        NNNNNNNN PPPPPPPPPPPPPPPPP       SSSSSSSSSSSSSSS
N:::::::N       N::::::N P::::::::::::::::P    SS:::::::::::::::S
N::::::::N      N::::::N P::::::PPPPPP:::::P  S:::::SSSSSS::::::S
N:::::::::N     N::::::N PP:::::P     P:::::P S:::::S     SSSSSSS
N::::::::::N    N::::::N   P::::P     P:::::P S:::::S
N:::::::::::N   N::::::N   P::::P     P:::::P S:::::S
N:::::::N::::N  N::::::N   P::::PPPPPP:::::P   S::::SSSS
N::::::N N::::N N::::::N   P:::::::::::::PP     SS::::::SSSSS
N::::::N  N::::N:::::::N   P::::PPPPPPPPP         SSS::::::::SS
N::::::N   N:::::::::::N   P::::P                    SSSSSS::::S
N::::::N    N::::::::::N   P::::P                         S:::::S
N::::::N     N:::::::::N   P::::P                         S:::::S
N::::::N      N::::::::N PP::::::PP           SSSSSSS     S:::::S
N::::::N       N:::::::N P::::::::P           S::::::SSSSSS:::::S
N::::::N        N::::::N P::::::::P           S:::::::::::::::SS
NODE___N         N_____N PACKAGE_P            STARTER_________S
```

The goal here is to have a vanilla project starter that includes TypeScript. In addition it has commit lint and ava for testing. So not so vanilla. More of a minimal preset. You get to chose your preferred front end framework. Enjoy making things.

### Features

- TypeScript
- [ava](https://github.com/avajs/ava) test framework
- nyc test coverage reporter
- standard-version
- commit-lint
- husky
- prettier
- pretty-quick staged formatting
- [clunk 4kb cli arg parser](https://www.npmjs.com/package/clunk)

![flavorite](https://raw.githubusercontent.com/patomation/vanilla-starter/master/public/favicon.ico)

# Install

```
npm i -G @patomation/nps
```

# Starting a new project

```
nps new my-new-ts-npm-package
cd my-new-ts-npm-package
npm i
```

# Updating an existing project

```
cd my-new-ts-npm-package
nps update
npm i
```

# Development

## Install

```
npm install
```

## Test

```
npm run test
# or
npm run watch:test
```

## Available NPM Scripts:

`npm run ...`

| Script          | Notes                                   |
| --------------- | --------------------------------------- |
|                 |                                         |
| compile:tests   |                                         |
| compile:package |                                         |
| compile         | both test and package                   |
| build           | transpile TyScript to JS /build dir     |
| unit            | run ava on /build                       |
| unit:coverage   | run coverage on /build                  |
| test            | compile /build and run unit tests       |
| coverage        | compile /build and test coverage report |
| watch:compile   | watch for change in src                 |
| watch:test      | run tests when src changes              |
| release         | trigger standard-version                |
| publish         | hook to push tags on npm publish        |
| prepare         | hook to install huksy on npm i          |
| prettier        | format all files with prettier          |
