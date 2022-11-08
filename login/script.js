import {$} from "../js/getElement.js"
import {query} from "../js/services.js"

async function login(e) {
  try {
    const formLogin = $("form-login")
    const {data, error} = await query("./login.php", {
      body: new FormData(formLogin), 
      method: "POST"
    })
    if (!data.loggedin) {
      const span = document.createElement("span")
      span.id = "error-login"
      span.classList.add("error")
      span.innerHTML = "Algo deu errado! Tente novamente."
      formLogin.appendChild(span)
      return
    } else {
      const span = $("error-login")
        if (span) {
          span.remove();
        }
    }

    localStorage.setItem("user", JSON.stringify(data))
    window.location = "/"
  } catch (error) {
    
  }
}
  
window.login = login    
window.onload = () => {
  const user = JSON.parse(localStorage.getItem("user"))
  if (user) {
    window.location = "/profile"
    return
  }

}
