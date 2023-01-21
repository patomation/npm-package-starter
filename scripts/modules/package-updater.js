const { clunk } = require('clunk')
const { readJson, writeJson } = require('./json')

function main() {
  const {
    inputs: [packagePathA, packagePathB],
  } = clunk()
  const packageA = readJson(packagePathA)
  const packageB = readJson(packagePathB)
  // All the stuff we want to keep from the old packages
  const keepKeys = ['name', 'description', 'version', 'keywords']
  keepKeys.forEach((key) => {
    const value = packageB[key]
    packageA[key] = value
  })
  writeJson(packagePathB, packageA)
}
main()
