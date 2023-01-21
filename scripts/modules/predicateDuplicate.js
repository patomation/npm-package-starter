/**
 * Usage:
 * ```
 * ["dup", "dup", "1", "1", "2", "3"].filter(predicateDuplicate)
 * // returns ["dup", "1", "2", "3"]
 * ```
 * @param {String} item
 * @param {Number} i
 * @param {Array} array
 * @returns Array
 */
module.exports = function predicateDuplicate(
  item,
  i,
  array
) {
  // Filter duplicates
  return array.indexOf(item) === i
}
