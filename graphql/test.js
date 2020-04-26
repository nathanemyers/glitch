const { exec } = require('child_process')

const ruby_path = '../runner.rb'

exec(ruby_path, (err, stdout, stderr) => {
  console.log('err', err)
  console.log('stdout', stdout)
  console.log('stderr', stderr)
})

