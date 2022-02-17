import path from 'path'
const fs = require('fs')

let pi = Math.PI
const pi1 = 3.14

export type Thing = {
  this: string
  that: number
}

function fn1(arg1) {
  const refex = new RegExp(/^hello$/g)
  return arg1.match(refex)
}

const fn2 = (arg1) => {
  if (arg1 === true) {
    switch(arg1) {
      case 'bibel':
        console.log('holy christ');
      default:
        console.log({ nothing: 'here' })
    }
  } else {
    try {
      let as = Array.from(1,2,3,4)
      JSON.stringify(as, null, 2);
    } catch(err) {
      if (err instanceof Error) {
        console.error(err.message)
      }
    }
  }
}


module.exports = {fn: fn1(new Date())}
