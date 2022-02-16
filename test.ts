import path from 'path'

let pi = Math.PI
const pi1 = 3.14

type Thing = {
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

fn1(new Date())
