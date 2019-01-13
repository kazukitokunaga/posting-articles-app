import axios from 'axios'
import _ from 'lodash'

// Set CSRF token
const token = document.getElementsByName('csrf-token')[0].getAttribute('content')

const isProduction = window.location.hostname !== 'localhost'

export default axios.create({
  baseURL: isProduction ? '/' : 'http://localhost:3000',
  headers: {
    Accept: 'application/json',
    common: {
      'X-CSRF-Token': token
    }
  },
  transformResponse: _.concat(axios.defaults.transformResponse, function(
    data,
    headers
  ) {
    if (
      !headers['content-type'] ||
      headers['content-type'].indexOf('application/json') === -1
    ) {
      return data
    }
    return deepMapKeys(data, (val, key) => {
      return _.camelCase(key)
    })
  }),

  transformRequest: _.concat(
    [
      // Parse request keys to snake_case
      function(data) {
        if (data instanceof FormData) {
          return data
        }
        return deepMapKeys(data, (val, key) => {
          if (_.startsWith(key, '_')) return key
          return _.snakeCase(key)
        })
      },
      // Transform to FormData if the data contains a File object
      function(data) {
        if (data instanceof FormData) {
          return data
        }
        if (containFile(data)) {
          return jsonToFormData(data)
        }
        return data
      }
    ],
    axios.defaults.transformRequest
  )
})

function containFile(val) {
  if (val instanceof File) {
    return true
  }
  if (_.isObject(val) || _.isArray(val)) {
    return _.some(val, containFile)
  }
  return false
}

function jsonToFormData(json) {
  const data = new FormData()

  // recursive
  function setData(path, obj) {
    _.each(obj, (val, key) => {
      let nextPath = path.length > 0 ? path + '[' + key + ']' : key
      if (_.isArray(obj)) {
        nextPath = path + '[]'
      }
      if (val instanceof File) {
        data.append(nextPath, val)
        return
      }
      if (_.isObject(val)) {
        // recurse
        setData(nextPath, val)
        return
      }
      if (_.isNull(val)) {
        // Skip null value (otherwise is would send a string 'null')
        return
      }
      data.append(nextPath, val)
    })
  }

  setData('', json)
  return data
}

function deepMapKeys(obj, cb) {
  if (_.isArray(obj)) {
    // 配列なら配列のまま返す
    return _.map(obj, val => {
      if (_.isObject(val)) {
        // Recurse
        return deepMapKeys(val, cb)
      }
      return val
    })
  }

  // オブジェクトならキーを変換
  return _.chain(obj)
    .mapKeys(cb)
    .mapValues(val => {
      if (_.isObject(val)) {
        if (val instanceof File) {
          return val
        }
        if (val instanceof Date) {
          return val.toISOString()
        }
        // Recurse
        return deepMapKeys(val, cb)
      }
      return val
    })
    .value()
}