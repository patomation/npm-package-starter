//@ts-check
const fs = require('fs')
const path = require('path')

function readJson(filePath) {
  return JSON.parse(fs.readFileSync(path.resolve(filePath), 'utf-8'))
}

function writeJson(filePath, object) {
  fs.writeFileSync(path.resolve(filePath), JSON.stringify(object, null, 2))
}

module.exports = {
  readJson,
  writeJson,
}
