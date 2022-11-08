import {$} from "../js/getElement.js"
import {query} from "../js/services.js"

async function register(e) {
  try {
    const registerForm = $("form-register")
    const senha = $("password").value
    const confirmarSenha = $("confirm").value
    if (senha !== confirmarSenha) {
      const span = document.createElement("span")
      span.id = "error-password"
      span.classList.add("error")
      span.innerHTML = "As senhas não são iguais."
      registerForm.appendChild(span)
      return
    } 
    const span = $("error-password")
    if (span) {
      span.remove();
    }
    const {data, error} = await query("./register.php", {
      body: new FormData(registerForm), 
      method: "POST"
    })
    console.log(data, error)
    window.location.href = "/login"
  } catch (error) {
    
  }
}

window.register = register     
