const get = require('lodash/get')
const set = require('lodash/set')

const config = {
  type: "m",
  // manager: {
  //   address: "la-01.deaf-mutes.us:4001",
  //   password: process.env.MANAGER_PASSWORD,
  // },
  plugins: {
    flowSaver: { use: true },
    user: { use: true },
    account: { use: true },
    macAccount: { use: true },
    group: { use: true },
    email: {
      use: true,
      type: "mailgun",
      baseUrl: "https://api.mailgun.net/v3/mail.deaf-mutes.us",
      apiKey: process.env.MAILGUN_APIKEY
    },
    webgui: {
      use: true,
      host: "0.0.0.0",
      port: "80",
      site: "http://ssmgr",
      icon: "/favicon.png",
      skin: "fs_laughingman",
      cdn: "https://deaf-mutes.oss-cn-shanghai.aliyuncs.com",
    }
  },
  db: {
    host: "mysql",
    port: 3306,
    user: "root",
    password: process.env.MYSQL_ROOT_PASSWORD,
    database: "shadowsocks"
  }
}

exports.all = () => config
exports.get = path => get(config, path)
exports.set = (path, value) => set(config, path, value)