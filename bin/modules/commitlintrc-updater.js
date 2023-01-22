//@ts-check
const fs = require('fs')
const path = require('path')
const { clunk } = require('clunk')
const predicateDuplicate = require('./predicateDuplicate')
const { readJson, writeJson } = require('./json')

function main() {
  const {
    inputs: [filePathA, filePathB],
  } = clunk()
  if (!filePathA || !filePathB) return

  const jsonA = readJson(filePathA)
  const jsonB = readJson(filePathB)

  const [, , scopeA] = jsonA.rules['scope-enum']
  const [, , scopeB] = jsonB.rules['scope-enum']

  const nextScopes = [...scopeA, ...scopeB]
    .sort()
    .filter(predicateDuplicate)

  jsonA.rules['scope-enum'][2] = nextScopes

  writeJson(filePathB, jsonA)
}
main()
