import { query } from "../js/services.js";
import { render } from "../js/render.js";

function populateProfile(profile) {
  const ui = `
    <div>
      <h2>Perfil</h2>
      <p>Nome: ${profile.nome}</p>
      <p>E-mail: ${profile.email}</p>
      <button class="btn" onclick="unlogin()">Deslogar</button>
    </div>
    `;
    

  render("profile", ui);
}


async function onMount(){
  const user = JSON.parse(localStorage.getItem("user"))
  if (!user) {
    window.location = "/login"
    return
  }
  const { data, error } = await query(`./profile.php`, {body: JSON.stringify({id: user.id}), method: "POST"});
  populateProfile(data);
}


window.onload = onMount
window.unlogin = () => {
  localStorage.removeItem("user")
  window.location = "/login"
  return
}
