import axios from 'axios'
// 之後只要需要token的都可以從這裡export
const token = document.querySelector("meta[name=csrf-token]").content
axios.defaults.headers.common["X-CSRF-Token"] = token

export default axios