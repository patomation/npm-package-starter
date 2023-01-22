//@ts-check
const { clunk } = require('clunk')
const { readJson, writeJson } = require('./json')

/**
 * Parse output of `git remote -v` into single url
 * @param {String} text
 *
 * ```sh
 * origin  git@github.com:patomation/omit-deep.git (fetch)
 * origin  git@github.com:patomation/omit-deep.git (push)
 * ```
 */
function parseGitRemoteToUrl(text) {
  return (
    'git://' +
    text
      .split('\n')[1]
      .split('\t')[1]
      .split(' ')[0]
      .replace('git@', '')
      .replace(':', '/')
  )
}

function main() {
  const {
    inputs: [packagePathA, packagePathB],
    flags: { gitremote },
  } = clunk({
    gitremote: {
      alias: 'r',
      type: String,
      description: 'the output of git remote -v', // Easier than child process in here
    },
  })
  if (!packagePathA || !packagePathB) return
  const repositoryUrl =
    parseGitRemoteToUrl(gitremote)
  console.log(repositoryUrl)
  const packageA = readJson(packagePathA)
  const packageB = readJson(packagePathB)
  // All the stuff we want to keep from the old packages
  const keepKeys = [
    'name',
    'description',
    'version',
    'keywords',
    'files',
  ]
  keepKeys.forEach((key) => {
    const value = packageB[key] || packageA[key]
    packageA[key] = value
  })
  packageA['repository'] = {
    type: 'git',
    url: repositoryUrl,
  }
  packageA.devDependencies = {
    ...packageB.devDependencies,
    ...packageA.devDependencies,
  }
  packageA.scripts = {
    ...packageB.scripts,
    ...packageA.scripts,
  }
  writeJson(packagePathB, packageA)
}
main()
