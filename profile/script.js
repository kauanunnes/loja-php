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

function populateShoppings(shoppings) {
  if (shoppings.length === 0) {
    render("shoppings", `
    Você não fez nenhuma compra.
    `)
    return
  }
  const ui = shoppings
  .map((shopping) => {
    return `
  <li>
    <div class="description">
      <p><strong>Data da compra:</strong> ${shopping.data_venda}</p>
      <p><strong>Valor da compra:</strong> R$ ${shopping.valor_total}</p>
      <p><strong>Tipo do pagamento:</strong> ${shopping.tipo_pagamento}</p>
      <p><strong>Confirmação do pagamento:</strong> ${shopping.confirmacao == 0 ? "Não confirmado." : "Confirmado."}</p>
    </div>
  </li>
  `;
  })
  .join("");

render("shoppings", `
<h2>Suas compras </h2>
<ul class="compras-lista">
  ${ui}
</ul>
`)


}

async function onMount(){
  const user = JSON.parse(localStorage.getItem("user"))
  if (!user) {
    window.location = "/login"
    return
  }
  const profile = await query(`./profile.php`, {body: JSON.stringify({id: user.id}), method: "POST"});
  populateProfile(profile.data);
  const shoppings = await query(`./vendas.php`, {body: JSON.stringify({id: user.id}), method: "POST"});
  populateShoppings(shoppings.data);
  
}


window.onload = onMount
window.unlogin = () => {
  localStorage.removeItem("user")
  window.location = "/login"
  return
}
