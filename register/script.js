import {$} from "../js/getElement.js"
import {query} from "../js/services.js"

async function register(e) {
  console.log(e)
  try {
    const registerForm = $("form-register")
    const {data, error} = await query("./register.php", new FormData(registerForm), "POST")
    console.log(data, error)
  } catch (error) {
    
  }
}

window.register = register     
