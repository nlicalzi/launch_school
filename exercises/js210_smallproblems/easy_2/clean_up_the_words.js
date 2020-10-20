function cleanUp(str) {
  let noSpecialChars = str.replace(/[^a-zA-Z]/g, ' ')
  let noRepeatWhitespace = noSpecialChars.replace(/\s+/g, ' ')
  return noRepeatWhitespace;
}

console.log(cleanUp("---what's my +*& line?"));